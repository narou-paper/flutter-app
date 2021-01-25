import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:image/image.dart';

Future<List<Image>> generatePictures(String html) async {
  final pdf = await Printing.convertHtml(
    format: PdfPageFormat(528, 880),
    html: html,
  );
  await for (final page in Printing.raster(pdf)) {
    final image = page.toImage();
    print(image);
  }
  final rasterList = await Printing.raster(pdf).toList();
  return Future.wait(rasterList.map((PdfRaster page) => page.toImage()));
}
