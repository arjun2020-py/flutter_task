import 'package:flutter/material.dart';

import 'utils/helper/custom_navigtion.dart';
import 'utils/router/navigtion_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      navigatorKey: NavigtionService.navigtorKey,
      initialRoute: CustomRoute().splash,
      routes: customMainRouter,
    );
  }
}
