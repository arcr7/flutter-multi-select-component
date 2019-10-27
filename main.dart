import 'package:flutter/material.dart';
import 'package:multi_select/multiselect/multiselect.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Select Component',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List checkedItems = [];
  List items = [
    {"isChecked": false, "name": "Item 1"},
    {"isChecked": false, "name": "Item 2"},
    {"isChecked": false, "name": "Item 3"},
    {"isChecked": false, "name": "Item 4"},
    {"isChecked": false, "name": "Item 5"},
    {"isChecked": false, "name": "Item 6"},
    {"isChecked": false, "name": "Item 7"},
    {"isChecked": false, "name": "Item 8"},
    {"isChecked": false, "name": "Item 9"},
    {"isChecked": false, "name": "Item 10"}
  ];

  setSelectedItem(selectedItems) {
    checkedItems = selectedItems
        .where((selectedItem) => selectedItem["isChecked"] == true)
        .toList();
    print(checkedItems);
  }

  resetAll() {
    items.forEach((item) {
      item["isChecked"] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Multi-Select Component"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: MultiSelectComponent(
                    items: items,
                    title: "Choose items",
                    resetAll: () => resetAll(),
                    onChange: (selectedItem) => setSelectedItem(selectedItem),
                    hint: "List")),
          ],
        ));
  }
}
