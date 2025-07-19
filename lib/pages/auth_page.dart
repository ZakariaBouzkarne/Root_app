import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthPage extends StatelessWidget {
  final void Function(Locale)? onLocaleChange;
  final void Function()? onThemeToggle;
  final bool isDarkMode;
  
  const AuthPage({
    super.key, 
    this.onLocaleChange,
    this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    Locale currentLocale = Localizations.localeOf(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Sélecteur de langue stylisé en haut à droite
            Positioned(
              top: 16,
              right: 16,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Bouton de basculement du thème
                  Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: IconButton(
                      icon: Icon(
                        isDark ? Icons.light_mode : Icons.dark_mode,
                        color: isDark ? Colors.white : Colors.black,
                        size: 24,
                      ),
                      tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                      onPressed: () {
                        print('Theme toggle pressed from auth page! Current mode: ${isDark ? 'dark' : 'light'}');
                        if (onThemeToggle != null) {
                          onThemeToggle!();
                        }
                      },
                    ),
                  ),
                  // Sélecteur de langue
                  _LanguageSelector(
                    currentLocale: currentLocale,
                    onLocaleChange: onLocaleChange,
                    isDarkMode: isDark,
                  ),
                ],
              ),
            ),
            // Contenu principal
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Titre vintage noir
                      Text(
                        loc.welcomeBack,
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                          letterSpacing: 1.2,
                          shadows: [
                            Shadow(
                              color: (isDark ? Colors.white : Colors.black).withOpacity(0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Ligne décorative noire
                      Container(
                        width: 80,
                        height: 3,
                        decoration: BoxDecoration(
                          color: isDark ? Colors.white : Colors.black,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Champ email
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: isDark ? const Color(0xFF2A2A2A) : Colors.grey[100],
                          hintText: loc.email,
                          hintStyle: TextStyle(
                            fontFamily: 'Georgia',
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined, 
                            color: isDark ? Colors.white70 : Colors.black45
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Champ mot de passe
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: isDark ? const Color(0xFF2A2A2A) : Colors.grey[100],
                          hintText: loc.password,
                          hintStyle: TextStyle(
                            fontFamily: 'Georgia',
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline, 
                            color: isDark ? Colors.white70 : Colors.black45
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        obscureText: true,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 28),
                      // Bouton de connexion vintage noir
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  onLocaleChange: onLocaleChange!,
                                  onThemeToggle: onThemeToggle!,
                                  isDarkMode: isDark,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDark ? Colors.white : Colors.black,
                            foregroundColor: isDark ? Colors.black : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            elevation: 6,
                            shadowColor: (isDark ? Colors.white : Colors.black).withOpacity(0.18),
                            textStyle: const TextStyle(
                              fontFamily: 'Georgia',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1.1,
                            ),
                          ),
                          child: Text(loc.signIn),
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Lien d'inscription vintage
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(
                                onThemeToggle: onThemeToggle,
                                isDarkMode: isDark,
                              ),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft,
                        ),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Georgia',
                              color: isDark ? Colors.white : Colors.black,
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: loc.alreadyHaveAccount,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: loc.signUp,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? Colors.white : Colors.black,
                                  shadows: [
                                    Shadow(
                                      color: (isDark ? Colors.white : Colors.black).withOpacity(0.10),
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      // Séparateur
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: isDark ? Colors.white24 : Colors.black26,
                              thickness: 1.2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              loc.orContinueWith,
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                color: isDark ? Colors.white60 : Colors.black38,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: isDark ? Colors.white24 : Colors.black26,
                              thickness: 1.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      // Boutons sociaux
                      Row(
                        children: [
                          Expanded(child: _GoogleButton(isDarkMode: isDark)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  final Locale currentLocale;
  final void Function(Locale)? onLocaleChange;
  final bool isDarkMode;

  const _LanguageSelector({
    required this.currentLocale,
    this.onLocaleChange,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.98),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: (isDarkMode ? Colors.white : Colors.black).withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 1,
          ),
          BoxShadow(
            color: (isDarkMode ? Colors.white : Colors.black).withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: (isDarkMode ? Colors.white : Colors.black).withOpacity(0.1),
          width: 1,
        ),
      ),
      child: DropdownButton<Locale>(
        value: currentLocale,
        underline: const SizedBox(),
        icon: Icon(
          Icons.language, 
          size: 20, 
          color: isDarkMode ? Colors.white.withOpacity(0.87) : Colors.black87
        ),
        items: [
          DropdownMenuItem(
            value: const Locale('en'),
            child: Text(
              'English', 
              style: TextStyle(
                fontSize: 14, 
                color: isDarkMode ? Colors.white.withOpacity(0.87) : Colors.black87
              ),
            ),
          ),
          DropdownMenuItem(
            value: const Locale('fr'),
            child: Text(
              'Français', 
              style: TextStyle(
                fontSize: 14, 
                color: isDarkMode ? Colors.white.withOpacity(0.87) : Colors.black87
              ),
            ),
          ),
          DropdownMenuItem(
            value: const Locale('ar'),
            child: Text(
              'العربية', 
              style: TextStyle(
                fontSize: 14, 
                color: isDarkMode ? Colors.white.withOpacity(0.87) : Colors.black87
              ),
            ),
          ),
        ],
        onChanged: (locale) {
          if (locale != null && onLocaleChange != null) {
            onLocaleChange!(locale);
          }
        },
      ),
    );
  }
}

class _GoogleButton extends StatelessWidget {
  final bool isDarkMode;
  
  const _GoogleButton({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF2A2A2A) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isDarkMode ? Colors.white : Colors.black, 
            width: 1.5
          ),
          boxShadow: [
            BoxShadow(
              color: (isDarkMode ? Colors.white : Colors.black).withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/google_icon.png',
                width: 24,
                height: 24,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.g_mobiledata, 
                  color: isDarkMode ? Colors.white : Colors.red, 
                  size: 24
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Google',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontFamily: 'Georgia',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 