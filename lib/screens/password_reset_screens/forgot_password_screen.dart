import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:law_legend/resources/appbar.dart';
import 'package:law_legend/resources/round_button.dart';
import 'package:law_legend/screens/login_screen.dart';

import '../../resources/resources.dart';
import '../../resources/toast_message.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  TextEditingController phoneController = TextEditingController();
  FocusNode phoneNode = FocusNode();

  bool loading = false;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: '',backgroundColor: Colors.transparent,),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12),
                child: Text('Forgot password?',
                  style: TextStyle(fontFamily: 'Poppins Bold',fontWeight: FontWeight.w700,fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5,left: 12),
                child: Text('Don’t worry! It happens. Please enter the phone number with your account.',
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
              Spacer(),
              //getLoginBtn(),
              RoundButton(title: 'Send code',loading: loading, onTap: (){
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
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => Verify(verficationID: verificationId, phoneNumber: phoneController.text,)));
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
                      child: Text("Remember password",
                        style: TextStyle(
                          fontFamily: "Popppins Thin",fontSize: 14,fontWeight: FontWeight.w400,),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Container(
                        child: Text('Log in',
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

}
