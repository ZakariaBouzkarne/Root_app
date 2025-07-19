import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'auth_page.dart';

class LandingPage extends StatefulWidget {
  final void Function(Locale) onLocaleChange;
  final void Function() onThemeToggle;
  final bool isDarkMode;
  
  const LandingPage({
    Key? key, 
    required this.onLocaleChange,
    required this.onThemeToggle,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AuthPage(
              onLocaleChange: widget.onLocaleChange,
              onThemeToggle: widget.onThemeToggle,
              isDarkMode: widget.isDarkMode,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isDark = widget.isDarkMode;
    
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Fond avec dégradé radial vintage
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.2,
                  colors: isDark 
                    ? [
                        const Color(0xFF2A2A2A),
                        const Color(0xFF1A1A1A),
                        const Color(0xFF0A0A0A),
                      ]
                    : [
                        const Color(0xFF2A2A2A),
                        const Color(0xFF1A1A1A),
                        const Color(0xFF0A0A0A),
                      ],
                  stops: const [0.0, 0.7, 1.0],
                ),
              ),
            ),
            // Bouton de thème en haut à gauche
            Positioned(
              top: 16,
              left: 16,
              child: _ThemeToggleButton(
                isDarkMode: isDark,
                onToggle: widget.onThemeToggle,
              ),
            ),
            // Logo stylisé au centre
            Center(
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: (isDark ? Colors.white : Colors.white).withOpacity(0.13),
                      blurRadius: 36,
                      spreadRadius: 10,
                    ),
                  ],
                  border: Border.all(color: isDark ? Colors.white : Colors.white, width: 4),
                ),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white : Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDark ? Colors.grey[400]! : Colors.grey[400]!, 
                      width: 2
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                      width: 140,
                      height: 140,
                    ),
                  ),
                ),
              ),
            ),
            // Animation de loading en bas
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 56),
                child: _ThreeDotsLoading(isDarkMode: isDark),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeToggleButton extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggle;

  const _ThemeToggleButton({
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: IconButton(
        onPressed: onToggle,
        icon: Icon(
          isDarkMode ? Icons.light_mode : Icons.dark_mode,
          color: isDarkMode ? Colors.white : Colors.black,
          size: 24,
        ),
      ),
    );
  }
}

class _ThreeDotsLoading extends StatefulWidget {
  final bool isDarkMode;
  
  const _ThreeDotsLoading({required this.isDarkMode});

  @override
  State<_ThreeDotsLoading> createState() => _ThreeDotsLoadingState();
}

class _ThreeDotsLoadingState extends State<_ThreeDotsLoading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          int activeDot = (_controller.value * 3).floor() % 3;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (i) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: i == activeDot 
                    ? (widget.isDarkMode ? Colors.white : Colors.white)
                    : (widget.isDarkMode ? Colors.white.withOpacity(0.3) : Colors.white.withOpacity(0.3)),
                  shape: BoxShape.circle,
                ),
              );
            }),
          );
        },
      ),
    );
  }
} 