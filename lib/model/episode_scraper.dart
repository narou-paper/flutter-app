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
    return Episode(
      id: null,
      novel: ncode,
      number: number,
      chapter: chapterId,
      title: 'hoge',
      foreword: null,
      body: 'hoge',
      afterword: null,
      postedAt: null,
      fixedAt: null,
      illustCount: null,
    );
  }
}
