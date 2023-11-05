import 'package:flutter/material.dart';
import 'package:iiitr_assignment/main.dart';



class Result extends StatefulWidget {
  const Result({Key? key,required this.title}) :super(key: key);
  final List title;

  @override
  State<Result> createState() => MyResult();


}
class MyResult extends State<Result>{

  @override
  Widget build(BuildContext context) {
     final String c1 = widget.title[0];
     final String c2 = widget.title[1];

    String calculate(String a,String b) {
      int common = 0;
      int l1 = a.length;
      int l2 = b.length;
      if (a.length>b.length) {
        for (int i = 0; i < a.length; i++) {
          for (int j = 0; j < b.length; j++) {
            if (a[i].toLowerCase() == b[j].toLowerCase()) {
              common++;
              if (a[i] == '' || b[j]=='')common--;
              b = b.replaceAll(b[j], '').trim();
            }
          }
        }
      }
      else
      {
        for (int i = 0; i < b.length; i++) {
          for (int j = 0; j < a.length; j++) {
            if (b[i].toLowerCase() == a[j].toLowerCase()) {
              common++;
              if (b[i] == '' || a[j]=='')common--;
              a = a.replaceAll(a[j], '').trim();
            }
          }
        }
      }

      int ans = l1+l2-2*common;

      String test = "FLAMES";
      int o=0;
      while (test.length!=1)
      {
        int temp=ans-1;
        if (o>test.length-1)o=0;

        while (temp!=0) {

          o++;
          temp--;
          if (o>test.length-1)o=0;

        }
        String char = test[o];

        test=test.replaceAll(char, '').trim();

      }
      return test;
    }
    String answer = "not yet";

    void run() {
      setState(() {
        answer = calculate(c1, c2);
        if (answer == 'F')answer = 'F - FRIENDS';
        if (answer == 'L')answer = 'L - LOVERS';
        if (answer == 'A')answer = 'A - AFFECTIONATE';
        if (answer == 'M')answer = 'M - MARRIAGE';
        if (answer == 'E')answer = 'E - ENEMIES';
        if (answer == 'S')answer = 'S - SIBLING';
      });
    }
    run();

    //answer fully changed

    return Scaffold(

      body:

      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(elevation: 15,child:  Text(answer,style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20)),color: const Color(0xffB5338A),),
          ],
        ),
      ),


    );
  }
}
