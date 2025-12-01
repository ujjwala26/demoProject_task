import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagePicker extends StatefulWidget {
  const imagePicker({super.key});

  @override
  State<imagePicker> createState() => _imagePickerState();
}

class _imagePickerState extends State<imagePicker> {

  File? _selectedImage;

  Future _pickImageFromGallery()async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });

  }
  Future _pickImageFromcamera()async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              TextButton(onPressed: (){
                
                _pickImageFromGallery();
              }, child: Text("gallery")),
              TextButton(onPressed: (){

               _pickImageFromcamera();
              }, child: Text("camera")),
              _selectedImage != null ? Image.file(_selectedImage!) : Text("please select an image"),
            ],
          )
        ],
      ),

    );
  }
}