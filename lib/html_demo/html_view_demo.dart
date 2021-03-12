import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:html/parser.dart' show parse;

class HtmlViewDemo2 extends StatefulWidget {
  @override
  _HtmlViewDemo2State createState() => _HtmlViewDemo2State();
}

class _HtmlViewDemo2State extends State<HtmlViewDemo2> {
  String filePath = "files/test.html";
  String filePathCountDown = "files/countdown.html";

  WebViewController _controller;
  String result = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              initialUrl: "",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _controller = controller;
                // _loadAssetfromHtml();
                _loadCountDownfromHtml();
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "$result",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 50,
                  ),
                ),
                Text(
                  "Flutter part",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () async {
                            // _loadAssetfromHtml();

                            var res = await _controller
                                .evaluateJavascript("clock(20)");
                            if (res != null) {}
                          },
                          child: Text(
                            "Start",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () async {
                            var res = await _controller
                                .evaluateJavascript("myStopFun()");
                            if (res != null) {}
                          },
                          child: Text(
                            "Stop",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () async {
                            var res = await _controller
                                .evaluateJavascript("restartFun()");
                            if (res != null) {}
                          },
                          child: Text(
                            "Restart",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var res = await _controller.evaluateJavascript("add(10,20)");
          if (res != null) {
            print(res.toString());
            setState(() {
              result = res;
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _loadAssetfromHtml() async {
    String htmlContent = await rootBundle.loadString(filePath);
    _controller.loadUrl(Uri.dataFromString(htmlContent,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  _loadCountDownfromHtml() async {
    String htmlContent = await rootBundle.loadString(filePathCountDown);
    _controller.loadUrl(Uri.dataFromString(htmlContent,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
