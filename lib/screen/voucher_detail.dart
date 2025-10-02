import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class VoucherDetailScreen extends StatefulWidget {
  const VoucherDetailScreen({super.key});

  @override
  State<VoucherDetailScreen> createState() => _VoucherDetailScreenState();
}

class _VoucherDetailScreenState extends State<VoucherDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            const SizedBox(height: 20),
            _buildVoucherHeader(),
            const SizedBox(height: 11),
            _buildTabBar(),
            _buildTabBarView(),
            _buildRedeemButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildVoucherHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/voucher_detail.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '25% discount voucher',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '2.500 points',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFCB351),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(text: 'Detail'),
        Tab(text: 'Term Condition'),
      ],
      indicatorColor: const Color(0xFF7743DB),
      indicatorWeight: 3.0,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: const Color(0xFF7743DB),
      unselectedLabelColor: const Color(0xFF475467),
      labelStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          // Detail Tab
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Sure thing! Your \"25% discount voucher\" is a fabulous \noffer that allows you to enjoy a quarter off the regular \nprice on selected items or services. \n  \nThis voucher is your ticket to some sweet savings—\nwhether you're treating yourself or snagging a great deal \nfor someone special. \n \nHappy shopping!",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF475467),
                height: 1.4,
              ),
            ),
          ),
          // Term Condition Tab
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms and Conditions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('1. Voucher is valid for one-time use only.'),
                  SizedBox(height: 5),
                  Text('2. Voucher cannot be exchanged for cash.'),
                  SizedBox(height: 5),
                  Text('3. Voucher is valid until 31 December 2025.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRedeemButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7743DB),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        child: Text(
          'Redeem now',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFE4D9F8),
          ),
        ),
      ),
    );
  }
}

Widget _buildAppBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 24,
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        Expanded(
          child: Text(
            'Voucher Detail',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 48), // To balance the back button
      ],
    ),
  );
}
