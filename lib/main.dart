import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invoce_gentertaer/invoce/invoce_pdf/pdf_view.dart';
import 'package:invoce_gentertaer/screen/home_screen.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Home_Screen(),
        'pdf':(context)=>Invoce_Pdf(),
      },
    )
  );
}
