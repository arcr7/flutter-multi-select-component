import 'package:flutter/material.dart';

class MultiSelectComponent extends StatefulWidget {
  final Function onChange;
  final Function resetAll;
  Map selectedValue;
  String title;
  List items;
  final String hint;
  MultiSelectComponent(
      {Key key,
      @required this.onChange,
      @required this.items,
      this.hint,
      this.resetAll,
      this.title});
  @override
  MultiSelectComponentState createState() => MultiSelectComponentState();
}

class MultiSelectComponentState extends State<MultiSelectComponent> {
  @override
  Widget build(BuildContext context) {
    multiSelect(context, items) {
      return showDialog(
          context: context,
          builder: (BuildContext cont) {
            return StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                title: Text(widget.title),
                content: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = widget.items[index];
                            return ListTile(
                              leading: IconButton(
                                icon: item["isChecked"]
                                    ? Icon(
                                        Icons.check_box,
                                        color: Colors.green,
                                      )
                                    : Icon(
                                        Icons.check_box_outline_blank,
                                        color: Colors.green,
                                      ),
                                onPressed: () {
                                  setState(() {
                                    item["isChecked"] = !item["isChecked"];
                                  });
                                },
                              ),
                              title: Text(
                                item["name"],
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Reset all"),
                    onPressed: () {
                      widget.resetAll();
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        widget.onChange(items);
                        Navigator.of(context).pop();
                      })
                ],
              );
            });
          });
    }

    return GestureDetector(
      onTap: () => multiSelect(context, widget.items),
      child: DropdownButtonHideUnderline(
        child: InputDecorator(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.black)),
          ),
          child: Container(
            height: 20,
            child: DropdownButton(
              hint: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  widget.hint,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              icon: Icon(
                Icons.expand_more,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
