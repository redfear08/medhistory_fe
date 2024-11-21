import 'package:flutter/material.dart';
import '../utils/api_helper.dart';
import '../widgets/neomorphic_container.dart';

class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  String? _summary;
  bool _isLoading = false;

  Future<void> _fetchSummary() async {
    setState(() => _isLoading = true);

    try {
      final response = await ApiHelper().get("/generate-summary");
      setState(() {
        _summary = response.data['summary'] ?? "No summary available.";
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to fetch summary: $e")));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Summary")),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : NeomorphicContainer(
                child: Text(_summary ?? "No summary yet.",
                    style: TextStyle(fontSize: 18)),
              ),
      ),
    );
  }
}
