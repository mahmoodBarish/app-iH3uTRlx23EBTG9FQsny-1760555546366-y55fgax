import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildAppBar(context),
                const SizedBox(height: 32),
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/4_297.png'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    'Update Profile Picture',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF2761FF),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                _buildInfoField(
                  label: 'Name',
                  value: 'James Franco',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 12),
                _buildInfoField(
                  label: 'Email',
                  value: 'jamesfranco@gmail.com',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 12),
                _buildInfoField(
                  label: 'Phone Number',
                  value: '03212318263',
                  icon: Icons.phone_outlined,
                ),
                const SizedBox(height: 24),
                _buildChangePasswordTile(context),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.go('/profile');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2761FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    elevation: 0,
                  ),
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF061023)),
            onPressed: () => context.pop(),
          ),
          Text(
            'Profile Information',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF061023),
            ),
          ),
          const SizedBox(width: 48), // To balance the IconButton
        ],
      ),
    );
  }

  Widget _buildInfoField(
      {required String label, required String value, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF666666),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFF3F4F9),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF061023),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Icon(icon, color: const Color(0xFF061023), size: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChangePasswordTile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            spreadRadius: 0,
            blurRadius: 30,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Handle change password navigation or action
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.lock_outline,
                        color: Color(0xFF061023), size: 24),
                    const SizedBox(width: 12),
                    Text(
                      'Change Password',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF061023),
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios,
                    color: Color(0xFF061023), size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}