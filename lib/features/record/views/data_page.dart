import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drenchmate/features/record/controllers/record_controller.dart';
import 'package:drenchmate/features/record/models/record_database.dart';
import 'package:drenchmate/features/record/views/record_form.dart';
import 'package:drenchmate/features/record/views/widgets/record_list.dart';
import 'package:path_provider/path_provider.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {

  @override
  void initState(){
    super.initState();    
    RecordDatabase.fetchRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Records'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _exportRecordsToCSV(context),
            icon: Icon(Icons.file_download),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RecordForm()),
        ),
        child: const Icon(Icons.add),
      ),
      body: const RecordList(),
    );
  }

  void _exportRecordsToCSV(BuildContext context) async {
    try {
      final records = context.read<RecordController>().currentRecords;
      final directory = await getExternalStorageDirectory();
      final filePath = '${directory!.path}/records.csv';
      await RecordDatabase.exportRecordsToTxt(records);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Records exported to CSV'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to export records to CSV: $e'),
        ),
      );
    }
  }
}
