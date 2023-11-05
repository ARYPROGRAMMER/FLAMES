










import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iiitr_assignment/design.dart';
import 'package:iiitr_assignment/resultpage.dart';
import 'package:iiitr_assignment/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLAMES',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
            displayLarge: TextStyle(color: Colors.green ,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontFamily: "fontmain1"),
            displayMedium: TextStyle(color: Colors.greenAccent ,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontFamily: "fontmain1"),
            displaySmall: TextStyle(color: Colors.lightGreen ,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontFamily: "fontmain3"),
          ),
          primarySwatch: Colors.red,
      ),
      home: SplashScreen(),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key,key}):super(key: key);


  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

               late AnimationController _controller;
               bool isPlaying = false;
               int maxDuration = 10;
           @override
           void initState() {
             super.initState();
             _controller = AnimationController(vsync: this, duration: Duration(seconds: maxDuration))
               ..addListener(() {
                 setState(() {});
               })
               ..addStatusListener((status) {
                 if (status == AnimationStatus.completed) {
                   isPlaying = false;
                 }
               });

             controller1.addListener(() { });
             controller2.addListener(() { });
           }


               @override
               void dispose() {
                 _controller.dispose();
                 controller1.dispose();
                 controller2.dispose();
                 super.dispose();
               }
               List<Color> gradientColors = const [
                 Color(0xffFF0069),
                 Color(0xffFED602),
                 Color(0xff7639FB),
                 Color(0xffD500C5),
                 Color(0xffFF7A01),
                 Color(0xffFF0069),
               ];
           String an='';
               Future<void> _showMyDialog() async {
                 return showDialog<void>(
                   context: context,
                   barrierDismissible: false, // user must tap button!
                   builder: (BuildContext context) {
                     return AlertDialog(
                       title: const Text('Disclaimer For Nerds'),
                       content: const SingleChildScrollView(
                         child: ListBody(
                           children: <Widget>[
                             Text('This is just a game. Dont take anything seriously and personally'),
                             Text(''),
                             Text('Are you sure you want to see the result?'),
                           ],
                         ),
                       ),
                       actions: <Widget>[
                         TextButton(
                           child: const Text('I wanna quit'),
                           onPressed: () {
                             Navigator.of(context).pop();
                             exit(0);
                           },
                         ),
                         TextButton(
                           child: const Text('Sure. maybe..'),
                           onPressed: () {
                             an='yes';
                             Navigator.of(context).pop();
                           },
                         ),

                       ],
                     );
                   },
                 );
               }


  late var controller1 = TextEditingController();
  late var controller2 = TextEditingController();

               String? get _errorText {
                 // at any time, we can get the text from _controller.value.text
                 final text = controller2.value.text;
                 // Note: you can do your own custom validation here
                 // Move this logic this outside the widget for more testable code
                 if (text.isEmpty) {
                   return 'Can\'t be empty';
                 }
                 if (text.length < 3) {
                   return 'Too short';
                 }
                 // return null if the text is valid
                 return null;
               }

               String? get _errorText2 {
                 // at any time, we can get the text from _controller.value.text
                 final text = controller1.value.text;
                 // Note: you can do your own custom validation here
                 // Move this logic this outside the widget for more testable code
                 if (text.isEmpty) {
                   return 'Can\'t be empty';
                 }
                 if (text.length < 3) {
                   return 'Too short';
                 }
                 // return null if the text is valid
                 return null;
               }

               var _text = '';

               @override
  Widget build(BuildContext context) {
    double val = (_controller.value * maxDuration);



    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffcb5382),
        centerTitle: true,
        title:  Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white,width: 2.5),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.pinkAccent.withOpacity(1),
                offset: const Offset(
                  0.0,
                  0.0,
                ), //Offset
                blurRadius: 50.0,
                spreadRadius: 10.0,
              ), //BoxShadow
            ], //BoxShadow
          ),
          child: Row(
          children: [
            Text('   F L A M E S  '),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(width:60,


                  child: Image.asset("assets/images/uwu.png")),
            )
          ],
        ),),

        titleTextStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: const Color(0xff470a0a),fontSize: 25),
        titleSpacing: 80,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(stops:[0,0.2,0.6,1],radius: 1.4,center: Alignment.centerLeft,colors: [const Color(0xffAFFCCCB),const Color(0xffFAA0A0),const Color(0xffbc544b),const Color(0xff7B1818)])
        ),

        child: Center(

            child: SingleChildScrollView(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [



                  SizedBox(
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    child: TextField(
                      controller: controller1,
                        onChanged: (text) => setState(() => _text),
                        enabled: true,
                decoration: InputDecoration(
                    labelText: 'YOU',
                    errorText: _errorText2,
                      suffixIcon: Icon(Icons.boy_sharp,size: 27,),


                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 1,
                              color: Colors.redAccent,
                                                      )
                      ),
                      enabledBorder: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.orange
                          ),

                      )
                )
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                    height: 40,
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    child: TextField(
                      controller: controller2,
                      onChanged: (text) => setState(() => _text),
                      decoration: InputDecoration(

                        labelText: "YOUR PARTNER",
                          errorText: _errorText,
                          suffixIcon: Icon(Icons.girl_sharp,size: 27,),

                          focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 1,
                              color: Colors.pinkAccent
                          )
                        ),
                        enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                                color: Colors.greenAccent
                            )
                        )
                      ),
                    ),
                  ),


                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.pinkAccent,
                          width: 2,
                        ),
                        shape: BoxShape.circle),
                    child: GestureDetector(

                      onTap: () {
                        if (an=='')
                        _showMyDialog();

                        if (controller1.text!='' && controller2.text!='' && an=='yes')
{



                        Timer(
                          Duration(seconds: 10),
                            () {

                              String a1 = controller1.text;
                              String b1 = controller2.text;
                              List temp = [a1,b1];
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => Result(title: temp),
                            ),
                          );}
                        );
                        setState(() {


                          if (isPlaying) {
                            _controller.reset();


                          } else {
                            _controller.reset();
                            _controller.forward();

                          }

                          isPlaying = !isPlaying;
                        });
                      }},
                      child: AnimatedContainer(
                        height: isPlaying ? 25 : 60,
                        width: isPlaying ? 25 : 60,
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(isPlaying ? 100 : 200),
                          color: Colors.white54,

                        ),
                        child: Center(child: Text("Evaluate")),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                    height: 40,
                  ),
                  AnimatedBuilder(
                      animation: _controller,
                      builder: (context, _) {
                        return Container(
                          height: 300,
                          width: 300,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CustomPaint(
                                  painter: LiquidPainter(
                                    _controller.value * maxDuration,
                                    maxDuration.toDouble(),
                                  ),
                                ),
                              ),
                              CustomPaint(
                                  painter: RadialProgressPainter(
                                    value: _controller.value * maxDuration,
                                    backgroundGradientColors: gradientColors,
                                    minValue: 0,
                                    maxValue: maxDuration.toDouble(),
                                  )),

                            ],
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  // Start and Stop Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "Evaluation",
                        style: const TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),

                      Text(
                        " : ${(val.toInt() * 10).toString()}%",
                        style: const TextStyle(color: Colors.greenAccent, fontSize: 20),
                      ),

                    ],
                  ),

              ]),
            ),
            ),
      ),
      );
    
  }

}

