import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';

class MiniTvScreen extends StatefulWidget {
  const MiniTvScreen({super.key});

  @override
  State<MiniTvScreen> createState() => _MiniTvScreenState();
}

class _MiniTvScreenState extends State<MiniTvScreen> {
  final String apiKey =
      'https://developers.google.com/youtube/code_samples#youtube-data-api-v3';
  final List<String> channelIds = [
    'UCX6OQ3DkcsbYNE6H8uQQuVA', // MrBeast
    'UCE_M8A5yxnLfW0KghEeajjw', // Apple
    'UC-9-kyTW8ZkZNDHQJ6FgpwQ', // Music
  ];

  List<Map<String, dynamic>> channels = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchChannelData();
  }

  Future<void> fetchChannelData() async {
    List<Map<String, dynamic>> fetchedChannels = [];

    for (String id in channelIds) {
      final url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/channels?part=snippet,statistics&id=$id&key=$apiKey',
      );

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['items'] != null && data['items'].isNotEmpty) {
          final item = data['items'][0];
          fetchedChannels.add({
            'title': item['snippet']['title'],
            'thumbnail': item['snippet']['thumbnails']['high']['url'],
            'subscribers': item['statistics']['subscriberCount'],
            'videos': item['statistics']['videoCount'],
            'views': item['statistics']['viewCount'],
          });
        }
      }
    }

    setState(() {
      channels = fetchedChannels;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text(
          'Mini Tv',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: channels.length,
              itemBuilder: (context, index) {
                final channel = channels[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(channel['thumbnail']),
                      radius: 30,
                    ),
                    title: Text(channel['title'],
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    subtitle: Text(
                      '${channel['subscribers']} subscribers\n${channel['videos']} videos • ${channel['views']} views',
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
