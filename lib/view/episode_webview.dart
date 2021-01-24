import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:narou_paper/model/db.dart';
import 'package:narou_paper/view_model/episode_webview.dart';

class EpisodeWebView extends StatelessWidget {
  final Episode initialEpisode;

  EpisodeWebView(this.initialEpisode);

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<EpisodeWebViewViewModel>(
        create: (_) => EpisodeWebViewViewModel(initialEpisode),
        child: Builder(
          builder: (BuildContext context) => WebviewScaffold(
            appBar: AppBar(
              title: Text(
                context.watch<EpisodeWebViewViewModel>().episode.title,
                maxLines: 3,
              ),
            ),
            body: Builder(builder: (BuildContext context) {
              final uri = context.select(
                (EpisodeWebViewViewModel viewModel) => viewModel.episodeUri,
              );
              return WebView(
                initialUrl: 'about:blank',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) =>
                    webViewController.loadUrl(uri.toString()),
              );
            }),
          ),
        ),
      );
}
