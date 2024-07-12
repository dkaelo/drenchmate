import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drenchmate/features/record/controllers/record_controller.dart';
import 'package:drenchmate/features/record/views/record_form.dart';
import 'package:drenchmate/features/record/views/widgets/record_list.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  void initState() {
    super.initState();
    // Fetch records during initialization
    Provider.of<RecordController>(context, listen: false).fetchRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RecordForm()),
        ),
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: RecordList(),
      ),
    );
  }
}
