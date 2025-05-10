import 'package:flutter/material.dart';
import 'package:latihan_login/screen/Profil_screen.dart';
import 'package:latihan_login/screen/login_screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../utils/constants.dart';

class MainMenuScreen extends StatefulWidget {
  final String email;
  final String password;

  const MainMenuScreen({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int _currentIndex = 0;

  final List<IconData> iconList = [Icons.home, Icons.person];

  final List<String> titleList = ["Beranda", "Profil Saya"];

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildMenuItem("Main Sekarang", Icons.play_arrow),
            _buildMenuItem("Bermain dengan Teman", Icons.group),
            _buildMenuItem("Papan Skor", Icons.leaderboard),
            _buildMenuItem("Aturan Bermain", Icons.rule),
            _buildMenuItem(
              "Keluar",
              Icons.logout,
              action: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        );
      case 1:
        return const ProfileScreen();
      default:
        return const Center(child: Text("Halaman tidak ditemukan."));
    }
  }

  Widget _buildMenuItem(String title, IconData icon, {VoidCallback? action}) {
    return GestureDetector(
      onTap:
          action ??
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Fitur '$title' belum tersedia.")),
            );
          },
      child: Card(
        color: kSecondaryColor(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 40),
              const SizedBox(width: 16),
              Text(title, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor(context),
      appBar: AppBar(
        title: Text(titleList[_currentIndex]),
        backgroundColor: kSecondaryColor(context),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSecondaryColor(context),
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            _currentIndex = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        backgroundColor: kSecondaryColor(context),
        activeColor: Colors.white,
        inactiveColor: Colors.white54,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
