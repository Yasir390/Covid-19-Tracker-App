import 'package:flutter/material.dart';
import '../style.dart';

class ReusableCardRow extends StatelessWidget {
  String title,value;


  ReusableCardRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10,top: 10,left: 15,right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: cardTextStyle,),
            Text(value,style: cardTextStyle,),
          ],
        ),
      ),
    );
  }
}