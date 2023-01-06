import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/app/locator.dart';
import 'package:flutter_shared_preferences/services/shared_preferences_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colorful Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Colorful Counter App'),
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
  final sharedPrefService = serviceLocator<SharedPreferencesService>();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Easily persist the counter value to shared preferences
      sharedPrefService.counterValue = ++_counter;
    });

    // Easily change the theme color on shared preferences when the counter is a multiple of 5
    if (_counter % 5 == 0) {
      _changeThemeColor();
    }
  }

  void _changeThemeColor() {
    // Get a random color from the list of colors
    final color = Colors.primaries[_counter % Colors.primaries.length].value;

    // Easily persist the theme color to shared preferences
    sharedPrefService.themeColor = Color(color);
  }

  void _resetValues() {
    setState(() {
      sharedPrefService.counterValue = 0;
      sharedPrefService.themeColor = Colors.blue;
      _counter = 0;
    });
  }

  @override
  void initState() {
    super.initState();

    // Easily get the counter value from shared preferences
    _counter = sharedPrefService.counterValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Easily get the theme color from shared preferences
      backgroundColor: sharedPrefService.themeColor,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetValues,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
