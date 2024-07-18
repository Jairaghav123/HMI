import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class JsonDataWidget extends StatefulWidget {
  @override
  _JsonDataWidgetState createState() => _JsonDataWidgetState();
}

class _JsonDataWidgetState extends State<JsonDataWidget> {
  String jsonData = '';

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('asset/generated_json/All_Black20240602_084216.json');
    final data = json.decode(response);
    setState(() {
      jsonData = const JsonEncoder.withIndent('  ').convert(data); // Pretty print JSON
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Data'),
      ),
      body: jsonData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(jsonData),
      ),
    );
  }
}
