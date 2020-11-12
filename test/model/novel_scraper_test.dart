import 'package:flutter_test/flutter_test.dart';

import 'package:narou_paper/model/novel_scraper.dart';
import 'package:narou_paper/model/db.dart';

void main() {
  const ncodeShanfro = 'n6169dz';
  const shanfroTitle = 'シャングリラ・フロンティア〜クソゲーハンター、神ゲーに挑まんとす〜';
  const shanfroWriterName = '硬梨菜';
  const ncodeHoge = 'n6832gk';
  const hogeTitle = '通りすがりの猫女';
  const hogeWriterNickName = 'レムウェル';

  group('NovelScraper', () {
    group('scrape() returns correct Novel', () {
      Novel novel;

      setUp(() async {
        await Future.delayed(Duration(milliseconds: 500));
        novel = await NovelScraper(ncodeShanfro).scrape();
      });

      test('text', () {
        expect(novel.title, shanfroTitle);
      });

      test('writerNickname', () {
        expect(novel.writerNickname, shanfroWriterName);
      });
    });
    test('scrape() returns correct Novel writerNickmane when really nickname',
        () async {
      await Future.delayed(Duration(milliseconds: 500));
      var novel = await NovelScraper(ncodeHoge).scrape();
      expect(novel.writerNickname, hogeWriterNickName);
    });
  });
}
