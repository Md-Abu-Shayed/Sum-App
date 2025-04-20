import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SumApp(),
        title: 'Sum App',
        debugShowCheckedModeBanner: false);
  }
}

class SumApp extends StatefulWidget {
  const SumApp({super.key});

  @override
  State<SumApp> createState() => _SumAppState();
}

class _SumAppState extends State<SumApp> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  TextEditingController number3Controller = TextEditingController();
  double total = 0;

  void calculateTotal() {
    double? num1 = double.tryParse(number1Controller.text);
    double? num2 = double.tryParse(number2Controller.text);
    double? num3 = double.tryParse(number3Controller.text);

    if (num1 != null && num2 != null && num3 != null) {
      setState(() {
        total = num1 + num2 + num3;
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please enter valid numbers')));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sum App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(total.toString(), style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            TextFormField(
              controller: number1Controller,
              decoration: InputDecoration(
                labelText: 'Number 1',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            TextFormField(
              controller: number2Controller,
              decoration: InputDecoration(
                labelText: 'Number 2',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),
            TextFormField(
              controller: number3Controller,
              decoration: InputDecoration(
                labelText: 'Number 3',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
                calculateTotal();
              }, child: Text('Sum')),
            ),
          ],
        ),
      ),
    );
  }
}
