
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: pageeror(),
    );
  }
}
class pageeror extends StatefulWidget {
  const pageeror({super.key});

  @override
  State<pageeror> createState() => _pageerorState();
}

class _pageerorState extends State<pageeror> with SingleTickerProviderStateMixin{
   late AnimationController _controller;
  bool _animationCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addListener(() {
        if (_controller.status == AnimationStatus.completed && !_animationCompleted) {
          setState(() {
            _animationCompleted = true;
          });
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        _animationCompleted == true?   Container(height: double.infinity,width: double.infinity,
            alignment: Alignment.center,
              child: BounceInDown(from: 11,
                child: Text("4  4",style: TextStyle(fontSize: 155,fontFamily: "p",color: Colors.red),
                ),
              ),):Container(),
     
            _animationCompleted == true? Container(
              child: Positioned(top: 200,left: 120,
                child: BounceInDown(from: 11,
                  child: Text("Ooops!",style: TextStyle(fontSize: 35,fontFamily: "p",color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                ),),):Container(),
          
            _animationCompleted == true?Container(
              child: Positioned(top: 250,left: 50,
                child: BounceInDown(from: 11,
                  child: Text("Page Not Found",style: TextStyle(fontSize: 35,fontFamily: "p",color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                ),),):Container(),

          AnimatedPositioned(height: 400,left:110 ,
          duration: Duration(seconds: 1),
          bottom: _animationCompleted ? MediaQuery.of(context).size.height / 2 - 350 : -400,
          child:Column(
            children: [
              Image.asset("assets/watches/a.png",height: 250,),
            ],
          )
          ),
        ],
      ),
    );
  }
}
