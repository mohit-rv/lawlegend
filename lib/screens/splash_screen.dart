import 'package:flutter/material.dart';
import 'package:law_legend/resources/resources.dart';
import 'package:law_legend/screens/explore_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), ()  {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExploreScreen()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
               margin: EdgeInsets.only(top: 265,left: 28),
               child: Image.asset(Resources.SplashImage,),),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Image(image: AssetImage(Resources.Splash2),
                  opacity: const AlwaysStoppedAnimation(.5) ,
                  height: 340,
                  width: MediaQuery.of(context).size.width ,),
            )
          ],
        ),
      ),
    );
  }
}
