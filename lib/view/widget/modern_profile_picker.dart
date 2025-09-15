import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/color.dart';
import '../../core/theme.dart';

class ModernProfilePicker extends StatefulWidget {
  const ModernProfilePicker({super.key});

  @override
  State<ModernProfilePicker> createState() => _ModernProfilePickerState();
}

class _ModernProfilePickerState extends State<ModernProfilePicker> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _image = null;

  @override
  void initState() {
    super.initState();
  }

  void _pickImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(180),
            onTap: _pickImage,
            child: _image == null
                ? CircleAvatar(
                    backgroundColor: ModernColors.textSecondary.withOpacity(
                      0.3,
                    ),
                    radius: 40,
                    child: Icon(CupertinoIcons.camera, size: 36),
                  )
                : Image.file(
                    File(_image!.path),
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
          ),
          SizedBox(width: 12),

          Text(
            "Add photo",

            style: TextStyle(
              color: ModernColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
