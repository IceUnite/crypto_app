import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        dividerColor: Colors.white24,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 31, 31, 31),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        listTileTheme: ListTileThemeData(iconColor: Colors.white),
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
      home: const MyHomePage(title: 'My crypto app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme1 = Theme.of(context).textTheme.bodyMedium;
    final theme2 = Theme.of(context).textTheme.labelSmall;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.separated(
            itemCount: 15,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'bitcoin',
                  style: theme1,
                ),
                subtitle: Text(
                  '10000\$',
                  style: theme2,
                ),
                leading: Image.asset(
                  'assets/png/Bitcoin.svg.png',
                  width: 40,
                  height: 40,
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              );
            }) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
