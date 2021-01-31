import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:narou_paper/model/db.dart';
import 'package:narou_paper/view_model/send_episode.dart';

class EpisodeSendingFutureDialog extends StatelessWidget {
  final Episode episode;

  final _hogeNovel = Novel(
    ncode: 'n1234ab',
    ncodeInt: null,
    title: 'title',
    writerNickname: 'nickname',
    writer: 0,
    story: null,
    isR18: false,
    isSerial: true,
    readEpisodeCount: 0,
    maxEpisodeNum: 10,
  );

  EpisodeSendingFutureDialog(this.episode);

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: sendEpisodeToPaper(episode, _hogeNovel),
        builder: (context, AsyncSnapshot<http.Response> snapshot) {
          developer.log('snapshot', error: snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (snapshot.error != null)
            return _ErrorDialog(snapshot.error);
          else if (snapshot.data.statusCode == 200)
            return _FinishedDialog(snapshot.data.body);
          else
            return _ErrorDialog({
              'status code': snapshot.data.statusCode,
              'body': snapshot.data.body,
            });
        },
      );
}

class _FinishedDialog extends StatelessWidget {
  final String responseBody;

  const _FinishedDialog(this.responseBody);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text('送信完了'),
        content: Column(
          children: <Widget>[
            Text('電子ペーパーに転送しました'),
            Text(
              responseBody,
              style: TextStyle(color: Colors.lightGreen),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
}

class _ErrorDialog extends StatelessWidget {
  final Object error;

  _ErrorDialog(this.error);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text('エラー'),
        content: Column(
          children: <Widget>[
            Text('データ転送時にエラーが発生しました'),
            Text(
              error.toString(),
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
}
