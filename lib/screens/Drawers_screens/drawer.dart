import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:law_legend/resources/resources.dart';
import 'package:law_legend/screens/explore_screen.dart';
import 'package:law_legend/screens/Drawers_screens/purchase_history_screen.dart';

import 'faq_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {


  late YYDialog logoutDialoge;
  late YYDialog contactUsDialoge;



  @override
  Widget build(BuildContext context) {
    return Drawer(
      //width: MediaQuery.of(context).size.width*0.9,
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          // DrawerHeader(child: Text("DrawerHeader")),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 46,
                    height: 46,
                    margin: EdgeInsets.only(top: 10,left: 10,right: 20),
                    padding: EdgeInsets.only(left: 8, right: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFF3F3F3),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Image(
                      image: AssetImage(Resources.backIcon),
                      width: 12,
                      height: 12,
                      color: Colors.black,
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                   // Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => EditProfileScreen()));
                  },
                  child: Container(
                    //margin: EdgeInsets.only(top: 12,right: 0),
                    width: 65,
                    height: 64,
                    alignment: Alignment.bottomRight,
                    decoration: ShapeDecoration(
                        image: DecorationImage(
                            image: AssetImage(Resources.editImage),
                            fit: BoxFit.cover
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                    // child:  Image(
                    //   image: AssetImage(Resources.editIcon),
                    //   height: 20,width: 20,
                    // ),

                  ),
                ),


                // Stack(
                //     children: [
                //       Container(
                //         margin: EdgeInsets.only(left: 0,top: 10,bottom: 50),
                //         width: 120,
                //         height: 120,
                //         decoration: ShapeDecoration(
                //             image: widget.selectImage != null ?
                //             DecorationImage(image: FileImage(widget.selectImage! as File),fit:  BoxFit.cover) :
                //             DecorationImage(image: AssetImage(Resources.updateimgeuser),fit:  BoxFit.cover)
                //             ,
                //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))
                //         ),
                //       ),
                //
                //
                //       InkWell(
                //         onTap: (){
                //         //  _pickImage();
                //           // selectImage(ImageSource.gallery, 1);
                //         },
                //         child: Container(
                //           margin: EdgeInsets.only(top: 102,left: 82),
                //           child:Image(
                //             image: AssetImage(Resources.editIcon),height: 33,width: 33,
                //           ),),
                //       )
                //
                //     ]
                // ),

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 60),
                      child: Text(
                        'User ID',
                        style: TextStyle(
                          color: Color(0xFF26475D),
                          fontSize: 16,
                          fontFamily: 'Poppins Bold',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10,left: 5,right: 50),
                      child: Text(
                        '123456789',
                        style: TextStyle(
                          color: Color(0xFF627384),
                          fontSize: 11,
                          fontFamily: 'Poppins Medium',
                          fontWeight: FontWeight.w500,
                          height: 0.11,
                        ),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10,left: 60),
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.0,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFF3F3F3),
                  //  color: Colors.black
                ),
              ),
            ),
          ),

          // Drawer Lists

          Container(
            margin: EdgeInsets.only(top: 0,left: 24,right: 18),
            child: Column(
              children: [

                InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => PurchaseHistScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      children: [
                        Container(
                          //  margin: EdgeInsets.only(),
                            width: 36,
                            height: 36,
                            child: Image(
                              image: AssetImage(Resources.PHistory),
                              // color: Color(0xFF0C3C89),
                              //  color: ,
                            )
                        ),

                        Container(
                            margin: EdgeInsets.only(left: 12,),
                            child: Text(
                              'Purchase History',
                              style: TextStyle(
                                color: Color(0xFF191D31),
                                fontSize: 14,
                                fontFamily: 'Poppins SemiBold',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0,left: 60),
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFF3F3F3),
                        //  color: Colors.black
                      ),
                    ),
                  ),
                ),


                InkWell(
                  onTap: () {
                    //  Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => NotSettingScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      children: [
                        Container(
                          //  margin: EdgeInsets.only(),
                            width: 36,
                            height: 36,
                            child: Image(
                              image: AssetImage(Resources.ifriend),
                              // color: Color(0xFF0C3C89),
                              //  color: ,
                            )
                        ),

                        Container(
                            margin: EdgeInsets.only(left: 12,),
                            child: Text(
                              'Invite Friend',
                              style: TextStyle(
                                color: Color(0xFF191D31),
                                fontSize: 14,
                                fontFamily: 'Poppins SemiBold',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0,left: 60),
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFF3F3F3),
                        //  color: Colors.black
                      ),
                    ),
                  ),
                ),


                InkWell(
                  onTap: () {
                  //  Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => NotSettingScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      children: [
                        Container(
                            //  margin: EdgeInsets.only(),
                            width: 36,
                            height: 36,
                            child: Image(
                              image: AssetImage(Resources.dnotification),
                             // color: Color(0xFF0C3C89),
                              //  color: ,
                            )
                        ),

                        Container(
                            margin: EdgeInsets.only(left: 12,),
                            child: Text(
                              'Notification',
                              style: TextStyle(
                                color: Color(0xFF191D31),
                                fontSize: 14,
                                fontFamily: 'Poppins SemiBold',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0,left: 60),
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFF3F3F3),
                        //  color: Colors.black
                      ),
                    ),
                  ),
                ),


                InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => FaqScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      children: [
                        Container(
                            //  margin: EdgeInsets.only(),
                            width: 36,
                            height: 36,
                            child: Image(
                              image: AssetImage(Resources.faq),
                              // color: Color(0xFF0C3C89),
                              //  color: ,
                            )
                        ),

                        Container(
                            margin: EdgeInsets.only(left: 12,),
                            child: Text(
                              'FAQ',
                              style: TextStyle(
                                color: Color(0xFF191D31),
                                fontSize: 14,
                                fontFamily: 'Poppins SemiBold',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            )
                        ),



                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0,left: 60),
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFF3F3F3),
                        //  color: Colors.black
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => FaqScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      children: [
                        Container(

                            //  margin: EdgeInsets.only(),
                            width: 36,
                            height: 36,
                            child: Image(
                              image: AssetImage(Resources.PrivacyPolicy),
                              //  color: ,
                            )
                        ),

                        Container(
                            margin: EdgeInsets.only(left: 12,),
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                color: Color(0xFF191D31),
                                fontSize: 14,
                                fontFamily: 'Poppins SemiBold',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            )
                        ),



                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0,left: 60),
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFF3F3F3),
                        //  color: Colors.black
                      ),
                    ),
                  ),
                ),


                InkWell(
                  onTap: () {
                    //Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => FAQScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      children: [
                        Container(
                            //  margin: EdgeInsets.only(),
                            width: 36,
                            height: 36,
                            child: Image(
                              image: AssetImage(Resources.ContactUs),
                              // color: Color(0xFF0C3C89),
                              //  color: ,
                            )
                        ),

                        Container(
                            margin: EdgeInsets.only(left: 12,),
                            child: Text(
                              'Contact Us',
                              style: TextStyle(
                                color: Color(0xFF191D31),
                                fontSize: 14,
                                fontFamily: 'Poppins SemiBold',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            )
                        ),



                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0,left: 60),
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFF3F3F3),
                        //  color: Colors.black
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    // Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => FAQScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      children: [
                        Container(
                            //  margin: EdgeInsets.only(),
                            width: 36,
                            height: 36,
                            child: Image(
                              image: AssetImage(Resources.ifriend),
                              //  color: ,
                            )
                        ),

                        Container(
                            margin: EdgeInsets.only(left: 12,),
                            child: Text(
                              'Terms and Condition',
                              style: TextStyle(
                                color: Color(0xFF191D31),
                                fontSize: 14,
                                fontFamily: 'Poppins SemiBold',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            )
                        ),



                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0,left: 60),
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFF3F3F3),
                        //  color: Colors.black
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    // Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => FAQScreen()));

                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      children: [
                        Container(
                          //  margin: EdgeInsets.only(),
                            width: 36,
                            height: 36,
                            child: Image(
                              image: AssetImage(Resources.RateUs),
                              //  color: ,
                            )
                        ),

                        Container(
                            margin: EdgeInsets.only(left: 12,),
                            child: Text(
                              'Rate Us',
                              style: TextStyle(
                                color: Color(0xFF191D31),
                                fontSize: 14,
                                fontFamily: 'Poppins SemiBold',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            )
                        ),



                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0,left: 60),
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFF3F3F3),
                        //  color: Colors.black
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    logoutDialoge = YYDialogConfirm(context);
                    logoutDialoge.show();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      children: [
                        Container(
                            //  margin: EdgeInsets.only(),
                            width: 36,
                            height: 36,
                            child: Image(
                              image: AssetImage(Resources.Logout),
                              //  color: ,
                            )
                        ),

                        InkWell(
                          onTap: (){
                            //_logout(context);
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: 12,),
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                  color: Color(0xFF191D31),
                                  fontSize: 14,
                                  fontFamily: 'Poppins Semibold',
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              )
                          ),
                        ),



                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0,left: 60),
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFF3F3F3),
                        //  color: Colors.black
                      ),
                    ),
                  ),
                ),


                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Image(image: AssetImage(Resources.ytImage)),
                        height: 56,width: 56
                      ),


                      Container(
                          margin: EdgeInsets.only(top: 12,left: 20),
                          decoration: ShapeDecoration(
                              color: Colors.white70,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              )
                          ),
                          child: Image(image: AssetImage(Resources.fbCircle)),
                          height: 36,width: 36
                      ),

                      Container(
                          margin: EdgeInsets.only(top: 12,left: 20),
                          decoration: ShapeDecoration(
                              color: Colors.white70,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              )
                          ),
                          child: Image(image: AssetImage(Resources.instCircle)),
                          height: 36,width: 36
                      )


                    ],
                  ),
                )



              ],
            ),
          ),





        ],
      ),
    );
  }

  YYDialog YYDialogConfirm(BuildContext context) {
    return YYDialog().build(context)
      ..width = MediaQuery.of(context).size.width * 0.9
      ..backgroundColor = Colors.transparent
    //  ..height = 500
      ..dismissCallBack = () {

      }..widget(
          StatefulBuilder(
              builder: (BuildContext context, StateSetter mystate) {
                return getlogoutCard(mystate);
              })
      )..animatedFunc = (child, animation) {
        return FadeTransition(
          child: child,
          //scale: Tween(begin: 0.0, end: 1.0).animate(animation),
          opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
        );
      };
  }

  getlogoutCard(StateSetter mystate) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      color: Colors.white,
      child: Container(
        height: 247,
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            )
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60,left: 120),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Log Out?',
                style: TextStyle(
                  color: Color(0xFF191D31),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.07,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 30,left: 60),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Are you sure want to log out?',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4099999964237213),
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                ),
              ),
            ),


            Container(
              margin: EdgeInsets.only(top: 40,bottom: 40),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.only(top: 20),
                      width: 104,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: Color(0xFFDEDEDE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF3E3E43),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      //_logout(context);
                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ExploreScreen()), (route) => false);
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      //   margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.only(top: 20),
                      width: 104,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: Color(0xFF0C3C89),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Log Out',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                    ),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }


}
