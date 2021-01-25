import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:narou_paper/common.dart';

import 'package:narou_paper/model/db.dart';
import 'package:narou_paper/view_model/episode_html_builder.dart';
import 'package:narou_paper/view_model/picture_generator.dart';

class EpisodeSendDialog extends StatelessWidget {
  final Episode episode;

  EpisodeSendDialog(this.episode);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text('データ転送'),
        content: Text('電子ペーパーに転送しますか？'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Send!'),
            onPressed: () async {
              await http.post(Uri.parse(Settings.paperDomain), body: {
                'bodyHtml': episode.html,
              });
              await generatePictures(EpisodeHtmlBuilder.build(episode.html));
              Navigator.of(context).pop();
            },
          ),
        ],
      );
}
