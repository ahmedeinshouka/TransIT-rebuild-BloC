import 'package:flutter/material.dart';
import 'package:untitled5/consts/Colors.dart';
import 'package:untitled5/consts/ImagesDirections.dart';
import '../Intro/Intro.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool showText = false;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Animation for moving the logo from center to left
    _animation = Tween<double>(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            showText = true;
          });
        }
      });

    // Start the animation after a short delay
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });

    // Navigate to the next screen after a duration
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(_createRoute());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) => const Intro(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0); // Start from the top
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashColor,
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              children: [
                // Logo Animation
                Positioned(
                  top: MediaQuery.of(context).size.height / 2 - 50,
                  left: MediaQuery.of(context).size.width / 2 -
                      50 +
                      _animation.value,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset(logoDirection),
                      // Text appearing after animation
                      if (showText)
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trans-IT',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Transportation Information Technology',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
