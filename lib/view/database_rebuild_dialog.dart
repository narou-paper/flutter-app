import 'package:flutter/material.dart';

import 'package:narou_paper/model/db.dart';

class DatabaseRebuildDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text('データベース初期化'),
        content: Text('本当に消して良いですか？'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Delete!'),
            onPressed: () {
              final migrator = NarouDatabase().createMigrator();
              for (final table in NarouDatabase().allTables) {
                migrator.deleteTable(table.actualTableName).then((value) =>
                    migrator.createTable(table).then((value) =>
                        NarouDatabase().markTablesUpdated([table].toSet())));
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      );
}
