import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class AnimationFlowView extends StatefulWidget {
  @override
  _AnimationFlowViewState createState() => _AnimationFlowViewState();
}

class _AnimationFlowViewState extends State<AnimationFlowView>
    with TickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> animation1;
  AnimationController animationController;
  AnimationController animationController1;
  GifController controllerGif;

  @override
  void initState() {
    super.initState();
    controllerGif = GifController(vsync: this);

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween<double>(begin: 0, end: -300).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        }
      });
    animationController1 =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation1 =
        Tween<double>(begin: 0, end: -300).animate(animationController1)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController1.repeat();
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.green,
                ),
                // Align(
                //   alignment: AlignmentDirectional(0, 0.7),
                //   child: Transform.translate(
                //     offset: Offset(0, animation.value),
                //     child: Container(
                //       height: 150,
                //       width: 100,
                //       decoration: BoxDecoration(
                //           image: DecorationImage(
                //         image: AssetImage('assets/smiley.png'),
                //       )),
                //     ),
                //   ),
                // ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: RaisedButton(
                    onPressed: () {
                      animationController.forward();
                      animationController1.forward();
                    },
                    child: Text('Go'),
                    color: Colors.red,
                    textColor: Colors.yellowAccent,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                )
              ],
            ),
            // Align(
            //   alignment: AlignmentDirectional(1, 0.0),
            //   child: Transform.translate(
            //     offset: Offset(0, animation1.value),
            //     child: Container(
            //       height: 150,
            //       width: 100,
            //       decoration: BoxDecoration(
            //           image: DecorationImage(
            //         image: AssetImage('assets/smiley.png'),
            //       )),
            //     ),
            //   ),
            // ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/giftwo.gif",
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
