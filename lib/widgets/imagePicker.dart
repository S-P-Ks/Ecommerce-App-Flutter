import 'dart:io';
import 'package:ecommapp/controllers/imagePicker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicker extends GetView<ImagePickerController> {
  const ImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black54,
            // backgroundImage: image != null ? FileImage(image!) : null,
          ),
          TextButton.icon(
            onPressed: () => controller.getImage(),
            icon: const Icon(Icons.image),
            label: const Text("Add Image"),
          )
        ],
      ),
    );
  }
}
