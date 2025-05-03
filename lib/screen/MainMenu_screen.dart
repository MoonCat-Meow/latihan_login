import 'package:flutter/material.dart';
import 'package:latihan_login/screen/Profil_screen.dart';
import 'package:latihan_login/screen/login_screen.dart';
import '../utils/constants.dart';

class MainMenuScreen extends StatelessWidget {
  final String email;
  final String password;

  const MainMenuScreen({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {"title": "Main Sekarang", "icon": Icons.play_arrow},
      {"title": "Bermain dengan Teman", "icon": Icons.group},
      {"title": "Papan Skor", "icon": Icons.leaderboard},
      {"title": "Aturan Bermain", "icon": Icons.rule},
      {
        "title": "Profil Saya",
        "icon": Icons.person,
        "action":
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            ),
      },
      {
        "title": "Keluar",
        "icon": Icons.logout,
        "action":
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            ),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
        backgroundColor: kSecondaryColor(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children:
              menuItems.map((item) {
                return GestureDetector(
                  onTap:
                      item['action'] ??
                      () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Fitur '${item['title']}' belum tersedia.",
                            ),
                          ),
                        );
                      },
                  child: Card(
                    color: kSecondaryColor(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(item['icon'], color: Colors.white, size: 40),
                          const SizedBox(width: 16),
                          Text(
                            item['title'],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
