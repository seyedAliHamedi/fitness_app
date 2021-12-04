import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dashboard.dart';
import './animation.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomePage(),
      '/dashboard': (context) => const Dashboard()
    },
    initialRoute: '/',
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> rippleAnimation;
  late Animation<double> scaleAnimation;
  late AnimationController rippleController;
  late AnimationController scaleController;

  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    rippleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    scaleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addStatusListener((status) {
             if (status == AnimationStatus.completed) {
              Navigator.pushNamed(context, '/dashboard');
            }
          });

    scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(scaleController);

    rippleAnimation =
        Tween<double>(begin: 80.0, end: 90.0).animate(rippleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              rippleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              rippleController.forward();
            }
          });
    rippleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _pageController,
      children: [
        mask('two.jpg', rippleController, scaleController, rippleAnimation,
            scaleAnimation),
        mask('one.jpg', rippleController, scaleController, rippleAnimation,
            scaleAnimation),
        mask('three.jpg', rippleController, scaleController, rippleAnimation,
            scaleAnimation),
      ],
    ));
  }
}

Widget mask(
    image, rippleController, scaleController, rippleAnimation, scaleAnimation) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/$image'),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
        color: Colors.black.withOpacity(.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Fade(
                child: Text(
              'Exerciese',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 40.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Fade(
                    child: Text(
                  '15',
                  style: TextStyle(
                      color: Colors.yellow[400],
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                )),
                const Fade(
                    child: Text(
                  'Minutes',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                )),
              ],
            ),
            const SizedBox(height: 40.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Fade(
                    child: Text(
                  '3',
                  style: TextStyle(
                      color: Colors.yellow[400],
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                )),
                const Fade(
                    child: Text(
                  'Reps',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                )),
              ],
            ),
            const Spacer(),
            const Fade(
                child: Text(
              'Start the morning with your health',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400),
            )),
            const SizedBox(
              height: 40.0,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedBuilder(
                animation: rippleAnimation,
                builder: (context, child) => SizedBox(
                  width: rippleAnimation.value,
                  height: rippleAnimation.value,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(.4),
                    ),
                    child: InkWell(
                      onTap: () {
                        scaleController.forward();
                      },
                      child: AnimatedBuilder(
                        animation: scaleAnimation,
                        builder: (context, child) => Transform.scale(
                          scale: scaleAnimation.value,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
  );
}
