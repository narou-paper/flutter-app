import 'package:narou_paper/model/db.dart';
import 'package:narou_paper/model/novel_scraper.dart';

class NovelsRepository {
  static Stream<List<Novel>> get novelListStream =>
      NarouDatabase().novelListStream;

  static void addNovel(String ncode) async {
    final novel = await NovelScraper(ncode).scrape();
    NarouDatabase().addNovel(novel.toCompanion(true));
  }
}
