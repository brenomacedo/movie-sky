import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndSub extends StatelessWidget {

  final String title;
  final String subtitle;

  const TitleAndSub({ Key? key, required this.title, required this.subtitle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ), textAlign: TextAlign.center),
        SizedBox(height: 5),
        Text(subtitle, style: GoogleFonts.ubuntu(
          color: Colors.grey[700],
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ), textAlign: TextAlign.center),
      ],
    );
  }
}