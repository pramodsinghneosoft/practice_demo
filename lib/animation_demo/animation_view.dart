import 'package:flutter/material.dart';

class AnimationView extends StatefulWidget {
  @override
  _AnimationViewState createState() => _AnimationViewState();
}

class _AnimationViewState extends State<AnimationView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  bool hide = false;

  @override
  void initState() {
    super.initState();
    callAnimation();
  }

  callAnimation() {
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
    ));
    animationController.addStatusListener((status) {
      print("animation---->");
      print("$status");
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: 4), () {
          setState(() {
            hide = true;
          });
        });
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.star),
            onPressed: () {
              animationController.reverse();
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.star_border),
            onPressed: () {
              setState(() {
                hide = false;
              });
              callAnimation();
            },
          ),
        ],
      ),
      body: Container(
        width: width,
        height: height,
        color: Colors.green,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform(
              transform:
                  Matrix4.translationValues(animation.value * width, 0.0, 0.0),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  hide != true
                      ? Text(
                          "data",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        )
                      : Text(
                          "hidden data",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
