import 'package:flutter/material.dart';
import '../widgets/neomorphic_container.dart';

class MedicineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suggest Medicines")),
      body: Center(
        child: NeomorphicContainer(
          child: Text("Medicine suggestion functionality to be implemented"),
        ),
      ),
    );
  }
}
