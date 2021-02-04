import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class EpisodeImagesPreviewDialog extends StatelessWidget {
  final List<ui.Image> images;

  EpisodeImagesPreviewDialog(this.images);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text('プレビュー'),
        content: ListView.separated(
          itemCount: images.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) => AspectRatio(
            aspectRatio: 528 / 880,
            child: CustomPaint(
              size: Size(528, 880),
              painter: _ImagePainter(images[index]),
            ),
          ),
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

class _ImagePainter extends CustomPainter {
  final ui.Image image;

  _ImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint(),
    );
  }

  @override
  bool shouldRepaint(_ImagePainter oldDelegate) {
    return image != oldDelegate.image;
  }
}
