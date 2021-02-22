import 'package:flutter/material.dart';

import 'package:narou_paper/model/db.dart';
import 'package:narou_paper/view/episode_sending_future_dialog.dart';
import 'package:narou_paper/view_model/send_episode.dart';
import 'episode_images_preview_dialog.dart';

class EpisodeSendingDialog extends StatelessWidget {
  final Episode episode;

  EpisodeSendingDialog(this.episode);

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
            child: Text('Preview'),
            onPressed: () async {
              final images = await generateImagesFromEpisode(episode).toList();
              showDialog(
                context: context,
                builder: (_) => EpisodeImagesPreviewDialog(images),
              );
            },
          ),
          TextButton(
            child: Text('Send!'),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (_) => EpisodeSendingFutureDialog(episode),
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      );
}
