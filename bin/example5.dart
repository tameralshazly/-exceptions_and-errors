// ignore_for_file: public_member_api_docs, sort_constructors_first
void main(List<String> args) {
  try {
    print('Dog age 11 is going to run...');
    Dog(age: 11, isTired: false).run();
  } catch (e) {
    print(e);
  }

  try {
    print('a tired dog is going to run...');
    Dog(age: 2, isTired: true).run();
  } catch (e) {
    print(e);
  }
}

class Throws<T> {
  final List<T> exceptions;

  const Throws(this.exceptions);
}

class DogIsTooOldException implements Exception {}

class DogIsTiredException implements Exception {}

class Animal {
  final int age;
  const Animal({
    required this.age,
  });

  @Throws([UnimplementedError])
  void run() => throw UnimplementedError();
}

class Dog extends Animal {
  final bool isTired;

  const Dog({
    required this.isTired,
    required super.age,
  });

  @Throws([DogIsTooOldException, DogIsTiredException])
  @override
  void run() {
    if (age > 10) {
      throw DogIsTooOldException();
    } else if (isTired) {
      throw DogIsTiredException();
    } else {
      print('Dog is running...');
    }
    super.run();
  }
}
