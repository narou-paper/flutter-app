import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:moor/moor.dart';

import 'db.dart';
import 'client.dart';
import 'episode_scraper.dart';

class NovelScraper {
  final String ncode;
  final NarouClient client;
  final String baseScope;

  NovelScraper(this.ncode)
      : baseScope = 'novel $ncode scraper',
        client = NarouClient('novel $ncode scraper');

  Future<Novel> scrape() async {
    final firstResponse = await client.firstRequest(ncode);
    final response = firstResponse.response, isR18 = firstResponse.isR18;
    final document = parse(response.body);
    final novel = _parseNovel(document, isR18);
    if (novel.isSerial)
      await _parseEpisodesAndChapters(document, isR18);
    else {
      final episode =
          EpisodeScraper(ncode, 1, isR18, baseScope).parseEpisode(document);
      NarouDatabase().addEpisode(episode.toCompanion(false));
    }
    return novel;
  }

  Novel _parseNovel(dom.Document document, bool isR18) {
    final novelColorElement =
        document.querySelector('#novel_contents > #novel_color');
    final title = novelColorElement.querySelector('.novel_title').text;
    var writerNickname =
        novelColorElement.querySelector('.novel_writername > a')?.text;
    if (writerNickname == null || writerNickname.isEmpty) {
      writerNickname = novelColorElement
          .querySelector('.novel_writername')
          .text
          .split('：')
          .elementAt(1)
          .trim();
    }
    final indexBoxElements =
        novelColorElement.querySelectorAll('.index_box > *');
    final isSerial = indexBoxElements != null;
    final maxEpisodeNum = (isSerial) ? indexBoxElements.length : 1;

    return Novel(
      ncode: ncode,
      ncodeInt: null,
      title: title,
      writerNickname: writerNickname,
      writer: 0,
      story: null,
      isR18: isR18,
      isSerial: isSerial,
      readEpisodeCount: 0,
      maxEpisodeNum: maxEpisodeNum,
    );
  }

  Future _parseEpisodesAndChapters(dom.Document document, bool isR18) async {
    final indexBoxElements = document
        .querySelectorAll('#novel_contents > #novel_color > .index_box > *');
    var chapterNum = 0, episodeNum = 0, chapterId;

    for (var element in indexBoxElements) {
      if (element.className == 'chapter_title') {
        chapterNum += 1;
        chapterId = await _parseChapter(element, chapterNum);
      } else {
        episodeNum += 1;
        _parseEpisode(episodeNum, chapterId, isR18);
      }
    }
  }

  Future<int> _parseChapter(dom.Element element, int number) =>
      NarouDatabase().addChapter(ChaptersCompanion(
        novel: Value(ncode),
        number: Value(number),
        name: Value(element.text),
      ));

  void _parseEpisode(int number, int chapterId, bool isR18) async {
    final episode = await EpisodeScraper(
      ncode,
      number,
      isR18,
      baseScope,
      chapterId: chapterId,
    ).scrape();
    NarouDatabase().addEpisode(episode.toCompanion(true));
  }
}
