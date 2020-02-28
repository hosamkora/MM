import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: MyHome(),
    ));
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.grey,
      body: Container(),
    );
  }

  Widget myDrawer() {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 200,
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                // Container(
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //     image: AssetImage("assets/images/background.jpg"),
                //     fit: BoxFit.cover,
                //   )),
                // ),
                Positioned.fill(
                  child: Container(
                    child: Image.asset(
                      "assets/images/background.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text("Main"),
          Text("About")
        ],
      ),
    );
  }
}
