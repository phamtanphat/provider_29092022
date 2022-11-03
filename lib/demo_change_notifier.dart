import 'package:flutter/material.dart';
class DemoChangeNotifierPage extends StatefulWidget {

  @override
  State<DemoChangeNotifierPage> createState() => _DemoChangeNotifierPageState();
}

class _DemoChangeNotifierPageState extends State<DemoChangeNotifierPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Change Notifier"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Center(child: ChangeNotifierContainer()),
      ),
    );
  }
}

class ChangeNotifierContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Count "),
        ElevatedButton(
            onPressed: () {

            },
            child: Text("Increase")
        )
      ],
    );
  }
}


class Count {
  int value = 0;

  void increaseValue() {
    value += 1;
  }
}
