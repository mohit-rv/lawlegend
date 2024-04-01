import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:law_legend/resources/appbar.dart';

import '../resources/resources.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  TextEditingController nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _passwordIsVisible = false;
  bool isConditionsChecked = false;
  FocusNode nameNode = FocusNode();
  FocusNode _passwordNode = FocusNode();
  FocusNode emailNode = FocusNode();

  @override
  void dispose() {
    nameController.dispose();
    _emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Complete Your Profile',backgroundColor: Colors.transparent),
      bottomNavigationBar: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {

        },
        child: Container(
          margin: EdgeInsets.only(top: 10,right: 15,left: 15),
          padding: EdgeInsets.only(top: 16),
          width: MediaQuery.of(context).size.width,
          height: 56,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26)
              ),
              color: Color(0xff005AC6)
          ),
          child: Text('Submit',textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
                 getNameField(),
                 getEmailField(),
                 getPasswordField(),
                 Container(
                   margin: EdgeInsets.only(top: 350),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       getTermsAndCheck(),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text('I agree to the ',
                                 style: TextStyle(fontFamily: 'Poppins Regular',fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black38),
                               ),
                               Text('Terms & Conditions',
                                 style: TextStyle(fontFamily: 'Poppins Regular',fontSize: 12,fontWeight: FontWeight.bold,color: Color(0xff005AC6)),
                               ),
                               Text(' and',
                                 style: TextStyle(fontFamily: 'Poppins Regular',fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black38),
                               ),
                               Text(' Privacy',
                                   style: TextStyle(fontFamily: 'Poppins Regular',fontSize: 12,fontWeight: FontWeight.bold,color: Color(0xff005AC6)),
                                 ),
                             ],
                           ),
                           Container(
                             margin: EdgeInsets.only(left: 0),
                             child: Text(' Policy',
                               style: TextStyle(fontFamily: 'Poppins Regular',fontSize: 12,fontWeight: FontWeight.bold,color: Color(0xff005AC6)),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),


            ],
          ),
        ),
      ),
    );
  }

  getNameField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFD8DADC),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            controller: nameController,
            focusNode: nameNode,
            onChanged: (text) {
              setState(() {});
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Full Name",
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
                    image: AssetImage(Resources.profile),
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
            cursorColor: Color(0xFFA7A9B7),
            style: TextStyle(
              color: Color(0xFFA7A9B7),
              fontSize: 14,
              fontFamily: 'Poppins Medium',
              fontWeight: FontWeight.w400,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  getEmailField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFD8DADC),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            controller: _emailController,
            focusNode: emailNode,
            onChanged: (text) {
              setState(() {});
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
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
                    image: AssetImage(Resources.profile),
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
            cursorColor: Color(0xFFA7A9B7),
            style: TextStyle(
              color: Color(0xFFA7A9B7),
              fontSize: 14,
              fontFamily: 'Poppins Medium',
              fontWeight: FontWeight.w400,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  getPasswordField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFD8DADC),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            controller: _passwordController,
            focusNode: _passwordNode,
            onChanged: (text) {
              setState(() {});
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your password",
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
                    image: AssetImage(Resources.lock),
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
                suffixIcon: IconButton(
                  icon: Icon(
                    !_passwordIsVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    //change icon based on boolean value
                    color: _passwordIsVisible
                        ? HexColor("#838383")
                        : HexColor("#838383"),
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordIsVisible =
                      !_passwordIsVisible; //change boolean value
                    });
                  },
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(18)),
            keyboardType: TextInputType.name,
            obscureText: !_passwordIsVisible,
            maxLines: 1,
            cursorColor: Color(0xFFA7A9B7),
            style: TextStyle(
              color: Color(0xFFA7A9B7),
              fontSize: 14,
              fontFamily: 'Poppins Medium',
              fontWeight: FontWeight.w400,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  getTermsAndCheck() {
    return Container(
        alignment: Alignment.topLeft,
        child: Checkbox(
          checkColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return const Color(0xFF005AC6);
                }
                return Colors.black12;
              }),
          side: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
          value: isConditionsChecked,
          onChanged: (bool? value) {
            setState(() {
              isConditionsChecked = value ?? false;
              print('CheckBox Selected');
            });
          },
        ),
    );
  }


}
