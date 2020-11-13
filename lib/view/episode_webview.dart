import 'dart:io';

import 'package:flutter/material.dart';
import 'package:narou_paper/view_model/episode_webview.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:narou_paper/model/db.dart';

class EpisodeWebView extends StatefulWidget {
  final Episode initialEpisode;

  EpisodeWebView(this.initialEpisode);

  @override
  State<StatefulWidget> createState() => EpisodeWebViewState(initialEpisode);
}

class EpisodeWebViewState extends State<EpisodeWebView> {
  final Episode initialEpisode;

  EpisodeWebViewState(this.initialEpisode);

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<EpisodeWebViewViewModel>(
        create: (_) => EpisodeWebViewViewModel(initialEpisode),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('hoge'),
          ),
          body: Builder(builder: (BuildContext context) {
            final uri = context.select(
                (EpisodeWebViewViewModel viewModel) => viewModel.episodeUri);
            return WebView(
              initialUrl: 'about:blank',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) =>
                  webViewController.loadUrl(uri.toString()),
            );
          }),
        ),
      );
}
