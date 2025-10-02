import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026704d'),
            ),
            const SizedBox(height: 16),
            Text(
              'Marissa Edward',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'marissa.edward@example.com',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            _buildProfileMenuItem(icon: Icons.person_outline, title: 'Edit Profile'),
            _buildProfileMenuItem(icon: Icons.settings_outlined, title: 'Settings'),
            _buildProfileMenuItem(icon: Icons.notifications_outlined, title: 'Notifications'),
            _buildProfileMenuItem(icon: Icons.logout, title: 'Logout', isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileMenuItem({required IconData icon, required String title, bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : null),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          color: isLogout ? Colors.red : null,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}