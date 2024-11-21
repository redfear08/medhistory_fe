import 'package:flutter/material.dart';
import 'upload_screen.dart';
import 'summary_screen.dart';
import 'medicine_screen.dart';
import 'history_screen.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medical App"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              label: "Upload Document",
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => UploadScreen()));
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              label: "View Summary",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SummaryScreen()));
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              label: "Suggest Medicines",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => MedicineScreen()));
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              label: "View Medical History",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => HistoryScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
