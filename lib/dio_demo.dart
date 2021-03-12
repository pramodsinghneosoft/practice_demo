import 'package:flutter/material.dart';

class DioDemoView extends StatefulWidget {
  @override
  _DioDemoViewState createState() => _DioDemoViewState();
}

class _DioDemoViewState extends State<DioDemoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title:Text("Dio Demo"),
    ),
    body: Container(
      child: Text(""),
    ),
    );
  }
}