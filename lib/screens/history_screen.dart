import 'package:flutter/material.dart';
import '../widgets/neomorphic_container.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Medical History")),
      body: Center(
        child: NeomorphicContainer(
          child: Text("Medical history functionality to be implemented"),
        ),
      ),
    );
  }
}
