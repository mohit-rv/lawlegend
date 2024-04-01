import 'package:flutter/material.dart';
import 'package:law_legend/resources/appbar.dart';

class PrevacyPolicy extends StatefulWidget {
  const PrevacyPolicy({super.key});

  @override
  State<PrevacyPolicy> createState() => _PrevacyPolicyState();
}

class _PrevacyPolicyState extends State<PrevacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Privacy Policy', backgroundColor: Colors.white),
      body: Container(
        constraints: BoxConstraints.expand(),
      ),
    );
  }
}
