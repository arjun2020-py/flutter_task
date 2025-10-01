import 'package:flutter/material.dart';

class NavigtionService {
  static final GlobalKey<NavigatorState> navigtorKey =
      GlobalKey<NavigatorState>();

  Future<dynamic> pushName(String routeName, {dynamic arguments}) {
    return navigtorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> onPush(Widget screen) {
    return navigtorKey.currentState!.push(
      MaterialPageRoute(builder: (conext) => screen),
    );
  }


}
