// ignore_for_file: unused_import, prefer_const_constructors, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sindhu/tools/colors.dart';
import 'package:sindhu/widgets/beaches.dart';

Widget suitability(BuildContext context, String param1, String param2, String param3, String aname, String aurl){
  return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: grey, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 100, width: MediaQuery.sizeOf(context).width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(aurl, width: 120, height: 120, fit: BoxFit.fill,),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(aname, style: GoogleFonts.montserrat(color: black, fontWeight: FontWeight.bold),),

                if (aname == "SWIMMING") 
                showIcons(Icon(Icons.waves, color: black,), Icon(Icons.arrow_upward, color: black,), Icon(Icons.air, color: black,))
                else if (aname == "SURFING") 
                  showIcons(Icon(Icons.waves, color: black,), Icon(Icons.arrow_upward, color: black,), Icon(Icons.air, color: black,))
                else if (aname == "KAYAKING") 
                  showIcons(Icon(Icons.waves, color: black,), Icon(Icons.air, color: black,), SizedBox())
                else if (aname == "PARAGLIDING") 
                  showIcons(Icon(Icons.air, color: black,), SizedBox(), SizedBox())
                else if (aname == "SUNBATHING") 
                  showIcons(Icon(Icons.sunny, color: black,), Icon(Icons.thermostat, color: black,), SizedBox())
                else if (aname == "FISHING") 
                  showIcons(Icon(Icons.air, color: black,), Icon(Icons.arrow_upward, color: black,), SizedBox())
                else if (aname == "MEDITATION") 
                  showIcons(Icon(Icons.masks, color: black,), Icon(Icons.sunny, color: black,), SizedBox())
                else if (aname == "SCUBA DIVING") 
                  showIcons(Icon(Icons.waves, color: black,), Icon(Icons.arrow_upward, color: black,), SizedBox()),

                  Text(                  
                    getSuitability(aname, param1, param2, param3),
                    style: GoogleFonts.montserrat(color: 
                    (){
                      if(getSuitability(aname, param1, param2, param3) == 'SUITABLE'){
                        return Colors.lightGreen;
                      }
                      else if(getSuitability(aname, param1, param2, param3) == 'CAUTION REQUIRED'){
                        return Colors.yellow.shade700;
                      }
                      else if(getSuitability(aname, param1, param2, param3) == 'NOT RECOMMENDED'){
                        return Colors.red;
                      }
                    }()
                    , fontWeight: FontWeight.w600),)
                ],
              ),
            )
          ],
        ),
      ),
    );
}


String getSuitability(String aname, String aparam1, String aparam2, String aparam3) {
  switch (aname) {
    case 'SWIMMING':
      double awave = double.parse(aparam1);
      double aswell = double.parse(aparam2);
      double awind = double.parse(aparam3);

      if (awave < 1.0 && aswell < 1.5 && awind < 20) {
        return 'SUITABLE';
      } else if (awave < 2.0 && aswell < 2.5 && awind < 30) {
        return 'CAUTION REQUIRED';
      } else {
        return 'NOT RECOMMENDED';
      }

    case 'SURFING':
      double awave = double.parse(aparam1);
      double aswell = double.parse(aparam2);
      double awind = double.parse(aparam3);

      if (awave >= 1.0 && awave <= 2.5 && aswell < 3.0 && awind < 30) {
        return 'SUITABLE';
      } else if (awave > 2.5 && awave <= 3.5 && aswell < 4.0 && awind < 40) {
        return 'CAUTION REQUIRED';
      } else {
        return 'NOT RECOMMENDED';
      }

    case 'KAYAKING':
      double awave = double.parse(aparam1);
      double awind = double.parse(aparam2);

      if (awave < 1.0 && awind < 20) {
        return 'SUITABLE';
      } else if (awave < 2.0 && awind < 30) {
        return 'CAUTION REQUIRED';
      } else {
        return 'NOT RECOMMENDED';
      }

    case 'PARAGLIDING':
      double awind = double.parse(aparam1);

      if (awind >= 15 && awind <= 30) {
        return 'SUITABLE';
      } else if (awind > 30 && awind <= 40) {
        return 'CAUTION REQUIRED';
      } else {
        return 'NOT RECOMMENDED';
      }

    case 'SUNBATHING':
      double auv = double.parse(aparam1);
      double atemp = double.parse(aparam2);

      if ( auv >=2 && auv < 6 && atemp >= 22 && atemp <= 32) {
        return 'SUITABLE';
      } else if (auv < 8 && atemp >= 32 && atemp <= 38) {
        return 'CAUTION REQUIRED';
      } else {
        return 'NOT RECOMMENDED';
      }

    case 'FISHING':
      double awind = double.parse(aparam1);
      double awave = double.parse(aparam2);

      if (awind < 20 && awave < 1.0) {
        return 'SUITABLE';
      } else if (awind < 30 && awave < 2.0) {
        return 'CAUTION REQUIRED';
      } else {
        return 'NOT RECOMMENDED';
      }

    case 'MEDITATION':
      double auv = double.parse(aparam1);
      double aairq = double.parse(aparam2);

      if (auv < 6 && aairq < 100) {
        return 'SUITABLE';
      } else if (auv < 8 && aairq < 150) {
        return 'CAUTION REQUIRED';
      } else {
        return 'NOT RECOMMENDED';
      }

    case 'SCUBA DIVING':
      double awave = double.parse(aparam1);
      double aswell = double.parse(aparam2);
      double awind = double.parse(aparam3);

      if (awave < 1.0 && aswell < 1.5 && awind < 20) {
        return 'SUITABLE';
      } else if (awave < 2.0 && aswell < 2.5 && awind < 30) {
        return 'CAUTION REQUIRED';
      } else {
        return 'NOT RECOMMENDED';
      }

    default:
      return 'NO DATA AVAILABLE';
  }
}

Widget showIcons(Widget i1, Widget i2, Widget i3){
  return Row(
    children: [
      i1,
      SizedBox(width: 5),
      i2,
      SizedBox(width: 5),
      i3,
    ],
  );
}