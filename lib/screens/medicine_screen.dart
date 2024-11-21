import 'package:flutter/material.dart';
import '../utils/api_helper.dart';
import '../widgets/neomorphic_container.dart';

class MedicineScreen extends StatefulWidget {
  @override
  _MedicineScreenState createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  List<String> _medicines = [];
  bool _isLoading = false;

  Future<void> _fetchMedicines() async {
    setState(() => _isLoading = true);

    try {
      final response = await ApiHelper().get("/suggest-medicines");
      setState(() {
        _medicines = List<String>.from(response.data['medicines'] ?? []);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to fetch medicines: $e")));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suggest Medicines")),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: _medicines.length,
              itemBuilder: (context, index) {
                return NeomorphicContainer(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child:
                        Text(_medicines[index], style: TextStyle(fontSize: 16)),
                  ),
                );
              },
            ),
    );
  }
}
