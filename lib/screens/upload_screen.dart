import 'package:flutter/material.dart';
import '../widgets/neomorphic_container.dart';

class UploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Document")),
      body: Center(
        child: NeomorphicContainer(
          child: Text("Upload functionality to be implemented"),
        ),
      ),
    );
  }
}
