import 'package:flutter/material.dart';
import 'package:law_legend/resources/resources.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  CustomAppBar({Key? key,required this.title, required this.backgroundColor }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      elevation: 8,
      title: Text(title,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontFamily: 'Poppins Semibold',
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
      centerTitle: true,
     // backgroundColor: backgroundColor,
      flexibleSpace: Container(
        color: backgroundColor,
        padding: EdgeInsets.only(top: 20, left: 24, right: 24),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 8, right: 8),
                decoration: ShapeDecoration(
                 // color: Colors.white,
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
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
