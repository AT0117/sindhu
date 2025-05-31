// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sindhu/widgets/beaches.dart';

Widget favorites(Color white, Color black){ 
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 30),
        child: Text('FAVORITES', style: GoogleFonts.montserrat(
          color: Colors.lightBlue[600],
          fontWeight: FontWeight.w500,
          fontSize: 25,
          letterSpacing: 2.5,
        ),),
      ),
      if (favoritesList.isEmpty) 
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text('NO BEACHES IN FAVORITE LIST', style: GoogleFonts.montserrat(
          color: black,
          fontSize: 20,
        ),),
      ) else Expanded(
        child: ListView.builder(
          itemCount: favoritesList.length,
          itemBuilder: (context, index) {
            return beachContainer(context, favoritesList[index], white, black);
          },
        ),
      ),
    ],
  );
}
