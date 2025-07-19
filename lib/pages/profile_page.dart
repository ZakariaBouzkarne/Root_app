import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  final void Function()? onThemeToggle;
  final bool isDarkMode;
  
  const ProfilePage({
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
        backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.grey[100],
        elevation: 0,
        title: Text(
          loc.profile,
          style: TextStyle(
            fontFamily: 'Georgia',
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: isDark ? Colors.white : Colors.black,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                color: isDark ? Colors.white12 : Colors.black12,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : Colors.grey[200],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: (isDark ? Colors.white : Colors.black).withAlpha((0.10 * 255).toInt()),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: isDark ? Colors.grey[700] : Colors.white,
                  child: Icon(
                    Icons.person_outline, 
                    color: isDark ? Colors.white : Colors.black54, 
                    size: 54
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'John Doe',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: isDark ? Colors.white : Colors.black,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'john.doe@email.com',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 16,
                  color: isDark ? Colors.white70 : Colors.black54,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit, 
                    color: isDark ? Colors.white : Colors.black
                  ),
                  label: Text(
                    loc.editProfile,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontFamily: 'Georgia',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: isDark ? Colors.white : Colors.black, 
                      width: 1.3
                    ),
                    backgroundColor: isDark ? Colors.grey[800] : Colors.grey[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
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