import 'package:flutter/foundation.dart';
import 'package:invoce_gentertaer/screen/Modal_class.dart';
import 'package:invoce_gentertaer/screen/home_screen.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


Future<Uint8List> savePDF(List p1) async {

  var pdf=pw.Document();
  pdf.addPage(pw.Page(build: (context) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      children: [
        // label("Product"),

        pw.Expanded(
          child: pw.ListView.builder(itemBuilder: (context, index) {
            return pw.Center(child: pw.Text("Product Name \n\n${p1[index].name}\n\n"),);
          },itemCount: itemList.length,),
        ),
        pw.Expanded(
          child: pw.ListView.builder(itemBuilder: (context, index) {
            return pw.Center(child: pw.Text("Qty \n\n${p1[index].qty}\n\n"),);
          },itemCount: itemList.length,),
        ),
        pw.Expanded(
          child: pw.ListView.builder(itemBuilder: (context, index) {
            return pw.Center(child: pw.Text("Price  \n\n${p1[index].price}\n\n"),);
          },itemCount: itemList.length,),
        ),
      ],
    );



  },orientation: pw.PageOrientation.portrait,
  pageFormat: PdfPageFormat.a4,
  margin: pw.EdgeInsets.all(10),));
  return await pdf.save();
}