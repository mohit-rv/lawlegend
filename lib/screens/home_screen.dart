import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:law_legend/screens/Drawers_screens/drawer.dart';

import '../resources/resources.dart';
import 'notify_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentPage = 0;
  int currentImage = 0;
  CarouselController buttonCarouselController = CarouselController();
  CarouselController bottomCarouselController = CarouselController();
  var scaffoldKey = GlobalKey<ScaffoldState>();


  List<Map<String, dynamic>> carouselItems = [
    {"image": Resources.image,'imagePos': 0},
    {"image": Resources.image,'imagePos': 1},
    {"image": Resources.image,'imagePos': 2}
  ];

  List<Map<String, dynamic>> gridItems = [
    {"image": Resources.firstgridImage,"title": "Showcase Demo","subtitle": "Videos | Articles Updates","lock": true,},
    {"image": Resources.secondgridImage,"title": "TAX Legends","subtitle": "Support Monthly 4000/-","lock": false},
    {"image": Resources.thirdgridImage,"title": "GST Legends","subtitle": "Support (Monthly) 4000/-","lock": false},
    {"image": Resources.secondgridImage,"title": "Combo Legends","subtitle": "Support (Monthly) 8000/-","lock": true},
     {"image": Resources.thirdgridImage,"title": "GST Legends","subtitle": "Support (Monthly) 4000/-","lock": false},
     {"image": Resources.secondgridImage,"title": "Combo Legends","subtitle": "Support (Monthly) 8000/-","lock": true},
   //  {"image": Resources.secondgridImage,"title": "Combo Legends","subtitle": "Support (Monthly) 8000/-","lock": true},
   //  {"image": Resources.secondgridImage,"title": "Combo Legends","subtitle": "Support (Monthly) 8000/-","lock": true},
  ];


  var bottomSlider = [
    {"image": Resources.bottomsilder,'imagePos': 0},
    {"image": Resources.bottomsilder,'imagePos': 1},
    {"image": Resources.bottomsilder,'imagePos': 2}
  ];


  var bottomscreenGrid = [
    {"image": Resources.secondgridImage,"title": "Income Tax"},
    {"image": Resources.thirdgridImage,"title": "GST",},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: myAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                    //  height: 400,
                      margin: EdgeInsets.only(),
                      child: CarouselSlider.builder(
                        itemCount: carouselItems.length,
                        carouselController: buttonCarouselController,
                        options: CarouselOptions(
                          //height: 380,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          enlargeFactor: 0.1,
                          aspectRatio: 1 / 1.2,
                          //padEnds: false,
                          enableInfiniteScroll: false,
                          autoPlay: true,
                          initialPage: currentPage,
                          reverse: false,
                          pauseAutoPlayOnTouch: true,
                          autoPlayInterval: const Duration(seconds: 10),
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentPage = index;
                            });
                          },
                        ),
                        itemBuilder: (BuildContext, int index, int realIndex) {
                          return Container(
                              /*width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.9,*/
                                margin: EdgeInsets.all(10),
                              child: AnimatedPadding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery
                                        .of(context)
                                        .viewInsets
                                        .bottom
                                ),
                                curve: Curves.decelerate,
                                duration: const Duration(milliseconds: 200),
                                child: getSlider(index),
                              )
                          );
                        },),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 0, top: 0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var n = 0; n <carouselItems.length; n++) buildIndicator(
                              carouselItems[currentPage]['imagePos'] == n)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          //     maxCrossAxisExtent: 200,
                          //     mainAxisExtent: 160,
                          //     crossAxisSpacing: 20,
                          //     mainAxisSpacing: 20
                          // ),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 160,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20
                          ),
                          itemCount: gridItems.length,
                          itemBuilder: (context, gindex) {
                           // return getGridCard(gindex);
                            return myGrid(gindex);
                          }),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(right: 25),
                     child:  CarouselSlider.builder(
                       carouselController: bottomCarouselController,
                       options: CarouselOptions(
                         //height: 450,
                         autoPlay: false,
                         enlargeCenterPage: false,
                         viewportFraction: 1,
                         initialPage: currentImage,
                         reverse: false,
                         enlargeFactor: 0.1,
                         enableInfiniteScroll: false,
                         pauseAutoPlayOnTouch: true,
                         aspectRatio: 18 / 8,
                         //aspectRatio: 2 / 1,
                         padEnds: false,
                         autoPlayInterval: const Duration(seconds: 10),
                         scrollDirection: Axis.horizontal,
                         onPageChanged: (index, reason) {
                           setState(() {
                             currentImage = index;
                           });
                         },
                       ),
                       itemCount: 3,
                       itemBuilder: (BuildContext context, int bindex,
                           int realIndex) {
                         return Container(
                           margin: const EdgeInsets.only(
                               top: 10, left: 22, right: 0, bottom: 18),
                           child: AnimatedPadding(
                               padding: EdgeInsets.only(
                                   bottom: MediaQuery.of(context)
                                       .viewInsets
                                       .bottom),
                               duration: const Duration(milliseconds: 200),
                               curve: Curves.decelerate,
                               child: getBottomSliderCard(bindex)
                           ),
                           //getMembersCard(),
                         );
                       },

                     ),
                    ),

                    Container(
                      margin: EdgeInsets.only( top: 0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var n = 0; n < bottomSlider.length; n++)
                          dotIndicator(bottomSlider[currentImage]['imagePos'] == n)
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            getBottomScreen();
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 18),
                            child: Stack(
                              children: [
                                 Image(image: AssetImage(Resources.button),
                                 height: 74,width: 278,
                                 ),
                                Container(
                                  margin: EdgeInsets.only(top: 22,left: 80),
                                  child: Text('Ask a query',textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Poppins Bold',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,color: Colors.white
                                    ),
                                  ),
                                ),
                                Container(
                                 // margin: EdgeInsets.only(bottom: 5),
                                  child: Image(
                                    image: AssetImage(Resources.buttonIcon),height: 74,width: 74,))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )


                  ],
                ),


          )
    );
  }

  getSlider(int index) {
    return Container(
           width: MediaQuery.of(context).size.width,
           height: 364,
           decoration: ShapeDecoration(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(26),
             )
           ),
        child: Image(
          image: AssetImage(carouselItems[index]['image'].toString()),
          fit: BoxFit.contain,
        ),
      );
  }

  myAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      //toolbarHeight: 80,
      elevation: 8,
      title: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [//but if i will not give expanded it is not shoswng
          Container(
            margin: EdgeInsets.only(left: 65 , bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Morning',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontFamily: 'Poppins Semibold',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Text('Amish Kumar Jansen',
                  style: TextStyle(
                    color: Color(0xff676767),
                    fontSize: 12,
                    fontFamily: 'Poppins Semibold',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                )
              ],
            ),
          ),


          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => notifyScreen()));
            },
            child: Container(
              margin: EdgeInsets.only(left: 100),
              child: Image(
                image: AssetImage(Resources.notifyIcon),
                height: 20,width: 20,
              ),
            ),
          )
        ],
      ),
      centerTitle: false,
      backgroundColor: Colors.white,
      flexibleSpace: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 20, left: 24, right: 24),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Container(
                width: 46,
                height: 46,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Image(
                  image: AssetImage(Resources.drawer),
                  width: 12,
                  height: 12,
                  color: Colors.black,
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }

  buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        height: isSelected ? 11 : 11,
        width: isSelected ? 11 : 11,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected? Color(0xff0060D3) : Color(0xffDFE6E9)
        ),
      ),
    );
  }

  getGridCard(int gindex) {
       return  Container(
          decoration: ShapeDecoration(
            color: Color(0xff8DCCDB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
         child: gridItems[gindex]['lock']!=null &&  gridItems[gindex]['lock'] ? Stack(
           children: [
             Container(

               child: Image(
                 image: AssetImage(gridItems[gindex]['image'].toString()),
                 fit: BoxFit.contain,
               ),
             ),
             ClipPath(
               clipper: MyClipper(),
               child: Container(
                 margin: EdgeInsets.only(top: 120),
                 width: MediaQuery.of(context).size.width,
                 height: 60,
                 decoration: ShapeDecoration(
                  color: Color(0xff005AC6),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12)
                   )
                 ),
                 // decoration: BoxDecoration(
                 //   color: Color(0xff005AC6),
                 //   borderRadius: BorderRadius.only(
                 //     bottomLeft: Radius.circular(16.0),
                 //     bottomRight: Radius.circular(16.0),
                 //     topRight: Radius.elliptical(0, 12))
                 // ),
                 child: Column(
                   children: [
                     Container(
                       child: Text(gridItems[gindex]['title'].toString(),
                         style: TextStyle(
                             fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white,
                             fontFamily: 'Poppins Bold'),),
                     ),

                     Container(
                       margin: EdgeInsets.only(top: 0),
                       child: Text(gridItems[gindex]['subtitle'].toString(),
                         style: TextStyle(
                             fontWeight: FontWeight.w500,fontSize: 10,color: Colors.white,fontFamily: 'Poppins Bold'),),
                     ),

                     //gridItems[gindex]['lock'] ?
                   ],
                 ),
               ),
             ),

             Container(
               decoration: ShapeDecoration(
                   color: Colors.black26,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(16)
                   )
               ),
               child: Center(
                 child: Image(
                   image: AssetImage(Resources.lockImage),
                   height: 32,width: 32,
                 ),
               ),
             )

           ]
         ):

         Stack(
             children: [
               Container(
                 child: Image(
                   image: AssetImage(gridItems[gindex]['image'].toString()),
                   fit: BoxFit.contain,
                 ),
               ),
               ClipPath(
                 clipper: MyClipper(),
                 child: Container(
                   margin: EdgeInsets.only(top: 120),
                   width: MediaQuery.of(context).size.width,
                   height: 60,
                   decoration: ShapeDecoration(
                       color: Color(0xff005AC6),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12)
                       )
                   ),
                   // decoration: BoxDecoration(
                   //   color: Color(0xff005AC6),
                   //   borderRadius: BorderRadius.only(
                   //     topLeft: Radius.circular(16.0),
                   //     topRight: Radius.circular(16.0),
                   //   )
                   // ),
                   child: Column(
                     children: [
                       Container(
                         //border radius ko uper ki or circular kaise banaye flutter me kyuki agar hum flutter me container me decoration me BorderRadius.circular lete hai to wo niche ki aur circular ker deta hai aur mujhe ooper ki or kerna hai
                         child: Text(gridItems[gindex]['title'].toString(),
                           style: TextStyle(
                               fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white,fontFamily: 'Poppins Bold'),),
                       ),

                       Container(
                         margin: EdgeInsets.only(top: 0),
                         child: Text(gridItems[gindex]['subtitle'].toString(),
                           style: TextStyle(
                               fontWeight: FontWeight.w500,fontSize: 10,color: Colors.white,fontFamily: 'Poppins Bold'),),
                       ),
                     ],
                   ),
                 ),
               ),

             ]
         )

       );
  }

  getBottomSliderCard(int index) {
    return Container(
      child: Image(
        image: AssetImage(bottomSlider[index]['image'].toString(),),
      ),
    );
  }

   dotIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        height: isSelected ? 11 : 11,
        width: isSelected ? 11 : 11,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected? Color(0xff0060D3) : Color(0xffDFE6E9)
        ),
      ),
    );
  }

   getBottomScreen()  {
    return showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: MediaQuery.of(context).size.height*0.4,
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.,
          children: [

              Container(
                margin: EdgeInsets.only(top: 10,left: 300),
               child:
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close_rounded,size: 30,)),

              ),

               Container(
                 margin: EdgeInsets.only(top: 0,bottom: 8),
                 child: Text('Select Your Query Sections',
                     style: TextStyle(
                         fontFamily: 'Poppins Bold',
                         fontWeight: FontWeight.w600,
                         fontSize: 18,color: Color(0xff394A5D)
                     ),
                 ),
               ),

            Container(
              margin: EdgeInsets.only(top: 0),
              child: Text('Lorem ipsum dolor sit amet, consectetur oremelit, sed do eiusmod',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins SimiBold',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,color: Color(0xff6A748B)
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20,bottom: 10),
              width: MediaQuery
                  .of(context)
                  .size
                  .width, //how to give dynamic height in container in flutter
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisExtent: 160,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20
                  ),
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: 2,
                  //   mainAxisExtent: 1,
                  //   crossAxisSpacing: 20
                  // ),
                  itemCount: bottomscreenGrid.length,
                  itemBuilder: (context, gindex) {
                    return getGridBottomCard(gindex);
                  }),
            ),

          ],
        ),
      );
    });
   }

   //***************************************************************************************

   getGridBottomCard(int gindex) {
    return  Container(
        decoration: ShapeDecoration(
            color: Color(0xff8DCCDB),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
            )
        ),
        child: InkWell(
          onTap: () {
               getsecondBottom();
          },
          child: Stack(
              children: [
                Container(
                  child: Image(
                    image: AssetImage(bottomscreenGrid[gindex]['image'].toString()),
                    fit: BoxFit.contain,
                  ),
                ),
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    margin: EdgeInsets.only(top: 120),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: ShapeDecoration(
                        color: Color(0xff005AC6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                    // decoration: BoxDecoration(
                    //   color: Color(0xff005AC6),
                    //   borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(16.0),
                    //     topRight: Radius.circular(16.0),
                    //   )
                    // ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:9),
                          child: Text(bottomscreenGrid[gindex]['title'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,color: Colors.white,fontFamily: 'Poppins Bold'),),
                        ),

                      ],
                    ),
                  ),
                ),

              ]
          ),
        )

    );
  }

   getsecondBottom() {
    return showModalBottomSheet(context: context, builder: (BuildContext context){
        return Container(
          height: MediaQuery.of(context).size.height*0.4,
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
                margin: EdgeInsets.only(top: 10,left: 300),
                child:
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close_rounded,size: 30,)),

              ),

              Container(
                margin: EdgeInsets.only(top: 0,bottom: 8),
                child: Text('Contact Us',
                  style: TextStyle(
                      fontFamily: 'Poppins Bold',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,color: Color(0xff394A5D)
                  ),
                ),
              ),

              Container(
                child: Text('Lorem ipsum dolor sit amet, consectetur oremelit, sed do eiusmod',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins SimiBold',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,color: Color(0xff6A748B)
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20,bottom: 5,right: 12,left: 12),

                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 120,width: 120,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(width: 1,color: Colors.black12)
                        )
                      ),
                      child: Center(
                          child: Image(
                              image: AssetImage(Resources.whattsApp),
                              height: 67,width: 75,
                          ),
                      ),
                    ),
                    Container(
                      height: 120,width: 120,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(width: 1,color: Colors.black12)
                        )
                      ),
                      child: Center(
                          child: Image(
                              image: AssetImage(Resources.mail),
                              height: 67,width: 51,
                          ),
                      ),
                    ),
                  ],
                ),
              )


            ],
          ),
        );
    });
  }


    myGrid(int gindex) {
    return Container(
      child: Stack(
        children: [
            Container(
               decoration: ShapeDecoration(
                   color: Color(0xff005AC6),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(12)
                 )
               ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 120),
                    child: Text(gridItems[gindex]['title'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white,fontFamily: 'Poppins Bold'),),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Text(gridItems[gindex]['subtitle'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,fontSize: 10,color: Colors.white,fontFamily: 'Poppins Bold'),),
                  ),
                ],
              ),
            ),
          Container(
           height: 120,
           width: double.infinity,
            //iss color:Color(0xff8DCCDB),wale container me aisi konsi property use kare ki ye apne parent container jiska color: Color(0xff005AC6), ye hai uski width le le.
            margin: EdgeInsets.only(top: 0),
            decoration: ShapeDecoration(
                color: Color(0xff8DCCDB),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                )
            ),
            child: Image(
              image: AssetImage(gridItems[gindex]['image'].toString()),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );

  }

}




class MyClipper extends CustomClipper<Path> {
  //but container under ki or shape banana chahiye ye bahar ki or bana raha hai
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height); // starting point
    path.arcToPoint(
      Offset(size.width, size.height),
      radius: Radius.circular(16.0),
      clockwise: false,

    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
