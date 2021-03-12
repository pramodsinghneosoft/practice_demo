import 'dart:async';

import 'package:flutter/material.dart';

class AutoScrollListView extends StatefulWidget {
  @override
  _AutoScrollListViewState createState() => _AutoScrollListViewState();
}

class _AutoScrollListViewState extends State<AutoScrollListView> {
  var _scrollController = ScrollController();
  int itemLength = 0;
  _scrollToBottom() {
    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    Timer(
        Duration(milliseconds: 500),
        () => _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent));
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    return Scaffold(
      appBar: AppBar(
        title: Text("AutoScroll ListView"),
      ),
      body: ListView.builder(
        itemCount: itemLength,
        controller: _scrollController,
        reverse: true,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Yo Dummy Text $index'),
            dense: true,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            itemLength++;
          });
          _scrollToBottom();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
