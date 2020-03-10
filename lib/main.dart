import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var list = <ItemData>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Things"),
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.shopping_cart),
          Text(list.length.toString())
        ],
      ),
      body: ListView(
        children: list.map((itemData) => CustomListItem(itemData)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void addItem() {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    showDialog(
        context: context,
        builder: (_) {
          return Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 5),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: "Name"),
                    ),
                    TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(labelText: "age"),
                    ),
                    FlatButton(
                      child: Text("Confirm"),
                      onPressed: () {
                        final name = nameController.text;
                        final age = int.parse(ageController.text);

                        final width = Random().nextInt(500);
                        list.add(ItemData(
                            name: name,
                            age: age,
                            imageUrl:
                                "https://placeimg.com/$width/$width/any"));
                        setState(() {});
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

// https://placeimg.com/400/400/any

class CustomListItem extends StatelessWidget {
  final ItemData itemData;
  const CustomListItem(this.itemData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Image(
              image: NetworkImage(itemData.imageUrl),
              height: 100,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  itemData.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "${itemData.age} year",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemData {
  final String name;
  final int age;
  final String imageUrl;

  ItemData({this.name, this.age, this.imageUrl});
}
