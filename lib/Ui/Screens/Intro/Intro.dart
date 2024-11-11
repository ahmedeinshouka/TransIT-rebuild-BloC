import 'package:flutter/material.dart';
import 'package:untitled5/consts/Colors.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: splashColor,
      body: Stack(children: [
        Positioned(
          left: -149,
          top: -55,
          child: Container(
            width: 688,
            height: 730,
            clipBehavior: Clip.antiAlias,
            decoration: const ShapeDecoration(
              color: appColorBase,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(500),
                  bottomRight: Radius.circular(500),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/IntroMaterial/image.png",
                  width: 400,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 152,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(bottomColorRedWhite),
                        ),
                        child: const Text(
                          "English",
                          style: TextStyle(color: appColorBase),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 152,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(appColorBase),
                          elevation: WidgetStateProperty.all(3),
                        ),
                        child: const Text(
                          "العربية",
                          style: TextStyle(
                              color: Color.fromRGBO(170, 170, 170, 1)),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 313,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      side: WidgetStateProperty.all(
                          const BorderSide(color: bottomColorRedWhite)),
                      backgroundColor: WidgetStateProperty.all(appColorBase),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Home');
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Proceed",
                          style: TextStyle(color: bottomColorRedWhite),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Color.fromRGBO(255, 112, 35, 1),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          left: 22,
          width: 250,
          height: 70,
          child: Image.asset("assets/IntroMaterial/image (1).png"),
        )
      ]),
    ));
  }
}
