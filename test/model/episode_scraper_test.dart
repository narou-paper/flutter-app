import 'package:flutter_test/flutter_test.dart';

import 'package:narou_paper/model/episode_scraper.dart';
import 'package:narou_paper/model/db.dart';

void main() {
  const ncodeShanfro = 'n6169dz';
  const shanfroEpisode1Title = '貴方はなんのためにゲームをしますか？';

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
    });
  });
}
