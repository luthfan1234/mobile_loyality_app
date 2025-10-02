import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_2/screen/account_information.dart';
import 'package:flutter_application_2/utils/page_route_animation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home.png'),
          fit: BoxFit.cover,
        ),
      ),
      child:
          Column(
                children: [
                  const SizedBox(height: 90),
                  _buildAppBar(context),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Stack(
                      children: [
                        const _Link_Group(),
                        _Scrollable_Contain(context),
                      ],
                    ),
                  ),
                ],
              )
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic),
    );
  }

  Widget _buildListSection(
    String title,
    List<String> items,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFA0A4B0),
              height: 1.5,
            ),
          ),
        ),
        ...items
            .map(
              (item) => Column(
                children: [
                  ListTile(
                    title: Text(
                      item,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1D2939),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Widget? screen;
                      switch (item) {
                        case "Account Information":
                          screen = const AccountInformationScreen();
                          break;
                      }
                      if (screen != null) {
                        Navigator.push(context, CustomPageRoute(child: screen));
                      }
                    },
                  ),
                  const Divider(height: 1, color: Color(0xFFF2F4F7)),
                ],
              ),
            )
            .toList(),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Scrollable_Contain(BuildContext context) {
    final List<String> generalItems = [
      "Account Information",
      "Transaction History",
      "Referral Code",
      "Settings",
    ];

    final List<String> supportItems = ["About Us", "FAQ", "Help"];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 100),

      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
        children: [
          _buildListSection("GENERAL", generalItems, context),
          const SizedBox(height: 16),
          _buildListSection("SUPPORT", supportItems, context),
          const SizedBox(height: 16),
          ListTile(
            title: Text(
              "Logout",
              style: GoogleFonts.inter(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              print("Logout tapped!");
            },
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _Link_Group extends StatelessWidget {
  const _Link_Group();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 111,
      decoration: const BoxDecoration(
        color: Color(0xFFE4D9F8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
        child: Container(
          width: 369,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/tier_membership2.png',
                      width: 38,
                      height: 38,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gold',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFD69400),
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Membership',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFA0A4B0),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.chevron_right,
                      color: Color(0xFFA0A4B0),
                      size: 20,
                    ),
                  ],
                ),
              ),
              Container(
                width: 2,
                height: 41,
                // ignore: deprecated_member_use
                color: const Color(0xFF475467).withOpacity(0.1),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/point.png',
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1.200',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFD69400),
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Points',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFA0A4B0),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.chevron_right,
                      color: Color(0xFFA0A4B0),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildAppBar(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left: Icon + "1.200 Points"
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/avatar.png', width: 64, height: 64),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Marissa Edwards',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFE4D9F8),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),

                    // Row 3: Expiring text
                    Text(
                      '+62 851 6767 9900',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFE4D9F8),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
