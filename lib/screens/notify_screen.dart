import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:law_legend/resources/appbar.dart';
import 'package:law_legend/resources/resources.dart';

class notifyScreen extends StatefulWidget {
  const notifyScreen({super.key});

  @override
  State<notifyScreen> createState() => _notifyScreenState();
}

class _notifyScreenState extends State<notifyScreen> {

  int notifications = 0;
  int i = 0;


  List<Map<String, dynamic>> NFList = [
    {"icon": Resources.dotIcoon,"title":"Latest TAX and submit","stitle": "Tap to see the message","time": "2 m ago","isRead": false,},
    {"icon": Resources.percantIcon,"title":"Your GSTIN number added ipsum dolor","stitle": "Tap to  see the detail ipsum","time": "2 m ago","isRead": true,},
    {"icon": Resources.dotIcoon,"title":"Try The Latest TAX and submit before December","stitle": "Let’s try the TAX feature we provide","time": "10 m ago","isRead": true},
    {"icon": Resources.percantIcon,"title":"elit TAX ipsum dolor elit ipsum dolor lorem","stitle": "For all transaction without requirements","time": "10 m ago","isRead": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(
         title: 'Notification',backgroundColor: Colors.white,
       ),
         backgroundColor: Colors.white,
         body: NFList.isNotEmpty ? SingleChildScrollView(
            child: Column(
              children: [
                Row(//crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 27,left: 24),
                      child: Text('Recent',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins SemiBold",
                          fontSize: 16,
                          color: Color(0xFF191D31),
                          height: 0
                      ),),
                    ),

                    Container(
                      height: 15,width: 15,
                      margin: EdgeInsets.only(top: 28,left: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        color: Color(0xFF0060D3),
                        //   shape: BoxShape.circle

                      ),
                      child: Text('${i+NFList.length}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                          fontFamily: "Poppins Medium",
                        ),),
                    ),

                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){
                        setState(() {
                          NFList.clear();
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 27,right: 24,left: 150),
                          child:  Text('Clear All',style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF0060D3),
                            fontFamily: "Poppins Medium",
                            height: 0,
                            fontWeight: FontWeight.w400,

                          ),)
                      ),
                    )
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: getNoteList(),
                )

              ],
            ),
         ):

         Container(
           margin: EdgeInsets.only(top: 10,right: 50,left: 50),
           width: 375,
           height: 812,
           decoration: BoxDecoration(
               color: Colors.white
           ),
           child: Container(
             width: 202,
             height: 191.05,
             child: ListView(

               children: [
                 Image(
                   image: AssetImage(Resources.NullNote),
                 ),
                 Container(
                   padding: EdgeInsets.only(left: 55,top: 30),
                   child: Text(
                     'No Notifications',
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
                   margin: EdgeInsets.only(top: 20),
                   child: Text(
                     'You have no notifications at this time. Thank you',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       color: Color(0xFF514A6B),
                       fontSize: 15,
                       fontFamily: 'Poppins',
                       fontWeight: FontWeight.w400,
                       height: 0,
                     ),
                   ),
                 )

               ],
             ),

           ),
         )

    );
  }

  getNoteList() {

    return Expanded(
        child: Container(
          // color: Colors.greenAccent,
          child: ListView.builder(
              itemCount: NFList.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              controller: ScrollController(),
              itemBuilder: (context, index){
                return Slidable(
                  key: Key('$NFList'),
                  // startActionPane: ActionPane(
                  //   motion: ScrollMotion(),
                  //   children: [
                  //
                  //   ],
                  // ),
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: (){
                      setState(() {
                        NFList.removeAt(index);
                      });
                    },),
                    children: [
                      SlidableAction(
                        flex: 2,
                        icon: Icons.delete,
                        label: 'delete',
                        backgroundColor: Colors.red ,
                        onPressed: (direction) {
                          setState(() {
                            NFList.removeAt(index);
                          });
                        },
                      ),

                    ],
                  ),
                  child: Container(
                    color: bool.parse(NFList[index]['isRead'].toString()) ? Colors.transparent : HexColor("#191D3191"),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      //height: 87,
                      margin: EdgeInsets.only(top: 15, left: 24, right: 24),
                      child: Column(
                        children: [
                          Container(
                            //margin: EdgeInsets.only(left: 12, right: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  //margin: EdgeInsets.only(left: 12, top: 10, bottom: 10),
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: AssetImage(
                                      NFList[index]['icon'].toString(),
                                    ),
                                  )
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 19, right: 18),
                                              child: Text(
                                                NFList[index]['title'].toString(),
                                                style: TextStyle(
                                                  color: Color(0xFF1C1C20),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins Semibold',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              NFList[index]['time'].toString(),
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xFFA7A9B7),
                                                fontSize: 11,
                                                fontFamily: 'Poppins medium',
                                                fontWeight: FontWeight.w500,
                                                height: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 19, top: 6),
                                        child: Text(
                                          NFList[index]['stitle'].toString(),
                                          style: TextStyle(
                                            color: Color(0xFFA7A9B7),
                                            fontSize: 13,
                                            fontFamily: 'Poppins Medium',
                                            fontWeight: FontWeight.w400,
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //Spacer(),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 15),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFF3F3F3),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),


                );

              }

          ),
        ));
  }
}


