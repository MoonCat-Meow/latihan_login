import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = '';
  String email = '';
  String phone = '';
  String address = '';

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('user_name') ?? 'Pengguna';
      email = prefs.getString('user_email') ?? '-';
      phone = prefs.getString('user_phone') ?? '-';
      address = prefs.getString('user_address') ?? '-';
    });
  }

  Widget buildProfileItem(String label, String value, IconData icon) {
    return Card(
      color: Colors.grey[850],
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: kSecondaryColor(context)),
        title: Text(label, style: const TextStyle(color: Colors.white70)),
        subtitle: Text(value, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor(context),
      appBar: AppBar(
        title: const Text("Profil Saya"),
        backgroundColor: kSecondaryColor(context),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_default.png'),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 24),
          buildProfileItem('Email', email, Icons.email),
          buildProfileItem('Nomor Telepon', phone, Icons.phone),
          buildProfileItem('Alamat', address, Icons.home),
          const SizedBox(height: 24),
          Center(
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return ElevatedButton.icon(
                  icon: const Icon(Icons.brightness_6),
                  label: const Text("Ganti Tema"),
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kSecondaryColor(context),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
