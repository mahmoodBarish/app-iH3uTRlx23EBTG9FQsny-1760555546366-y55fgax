import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Followers extends StatelessWidget {
  const Followers({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> myFollowers = [
      {
        'name': 'Olivia Thompson',
        'username': '@oliviathompson',
        'image': 'assets/images/4_202.png',
      },
      {
        'name': 'Ethan Baker',
        'username': '@ethan_baker',
        'image': 'assets/images/4_216.png',
      },
      {
        'name': 'Chloe Mitchell',
        'username': '@Mitch_Chloe',
        'image': 'assets/images/4_230.png',
      },
    ];

    final List<Map<String, String>> followerRequests = [
      {
        'name': 'James Carter',
        'username': '@Bigjamescarter',
        'image': 'assets/images/4_249.png',
      },
      {
        'name': 'Ava Wilson',
        'username': '@Avawilson_',
        'image': 'assets/images/4_263.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF252525)),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Followers',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: const Color(0xFF252525),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              _SectionHeader(title: 'My Followers'),
              const SizedBox(height: 12),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: myFollowers.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final follower = myFollowers[index];
                  return _FollowerCard(
                    name: follower['name']!,
                    username: follower['username']!,
                    imageUrl: follower['image']!,
                  );
                },
              ),
              const SizedBox(height: 20),
              _SectionHeader(title: 'Follower Request'),
              const SizedBox(height: 12),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: followerRequests.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final request = followerRequests[index];
                  return _FollowerRequestCard(
                    name: request['name']!,
                    username: request['username']!,
                    imageUrl: request['image']!,
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: const Color(0xFF252525),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See more',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: const Color(0xFF2761FF),
            ),
          ),
        ),
      ],
    );
  }
}

class _FollowerCard extends StatelessWidget {
  final String name;
  final String username;
  final String imageUrl;

  const _FollowerCard({
    required this.name,
    required this.username,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/profile_info_page'),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 30,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(imageUrl),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xFF252525),
                    ),
                  ),
                  Text(
                    username,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: const Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFD646F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                minimumSize: const Size(66, 23),
              ),
              child: Text(
                'Remove',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FollowerRequestCard extends StatelessWidget {
  final String name;
  final String username;
  final String imageUrl;

  const _FollowerRequestCard({
    required this.name,
    required this.username,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/profile_info_page'),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 30,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(imageUrl),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xFF252525),
                    ),
                  ),
                  Text(
                    username,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: const Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF31CD7A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                minimumSize: const Size(66, 23),
              ),
              child: Text(
                'Accept',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}