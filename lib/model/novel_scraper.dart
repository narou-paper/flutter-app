import 'dart:convert';
import 'dart:developer' as developer;

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'package:narou_paper/model/db.dart';
import 'common.dart';

class NovelScraper {
  final ncode;

  NovelScraper(this.ncode);

  Future<Novel> scrape() async {
    var response = await http.get('${Narou.baseURL}/$ncode/');
    bool isR18 = false;

    if (response.statusCode == 301) {
      final redirectUrl = response.headers['Location'];
      if (redirectUrl != null && redirectUrl.startsWith(Narou.baseR18Url)) {
        isR18 = true;
        response = await http.get(redirectUrl);
      }
    }

    if (response.statusCode == 200) {
      return _parseNovel(response.body, isR18);
    } else {
      final message = 'Request failed with status: ${response.statusCode}.';
      final name = 'novel${(isR18 ? '(R18)' : '')} $ncode scraper';
      developer.log(message, name: name, error: jsonEncode(response));
      throw Exception('$message in $name');
    }
  }

  Novel _parseNovel(responseBody, bool isR18) {
    return Novel(
      ncode: ncode,
      ncodeInt: null,
      title: 'hoge',
      writerNickname: 'hoge',
      writer: 0,
      story: null,
      isSerial: true,
      maxEpisodeNum: 1,
    );
  }
}
