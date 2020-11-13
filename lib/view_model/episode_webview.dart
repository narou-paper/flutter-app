import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:narou_paper/model/db.dart';

class EpisodeWebViewViewModel extends ChangeNotifier {
  Episode episode;

  EpisodeWebViewViewModel(this.episode);

  Uri get episodeUri {
    final episodeHtml = '''
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <style>
            body {
                color: #FFFFFF;
                font-size: 16px;
                padding: 10px;
                font-family: "メイリオ", "Meiryo", 'Lucida Grande', "sans-serif";
                writing-mode: vertical-rl;
                background: black;
            }
            .novel_title, .novel_subtitle {
                font-size: 170%;
                line-height: 150%;
            }
            #novel_honbun {
                line-height: 28.8px;
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        ${episode.bodyHtml}
    </body>
</html>
''';
    return Uri.dataFromString(
      episodeHtml,
      mimeType: 'text/html',
      encoding: utf8,
    );
  }
}
