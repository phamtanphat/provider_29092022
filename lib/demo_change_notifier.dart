import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Count extends ChangeNotifier {
  int value = 0;

  void increaseValue() {
    value += 1;
    notifyListeners();
  }
}

class DemoChangeNotifierPage extends StatefulWidget {

  @override
  State<DemoChangeNotifierPage> createState() => _DemoChangeNotifierPageState();
}

class _DemoChangeNotifierPageState extends State<DemoChangeNotifierPage> {
  @override
  Widget build(BuildContext context) {
    print("Parent Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Change Notifier"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Center(
            child: ChangeNotifierProvider(
                create: (context) => Count(),
                child: CountContainer()
            )
        ),
      ),
    );
  }
}

class CountContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Count count = Provider.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<Count>(
            builder: (context, count, child){
              return Text("Count ${count.value}");
            },
        ),
        ElevatedButton(
            onPressed: () {
                count.increaseValue();
            },
            child: Text("Increase")
        )
      ],
    );
  }
}


