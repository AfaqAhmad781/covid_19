import 'package:covid19_tracker/reusable_row.dart';
import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              PieChart(
                animationDuration: Duration(milliseconds: 1200) ,
                chartType: ChartType.ring,
                colorList: colorList,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.left
                ),
                dataMap:{
                  "Total": 20,
                  "Recovered": 3,
                  "Deaths": 17 }
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height  * 0.06 ),
                  child: Card(
                    child: Column(
                      children: [
                        ReusableRow(title: 'Total',value: '50,126'),
                        ReusableRow(title: 'Recovered',value: '30,333'),
                        ReusableRow(title: 'Deaths',value: '20,745'),
                        ReusableRow(title: 'Critical',value: '10,253'),
                        ReusableRow(title: 'Hospitals',value: '577'),
                        ReusableRow(title: 'Doctos',value: '3,234'),
                      ],
                      ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff1aa260),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text('Track Countries'),  
                  ),
                )
            ],
          ),
        )
        ),
    );
  }
}