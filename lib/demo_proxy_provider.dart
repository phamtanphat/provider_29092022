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