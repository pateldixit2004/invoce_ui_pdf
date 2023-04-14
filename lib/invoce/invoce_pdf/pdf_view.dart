

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:invoce_gentertaer/pdf_view/pdf_view.dart';
import 'package:invoce_gentertaer/screen/Modal_class.dart';
import 'package:invoce_gentertaer/screen/home_screen.dart';
import 'package:printing/printing.dart';

class Invoce_Pdf extends StatefulWidget {
  const Invoce_Pdf({Key? key}) : super(key: key);

  @override
  State<Invoce_Pdf> createState() => _Invoce_PdfState();
}

class _Invoce_PdfState extends State<Invoce_Pdf> {
  GlobalKey golbalKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    List<productModal> p1= ModalRoute.of(context)!.settings.arguments as List<productModal>;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Bridal Studio",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () async {


            await  Printing.layoutPdf(onLayout: (format) => savePDF(p1),);



          }, icon: Icon(Icons.download,color: Colors.black,)),
          TextButton(onPressed: () async {


           RenderRepaintBoundary? renderBoundry = golbalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
           var image = await renderBoundry.toImage();
           var byteData= await image.toByteData(format: ImageByteFormat.png);
           Uint8List uint8List = byteData!.buffer.asUint8List();
           await ImageGallerySaver.saveImage(uint8List);

          }, child: Text("Gallery"))
        ],
      ),
      body: RepaintBoundary(
        key: golbalKey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blue.shade300,
          child: Stack(
            children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // label("Product"),

                        Expanded(
                          child: ListView.builder(itemBuilder: (context, index) {
                            return Center(child: Text("Product Name \n\n${p1[index].name}\n\n"),);
                          },itemCount: itemList.length,),
                        ),
                        Expanded(
                          child: ListView.builder(itemBuilder: (context, index) {
                            return Center(child: Text("Qty \n\n${p1[index].qty}\n\n"),);
                          },itemCount: itemList.length,),
                        ),
                        Expanded(
                          child: ListView.builder(itemBuilder: (context, index) {
                            return Center(child: Text("Price  \n\n${p1[index].price}\n\n"),);
                          },itemCount: itemList.length,),
                        ),
                      ],
                    ),
                  ),
                ],
          ),
        ),
      ),


    ),);
  }
  Widget label(String? data)
  {
    return Container(
      height: 30,
      width: 60,
      color: Colors.blueGrey,
      child: Center(child: Text("$data",style: TextStyle(color: Colors.black),)),
    );
  }
}
