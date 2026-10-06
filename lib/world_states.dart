import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStatesScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
  duration: Duration(seconds: 6),
  vsync: this
  )..repeat();
  @override

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final colorList = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amber.shade900,
      //   title: Text('Covid 19 Data'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              PieChart(
                dataMap:{
                  "Total": 20,
                  "Recovered": 3,
                  "Deaths": 17
                }
                )
            ],
          ),
        )
        ),
    );
  }
}