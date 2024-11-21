import 'package:flutter/material.dart';
import '../widgets/neomorphic_container.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Summary")),
      body: Center(
        child: NeomorphicContainer(
          child: Text("Summary functionality to be implemented"),
        ),
      ),
    );
  }
}
