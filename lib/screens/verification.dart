import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:law_legend/resources/appbar.dart';
import 'package:law_legend/resources/round_button.dart';
import 'package:law_legend/screens/home_screen.dart';
import 'package:pinput/pinput.dart';
import '../resources/resources.dart';

class Verify extends StatefulWidget {
//how to make custom validations in  flutter
 final String phoneNumber;
 final String verficationID;
  const Verify({super.key,required this.phoneNumber,required this.verficationID});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Timer countDownTimer;
  int resendTime = 1*30;
  final pinController = TextEditingController();
  String errorMessage = '';
  bool invalidOtp = false;


  TextEditingController Box1 = TextEditingController();
  TextEditingController Box2 = TextEditingController();
  TextEditingController Box3 = TextEditingController();
  TextEditingController Box4 = TextEditingController();
  TextEditingController Box5 = TextEditingController();
  TextEditingController Box6 = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() {
    countDownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if(resendTime<1) {
        countDownTimer.cancel();
      }
    });
  }

  stopTimer() {
    if(countDownTimer.isActive) {
      countDownTimer.cancel();
    }
  }
  //how to apply form validation in pinput flutter

  String strFormatting(n) => n.toString().padLeft(2, '0');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '',backgroundColor: Colors.white,),
       body: Container(
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         padding: EdgeInsets.only(top: 10,left: 24,right: 10),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
              child: Text('Verification Code',textAlign: TextAlign.left,
              style: TextStyle(fontSize: 30,
                  color: Colors.black,fontWeight: FontWeight.w700,fontFamily: "Poopins Regular"),
              )),
             Container(
               child: Text('We have sent the code verification to'),
             ),
             Container(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Container(
                     child: Text('your number',),
                   ),
                   Container(
                     margin: EdgeInsets.only(left: 5),
                     child: Text('+01 ${widget.phoneNumber}',
                       style: TextStyle(
                           fontSize: 14,fontWeight: FontWeight.bold,fontFamily: "Poppins Regular",
                       color: Color(0XFF0060D3)
                       ),
                     ),
                   )
                 ]
               ),
             ),
             Container(
               margin: EdgeInsets.only(top: 12),
               //child: getBox(),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   myInputBox(context, Box1),
                   myInputBox(context, Box2),
                   myInputBox(context, Box3),
                   myInputBox(context, Box4),
                   myInputBox(context, Box5),
                   myInputBox(context, Box6),
                 ],
               ),
             ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(invalidOtp ? 'Wrong code, please try again': '',
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.red),
                    ),
                  ],
                ),
              ),
             Container(
               margin: EdgeInsets.only(top: 30,),
               child: resendTime==0 ?
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Did not receive otp?',
                     style: TextStyle(
                         fontFamily: 'Poppins SemiBold',fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87
                     ),
                   ),
                   InkWell(
                       onTap: () {
                         invalidOtp = false;
                         resendTime = 40;
                         startTimer();
                         verifyPhoneNumber(widget.phoneNumber, context);
                       },
                       child: Text(' Resend otp',textAlign:  TextAlign.center,
                         style: TextStyle(
                             fontFamily: 'Poppins Bold',fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff0060D3)
                         ),
                       )),
                 ],
               ):
               Container(),
             ),

             resendTime !=0 ?
             Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image(image: AssetImage(Resources.clock),height: 16,width: 16,),
                 Text(' 00: ${strFormatting(resendTime)}')
               ],
             ):
             Container(),

             Spacer(),
             RoundButton(title: 'Submit', onTap: () async{
               try{
                 PhoneAuthCredential credential = await PhoneAuthProvider.credential(
                     verificationId: widget.verficationID, smsCode: pinController.text);
                 FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                   //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                   print('verficationID: ${widget.verficationID}');
                   print('pinController: ${pinController.text}');

                   final otp = Box1.text+Box2.text+Box3.text+Box4.text+Box5.text+Box6.text;
                   if(otp==widget.verficationID){
                     setState(() {
                       invalidOtp= false;
                      // stopTimer();
                       print('Right Otp');
                       bottomScreen();
                     });
                   } else {
                     setState(() {
                       invalidOtp = true;
                     });
                   }

                  });
               } catch(e) {
                 print('error: $e');
               }
             },
             ),
           ],
         ),
       ),
    );
  }

  Future<void> verifyPhoneNumber(String phoneNumber, BuildContext context) async {
  await _auth.verifyPhoneNumber(
  phoneNumber: phoneNumber,
  verificationCompleted: (PhoneAuthCredential credential) async {
  // Automatically sign in if the verification is completed
  await _auth.signInWithCredential(credential);
  // Navigate to the next screen or perform other actions
  print("Verification Completed: ${credential.smsCode}");
  },
  verificationFailed: (FirebaseAuthException e) {
  print("Verification Failed: $e");
  },
  codeSent: (String verificationId, int? resendToken) {
  // Store the verification ID for later use
  print("Code Sent: $verificationId");
  },
  codeAutoRetrievalTimeout: (String verificationId) {
  // Handle code auto-retrieval timeout
  print("Auto Retrieval Timeout: $verificationId");
  // You can implement the resend OTP functionality here
  // For example, show a button to resend OTP
  },
  timeout: Duration(seconds: 120), // Timeout for OTP auto-retrieval
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
                fit: BoxFit.cover,opacity: const AlwaysStoppedAnimation(0.4),
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
                      stopTimer();
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

  myInputBox(BuildContext context, TextEditingController boxController) {
    return Container(
      height: 65,width: 50,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: invalidOtp ?
              BorderSide(width: 1,color: Colors.red):
              BorderSide(width: 1,color: Colors.black54)   //it should be changed to red when incorect value is enterd
          )
      ),
      child: TextFormField(
        controller: boxController,
        autofocus: true,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        cursorColor: Colors.black87,
        cursorWidth: 2,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22,
          color: Color(0xff191D31),
          fontFamily: 'Poppins SemiBold',
        ),
        onChanged: (value) {
          if(value.length==1) {
            FocusScope.of(context).nextFocus();
          }if(value.length==0){
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
            counterText: '',
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)
            )
        ),
      ),
    );
  }

  getBox() {
    return Pinput(
      controller: pinController,
      length: 6,
      // obscureText: true,
      // obscuringWidget: Text(),
      autofocus: true,
      onChanged: (value){
        setState(() {
          pinController.text = value;
          errorMessage = '';
        });
        if(value!=6) {
          setState(() {
            // errorMessage = 'Invalid Pin';
            invalidOtp = true;
          });
        }
        print('$value changed');
      },
      onCompleted: (value) {
        if(value!='123456'){
          setState(() {
            // errorMessage = 'Wrong Pin';
            invalidOtp = true;
            print('wrong');
          });
        }else{
          print('$value comapleted' );
        }
      },
      onSubmitted: (value) {
        if(value!='123456'){
          setState(() {
            invalidOtp = true;
            print('wrong code');
          });
        }else{
          print('$value submitted' );
        }
      },
    );
  }


}
