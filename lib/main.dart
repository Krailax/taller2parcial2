import 'package:flutter/material.dart';
import 'package:taller2parcial2/services/mockapi.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MockApi mockApi = MockApi();
  int _count1 = 0;
  int _count2 = 0;
  int _count3 = 0;

  Future<void> _incrementCounter1() async {
    int newValue = await mockApi.getFerrariInteger();
    setState(() {
      _count1 = newValue;
    });
  }

  Future<void> _incrementCounter2() async {
    int newValue = await mockApi.getHyundaiInteger();
    setState(() {
      _count2 = newValue;
    });
  }

  Future<void> _incrementCounter3() async {
    int newValue = await mockApi.getFisherPriceInteger();
    setState(() {
      _count3 = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.deepOrange, 
            child: const Center(
              child: Text(
                'Asynchronous Calls',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 59, 3, 156), 
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _incrementCounter1,
                      child: const Text('getFerrariInteger'), 
                    ),
                    Text('$_count1', style: const TextStyle(color: Colors.white)),
                    ElevatedButton(
                      onPressed: _incrementCounter2,
                      child: const Text('getHyundaiInteger'), 
                    ),
                    Text('$_count2', style: const TextStyle(color: Colors.white)), 
                    ElevatedButton(
                      onPressed: _incrementCounter3,
                      child: const Text('getFisherPriceInteger'), 
                    ),
                    Text('$_count3', style: const TextStyle(color: Colors.white)), 
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
