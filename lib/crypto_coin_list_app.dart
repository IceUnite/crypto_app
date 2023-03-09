import 'package:crypto_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'router/router.dart';

class CryptoCoinListApp extends StatelessWidget {
  const CryptoCoinListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      routes: routes,
      initialRoute: '/coins_list',
    );
  }
}