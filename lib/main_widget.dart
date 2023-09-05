import 'package:flutter/material.dart';
import 'package:learn_animation/animated_square.dart';
import 'package:learn_animation/example_animation_widget.dart';
import 'package:learn_animation/fade_in.dart';

enum SquareSize { petit, grand }

class SquarSize extends StatefulWidget {
  const SquarSize({super.key});

  @override
  State<SquarSize> createState() => _SquarSizeState();
}

class _SquarSizeState extends State<SquarSize> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _curve;


  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..reverse();
    _curve = CurvedAnimation(
      parent: controller,
      curve: Curves.bounceIn,
    );
    controller.forward();
    super.initState();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60),
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child:
              // AnimatedSquare( animation: _curve,),
              // FadeIn(
              //   animation: controller,
              //   child: Test(),
              // ),
              ExempleAnimationWidget(),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.green,
          //         ),
          //         onPressed: () => {},
          //         child: const Text('Changer la taille',
          //             style: TextStyle(color: Colors.white)),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: const Text('Test',style: TextStyle(fontSize: 32),),
    );
  }
}
