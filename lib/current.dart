// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, curly_braces_in_flow_control_structures, unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sindhu/screens/about.dart';
import 'package:sindhu/screens/favorites.dart';
import 'package:sindhu/screens/guidelines.dart';
import 'package:sindhu/screens/homescreen.dart';
import 'package:sindhu/tools/colors.dart';

Widget? content;



class CurrentPage extends StatefulWidget {
  const CurrentPage({super.key});

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {

  IconData appearance_mode = Icons.dark_mode_outlined;
  String appearance_text = "DARK MODE";
  int defState = 4;

  @override
  Widget build(BuildContext context) {

    if(defState == 1){
      content = guidelinesPage();
    }
    
    else if(defState == 2)content = favorites(white, black);
    
    else if(defState == 3)content = about(white, black, context);
    
    else if(defState == 4)content = homescreen(white, black, context);

    return Scaffold(
      backgroundColor: white,
      body: content,
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: black,
        elevation: 2.5,
        shape:  
        MediaQuery.sizeOf(context).width < 600
        ?
        CircularNotchedRectangle()
        :
        null,
        color: 
        MediaQuery.sizeOf(context).width < 600
        ? cyan : Colors.transparent,
        notchMargin: 2.5,
        height: MediaQuery.sizeOf(context).height * 0.080,
        child: Row(
          mainAxisAlignment:
           MediaQuery.sizeOf(context).width < 600 ?
           MainAxisAlignment.spaceEvenly
           :
           MainAxisAlignment.spaceAround,
          children: [

            //GUIDELINES
            MediaQuery.sizeOf(context).width < 600
            ?
            IconButton(
              onPressed: () {setState(() {
                defState = 1;
              });},
              icon:  defState == 1? Icon(Icons.book,) : Icon(Icons.book_outlined,),
            )
            :
            TextButton(
              child: Text('GUIDELINES', style: GoogleFonts.montserrat(color: black, fontWeight: FontWeight.w600),),
              onPressed: () {
                setState(() {
                defState = 1;
                });
              },
            ),

            //FAVORITE
            MediaQuery.sizeOf(context).width < 600
            ?
            IconButton(
              onPressed: () {setState(() {
                defState = 2;
              });},
              icon:  defState == 2? Icon(Icons.favorite,) : Icon(Icons.favorite_border,),
            )
            :
            TextButton(
              child: Text('FAVORITES', style: GoogleFonts.montserrat(color: black, fontWeight: FontWeight.w600),),
              onPressed: () {
                setState(() {
                defState = 2;
                });
              },
            ),

            //INFO
            MediaQuery.sizeOf(context).width < 600
            ?
            IconButton(
              onPressed: () {setState(() {
                defState = 3;
              });},
              icon:  defState == 3? Icon(Icons.info,) : Icon(Icons.info_outline,),
            )
            :
           TextButton(
              child: Text('INFO', style: GoogleFonts.montserrat(color: black, fontWeight: FontWeight.w600),),
              onPressed: () {
                setState(() {
                defState = 3;
                });
              },
            ),

            //APPEARANCE
            MediaQuery.sizeOf(context).width < 600
            ?
            IconButton(
              onPressed: () {setState(() {

               if(appearance_mode == Icons.light_mode_outlined) {
                  appearance_mode = Icons.dark_mode_outlined;
                  white = Colors.white;
                  black = Colors.black87;
                } 
                else if(appearance_mode == Icons.dark_mode_outlined) {
                   appearance_mode = Icons.light_mode_outlined;
                   white = Colors.black87;
                   black = Colors.white;
                }
              });},
              icon: Icon(appearance_mode),
            )
            :
            TextButton(
              child: Text(appearance_text, style: GoogleFonts.montserrat(color: black, fontWeight: FontWeight.w600),),
              onPressed: () {
                if(appearance_text == "LIGHT MODE") {
                  setState(() {
                    appearance_text = "DARK MODE";
                    white = Colors.white;
                    black = Colors.black87;
                  });
                } 
                else if(appearance_text == "DARK MODE") {
                  setState(() {
                    appearance_text = "LIGHT MODE";
                    white = Colors.black87;
                    black = Colors.white;
                    
                  });
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: 
      FloatingActionButton(
        onPressed: () {
          setState(() {
            defState = 4;
          });
        },
        elevation: 0, hoverElevation: 0, focusElevation: 0, highlightElevation: 0, disabledElevation: 0,
        backgroundColor: Colors.transparent, focusColor: Colors.transparent, hoverColor: Colors.transparent,
        child: Image.asset('assets/sindhu-transparent.png'),
      ),
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.centerDocked
    );
  }
}