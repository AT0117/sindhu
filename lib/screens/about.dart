// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sindhu/tools/colors.dart';

Widget about(Color white, Color black, BuildContext context){
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(50,50,50,50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Lottie.network('https://lottie.host/cda65aba-2128-4ac3-85ca-36da919fa912/vXYoe3Ye47.json'),
          SizedBox(height: 30),
          Text(
            'ABOUT SINDHU',
            style: GoogleFonts.montserrat(
              color: cyan,
              fontSize: 20, 
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Sindhu is a cross platform application that helps its users to search and determine the suitability of various beaches across India.'
            ' This includes checking weather suitability, swell waves and sea tides suitability, etc.'
            ' If users wish to know whether they can enjoy recreational activities like surfing, fishing, etc.'
            ' they can make their decision based on the real time oceanic data.'
            ' Users can also register/login an account through which they can add their favorite beaches and stay alerted over potential risks.',
            style: GoogleFonts.montserrat(
              color: black, 
              fontSize: 15, 
              fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 20),
           Text(
            'DEVELOPED BY',
            style: GoogleFonts.montserrat(
              color: cyan,
              fontSize: 20, 
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 75,
                   backgroundColor: grey,
                    child: Text('ATHARVA\nTHAKARE', style: GoogleFonts.montserrat(color: white, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundColor: grey,
                    child: Text('ADITYA\nBURKUL', style: GoogleFonts.montserrat(color: white, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundColor: grey,
                    child: Text('ARYAN\nGARUD', style: GoogleFonts.montserrat(color: white, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundColor: grey,
                    child: Text('PRATHMESH\nZEND', style: GoogleFonts.montserrat(color: white, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ) 
        ],
      ),
    ),
  );
}