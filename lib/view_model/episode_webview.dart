import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:narou_paper/model/db.dart';
import 'episode_html_builder.dart';

class EpisodeWebViewViewModel extends ChangeNotifier {
  Episode episode;

  EpisodeWebViewViewModel(this.episode);

  Uri get episodeUri => Uri.dataFromString(
        EpisodeHtmlBuilder.build(episode.html, true),
        mimeType: 'text/html',
        encoding: utf8,
      );
}
