import 'dart:convert';
import 'dart:developer' as developer;

import 'package:html/parser.dart';

import 'db.dart';
import 'util.dart';

// class NovelScrapedObject {
//   final Novel novel;
//   final Writer writer;
//
//   NovelScrapedObject(this.novel, this.writer);
// }

class NovelScraper {
  final String ncode;

  NovelScraper(this.ncode);

  Future<Novel> scrape() async {
    final firstResponse = await NarouClient.firstRequest(ncode);
    final response = firstResponse.response, isR18 = firstResponse.isR18;
    final scope = 'novel${(isR18 ? '(R18)' : '')} $ncode scraper';

    if (response.statusCode == 200) {
      return _parseNovel(response.body, isR18, scope);
    } else {
      final message = 'Request failed with status: ${response.statusCode}.';
      developer.log(message, name: scope, error: jsonEncode(response));
      throw Exception('$message in $scope');
    }
  }

  Novel _parseNovel(String responseBody, bool isR18, String scope) {
    final document = parse(responseBody);
    final novelColorFragment =
        document.querySelector('#novel_contents > #novel_color');
    final title = novelColorFragment.querySelector('.novel_title').text;
    var writerNickname =
        novelColorFragment.querySelector('.novel_writername > a')?.text;
    if (writerNickname == null || writerNickname.isEmpty) {
      writerNickname = novelColorFragment
          .querySelector('.novel_writername')
          .text
          .split('：')
          .elementAt(1)
          .trim();
    }

    return Novel(
      ncode: ncode,
      ncodeInt: null,
      title: title,
      writerNickname: writerNickname,
      writer: 0,
      story: null,
      isSerial: true,
      readEpisodeCount: 0,
      maxEpisodeNum: 1,
    );
  }
}
