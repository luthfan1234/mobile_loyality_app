import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountInformationScreen extends StatelessWidget {
  const AccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Information',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildProfileSection(),
          const SizedBox(height: 24),
          _buildPersonalInfoSection(),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Profile
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'PROFILE',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFFA0A4B0),
              height: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Ganti foto profil
        ListTile(
          leading: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/icons/avatar.png'),
          ),
          title: Text(
            'Change profile picture',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Color(0xFF7743DB),
            ),
          ),
        ),

        // Full Name
        ListTile(
          title: Row(
            children: [
              Text(
                "Full Name",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF1D2939),
                  height: 1.5,
                ),
              ),
              const Spacer(),
              Flexible(
                child: Text(
                  "Marissa Edwards",
                  textAlign: TextAlign.end,
                  overflow:
                      TextOverflow.ellipsis, // biar auto potong kalau panjang
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF475467),
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),

        const Divider(height: 1, color: Color(0xFFF2F4F7)),

        // Username
        ListTile(
          title: Row(
            children: [
              Text(
                "Username",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF1D2939),
                  height: 1.5,
                ),
              ),
              const Spacer(),
              Flexible(
                child: Text(
                  "marissa123",
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF475467),
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),

        const Divider(height: 1, color: Color(0xFFF2F4F7)),
      ],
    );
  }

  Widget _buildPersonalInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'PERSONAL INFO',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFFA0A4B0),
              height: 1.5,
            ),
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "User ID",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Color(0xFF475467),
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Text(
                  "67776",
                  textAlign: TextAlign.end,
                  overflow:
                      TextOverflow.ellipsis, // biar kalau panjang auto potong
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF475467),
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          trailing: Icon(
            Icons.copy_all_rounded,
            size: 20,
            color: Color(0xFF7743DB),
          ),
          onTap: () {},
        ),
        const Divider(height: 1, color: Color(0xFFF2F4F7)),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date of Birth",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Color(0xFF475467),
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Text(
                  "12 June 1994",
                  textAlign: TextAlign.end,
                  overflow:
                      TextOverflow.ellipsis, // biar kalau panjang auto potong
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF475467),
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.info, size: 20, color: Color(0xFF7743DB)),
          onTap: () {},
        ),
        const Divider(height: 1, color: Color(0xFFF2F4F7)),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Phone Number",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Color(0xFF475467),
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Text(
                  "+62 851 6767 9900",
                  textAlign: TextAlign.end,
                  overflow:
                      TextOverflow.ellipsis, // biar kalau panjang auto potong
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF475467),
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        const Divider(height: 1, color: Color(0xFFF2F4F7)),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Email",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Color(0xFF475467),
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Text(
                  "marrisaedward@gmail.com",
                  textAlign: TextAlign.end,
                  overflow:
                      TextOverflow.ellipsis, // biar kalau panjang auto potong
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF475467),
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        const Divider(height: 1, color: Color(0xFFF2F4F7)),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Gender",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Color(0xFF475467),
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Text(
                  "Male",
                  textAlign: TextAlign.end,
                  overflow:
                      TextOverflow.ellipsis, // biar kalau panjang auto potong
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF475467),
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        const Divider(height: 1, color: Color(0xFFF2F4F7)),
      ],
    );
  }

  Widget _buildInfoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: GoogleFonts.inter(color: Colors.grey)),
    );
  }
}
