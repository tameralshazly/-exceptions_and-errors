// ignore_for_file: public_member_api_docs, sort_constructors_first
void main(List<String> args) {
  try {
    tryCreatingPerson(age: 20);
    tryCreatingPerson(age: -1);
    tryCreatingPerson(age: 141);
  } catch (e, stacktrace) {
    print(e);
    print(stacktrace);
  }
}

class InvalidAgeExceptions implements Exception {
  final int age;
  final String message;

  InvalidAgeExceptions(this.age, this.message);

  @override
  String toString() => 'InvalidAgeExceptions(age: $age, message: $message)';
}

class Person {
  final int age;

  Person({
    required this.age,
  }) {
    if (age <= 0) {
      throw InvalidAgeExceptions(age, 'Age must be positive');
    } else if (age > 140) {
      throw InvalidAgeExceptions(age, 'Age can not be greater than 140');
    }
  }
}

void tryCreatingPerson({int age = 0}) {
  try {
    print(Person(age: age).age);
  } on InvalidAgeExceptions {
    rethrow;
  } catch (e, stacktrace) {
    print(e);
    print(stacktrace);
  }
}
