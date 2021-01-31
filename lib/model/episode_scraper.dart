import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

import 'db.dart';
import 'client.dart';

class EpisodeScraper {
  final String ncode;
  final int number;
  final int chapterId;
  final bool isR18;
  final String baseScope;

  EpisodeScraper(this.ncode, this.number, this.isR18, String preScope,
      {this.chapterId})
      : baseScope = 'episode $number in $preScope';

  Future<Episode> scrape() async {
    await NarouClient.wait();
    final response =
        await NarouClient(baseScope).request('$ncode/$number', isR18);
    return parseEpisode(parse(response.body));
  }

  Episode parseEpisode(dom.Document document) {
    final novelColorElement =
        document.querySelector('#novel_contents > #novel_color');
    final title = novelColorElement.querySelector('.novel_subtitle').text;

    return Episode(
      id: null,
      novel: ncode,
      number: number,
      chapter: chapterId,
      title: title,
      foreword: null,
      body: 'hoge',
      html: novelColorElement.innerHtml,
      afterword: null,
      postedAt: DateTime.now(),
      fixedAt: null,
      illustCount: null,
    );
  }
}
