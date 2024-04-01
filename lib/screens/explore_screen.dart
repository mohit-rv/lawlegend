import 'package:flutter/material.dart';
import 'package:law_legend/resources/resources.dart';
import 'package:law_legend/resources/round_button.dart';
import 'package:law_legend/screens/create_account.dart';
import 'package:law_legend/screens/login_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
         body: SingleChildScrollView(
           padding: EdgeInsets.all(0),
           child: Column(
             children: [
               Container(
                 height: 200,
                 width: MediaQuery.of(context).size.width,
                 margin: EdgeInsets.only(top: 180,),
                 child: Image(image: AssetImage(Resources.secondScreenimg),
                   // height: 200,
                   // width: MediaQuery.of(context).size.width,
                   fit: BoxFit.cover,
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(top: 30),
                 child: Text('Explore the App',
                 style: TextStyle(
                   fontFamily: "Poppins Bold",fontSize: 30,fontWeight: FontWeight.bold,),
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(top: 5),
                 child: Text('Duis non arcu. Etiam posuere pretium efficitur.\n'
                '       in lacus nec purus iaculis non ipsu',
                   style: TextStyle(fontWeight: FontWeight.w500,
                     fontFamily: "Poppins SemiBold",fontSize: 12,color: Colors.black54,),
                 ),
               ),

               Container(
                 margin: EdgeInsets.only(top: 100),
                padding: EdgeInsets.all(8),
               child:  Column(
                 children: [
                   Container(
                     margin: EdgeInsets.only(right: 12,left: 12),
                     child: RoundButton(title: 'Sign In', onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                     }),
                   ),
                   SinUpBtn(),
                 ],
               )
               )

             ],
           ),

         ),
    );
  }

  SinUpBtn() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10,right: 12,left: 12),
        padding: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(26),
            border: Border.all(
                color: Colors.black12,
                width: 1
            )
        ),
        child: Text('Create Account',textAlign: TextAlign.center,
          style: TextStyle(fontFamily: "Poppins SemiBold",fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),
        ),
      ),
    );
  }

}
