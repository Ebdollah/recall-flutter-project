import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget {
  final String? userName;
  final Function(String) updateUserName;

  UserProvider({
    required this.userName,
    required this.updateUserName,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }
}
