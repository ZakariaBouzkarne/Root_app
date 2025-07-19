import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpPage extends StatelessWidget {
  final void Function()? onThemeToggle;
  final bool isDarkMode;
  
  const SignUpPage({
    super.key,
    this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isDark = isDarkMode;
    
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        title: Text(
          loc.createAccount,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontFamily: 'Georgia',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black, 
          size: 28
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  (isDark ? Colors.white : Colors.black).withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark 
              ? [
                  const Color(0xFF1A1A1A),
                  const Color(0xFF121212),
                ]
              : [
                  const Color(0xFFFAFAFA),
                  Colors.white,
                ],
            stops: const [0.0, 0.8],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      loc.createAccount,
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                        letterSpacing: 1.1,
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
                    Container(
                      width: 80,
                      height: 3,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white : Colors.black,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isDark ? const Color(0xFF2A2A2A) : Colors.grey[100],
                        hintText: loc.fullName,
                        hintStyle: TextStyle(
                          fontFamily: 'Georgia',
                          color: isDark ? Colors.white70 : Colors.black54,
                        ),
                        prefixIcon: Icon(
                          Icons.person_outline, 
                          color: isDark ? Colors.white70 : Colors.black45
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 18),
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
                    const SizedBox(height: 18),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isDark ? const Color(0xFF2A2A2A) : Colors.grey[100],
                        hintText: loc.confirmPassword,
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
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
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
                        child: Text(loc.signUp),
                      ),
                    ),
                    const SizedBox(height: 18),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
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
                              text: loc.alreadyHaveAccount + ' ',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: isDark ? Colors.white : Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: loc.signIn,
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
                            loc.orSignUpWith,
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
                    Row(
                      children: [
                        Expanded(child: _GoogleButton(isDarkMode: isDark)),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Icon(
                      Icons.people_outline, 
                      color: isDark ? Colors.white12 : Colors.black12, 
                      size: 36
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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