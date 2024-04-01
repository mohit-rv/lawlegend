import 'package:flutter/material.dart';
import 'package:law_legend/resources/appbar.dart';
import 'package:law_legend/resources/resources.dart';

class PurchaseHistScreen extends StatefulWidget {
  const PurchaseHistScreen({super.key});

  @override
  State<PurchaseHistScreen> createState() => _PurchaseHistScreenState();
}

class _PurchaseHistScreenState extends State<PurchaseHistScreen> {

  var ItemsList = [
    {  'image': Resources.phistory1,'title': 'GST Recent Updated','purchased on': '19 Oct 2023', 'validity': '30 days'},
    {  'image': Resources.phistory2,'title': 'Client Query - HUF', 'purchased on': '17 Oct 2023', 'validity': '30 days'},
    {  'image': Resources.phistory3,'title': 'School Fee Query', 'purchased on': '16 Oct 2023', 'validity': '30 days'},
    {  'image': Resources.phistory4,'title': 'Calculation of Income', 'purchased on': '15 Oct 2023', 'validity': '30 days'},
     {  'image': Resources.phistory1,'title': 'GST Recent Updated', 'purchased on': '14 Oct 2023', 'validity': '30 days'},
     {  'image': Resources.phistory2, 'title': 'Client Query - HUF','purchased on': '13 Oct 2023', 'validity': '30 days'},
     // {  'image': Resources.phistory2, 'title': 'Client Query - HUF','purchased on': '13 Oct 2023', 'validity': '30 days'},
     // {  'image': Resources.phistory2, 'title': 'Client Query - HUF','purchased on': '13 Oct 2023', 'validity': '30 days'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Purchase History',backgroundColor: Color(0xFFF6F6F6),),
      backgroundColor: Color(0xFFF6F6F6),
      body: Container(
        constraints: BoxConstraints.expand(),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: getItems(),
          ),
        ),
    );
  }

  getItems() {
    return Container(
        child: ListView.builder(
            itemCount: ItemsList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
          return Container(
            height: 87,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 15),
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(width: 1,color: Colors.black26)
                )
            ),
            child: Column(
              children: [
                   Container(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Container(
                           margin: EdgeInsets.only(top: 10,left: 0),
                           child: Image(
                               image: AssetImage(ItemsList[index]['image'].toString()),
                               height: 67,width: 67,
                           ),
                         ),

                         Container(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                           //  mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Container(
                                 margin: EdgeInsets.only(top: 2,left: 0),
                                 child: Text(ItemsList[index]['title'].toString(),
                                 style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w600,
                                   color: Color(0xff1D1D21),
                                   fontFamily: 'Poppins Bold'
                                 ),
                                 ),
                               ),

                               Container(
                                 margin: EdgeInsets.only(top: 2,left: 0),
                                 child: Row(//mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                  Container(
                                    child: Text('Purchased on: ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff747474),
                                          fontFamily: 'Poppins Regular'
                                      ),
                                    ),
                                  ),


                                  Container(
                                    margin: EdgeInsets.only(top: 2,left: 0),
                                    child: Text(ItemsList[index]['purchased on'].toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff005AC6),
                                          fontFamily: 'Poppins Regular'
                                      ),
                                    ),
                                  ),
                                                               ],
                                                             ),
                               ),
                               Container(
                                 child: Row(
                                   children: [
                                     Container(
                                       margin: EdgeInsets.only(top: 2,left: 0),
                                       child: Text('Validity: ',
                                         style: TextStyle(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w600,
                                             color: Color(0xff747474),
                                             fontFamily: 'Poppins Regular'
                                         ),
                                       ),
                                     ),


                                     Container(
                                       margin: EdgeInsets.only(top: 2,left: 0),
                                       child: Text(ItemsList[index]['validity'].toString(),
                                         style: TextStyle(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w600,
                                             color: Color(0xff005AC6),
                                             fontFamily: 'Poppins Regular'
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),

                             ],
                           ),
                         ),

                         Container(
                             child: Image(image: AssetImage(Resources.aero),alignment: Alignment.centerRight,
                                 height: 18,width: 18))

                       ],
                     ),
                   )
              ],
            ),
          );
        }),
      );

  }

}
