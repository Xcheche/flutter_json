import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.teal),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final jsonStr = await DefaultAssetBundle.of(context)
        .loadString('load_json/person.json');
    final jsonData = json.decode(jsonStr);
    setState(() {
      data = jsonData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Load Json App"),
      ),
      body: Center(
        child: Container(
          child: data.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Name: ${data[index]["name"]}"),
                          Text("Age: ${data[index]["age"]}"),
                          Text("Height: ${data[index]["height"]}"),
                          Text("Hair Color: ${data[index]["hair_color"]}"),
                          Text("Gender: ${data[index]["gender"]}"),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
