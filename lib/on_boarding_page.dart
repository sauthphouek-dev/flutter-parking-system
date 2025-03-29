import 'package:flutter/material.dart';
import 'package:parking_app/shared/utils/app_colors.dart';
import 'package:parking_app/shared/widgets/eleveated_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this,
    );

    // Define the animation: Slide from left (-1.0) to right (1.0)
    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start from the left (off-screen)
      end: Offset.zero, // End at the right (off-screen)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Smooth animation curve
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Animated Car Image
            Stack(
              children: [
                Positioned(
                  top: height * 0.2,
                  child: Container(
                    margin: EdgeInsets.only(top: height * 0.2),
                    child: Image.asset(
                      'assets/images/car.png', // Replace with your car image path
                      height: 200, // Adjust the size as needed
                    ),
                  ),
                ),
              ],
            ),
            // Text Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.directions_car,
                        color: Colors.green,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Car Parking',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'You can feel best\nperformance on\nyour drive ',
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.2,
                          ),
                        ),
                        // TextSpan(
                        //   text: EmojiParser().emojify(':muscle:'),
                        //   style: TextStyle(fontSize: 28),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Buttons Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip Button
                  Expanded(
                    flex: 3,
                    child: ElevatedButtonWidget(
                      onPressed: () {
                        // Handle Skip button press
                      },
                      title: 'Skip',
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.black54,
                    ),
                  ),
                  // Next Button
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 4,
                    child: ElevatedButtonWidget(
                      onPressed: () {
                        // Handle Next button press
                      },
                      title: 'Next',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
