import 'package:flutter/material.dart';
import 'package:law_legend/resources/appbar.dart';

class taxLegendScreen extends StatefulWidget {
  const taxLegendScreen({super.key});

  @override
  State<taxLegendScreen> createState() => _taxLegendScreenState();
}

class _taxLegendScreenState extends State<taxLegendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Income Tax Legends',backgroundColor: Colors.transparent,),
      backgroundColor: Colors.white70,

    );
  }
}
