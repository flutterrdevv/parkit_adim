import 'dart:io';

import 'package:clipboard/clipboard.dart';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:park_admin/helpers/utils.dart';
import 'package:park_admin/widgets/text_area_widget.dart';

import 'controls_widget.dart';

class TextRecognitionWidget extends StatefulWidget {
  const TextRecognitionWidget({
    Key? key,
  }) : super(key: key);

  @override
  TextRecognitionWidgetState createState() => TextRecognitionWidgetState();
}

class TextRecognitionWidgetState extends State<TextRecognitionWidget> {
  XFile? imageFile;
  TextRecognizer textRecognizer = TextRecognizer();
  String scannedText = "";

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(child: buildImage()),
              const SizedBox(height: 16),
              ControlsWidget(
                onClickedPickImage: () => pickImage(ImageSource.gallery),
                onClickedScanImage: () => pickImage(ImageSource.camera),
                onClickedScanText: () => imageFile != null
                    ? scanText()
                    : showSnackBar('Select Image', context),
                onClickedClear: clear,
              ),
              const SizedBox(height: 16),
              TextAreaWidget(
                text: scannedText,
                onClickedCopy: copyToClipboard,
              ),
            ],
          ),
        ),
      );

  Widget buildImage() {
    return Container(
      child: imageFile != null
          ? Image.file(File(imageFile!.path))
          : const Icon(Icons.photo, size: 80, color: Colors.black),
    );
  }

  Future pickImage(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source);
    setImage(file);
  }

  Future scanText() async {
    print('Scanning text');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          // title: const Text("Alert Dialog Box"),
          // content: const Text("You have raised a Alert Dialog Box"),
          actions: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        );
      },
    );
    final inputImage = InputImage.fromFilePath(imageFile!.path);
    final text = await textRecognizer.processImage(inputImage);
    await textRecognizer.close();
    for (TextBlock block in text.blocks) {
      for (TextLine line in block.lines) {
        scannedText = "$scannedText${line.text}\n";
      }
    }
    scannedText.isNotEmpty
        ? setText(scannedText)
        : setText('No text in Image (');

    Navigator.of(context).pop();
  }

  void clear() {
    setImage(null);
    setText('');
  }

  void copyToClipboard() {
    if (scannedText.trim() != '') {
      FlutterClipboard.copy(scannedText);
    }
  }

  void setImage(newImage) {
    setState(() {
      imageFile = newImage;
    });
  }

  void setText(String newText) {
    setState(() {
      scannedText = newText;
    });
  }
}
