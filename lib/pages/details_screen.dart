import 'package:covid19_tracker/components/ReusableCardWidget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  String name;
 String image;
 int totalCases,totalDeaths,totalRecovered,active,critical,todayRecovered,test;

  DetailsScreen(
      {super.key, required this.name,
      required this.image,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.active,
      required this.critical,
      required this.todayRecovered,
      required this.test});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
         children: [
           SizedBox(
             height: 40,
           ),
           Center(
             child: CircleAvatar(
               backgroundImage: NetworkImage(widget.image),
               radius: 40,
             ),
           ),
           ReusableCardRow(title: 'Cases', value: widget.totalCases.toString()),
           ReusableCardRow(title: 'Total Deaths', value: widget.totalDeaths.toString()),
           ReusableCardRow(title: 'Total Recovered', value: widget.totalRecovered.toString()),
           ReusableCardRow(title: 'Active', value: widget.active.toString()),
           ReusableCardRow(title: 'Critical', value: widget.critical.toString()),
           ReusableCardRow(title: 'Today Recovered', value: widget.totalRecovered.toString()),
           ReusableCardRow(title: 'Test', value: widget.test.toString()),
         ],
      ),
    );
  }
}
