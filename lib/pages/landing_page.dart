import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:root_app/pages/home_page.dart';

class LandingPage extends StatefulWidget {
  final void Function(Locale) onLocaleChange;
  const LandingPage({Key? key, required this.onLocaleChange}) : super(key: key);

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
    Locale currentLocale = Localizations.localeOf(context);
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
              // Sélecteur de langue stylisé en haut à droite
              Positioned(
                top: 16,
                right: 16,
                child: Builder(
                  builder: (context) {
                    Locale currentLocale = Localizations.localeOf(context);
                    String langLabel(Locale locale) {
                      switch (locale.languageCode) {
                        case 'en':
                          return 'English';
                        case 'fr':
                          return 'Français';
                        case 'ar':
                          return 'العربية';
                        default:
                          return locale.languageCode;
                      }
                    }
                    String langFlag(Locale locale) {
                      switch (locale.languageCode) {
                        case 'en':
                          return '🇬🇧';
                        case 'fr':
                          return '🇫🇷';
                        case 'ar':
                          return '🇲🇦'; // Maroc pour l'arabe, à adapter si besoin
                        default:
                          return '🌐';
                      }
                    }
                    final locales = [
                      const Locale('en'),
                      const Locale('fr'),
                      const Locale('ar'),
                    ];
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(24),
                        onTap: () async {
                          final RenderBox button = context.findRenderObject() as RenderBox;
                          final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
                          final Offset position = button.localToGlobal(Offset.zero, ancestor: overlay);
                          final selected = await showMenu<Locale>(
                            context: context,
                            position: RelativeRect.fromLTRB(
                              position.dx,
                              position.dy + button.size.height + 8,
                              overlay.size.width - position.dx - button.size.width,
                              0,
                            ),
                            items: locales.map((locale) {
                              return PopupMenuItem<Locale>(
                                value: locale,
                                child: Row(
                                  children: [
                                    Text(langFlag(locale), style: const TextStyle(fontSize: 20)),
                                    const SizedBox(width: 8),
                                    Text(
                                      langLabel(locale),
                                      style: TextStyle(
                                        fontWeight: locale == currentLocale ? FontWeight.bold : FontWeight.normal,
                                        color: locale == currentLocale ? Colors.black : Colors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                          if (selected != null && selected != currentLocale) {
                            widget.onLocaleChange(selected);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.92),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.10),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            border: Border.all(
                              color: Colors.black.withOpacity(0.08),
                              width: 1.2,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                langFlag(currentLocale),
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                langLabel(currentLocale),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.keyboard_arrow_down, size: 18),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Logo animé
              Center(
                child: FadeTransition(
                  opacity: _fadeLogo,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
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
                          child: Text(
                            AppLocalizations.of(context)!.getStarted,
                            style: const TextStyle(
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