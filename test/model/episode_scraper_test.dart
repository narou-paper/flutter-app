import 'package:flutter_test/flutter_test.dart';

import 'package:narou_paper/model/episode_scraper.dart';
import 'package:narou_paper/model/db.dart';

void main() {
  const ncodeShanfro = 'n6169dz';
  const shanfroEpisode1Title = '貴方はなんのためにゲームをしますか？';
  const shanfroEpisode1BodyHtmlStart = '''
<div id="novel_color">



<div class="novel_bn">
<a href="/n6169dz/2/">次へ&nbsp;&gt;&gt;</a></div><!--novel_bn-->


<div id="novel_no">1/757</div>


<p class="novel_subtitle">貴方はなんのためにゲームをしますか？</p>



<div id="novel_honbun" class="novel_view">
<p id="L1">　世界中の精霊達を捕らえていた邪神グラトーニエが斃れる。</p>
''';

  final wait = () => Future.delayed(Duration(milliseconds: 500));

  group('EpisodeScraper', () {
    group('scrape() returns correct Episode', () {
      Episode episode;

      setUp(() async {
        await wait();
        episode = await EpisodeScraper(ncodeShanfro, 1, false, 'episode test')
            .scrape();
      });

      test('title', () {
        expect(episode.title, shanfroEpisode1Title);
      });

      test('html', () {
        expect(episode.html, startsWith(shanfroEpisode1BodyHtmlStart));
      });
    });
  });
}
