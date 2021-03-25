import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter PDF'),
      ),
      body: Container(
        child: Center(
          child: file != null
              ? PDF.file(file)
              : RaisedButton(
                  onPressed: () async {
                    File pickedFile = await FilePicker.getFile(
                      type: FileType.custom,
                      allowedExtensions: ['pdf', 'doc'],
                    );
                    setState(() {
                      file = pickedFile;
                    });
                  },
                  child: Text('Grab a File'),
                ),
        ),
      ),
    );
  }
}
