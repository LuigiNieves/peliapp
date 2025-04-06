import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ApiExample extends StatefulWidget {
  @override
  _ApiExampleState createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  List<dynamic> data = [];

  Future<void> fetchData() async {
    final url = Uri.parse('https://api.ejemplo.com/datos');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consumo de API en Flutter')),
      body: data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['nombre']),
                  subtitle: Text('Edad: ${data[index]['edad']}'),
                );
              },
            ),
    );
  }
}
