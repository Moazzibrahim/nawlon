import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/images/4.png", width: size.width),
          ),
          Positioned(
            top: 0, //c
            right: 0,
            child: Image.asset("assets/images/5.png", width: size.width),
          ),
          Positioned(
            top: 50,
            right: 10,
            child: Transform.scale(
              scale: 1.5,
              child: Image.asset("assets/images/transporter.png",
                  width: size.width * 0.35),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/3.png", width: size.width),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/6.png", width: size.width),
          ),
          child
        ],
      ),
    );
  }
}
