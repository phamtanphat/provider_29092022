import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_29092022/demo_change_notifier.dart';
class Count {
  int value = 0;

  void increaseValue() {
    value += 1;
  }
}

class CountService {
  Count? count;

  CountService();

  void updateCount(Count count) {
    count = count;
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
          Provider(create: (context) => Count()),
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
      )
    );
  }
}
