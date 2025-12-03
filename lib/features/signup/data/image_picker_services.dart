import 'dart:io';
import 'dart:math';

import 'package:image_picker/image_picker.dart';

class ImagePickerServices {
  File? _selectedImage; 
  static Future<File?> pickFromGallery() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    
    if (pickedImage == null) ;
    //return File(pickedImage.path);
    
  
   }


  static Future<File?> pickFromCamera() async {

    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage == null);
    //return File(pickedImage.path);

  }
  }
