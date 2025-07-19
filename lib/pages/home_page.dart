import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'profile_page.dart';
import 'landing_page.dart';
import 'create_group_page.dart';
import 'auth_page.dart';

class HomePage extends StatefulWidget {
  final void Function(Locale) onLocaleChange;
  final void Function() onThemeToggle;
  final bool isDarkMode;
  
  const HomePage({
    super.key, 
    required this.onLocaleChange,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Image.file(File(photo.path)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final groups = [
      {
        'name': 'Vintage Lovers',
        'avatar': Icons.camera_alt_outlined,
        'lastMessage': 'See you at the retro party! 🎉',
        'time': '17:01',
        'unread': 2,
      },
      {
        'name': 'Oldies Music',
        'avatar': Icons.album,
        'lastMessage': 'New playlist shared!',
        'time': '16:45',
        'unread': 0,
      },
      {
        'name': 'Classic Cars',
        'avatar': Icons.directions_car,
        'lastMessage': 'Check this 1967 Mustang!',
        'time': '15:30',
        'unread': 5,
      },
      {
        'name': 'Retro Gamers',
        'avatar': Icons.videogame_asset,
        'lastMessage': 'Who wants to play Pac-Man?',
        'time': '14:10',
        'unread': 1,
      },
    ];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark 
              ? [
                  const Color(0xFF1A1A1A),
                  const Color(0xFF2A2A2A),
                  const Color(0xFF121212),
                ]
              : [
                  const Color(0xFFF8F8F8),
                  const Color(0xFFEDEDED),
                  Colors.white,
                ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: Column(
          children: [
            // Header décoratif avec boutons
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 48, bottom: 24, left: 16, right: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? Colors.white24 : Colors.black12, 
                    width: 1.5
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Bouton profil
                  IconButton(
                    icon: Icon(
                      Icons.person_outline, 
                      color: isDark ? Colors.white : Colors.black, 
                      size: 30
                    ),
                    tooltip: 'Profile',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            onThemeToggle: widget.onThemeToggle,
                            isDarkMode: isDark,
                          ),
                        ),
                      );
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        loc.myGroups,
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: isDark ? Colors.white : Colors.black,
                          letterSpacing: 1.5,
                          shadows: [
                            Shadow(
                              color: isDark ? Colors.white12 : Colors.black12,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Bouton déconnexion
                  Row(
                    children: [
                      // Bouton de déconnexion
                      IconButton(
                        icon: Icon(
                          Icons.logout, 
                          color: isDark ? Colors.white : Colors.black, 
                          size: 28
                        ),
                        tooltip: 'Logout',
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => AuthPage(
                                onLocaleChange: widget.onLocaleChange,
                                onThemeToggle: widget.onThemeToggle,
                                isDarkMode: isDark,
                              ),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Liste des groupes
            Expanded(
              child: groups.isEmpty
                  ? Center(
                      child: Text(
                        loc.noGroups,
                        style: TextStyle(
                          fontSize: 18, 
                          color: isDark ? Colors.white70 : Colors.black54, 
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                      itemCount: groups.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 18),
                      itemBuilder: (context, index) {
                        final group = groups[index];
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(22),
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isDark 
                                    ? Colors.white.withOpacity(0.05) 
                                    : Colors.white.withOpacity(0.92),
                                  borderRadius: BorderRadius.circular(22),
                                  border: Border.all(
                                    color: isDark ? Colors.white24 : Colors.black12, 
                                    width: 1.2
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: (isDark ? Colors.white : Colors.black).withOpacity(0.07),
                                      blurRadius: 12,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                                      radius: 28,
                                      child: Icon(
                                        group['avatar'] as IconData,
                                        color: isDark ? Colors.white : Colors.black87,
                                        size: 28,
                                      ),
                                    ),
                                    const SizedBox(width: 18),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            group['name'] as String,
                                            style: TextStyle(
                                              fontFamily: 'Georgia',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: isDark ? Colors.white : Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            group['lastMessage'] as String,
                                            style: TextStyle(
                                              fontFamily: 'Georgia',
                                              fontSize: 15,
                                              color: isDark ? Colors.white70 : Colors.black54,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          group['time'] as String,
                                          style: TextStyle(
                                            fontFamily: 'Georgia',
                                            fontSize: 13,
                                            color: isDark ? Colors.white60 : Colors.grey,
                                          ),
                                        ),
                                        if ((group['unread'] as int) > 0)
                                          Container(
                                            margin: const EdgeInsets.only(top: 8),
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: isDark ? Colors.white : Colors.black,
                                              borderRadius: BorderRadius.circular(16),
                                              border: Border.all(
                                                color: isDark ? Colors.black : Colors.white, 
                                                width: 2
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: (isDark ? Colors.white : Colors.black).withOpacity(0.10),
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                              group['unread'].toString(),
                                              style: TextStyle(
                                                color: isDark ? Colors.black : Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Georgia',
                                                fontSize: 13,
                                                letterSpacing: 1.1,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: FloatingActionButton(
              heroTag: 'camera',
              backgroundColor: isDark ? Colors.white : Colors.black,
              elevation: 6,
              onPressed: _openCamera,
              child: Icon(
                Icons.camera_alt, 
                color: isDark ? Colors.black : Colors.white
              ),
              tooltip: loc.takePhoto,
            ),
          ),
          const SizedBox(width: 16),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: FloatingActionButton.extended(
              heroTag: 'createGroup',
              backgroundColor: isDark ? Colors.white : Colors.black,
              elevation: 6,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateGroupPage(
                      onThemeToggle: widget.onThemeToggle,
                      isDarkMode: isDark,
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.group_add, 
                color: isDark ? Colors.black : Colors.white
              ),
              label: Text(
                loc.createGroup, 
                style: TextStyle(
                  color: isDark ? Colors.black : Colors.white, 
                  fontWeight: FontWeight.bold
                )
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }
} 