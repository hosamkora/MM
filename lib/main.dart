import 'package:flutter/material.dart';
import 'package:hosam_test/view_model.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ListViewModel(),
      child: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Content(),
      ),
    );
  }
}

class Content extends StatelessWidget {
  Content({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final model = Provider.of<ListViewModel>(context, listen: false);
          showDialog(
            context: context,
            builder: (_) {
              return Center(
                child: Container(
                  color: Colors.grey,
                  width: 300,
                  height: 100,
                  child: Material(
                      child: Column(
                    children: <Widget>[
                      TextField(
                        controller: controller,
                      ),
                      FlatButton(
                        onPressed: () {
                          final model = Provider.of<ListViewModel>(context,
                              listen: false);
                          final val = controller.text;
                          model.additem(val);
                          Navigator.of(context).pop();
                        },
                        child: Text('Done'),
                      )
                    ],
                  )),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ListViewModel>(
      builder: (_, model, __) {
        return ListView(
          children: model.strings
              .map((string) => Text(
                    string,
                    style: TextStyle(fontSize: 35),
                  ))
              .toList(),
        );
      },
    );
  }
}
