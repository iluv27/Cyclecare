import 'package:flutter/material.dart';
import '../theme.dart';
import 'decorations.dart';
import 'screen_widget.dart';
import 'package:cyclecare/backend/google_signin.dart';
import 'package:cyclecare/ui/home_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OnBoardingScreenOne extends StatefulWidget {
  const OnBoardingScreenOne({super.key});

  @override
  State<OnBoardingScreenOne> createState() => _OnBoardingScreenOneState();
}

class _OnBoardingScreenOneState extends State<OnBoardingScreenOne> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool isLoading = false; // Track loading state

  void _nextScreen() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUpWithGoogle() async {
    setState(() {
      isLoading = true;
    });
    await signUpWithGoogle();
    if (currentUser != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          opacity: 0.7,
          color: const Color.fromARGB(255, 53, 53, 53),
          progressIndicator: const CircularProgressIndicator(
            color: Colors.white,
          ),
          inAsyncCall: isLoading,
          child: Stack(
            children: [
              Stack(
                children: [
                  // Skip Button

                  _currentPage == 2
                      ? Container()
                      : Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                      color: AppColors.textColor, fontSize: 16),
                                )),
                          ),
                        ),

                  // Onboarding Screens
                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: const [
                      OnboardingScreen(
                        imageAsset: 'asset/imgOne.png',
                        title: 'Welcome to Cyclecare',
                        description: 'Track, Understand, and Empower Yourself',
                      ),
                      OnboardingScreen(
                        imageAsset: 'asset/imgTwo.png',
                        title: 'Monitor Your Cycle',
                        description:
                            'Effortlessly Manage Your Period, track your cycle, symptoms and see predictions.',
                      ),
                      OnboardingScreen(
                        imageAsset: 'asset/imgThree.png',
                        title: 'Let’s Get Started!',
                        description:
                            'Curious? Don’t wait! Start Your Journey to Better Health.',
                      ),
                    ],
                  ),

                  // Bottom button
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: _currentPage == 2
                          ? ElevatedButton(
                              onPressed: () {
                                _handleSignUpWithGoogle(); // Call the async function
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: Size(
                                    MediaQuery.sizeOf(context).width * 1, 70),
                                backgroundColor: AppColors.textColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(100000)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    'asset/google.png',
                                    scale: 2,
                                  ),
                                  const Text(
                                    'Sign up with Google',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const Icon(Icons.east_rounded)
                                ],
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomProgressIndicator(_currentPage),
                                ElevatedButton(
                                  onPressed: _nextScreen,
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    minimumSize: const Size(70, 70),
                                    backgroundColor: AppColors.textColor,
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(Icons.east_rounded),
                                ),
                              ],
                            ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
