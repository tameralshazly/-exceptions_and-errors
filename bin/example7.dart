void main(List<String> args) {
  Dog(isTired: false).run();
  try {
    Dog(isTired: true).run();
  } catch (e, stackTrace) {
    print(e);
    print(stackTrace);
  }
}

class DogIsTiredException implements Exception {
  final String message;
  DogIsTiredException([this.message = 'Poor doggy is tired']);
}

class Dog {
  final bool isTired;

  const Dog({
    required this.isTired,
  });

  void run() {
    if (isTired) {
      throw DogIsTiredException('Poor doggy is tired');
    } else {
      print('Dog is running...');
    }
  }
}
