import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  const RoundButton({Key? key,
    required this.title,
    required this.onTap,
    this.loading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(top: 2),
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)
              ),
              color: Color(0xff005AC6)
          ),
        child: Center(child: loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white) :
        Text(title,textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),
        )),
      ),
    );
  }
}
