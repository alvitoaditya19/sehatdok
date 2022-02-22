part of 'extensions.dart';

extension FirebaseUserExtension on auth.User {
  User convertToUser({
    String name = "No Name",

    int balance = 10000,
  }) =>
      User(
        this.uid,
        this.email,
        name: name,
        balance: balance,
      );

  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);
}
