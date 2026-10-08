import 'package:covid19_tracker/countries_list.dart';
import 'package:covid19_tracker/model/world_states_model.dart';
import 'package:covid19_tracker/reusable_row.dart';
import 'package:covid19_tracker/services/Utilities/states_services.dart';
import 'package:shimmer/shimmer.dart';
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
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              FutureBuilder(
                future: statesServices.fetchWorldStatesRecord(),
                builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                  if(!snapshot.hasData){
                    return Expanded(
                      flex: 1,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width / 3.2 * 2,
                              width: MediaQuery.of(context).size.width / 3.2 * 2,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: MediaQuery.of(context).size.height * 0.06,
                              ),
                              child: Card(
                                child: Column(
                                  children: List.generate(
                                    7,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 12,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 12,
                                            width: 80,
                                            color: Colors.white,
                                          ),
                                          Container(
                                            height: 12,
                                            width: 40,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }else{
                    return Column(
                      children: [
                    PieChart(
                animationDuration: Duration(seconds:  3) ,
                chartType: ChartType.ring,
                colorList: colorList,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.left
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValuesInPercentage: true
                ),
                dataMap:{
                  "Total": double.parse(snapshot.data!.cases!.toString()),
                  "Recovered": double.parse(snapshot.data!.recovered.toString()),
                  "Deaths": double.parse(snapshot.data!.deaths.toString()),
                  }),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height  * 0.06 ),
                  child: Card(
                    child: Column(
                      children: [
                       ReusableRow(title: 'Total Cases', value: snapshot.data!.cases.toString()),
                       ReusableRow(title: 'Deaths', value: snapshot.data!.deaths.toString()),
                       ReusableRow(title: 'Recovered', value: snapshot.data!.recovered.toString()),
                       ReusableRow(title: 'Active', value: snapshot.data!.active.toString()),
                       ReusableRow(title: 'Critical', value: snapshot.data!.critical.toString()),
                       ReusableRow(title: 'Today Deaths', value: snapshot.data!.todayDeaths.toString()),
                       ReusableRow(title: 'Today Recovered', value: snapshot.data!.todayRecovered.toString()),
                      ],
                      ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CountriesListScreen() ));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff1aa260),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text('Track Countries'),  
                    ),
                  ),
                )
                      ],
                    );
                  }
              })
            ],
          ),
        )
        ),
    );
  }
}