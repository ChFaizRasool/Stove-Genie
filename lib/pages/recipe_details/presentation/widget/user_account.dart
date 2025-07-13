import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserAccountWidget extends StatelessWidget {
  final String userId;

  const UserAccountWidget({super.key, required this.userId});

  Future<Map<String, dynamic>?> getUserDetails() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.data();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: getUserDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Text("User not found"),
          );
        }

        final user = snapshot.data!;
        return userAccount(
          context,
          user['photoUrl'] ?? '',
          user['name'] ?? '',
          user['location'] ?? 'Unknown',
        );
      },
    );
  }
}

Widget userAccount(
    BuildContext context, String imgPath, String name, String loc) {
  return SizedBox(
    width: getWidth(context) * 0.9,
    child: Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: imgPath.isNotEmpty
              ? NetworkImage(imgPath)
              : const AssetImage('assets/images/profile.png') as ImageProvider,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            Row(
              children: [
                const Icon(Icons.location_on_rounded,
                    size: 15, color: Color(0xffFFA307)),
                Text(loc,
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffa9a9a9)))
              ],
            )
          ],
        ),
        const Spacer(),
        Container(
          width: 85,
          height: 37,
          decoration: BoxDecoration(
              color: const Color(0xffFFA307),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text('Follow',
                style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
          ),
        )
      ],
    ),
  );
}
