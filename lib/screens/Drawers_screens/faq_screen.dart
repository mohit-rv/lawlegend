import 'package:flutter/material.dart';
import 'package:law_legend/resources/appbar.dart';
import 'package:law_legend/resources/resources.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> with  TickerProviderStateMixin{

  var FaqItems = [];

  var ittemList = [
    {'title': 'Why my track is not showing'},
    {'title': 'Tracky insurance terms'},
    {'title': 'How to place order'},
    {'title': 'How to do track'},
    {'title': 'Tracky insurance terms'},
    {'title': 'How to place order'},
    {'title': 'How to create a acco'},
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(var i = 0; i < ittemList.length; i++) {

      var _controller = AnimationController(
          duration: Duration(milliseconds: 600),
          vsync: this);

      var _animation = CurvedAnimation(
          parent: _controller, curve: Curves.easeInOut);

      FaqItems.add(
        {
          "title":   ittemList[i]['title'].toString(),
          "stitle": "Open the Tradebase app is to get started and follow the steps. Tradebase this doesn’t charge a fee to create"
              " or maintain your Tradebase account. Open the Tradebase app to get. started and follow, the steps. doesn’t charge a fee "
              "to create or maintain your Tradebase account.",
          "isExpanded": false,
          "controller": _controller,       // use to start the the animation
          "animation": _animation           //use to end the the animation
        },

      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(title: 'FAQ',backgroundColor: Colors.transparent,),
        backgroundColor: Colors.white,
      bottomNavigationBar: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {

        },
        child: Container(
          margin: EdgeInsets.only(right: 12,left: 12),
          padding: EdgeInsets.only(top: 4),
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
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(Resources.message),height: 24,width: 24,),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text('Contact Via Email',textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Poppins SemiBold",fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
     body: Padding(
       padding: EdgeInsets.all(0),
       child: getFaqList(),
     ),
    );
  }

  getFaqList() {
    return  Container(
      // width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: FaqItems.length,
          physics: ScrollPhysics(),
          controller: ScrollController(),
          itemBuilder: (context, index){
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                setState(() {
                  FaqItems[index]['isExpanded'] = !FaqItems[index]['isExpanded'];
                  if(FaqItems[index]['isExpanded']) {
                    FaqItems[index]['controller'].forward() ;
                  }else {
                    FaqItems[index]['controller'].reverse();
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1,
                            color: Color(0xFFF3F3F3),
                            strokeAlign: BorderSide.strokeAlignCenter
                        ),
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 15 , top: 14, bottom: 14),
                            child: Text(
                              FaqItems[index]['title'].toString(),
                              style: TextStyle(
                                color: Color(0xFF48484D),
                                fontSize: 13,
                                fontFamily: 'Poppins SemiBold',
                                fontWeight: FontWeight.w400,
                                height: 0.10,
                              ),
                            )
                        ),

                        Container(
                            margin: EdgeInsets.only(right: 15, top: 14, bottom: 14),
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                )
                            ),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              child: Image(
                                image: FaqItems[index]['isExpanded'] ? AssetImage(Resources.minus) : AssetImage(Resources.plus),
                                width: 24,
                                height: FaqItems[index]['isExpanded'] ? 2 :24,
                                // height: 24,
                              ),
                            )
                        ),


                      ],
                    ),
                    FaqItems[index]['isExpanded'] ?
                    SizeTransition(                            //for animation
                      sizeFactor: FaqItems[index]['animation'],
                      //  axis: Axis.vertical,
                      child: Container(
                        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                        child: Text(
                          FaqItems[index]['stitle'].toString(),
                          style: TextStyle(
                            color: Color(0xFF757575),
                            fontSize: 10,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            letterSpacing: 0.25,
                          ),
                        ),
                      ),
                    ): Container()
                  ],
                ),
              ),
            );
          }
      ),
    );
  }


}
