// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, non_constant_identifier_names, avoid_print, empty_catches, use_build_context_synchronously, unused_import
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:sindhu/tools/colors.dart';
import 'package:sindhu/widgets/beaches.dart';
import 'package:sindhu/widgets/suitability.dart';

class InfoDialog extends StatefulWidget {

  final Beach beach;
  final Color w;
  final Color b;

  const InfoDialog({super.key, required this.beach, required this.w, required this.b});

  @override
  State<InfoDialog> createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {

  String temperature = "0";
  String windspeed = "0";
  String airq = "0";
  String swell = "0";
  String wave = "0";
  String uv = "0";

  Color? tempclr;

  void getData() async{
    Response t_w_res = await get(Uri.parse('https://api.open-meteo.com/v1/forecast?latitude='+ widget.beach.lat + '&longitude=' + widget.beach.lon + '&current=temperature_2m,wind_speed_10m'));
    Response s_w_res = await get(Uri.parse("https://marine-api.open-meteo.com/v1/marine?latitude=" + widget.beach.lat +"&longitude=" + widget.beach.lon + "&current=wave_height,swell_wave_height"));
    Response a_u_res = await get(Uri.parse("https://air-quality-api.open-meteo.com/v1/air-quality?latitude=" + widget.beach.lat + "&longitude=" + widget.beach.lon + "&current=us_aqi,uv_index"));
    Map t_w_data = jsonDecode(t_w_res.body);
    Map s_w_data = jsonDecode(s_w_res.body);
    Map a_u_data = jsonDecode(a_u_res.body);

    setState(() {
      temperature = t_w_data["current"]["temperature_2m"].toString();
      windspeed = t_w_data["current"]["wind_speed_10m"].toString();
      wave = s_w_data["current"]["wave_height"].toString();
      swell = s_w_data["current"]["swell_wave_height"].toString();
      airq = a_u_data["current"]["us_aqi"].toString();
      uv = a_u_data["current"]["uv_index"].toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: (MediaQuery.sizeOf(context).width > 600) 
      ? EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.30, right: MediaQuery.sizeOf(context).width * 0.30)
      : EdgeInsets.all(20),
    child: Container(
      decoration: BoxDecoration(
        color: widget.w,
        border: Border.all(color: grey),
        borderRadius: BorderRadius.circular(10)
      ),
      width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: MediaQuery.sizeOf(context).width > 600
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
            children: [
              Image.network(widget.beach.imgurl, fit: BoxFit.fitWidth,),
              SizedBox(height: 20),
              Text(
                widget.beach.name,
                style: GoogleFonts.montserrat(color: widget.b, fontWeight: FontWeight.w600, fontSize: 20,)
              ),
              Text(
                widget.beach.location,
                style: GoogleFonts.montserrat(color: widget.b, fontWeight: FontWeight.w300, fontSize: 19),
              ),
              
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: (MediaQuery.sizeOf(context).width > 600)
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: (widget.beach.isFav == true) 
                    ? Icon(Icons.favorite, color: Colors.redAccent[400], size: 30,)
                    : Icon(Icons.favorite_border, color: grey, size: 30,),
                    onTap: () {
                        setState(() {
                        if(widget.beach.isFav == false){
                          widget.beach.isFav = true;
                          favoritesList.add(widget.beach);
                        }
                        else{
                          widget.beach.isFav = false;
                          favoritesList.remove(widget.beach);
                        }
                      });
                    },
                  ), 
                  SizedBox(width: 10),
                  (widget.beach.isBlueFlag == true)
                  ? GestureDetector(
                    onTap: () {
                      showDialog(context: context, builder: 
                      (BuildContext context){
                        return AlertDialog(
                          title: Text('Blue flag beaches', style: TextStyle(color: cyan),),
                          content:  Text(
                          'The Blue Flag is a certification given to beaches by the Foundation for Environmental Education (FEE). A beach that has been awarded the blue flag means that it meets the organisations standards of environmental management. These standards are for water quality, safety, and public environmental education.',
                          style: TextStyle(color: white),
                          ),
                          backgroundColor: black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        );
                      });
                    },
                    child: Icon(Icons.flag, color: Colors.blue, size: 30,),
                  )
                  : SizedBox(width: 1, height: 0,)
                ],
              ),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('TEMPERATURE', style: GoogleFonts.montserrat(color: widget.b,),),SizedBox(height: 15,),
                        Text('WIND SPEED', style: GoogleFonts.montserrat(color: widget.b,),), SizedBox(height: 15,),
                        Text('AIR QUALITY', style: GoogleFonts.montserrat(color: widget.b,),), SizedBox(height: 15,),
                        Text('SWELL WAVE', style: GoogleFonts.montserrat(color: widget.b,),), SizedBox(height: 15,),
                        Text('WAVE HEIGHT', style: GoogleFonts.montserrat(color: widget.b,),), SizedBox(height: 15,),
                        Text('UV INDEX', style: GoogleFonts.montserrat(color: widget.b,),),
                      ],
                    ),
                    SizedBox(width: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Icon(Icons.thermostat, color: widget.b, size: 20,), SizedBox(height: 15,),
                        Icon(Icons.air, color: widget.b, size: 20,), SizedBox(height: 15,),
                        Icon(Icons.masks, color: widget.b, size: 20), SizedBox(height: 15,),
                        Icon(Icons.waves, color: widget.b, size: 20), SizedBox(height: 15,),
                        Icon(Icons.arrow_upward, color: widget.b, size: 20), SizedBox(height: 15,),
                        Icon(Icons.sunny, color: widget.b, size: 20), SizedBox(height: 15,)
                      ],
                    ),
                    SizedBox(width: 50),
                    (temperature == "0")?
                    CircularProgressIndicator(color: cyan,)
                    :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(temperature + "°C", style: GoogleFonts.montserrat(color: widget.b),),SizedBox(height: 15,),
                        Text(windspeed + " KMPH", style: GoogleFonts.montserrat(color: widget.b),), SizedBox(height: 15,),
                        Text(airq, style: GoogleFonts.montserrat(color: widget.b),), SizedBox(height: 15,),
                        Text(swell + " m", style: GoogleFonts.montserrat(color: widget.b),), SizedBox(height: 15,),
                        Text(wave + " m", style: GoogleFonts.montserrat(color: widget.b),), SizedBox(height: 15,),
                        Text(uv, style: GoogleFonts.montserrat(color: widget.b),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text( 'BEACH REPORT', style: GoogleFonts.montserrat(color: black, fontSize: 25, fontWeight: FontWeight.w600),),
              SizedBox(height:15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('TEMPERATURE', style: GoogleFonts.montserrat(color: widget.b,),),SizedBox(height: 15,),
                          Text('WIND SPEED', style: GoogleFonts.montserrat(color: widget.b,),), SizedBox(height: 15,),
                          Text('AIR QUALITY', style: GoogleFonts.montserrat(color: widget.b,),), SizedBox(height: 15,),
                          Text('SWELL WAVE', style: GoogleFonts.montserrat(color: widget.b,),), SizedBox(height: 15,),
                          Text('WAVE HEIGHT', style: GoogleFonts.montserrat(color: widget.b,),), SizedBox(height: 15,),
                          Text('UV INDEX', style: GoogleFonts.montserrat(color: widget.b,),),
                        ],
                      ),
                      SizedBox(width: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                           () {
                             double temp = double.parse(temperature);
                              if (temp < 22) {
                                tempclr = Colors.lightBlue;
                                return 'COOL';
                              } else if (temp >= 22 && temp <= 30) {
                                tempclr = Colors.yellow.shade700;
                                return 'NORMAL';
                              } else {
                                tempclr = Colors.red;
                                return 'HOT';
                              }
                            }(), style: GoogleFonts.montserrat(color: tempclr, fontWeight: FontWeight.w600),
                          ),SizedBox(height: 15,),
                          Text(
                            (){
                              double temp = double.parse(windspeed);
                              if(temp < 10){
                                tempclr = Colors.lightBlue;
                                return 'CALM';
                              }
                              else if(temp >= 10 && temp <=30){
                                tempclr = Colors.yellow.shade700;
                                return 'NORMAL';
                              }
                              else{
                                tempclr = Colors.red;
                                return 'STRONG';
                              }
                            }(), style: GoogleFonts.montserrat(color: tempclr, fontWeight: FontWeight.w600),), SizedBox(height: 15,),
                          Text((){
                            double temp = double.parse(airq);
                            if(temp < 50){
                              tempclr = Colors.lightGreen;
                              return "GOOD";
                            }
                            else if(temp >= 50 && temp <100){
                              tempclr = Colors.green;
                              return "SATISFACTORY";
                            }
                            else if(temp >= 100 && temp < 200){
                              tempclr = Colors.orange;
                              return "MODERATE";
                            }
                            else if(temp >= 200 && temp < 300){
                              tempclr = Colors.red;
                              return "POOR";
                            }
                            else{
                              tempclr = Colors.deepPurpleAccent;
                              return "HAZARDOUS";
                            }
                          }(), style: GoogleFonts.montserrat(color: tempclr, fontWeight: FontWeight.w600),), SizedBox(height: 15,),
                          Text((){
                            double temp = double.parse(swell);
                            if(temp < 1){
                              tempclr = Colors.lightBlue;
                              return "CALM";
                            }
                            else if(temp >= 1 && temp < 2.5){
                              tempclr = Colors.orange;
                              return "MODERATE";
                            }
                            else if(temp >= 2.5 && temp < 4.5){
                              tempclr = Colors.red;
                              return "ROUGH";
                            }
                            else{
                              tempclr = Colors.deepPurpleAccent;
                              return "HAZARDOUS";
                            }
                          }(),style: GoogleFonts.montserrat(color: tempclr, fontWeight: FontWeight.w600),), SizedBox(height: 15,),
                          Text((){
                            double temp = double.parse(wave);
                            if(temp < 0.5){
                              tempclr = Colors.lightBlue;
                              return "CALM";
                            }
                            else if(temp >= 0.5 && temp < 1.5){
                              tempclr = Colors.orange;
                              return "MODERATE";
                            }
                            else if(temp >= 1.5 && temp < 3.5){
                              tempclr = Colors.red;
                              return "ROUGH";
                            }
                            else {
                              tempclr = Colors.deepPurpleAccent;
                              return "HAZARDOUS";
                            }
                          }(), style: GoogleFonts.montserrat(color: tempclr, fontWeight: FontWeight.w600),), SizedBox(height: 15,),
                          Text((){
                            double temp = double.parse(uv);
                            if(temp < 2){
                              tempclr = Colors.lightGreen;
                              return 'LOW';
                            }
                            else if(temp >= 2 && temp < 5 ){
                              tempclr = Colors.lightBlue;
                              return "MODERATE";
                            }
                            else if(temp >= 5 && temp < 7){
                              tempclr = Colors.orange;
                              return "HIGH";
                            }
                            else if(temp >= 7 && temp < 10){
                              tempclr = Colors.red;
                              return "VERY HIGH";
                            }
                            else{
                              tempclr = Colors.deepPurpleAccent;
                              return "EXTREME";
                            }
                          }(), style: GoogleFonts.montserrat(color: tempclr, fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ],
                  ),
              ),
              SizedBox(height: 35),
              suitability(context, wave, swell, windspeed, 'SWIMMING', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNwhqyjTTVrmCJiT4MZ1PhmU0Cb0qwmvqrvQ&s'),
              SizedBox(height: 20),
              suitability(context, wave, swell, windspeed, 'SURFING', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs2d4_f8s6jcovDRZTE-EPZKvdheNbCOYxsg&s'),
              SizedBox(height: 20,),
              suitability(context, wave, windspeed, '', 'KAYAKING', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4PxnOMzn4Fr0A61oJlpfd4DVUlAC9_L1vsw&s'),
              SizedBox(height: 20),
              suitability(context, windspeed, '', '', 'PARAGLIDING', 'https://images.stockcake.com/public/f/a/8/fa825bbc-c88a-4a27-959b-5ed667b82c8b_large/paragliding-over-bay-stockcake.jpg'),
              SizedBox(height: 20),
              suitability(context, uv, temperature, '', 'SUNBATHING', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-lhwj3-IL4YIE3OvdCH1jxEQicsT7Rgmnng&s'),
              SizedBox(height: 20),
              suitability(context, windspeed, wave, '', 'FISHING', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSELEOzHGzBf6xUZ39k49Rc0liOssVxidIlDQ&s'),
              SizedBox(height: 20,),
              suitability(context, uv, airq, '', 'MEDITATION', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYiRd1ytgLH71UA_H0IaK_suTP6Os2uHkm1g&s'),
              SizedBox(height: 20),
              suitability(context, wave, swell, windspeed, 'SCUBA DIVING', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0NGv2-vwUa1bq36aXTnJxPLdp6-9jF-wcaw&s'),
              
            ],
          ),
        ),
      ),
    ),
  );
  }
}
