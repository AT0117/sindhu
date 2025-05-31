// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sindhu/tools/colors.dart';

Widget guidelinesPage(){

  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.fromLTRB(30, 70, 30, 10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Text(
              'BEACH SAFETY GUIDELINES',
              style: GoogleFonts.montserrat(
                color: cyan,
                fontSize: 20, 
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 35,),
            Lottie.network('https://lottie.host/e67eaebd-df37-4e87-9163-a2502c3a3348/fJlILYCPHs.json', width: 300, height: 300),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Check the weather forecast before you head out',
                style: GoogleFonts.montserrat(
                  color: grey,
                  fontSize: 15, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'This will help you prepare for any potential hazards, such as thunderstorms or high winds. It’s important to know the weather conditions before heading to the beach so you can dress appropriately and be prepared for any unexpected changes in the weather. This also includes checking for any storm warnings or advisories, as well as high tide and rip current warnings. It’s also important to pay attention to the UV index to make sure you’re protecting yourself from harmful UV rays.',
                style: GoogleFonts.montserrat(
                  color: black,
                  fontSize: 14, 
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Always swim in designated areas that are supervised by lifeguards',
                style: GoogleFonts.montserrat(
                  color: grey,
                  fontSize: 15, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Even the strongest swimmers can get caught in a rip current, so it’s important to have someone on duty to watch out for you. Lifeguards are trained professionals who are there to ensure your safety. They are trained to spot potential hazards and know how to respond in case of an emergency. They also keep an eye out for potential rip currents and other dangerous conditions. It’s important to follow their instructions and stay within the designated swimming area. If you’re unsure about the conditions or have any questions, don’t hesitate to ask a lifeguard for advice.',
                style: GoogleFonts.montserrat(
                  color: black,
                  fontSize: 14, 
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Never swim alone',
                style: GoogleFonts.montserrat(
                  color: grey,
                  fontSize: 15, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'It’s always a good idea to have a buddy with you in case of an emergency. Having a swimming partner with you can provide an extra level of safety, especially if you’re not a strong swimmer. If you’re swimming in the ocean, it’s important to have someone with you to keep an eye out for any potential hazards and to help you if you get caught in a rip current or other dangerous situation. It’s also helpful to have someone with you to keep an eye on your belongings and to watch over your children.',
                style: GoogleFonts.montserrat(
                  color: black,
                  fontSize: 14, 
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Keep an eye on the tide',
                style: GoogleFonts.montserrat(
                  color: grey,
                  fontSize: 15, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'If you’re swimming in the ocean, it’s important to pay attention to the tide and make sure you’re not caught in a dangerous situation. Tides can change quickly and unexpectedly, so it’s important to be aware of the tide schedule and to keep an eye on the water level. As the tide comes in, it can create strong currents and make swimming more difficult. It’s also important to be aware of the tide when walking along the beach as the tide can come in faster than you expect, and you don’t want to be caught in a dangerous situation.',
                style: GoogleFonts.montserrat(
                  color: black,
                  fontSize: 14, 
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Be aware of your surroundings',
                style: GoogleFonts.montserrat(
                  color: grey,
                  fontSize: 15, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Keep an eye out for any potential hazards, such as rocks or debris, and avoid swimming near them. The beach can be a fun and relaxing place, but it’s important to stay alert and aware of your surroundings. Keep an eye out for any potential hazards, such as rocks or debris, and avoid swimming near them. It’s also important to be aware of the other people around you and to keep an eye on your children at all times.',
                style: GoogleFonts.montserrat(
                  color: black,
                  fontSize: 14, 
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Wear sunscreen',
                style: GoogleFonts.montserrat(
                  color: grey,
                  fontSize: 15, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Sunburn can be dangerous and can also lead to skin cancer. Sunscreen is essential for protecting yourself from the sun’s harmful rays. Make sure to apply sunscreen with at least SPF 30, and be sure to reapply every 2 hours, or after swimming or sweating. Also, don’t forget to protect your lips and ears with lip balm and a hat or earplugs.',
                style: GoogleFonts.montserrat(
                  color: black,
                  fontSize: 14, 
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Bring a beach umbrella or beach tent',
                style: GoogleFonts.montserrat(
                  color: grey,
                  fontSize: 15, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'These will provide you with shade and protection from the sun’s harmful rays. Even on a cloudy day, UV rays can still be dangerous. It’s important to protect yourself from the sun’s rays, and a beach umbrella or beach tent can provide you with much-needed shade. Make sure to set up your umbrella or tent in a spot that will provide the most protection from the sun, and make sure to take breaks from the sun to avoid heat exhaustion or heat stroke.',
                style: GoogleFonts.montserrat(
                  color: black,
                  fontSize: 14, 
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Bring enough water to drink',
                style: GoogleFonts.montserrat(
                  color: grey,
                  fontSize: 15, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Dehydration can be dangerous, especially on a hot day at the beach. The sun, sand, and water can all dehydrate you quickly, so it’s important to drink plenty of water throughout the day. Bring a refillable water bottle with you, and make sure to drink water regularly, even if you don’t feel thirsty. It’s also a good idea to bring snacks that are high in water content, such as fruits or vegetables, to help keep you hydrated.',
                style: GoogleFonts.montserrat(
                  color: black,
                  fontSize: 14, 
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Bring a first aid kit',
                style: GoogleFonts.montserrat(
                  color: grey,
                  fontSize: 15, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'You never know when you might need it, and it’s better to be safe than sorry. A first aid kit is an essential item to bring to the beach. Make sure your kit includes essentials such as bandages, antiseptic cream, and pain relievers. It’s also a good idea to include any personal medications you may need, such as an inhaler or epipen. By being prepared, you’ll be able to handle any minor injuries or illnesses quickly and easily.',
                style: GoogleFonts.montserrat(
                  color: black,
                  fontSize: 14, 
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Always call for help if you or someone else is in danger',
                style: GoogleFonts.montserrat(
                  color: grey,
                  fontSize: 15, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Don’t hesitate to call for assistance if you need it. Safety should always be your top priority. If you or someone else is in danger, don’t hesitate to call for help. Know the emergency number of the area you’re in and locate the nearest emergency phone or lifeguard tower. In case of emergency, it’s important to stay calm and follow the instructions of the emergency personnel. Remember that the most important thing is to get help as soon as possible.',
                style: GoogleFonts.montserrat(
                  color: black,
                  fontSize: 14, 
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    ),
  );
}