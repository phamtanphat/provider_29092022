import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DemoProviderBasicPage extends StatefulWidget {

  @override
  State<DemoProviderBasicPage> createState() => _DemoProviderBasicPageState();
}

class _DemoProviderBasicPageState extends State<DemoProviderBasicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Provider Basic"),
      ),
      body: Container(
        child: Center(
          child: Provider(
            create: (context) => 10,
            child: OngBa(
              child: Chame(),
            ),
          ),
        ),
      ),
    );
  }
}

class OngBa extends StatelessWidget {

  Widget child;
  
  OngBa({required this.child});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Ong ba"),
          child
        ],
      ),
    );
  }
}

class Chame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    int value = Provider.of(context);
    return Container(
      child: Text("Cha me, value: $value"),
    );
  }
}



