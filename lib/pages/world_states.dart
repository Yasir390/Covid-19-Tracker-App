import 'package:covid19_tracker/models/WorldStatesModel.dart';
import 'package:covid19_tracker/pages/countries_list.dart';
import 'package:covid19_tracker/states_services.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../components/ReusableCardWidget.dart';
import '../components/reusable_elevated_button.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<Color> colorList = [
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Expanded(
            child: FutureBuilder<WorldStatesModel>(
              future: statesServices.fetchWorldRecords(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Expanded(child:
                  SpinKitFadingCircle(
                    color: Colors.red,
                    size: 50,
                    controller: _controller,
                  ));
                } else{
                  return Column(
                    children: [
                      PieChart(
                        dataMap:  {
                          'Total': double.parse(snapshot.data!.cases.toString()),
                          'Recovered': double.parse(snapshot.data!.recovered.toString()),
                          'Deaths': double.parse(snapshot.data!.deaths.toString())
                        },
                        chartValuesOptions:const ChartValuesOptions(
                          showChartValuesInPercentage: true
                        ),
                        animationDuration: const Duration(milliseconds: 1200),
                        chartType: ChartType.ring,
                        colorList: colorList,
                        legendOptions:
                        const LegendOptions(legendPosition: LegendPosition.left),
                      ),
                      Column(
                        children: [
                          ReusableCardRow(
                            title: 'Total',
                            value: snapshot.data!.cases.toString(),
                          ),
                          ReusableCardRow(
                            title: 'Recovered',
                            value: snapshot.data!.recovered.toString(),
                          ),ReusableCardRow(
                            title: 'Deaths',
                            value: snapshot.data!.deaths.toString(),
                          ),
                          ReusableCardRow(
                            title: 'Critical',
                            value: snapshot.data!.critical.toString(),
                          ),
                          ReusableCardRow(
                            title: 'Active',
                            value: snapshot.data!.active.toString(),
                          ),ReusableCardRow(
                            title: 'Today Deaths',
                            value: snapshot.data!.todayDeaths.toString(),
                          ),ReusableCardRow(
                            title: 'Today Recovered',
                            value: snapshot.data!.todayRecovered.toString(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ReusableElevatedButton(
                        text: 'Track Countries',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CountriesList(),));
                        },
                      )
                    ],
                  );

                }
              },
            ),
          ),

        ],
      ),
    )));
  }
}
