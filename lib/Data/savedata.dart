import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  List<Map<String, String>> _dataList = [];
  Map<String, String>? _selectedAgent;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> agentData = prefs.getStringList('agents') ?? [];
    setState(() {
      _dataList = agentData.map((data) => Map<String, String>.from(jsonDecode(data))).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Data'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: _dataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_dataList[index]['name']!),
                  onTap: () {
                    setState(() {
                      _selectedAgent = _dataList[index];
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: _selectedAgent == null
                ? const Center(child: Text('Select an agent to view details'))
                : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Agent Name: ${_selectedAgent!['name']}', style: const TextStyle(fontSize: 18)),
                  Text('Agent Address: ${_selectedAgent!['address']}', style: TextStyle(fontSize: 18)),
                  Text('Lorry Number: ${_selectedAgent!['lorryNumber']}', style: TextStyle(fontSize: 18)),
                  Text('No of Bags: ${_selectedAgent!['noOfBags']}', style: TextStyle(fontSize: 18)),
                  Text('Lot Weight: ${_selectedAgent!['lotWeight']}', style: TextStyle(fontSize: 18)),
                  Text('Type and Grade: ${_selectedAgent!['typeAndGrade']}', style: TextStyle(fontSize: 18)),
                  Text('Analysis Sample weight: ${_selectedAgent!['analysisSampleWeight']}', style: TextStyle(fontSize: 18)),
                  Text('Analysis Sample weight 2: ${_selectedAgent!['analysisSampleWeight2']}', style: TextStyle(fontSize: 18)),
                  Text('Lorry Sample weight: ${_selectedAgent!['lorrySampleWeight']}', style: TextStyle(fontSize: 18)),
                  Text('Moisture level: ${_selectedAgent!['moistureLevel']}', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
