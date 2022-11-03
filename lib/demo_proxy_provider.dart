import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_29092022/demo_change_notifier.dart';
class Count {
  late int value;

  Count({required this.value});

  void increaseValue() {
    value += 1;
    print("Vao count");
  }
}

class CountService {
  Count? count;

  CountService();

  void updateCount(Count count) {
    this.count = count;
  }

  void handlerCountService() {
    count?.increaseValue();
  }
}

class CountRepository {
  CountService? countService;

  CountRepository();

  void updateCountService(CountService countService) {
    this.countService = countService;
  }

  void handlerCountRepository() {
    countService?.handlerCountService();
  }
}


class DemoProxyProvider extends StatefulWidget {

  @override
  State<DemoProxyProvider> createState() => _DemoProxyProviderState();
}

class _DemoProxyProviderState extends State<DemoProxyProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Proxy Provider"),
      ),
      body: MultiProvider(
        providers: [
          Provider(create: (context) => Count(value: 10)),
          ProxyProvider<Count, CountService>(
              create: (context) => CountService(),
              update: (context, count, service) {
                service?.updateCount(count);
                return service ?? CountService();
              }
          ),
          ProxyProvider<CountService, CountRepository>(
              create: (context) => CountRepository(),
              update: (context, service, repository) {
                repository?.updateCountService(service);
                return repository ?? CountRepository();
              }
          ),
        ],
        child: DemoContainer(),
      )
    );
  }
}

class DemoContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Center(
        child: Consumer<CountRepository>(
          builder: (context, repository, child){
            return  Column(
              children: [
                Text("Count ${repository.countService?.count?.value}"),
                ElevatedButton(
                    onPressed: () {
                      repository.handlerCountRepository();
                    },
                    child: Text("Increase")
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
