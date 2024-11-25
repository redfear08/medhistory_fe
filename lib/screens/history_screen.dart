import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/neomorphic_container.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, dynamic>> _medicalHistory = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMedicalHistory();
  }

  Future<void> _fetchMedicalHistory() async {
    try {
      final response = await http
          .get(Uri.parse("http://127.0.0.1:5000/get-medical-history"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _medicalHistory =
              List<Map<String, dynamic>>.from(data['medical_history']);
          _isLoading = false;
        });
      } else {
        throw Exception("Failed to fetch medical history");
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      // Handle the error gracefully, e.g., show a message
      print("Error fetching medical history: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Medical History")),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _medicalHistory.isEmpty
              ? Center(
                  child: NeomorphicContainer(
                    child: Text("No medical history available."),
                  ),
                )
              : ListView.builder(
                  itemCount: _medicalHistory.length,
                  itemBuilder: (context, index) {
                    final historyItem = _medicalHistory[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: Image.network(
                          "http://127.0.0.1:5000/${historyItem['image_url']}",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title:
                            Text("Uploaded at: ${historyItem['upload_date']}"),
                        subtitle: Text("ID: ${historyItem['id']}"),
                      ),
                    );
                  },
                ),
    );
  }
}
