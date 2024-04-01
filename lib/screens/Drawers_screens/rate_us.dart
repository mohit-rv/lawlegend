import 'package:flutter/material.dart';
import 'package:law_legend/resources/appbar.dart';

class RateUsScreen extends StatefulWidget {
  const RateUsScreen({super.key});

  @override
  State<RateUsScreen> createState() => _RateUsScreenState();
}

class _RateUsScreenState extends State<RateUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Rate',
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
          child: Column(
            children: [

            ],
          ),
      ),
    );
  }
}
