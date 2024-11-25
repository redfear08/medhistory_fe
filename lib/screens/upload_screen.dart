import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import '../utils/api_helper.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _imageFile;
  XFile? _webImageFile; // For Web
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  // Function to pick image from gallery or camera
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb) {
        // Web platform
        setState(() {
          _webImageFile = pickedFile;
        });
      } else {
        // Mobile platform
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    }
  }

  // Function to upload image to the backend
  Future<void> _uploadImage() async {
    if (_imageFile == null && _webImageFile == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No image selected!")));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final dio = Dio();
      FormData formData;

      if (kIsWeb) {
        // Web: Use multipart file from bytes
        formData = FormData.fromMap({
          "file": MultipartFile.fromBytes(
            await _webImageFile!.readAsBytes(),
            filename: "document.jpg",
          ),
        });
      } else {
        // Mobile: Use multipart file from file path
        formData = FormData.fromMap({
          "file": await MultipartFile.fromFile(
            _imageFile!.path,
            filename: "document.jpg",
          ),
        });
      }

      final response = await dio.post(
        "http://127.0.0.1:5000/upload-document", // Replace with your API endpoint
        data: formData,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Uploaded successfully: ${response.data}")),
      );
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
            // Display image preview
            if (_imageFile != null && !kIsWeb)
              Image.file(
                _imageFile!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            if (_webImageFile != null && kIsWeb)
              Image.network(
                _webImageFile!.path,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
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
