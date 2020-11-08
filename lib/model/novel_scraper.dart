import 'dart:convert';
import 'dart:developer' as developer;

import 'package:html/parser.dart';

import 'package:narou_paper/model/db.dart';
import 'util.dart';

class NovelScraper {
  final ncode;

  NovelScraper(this.ncode);

  Future<Novel> scrape() async {
    final firstResponse = await NarouClient.firstRequest(ncode);
    final response = firstResponse.response, isR18 = firstResponse.isR18;

    if (response.statusCode == 200) {
      return _parseNovel(response.body, isR18);
    } else {
      final message = 'Request failed with status: ${response.statusCode}.';
      final name = 'novel${(isR18 ? '(R18)' : '')} $ncode scraper';
      developer.log(message, name: name, error: jsonEncode(response));
      throw Exception('$message in $name');
    }
  }

  Novel _parseNovel(String responseBody, bool isR18) {
    var document = parse(responseBody);
    var title = document
        .querySelector('#novel_contents > #novel_color > .novel_title')
        .text;

    return Novel(
      ncode: ncode,
      ncodeInt: null,
      title: title,
      writerNickname: 'hoge',
      writer: 0,
      story: null,
      isSerial: true,
      readEpisodeCount: 0,
      maxEpisodeNum: 1,
    );
  }
}
