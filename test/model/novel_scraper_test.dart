import 'package:flutter_test/flutter_test.dart';

import 'package:narou_paper/model/novel_scraper.dart';

void main() {
  const ncodeShanfro = 'n6169dz';
  const shanfroTitle = 'シャングリラ・フロンティア〜クソゲーハンター、神ゲーに挑まんとす〜';

  group('NovelScraper', () {
    test('scrape() returns correct Novel title', () async {
      final novel = await NovelScraper(ncodeShanfro).scrape();
      expect(novel.title, shanfroTitle);
    });
  });
}
