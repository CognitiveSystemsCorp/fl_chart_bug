import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<FlSpot> points = [];
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(milliseconds: 1000), () {
      points.add(FlSpot(5, 5));
      setState(() {
      });
    });   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fl_chart Test'),
      ),
      body: SizedBox(
        height: 200,
        width: 400,
        child: LineChart(
          swapAnimationDuration: const Duration(milliseconds: 0),
          LineChartData(
            minY: 0,
            minX: 0,
            maxY: 10,
            maxX: 10,
            borderData: FlBorderData(
              show: true,      
            ),  
            lineBarsData: [
              LineChartBarData(
                spots: points,
                dotData: FlDotData(
                  show: false,
                ),
              ),         
            ],
            titlesData: FlTitlesData(
              show: false,
            ),
          ),
        ),
      ),
    );
  }
}
