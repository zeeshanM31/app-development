import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // Function to reset the counter
  void _resetCounter() {
    setState(() {
      _counter = 0; // Reset the counter
    });
  }

  // Increment the counter
  void _incrementCounter() {
    setState(() {
      _counter++; // Increment counter
    });
  }

  // Decrement the counter (allow negative numbers)
  void _decrementCounter() {
    setState(() {
      _counter--; // Decrement counter, no restriction on negative numbers
    });
  }

  // Display special messages when milestones are reached
  String _getMilestoneMessage() {
    if (_counter == 10) {
      return "Great job! You've reached 10!";
    } else if (_counter == 50) {
      return "Halfway there! Keep it up!";
    } else if (_counter == 100) {
      return "Congratulations! You've reached 100!";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Counter App')),
      body: Container(
        decoration: BoxDecoration(
          // Gradient background color
          gradient: LinearGradient(
            colors: [
              Colors.pink.shade100,
              Colors.blue.shade100,
            ], // Light pink to light blue
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                '$_counter',
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(color: Colors.black),
              ),
              Text(
                _getMilestoneMessage(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.black),
                    onPressed: _decrementCounter,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.black),
                    onPressed: _incrementCounter,
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh, color: Colors.black),
                    onPressed: _resetCounter, // Reset counter on click
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}