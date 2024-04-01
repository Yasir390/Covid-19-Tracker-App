import 'package:flutter/material.dart';

class ReusableElevatedButton extends StatelessWidget {
  String text;
  void Function() onTap;


  ReusableElevatedButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff1aa260),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            )
        ),

        child:  Text(text,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
