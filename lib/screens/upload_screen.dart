import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import '../utils/api_helper.dart';
import '../widgets/neomorphic_container.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  // Function to pick image from gallery or camera
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Function to upload image to the backend
  Future<void> _uploadImage() async {
    if (_imageFile == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No image selected!")));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await ApiHelper().post("/upload-document", {
        "file": await MultipartFile.fromFile(_imageFile!.path,
            filename: "document.jpg"),
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Uploaded successfully: ${response.data}")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Upload failed: $e")));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Document")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Check if the platform is Web or Mobile
            if (_imageFile != null)
              kIsWeb
                  ? Image.network(
                      _imageFile!.path) // For Web: Display image via URL
                  : Image.file(_imageFile!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover), // For Mobile: Display local image
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Pick Image"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Upload Image"),
            ),
          ],
        ),
      ),
    );
  }
}
