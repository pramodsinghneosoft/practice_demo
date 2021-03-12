import 'package:flutter/material.dart';
import 'package:flutter_pubnub_demo/animation_demo/animation_view.dart';
import 'package:flutter_pubnub_demo/animation_flow_demo/animation_flow_view.dart';
import 'package:flutter_pubnub_demo/autoscroll_listview_demo/autoscroll_listview.dart';
import 'package:flutter_pubnub_demo/check_internent_demo.dart';
import 'package:flutter_pubnub_demo/download_video_demo/video_download_view.dart';
import 'package:flutter_pubnub_demo/html_demo/html_view.dart';
import 'package:flutter_pubnub_demo/html_demo/html_view_demo.dart';
import 'package:flutter_pubnub_demo/screenutil/screenutil_demo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pubnub/pubnub.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HtmlViewDemo2(),
        // home: ScreenUtilView(title: "ScreenUtil"),
        //
        // home: VideoDownloadView(),
        home: AnimationFlowView(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String subscribeKey = "sub-c-93907dc0-63d9-11eb-8f08-92456e14fb5a";
  String publishKey = "pub-c-cd6a5323-695f-452c-8ece-6154dae48753";
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    initializePubNub();
  }

  initializePubNub() {
    final pubnub = PubNub(
        defaultKeyset: Keyset(
            subscribeKey: subscribeKey,
            publishKey: publishKey,
            uuid: UUID('MY_UUID')));

    var myChannel = pubnub.channel('my_channel');

    myChannel.publish({'hello': 'world'});

    var subscription = pubnub.subscribe(channels: {'my_channel'});

    subscription.messages.listen((event) {
      print(event.payload);
      print(event.uuid);
    });

    // myChannel.subscribe().messages.listen((envelope) {
    //   print(envelope.payload);
    // });

    // var msg = myChannel.messages();
    // print(msg.from);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
