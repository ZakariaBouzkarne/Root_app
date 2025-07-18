import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeLogo;
  late Animation<double> _fadeButton;
  bool _isButtonPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeLogo = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.6, curve: Curves.easeOut)),
    );
    _fadeButton = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0, curve: Curves.easeOut)),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF181818),
              Color(0xFF444444),
              Color(0xFFF8F8F8),
              Colors.white,
            ],
            stops: [0.0, 0.25, 0.85, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Halo lumineux coloré et dégradé radial autour du logo
              Center(
                child: FadeTransition(
                  opacity: _fadeLogo,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Suppression du dégradé radial doux et du halo lumineux coloré
                      // Cercle du logo avec contour et effet gloss
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black.withOpacity(0.12),
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.10),
                              blurRadius: 40,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Logo
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/logo.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            // Effet gloss (reflet)
                            Positioned(
                              top: 18,
                              left: 30,
                              right: 30,
                              child: Container(
                                height: 28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white.withOpacity(0.45),
                                      Colors.white.withOpacity(0.05),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Bouton animé en bas
              Align(
                alignment: Alignment.bottomCenter,
                child: FadeTransition(
                  opacity: _fadeButton,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
                    child: GestureDetector(
                      onTapDown: (_) => setState(() => _isButtonPressed = true),
                      onTapUp: (_) => setState(() => _isButtonPressed = false),
                      onTapCancel: () => setState(() => _isButtonPressed = false),
                      onTap: () {
                        // TODO: Naviguer vers la suite de l'app
                      },
                      child: AnimatedScale(
                        scale: _isButtonPressed ? 0.96 : 1.0,
                        duration: const Duration(milliseconds: 120),
                        curve: Curves.easeOut,
                        child: Container(
                          width: double.infinity,
                          height: 58,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF222222),
                                Color(0xFF000000),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.18),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 