// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_import, sized_box_for_whitespace, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, empty_catches, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sindhu/current.dart';
import 'package:sindhu/tools/colors.dart';

class AccountScreen extends StatefulWidget {
  final Color white;
  final Color black;

  const AccountScreen({
    super.key,
    required this.white,
    required this.black,
  });

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50,80,50,50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'SIGN IN OR REGISTER',
                style: GoogleFonts.montserrat(color: widget.black,fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Enter your email address and password to sign in / register to this application.',
                style: GoogleFonts.montserrat(color: widget.black, fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          SizedBox(height: 40),
          Padding(
                padding: 
                (MediaQuery.sizeOf(context).width > 600)?
                EdgeInsets.fromLTRB(40, 20, 40, 20)
                :
                EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextField(
                  style: GoogleFonts.montserrat(color: widget.black, fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "MAIL",
                    hintStyle:
                        GoogleFonts.montserrat(color: widget.black, fontSize: 20, fontWeight: FontWeight.w300),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: widget.black),
                    ),
                    prefixIcon: Icon(Icons.mail_outline, color: cyan),
                  ),
                  cursorColor: grey,
                ),
              ),
          Padding(
                padding: 
                (MediaQuery.sizeOf(context).width > 600)
                ?
                EdgeInsets.fromLTRB(40, 10, 40, 20)
                :
                EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextField(
                  obscureText: true,
                  style: GoogleFonts.montserrat(color: widget.black, fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "PASSWORD",
                    hintStyle:
                        GoogleFonts.montserrat(color: widget.black, fontSize: 20, fontWeight: FontWeight.w300),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: widget.black),
                    ),
                    prefixIcon: Icon(Icons.lock_outline, color: cyan),
                  ),
                  cursorColor: grey,
                ),
              ),
          SizedBox(height: 20),
          TextButton(onPressed: (){

          }, 
          child: Text('VERIFY', style: GoogleFonts.montserrat(color: cyan, fontSize: 20, fontWeight: FontWeight.w400),)
        ),
          SizedBox(height: 30),
          Align(alignment: Alignment.center,child: Lottie.network('https://lottie.host/6d253af6-d352-424e-9a98-00c00f8eeffc/1pqKI7yDpW.json', width: 300, height: 300))
        ]
        ),
      ),
    );
  }
}
