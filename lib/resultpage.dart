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
     String myimage='';
    void run() {
      setState(() {
        answer = calculate(c1, c2);
        if (answer == 'F')myimage= 'children.png';
        if (answer == 'L')myimage = 'man.png';
        if (answer == 'A')myimage= 'hand.png';
        if (answer == 'M')myimage= 'rings.png';
        if (answer == 'E')myimage = 'ghost.png';
        if (answer == 'S')myimage= 'high-five.png';
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

      Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.redAccent.withOpacity(0.4),
        child: Center(
          child: Container(
            width: 350,
            height: 700,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white,width: 2.5),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
              BoxShadow(
              color: Colors.pinkAccent.withOpacity(0.18),
              offset: const Offset(
                40.0,
                0.0,
              ), //Offset
              blurRadius: 30.0,
              spreadRadius: 40.0,
            ), //BoxShadow
           ], //BoxShadow
            ),
            child: Stack(


                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 28.0,left:28.0 ,right: 28.0),
                    child: Text(answer,style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 40,color: Colors.red)),
                  ),
                  Positioned(
                    top: 75,
                    child: Container(
                      height: 350,
                      width: 350,
                      child: Image.asset('assets/images/${myimage}'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,

                    child: Container(
                      width: 350,
                      height: 320,
                      child: ClipRRect(

                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/images/letter.png')),),
                  ),
                  Positioned(
                      top: 625,
                      left: 30,
                      child: Container(
                          width: 140,
                          height: 50,
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(230),
                            // color: Colors.black.withOpacity(0.7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pinkAccent.withOpacity(1),
                                offset: const Offset(
                                  0.0,
                                  0.0,
                                ), //Offset
                                blurRadius: 10.0,
                                spreadRadius: 10.0,
                              ), //BoxShadow
                            ], //BoxShadow
                          ),

                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>MyHomePage()) , (route) => false);
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                          },child: Text('Check Another',style: TextStyle(color: Colors.white,fontSize: 16),),)))


                ],
              ),

          ),
        ),
      ),


    );
  }
}
