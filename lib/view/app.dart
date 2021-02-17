import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'package:narou_paper/view_model/app.dart';
import 'database_clear_dialog.dart';
import 'insert_test_data_dialog.dart';
import 'novel_import_dialog.dart';
import 'novel_list.dart';

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
        create: (_) => NarouPagerAppViewModel(NovelList()),
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
  List<Widget> _drawerWidgets(BuildContext context) => <Widget>[
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
      ];

  List<Widget> _debugWidgets(BuildContext context) => <Widget>[
        ListTile(
          leading: const Icon(Icons.delete_forever),
          title: const Text('Delete Database'),
          onTap: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (BuildContext context) => DatabaseClearDialog(),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.library_books),
          title: const Text('Insert Test Data'),
          onTap: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (BuildContext context) => InsertTestDataDialog(),
            );
          },
        ),
      ];

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: _drawerWidgets(context) +
              (foundation.kDebugMode ? _debugWidgets(context) : null),
        ),
      );
}

class _FabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => NovelImportDialog()),
        child: const Icon(Icons.add),
      );
}
