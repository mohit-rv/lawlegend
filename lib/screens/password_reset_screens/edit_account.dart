import 'package:flutter/material.dart';
import 'package:law_legend/resources/appbar.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '', backgroundColor: Colors.transparent),
      body: Stack(
        children: [

        ],
      ),
    );
  }
}
