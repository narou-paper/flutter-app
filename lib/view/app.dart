import 'dart:math';

import 'package:flutter/material.dart';
import 'package:narou_paper/view_model/app.dart';
import 'package:provider/provider.dart';

class NarouPaperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NarouPaper',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[800],
        accentColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (_) => NarouPagerAppViewModel(SliverList(
          delegate: SliverChildBuilderDelegate((context, index) =>
              Text(Random.secure().nextInt(10000).toString())),
        )),
        child: Scaffold(
          body: _ScrollWidget(),
          drawer: _DrawerWidget(),
          floatingActionButton: _FabWidget(),
        ),
      ),
    );
  }
}

class _ScrollWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Text('NarouPaper'),
            ),
            stretch: false,
            floating: true,
            pinned: false,
            snap: false,
          ),
          context.select((NarouPagerAppViewModel viewModel) => viewModel.sliver)
        ],
      );
}

class _DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'NarouPaper',
                style: Theme.of(context).primaryTextTheme.headline5,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text('Novel List'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
}

class _FabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      );
}
