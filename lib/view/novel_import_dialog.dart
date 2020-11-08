import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:narou_paper/view_model/novel_import_dialog.dart';

class NovelImportDialog extends StatelessWidget {
  String _ncodeValidator(String ncode) =>
      (RegExp(r'^[nN]\d{4}[a-zA-Z]{2}$').hasMatch(ncode))
          ? null
          : 'Nコードの形式に合わせてください\n複数入力はできません';

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<NovelImportDialogViewModel>(
        create: (_) => NovelImportDialogViewModel(),
        child: Builder(
          builder: (BuildContext context) => AlertDialog(
            title: Text('小説追加'),
            content: Form(
              key: context.select(
                  (NovelImportDialogViewModel viewModel) => viewModel.formKey),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'n1234ab',
                  labelText: 'Nコード',
                  errorMaxLines: 2,
                ),
                maxLength: 7,
                onSaved: (String ncode) =>
                    context.read<NovelImportDialogViewModel>().ncode = ncode,
                validator: _ncodeValidator,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Import'),
                onPressed: () {
                  final form = context
                      .read<NovelImportDialogViewModel>()
                      .formKey
                      .currentState;
                  if (form.validate()) {
                    form.save();
                    context.read<NovelImportDialogViewModel>().submit();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      );
}
