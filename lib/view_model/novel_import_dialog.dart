import 'package:flutter/material.dart';

import 'package:narou_paper/repository/novel.dart';

class NovelImportDialogViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String ncode;

  void submit() => NovelsRepository.addNovel(ncode);
}
