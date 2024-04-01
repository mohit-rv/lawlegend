import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:law_legend/resources/appbar.dart';
import 'package:law_legend/screens/create_account.dart';
import 'package:law_legend/screens/Drawers_screens/faq_screen.dart';
import 'package:law_legend/screens/home_screen.dart';
import 'package:law_legend/screens/verification.dart';
import '../resources/resources.dart';
import '../resources/round_button.dart';
import '../resources/toast_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool loading = false;
  var verificationId;
  TextEditingController phoneController = TextEditingController();
  final auth = FirebaseAuth.instance;
  FocusNode phoneNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '',backgroundColor: Colors.white,),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 12),
              child: Text('Log in',
              style: TextStyle(fontFamily: 'Poppins Bold',fontWeight: FontWeight.w700,fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5,left: 12),
              child: Text('Duis non arcu. Etiam posuere pretium ipsum.',
                style: TextStyle(fontWeight: FontWeight.w500,
                  fontFamily: "Poppins SemiBold",fontSize: 12,color: Colors.black54,),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,left: 12),
              child: Text('Phone Number',
              style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 15,fontFamily: "Poppins SemiBold"),
              ),
            ),
            getNumberField(),


            InkWell(
              onTap: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                bottomScreen();
              },
              child: Container(
                margin: EdgeInsets.only(top: 20,left: 12),
                child: Text('Home',
                  style:  TextStyle(color: Colors.lightBlue,
                      fontWeight: FontWeight.w500,fontSize: 15,fontFamily: "Poppins SemiBold"),
                ),
              ),
            ),


            // InkWell(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => FaqScreen()));
            //   },
            //   child: Text('Faq',
            //     style:  TextStyle(color: Colors.lightBlue,
            //         fontWeight: FontWeight.w500,fontSize: 15,fontFamily: "Poppins SemiBold"),)
            // ),


            Spacer(),
            //getLoginBtn(),
            RoundButton(title: 'Login',loading: loading, onTap: (){
              setState(() {
                loading = true;
              });
              auth.verifyPhoneNumber(
                  phoneNumber: phoneController.text,
                  timeout: const Duration(seconds: 60),
                  verificationCompleted: (_){
                    setState(() {
                      loading = false;
                    });
                  },
                  verificationFailed: (e){
                    setState(() {
                      loading = false;
                    });
                    FlutterT().toastMessage(e.toString());
                  },

                  codeSent: (String verificationId , int? token){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Verify(verficationID: verificationId, phoneNumber: phoneController.text,)));
                    setState(() {
                      loading = false;
                    });  },

                  codeAutoRetrievalTimeout: (e){
                    //how to display sconds of codeAutoRetrievalTimeout firebase on the flutter app
                    FlutterT().toastMessage(e.toString());
                    setState(() {
                      loading = false;
                    });
                  }  // codeAutoRetrievalTimeout
              );
            },
            ),
            Container(
              margin: EdgeInsets.only(top: 13,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Don't have an account?",
                    style: TextStyle(
                        fontFamily: "Popppins Thin",fontSize: 14,fontWeight: FontWeight.w400,),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
                    },
                    child: Container(
                      child: Text(' SignUp',
                        style: TextStyle(
                          fontFamily: "Poppins Bold",fontSize: 14,fontWeight: FontWeight.bold,color: Color(0xff005AC6)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  getNumberField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 54,
      margin: EdgeInsets.only(left: 12, right: 0, top: 6),
      padding: EdgeInsets.only(left: 16, right: 16),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.black38),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        children: [
          // Container(
          //     margin: EdgeInsets.only(top: 2,left: 10),
          //     child: Text('+91',)),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5,left: 0),
              child: TextFormField(
                controller: phoneController,
                focusNode: phoneNode,
                onChanged: (text) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your number",
                    hintStyle: TextStyle(
                      color: Color(0xFFA7A9B7),
                      fontSize: 14,
                      fontFamily: 'Poppins Medium',
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                    counterText: "",
                    prefixIcon: Container(
                      margin: EdgeInsets.only(right: 8),
                      child: const Image(
                        image: AssetImage(Resources.flagImage),
                        width: 24,
                        height: 24,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 34,
                      maxHeight: 34,
                      minHeight: 34,
                      maxWidth: 34,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(18)),
                keyboardType: TextInputType.name,
                maxLines: 1,
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bottomScreen() {
    return showModalBottomSheet(context: context, builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
          ),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage(Resources.topBar),height: 50,width: 60,)
              ],
            ),

            Container(
              height: 600,
              width: 600,
                  child: Image(image: AssetImage(Resources.frame),
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.softLight,
                    opacity: const AlwaysStoppedAnimation(0.8),
                  ),
                ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              margin: EdgeInsets.only(top: 250,left: 0),
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [Colors.white, Colors.transparent],
                //  // stops: [8, 5.0]
                // )
                color: Colors.white
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text('Register Successfully',textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Poppins Bold",fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xff191D31)),
                      ),
                    ),

                    Container(
                      child: Text('Congratulation! your account already created.'
                          ' Please login to get amazing experience.',textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Poppins SemiBold",fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xffA7A9B7)
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 18,right: 18),
                      child: RoundButton(title: 'Go to HomePage', onTap: (){
                        Navigator.push((context), MaterialPageRoute(builder: (context) => HomeScreen()));
                      }),
                    ),

                  ],
                ),

            ),

          ],
        ),
      );
    });
  }

}
