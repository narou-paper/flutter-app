import 'dart:async';
import 'dart:io' as io;
import 'dart:ui' as ui;
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:narou_paper/common.dart';
import 'package:narou_paper/model/db.dart';
import 'package:narou_paper/repository/novel.dart';
import 'package:narou_paper/view_model/episode_html_builder.dart';
import 'episode_html_builder.dart';

Stream<ui.Image> generateImagesFromEpisode(Episode episode) async* {
  final pdf = await Printing.convertHtml(
    format: PdfPageFormat(540, 816),
    html: EpisodeHtmlBuilder.build(episode.html),
  );
  // final output = await getExternalStorageDirectory();
  // await io.File('${output.path}/m5paper.pdf').writeAsBytes(pdf);
  yield* Printing.raster(pdf).asyncMap((page) => page.toImage());
}

Future<http.Response> sendEpisodeToPaper(Episode episode) async {
  final novel = await NovelsRepository.novel(episode.novel);
  final url = Uri.parse(Settings.paperDomain);
  final request = http.MultipartRequest('POST', url)
    ..fields['title'] = novel.title
    ..fields['episode'] = episode.number.toString()
    ..fields['subtitle'] = episode.title;

  final novelTitle =
      (novel.title.length > 10) ? novel.title.substring(0, 10) : novel.title;
  final episodeTitle = (episode.title.length > 10)
      ? episode.title.substring(0, 10)
      : episode.title;
  final episodeNum = episode.number;

  final images = generateImagesFromEpisode(episode);
  await images
      .asyncMap((image) => image.toByteData(format: ui.ImageByteFormat.png))
      .map((byteImage) => byteImage.buffer.asUint8List())
      .toList()
    ..asMap().forEach((index, intListImage) => request.files.add(
          http.MultipartFile.fromBytes(
            (index + 1).toString(),
            intListImage,
            filename: '[$novelTitle $episodeNum] $episodeTitle.$index.png'
                .replaceAll('/', '-'),
            contentType: MediaType('application', 'png'),
          ),
        ));
  developer.log('request created', error: request);
  try {
    final response = await http.Response.fromStream(
      await request.send().timeout(const Duration(seconds: 100)),
    );
    developer.log('response finished', error: response);
    return response;
  } catch (e) {
    developer.log('request error', error: request);
    return null;
  }
  // request.send().then(
  //     (responce) => developer.log('statuscode', error: responce.statusCode));
  // return await http.get('https://www.google.com');
}
