// ignore_for_file: prefer_const_constructors, unused_import, sized_box_for_whitespace, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sindhu/tools/colors.dart';
import 'package:sindhu/widgets/beaches.dart';
import 'package:sindhu/widgets/info.dart';

Widget homescreen(Color white, Color black, BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 200,
              child: Lottie.network(
                'https://lottie.host/32327512-8c85-4570-8afa-8b51c1d6d7a2/nnQI575N7L.json',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
              child: TextField(
                style: GoogleFonts.montserrat(color: cyan, fontSize: 25),
                decoration: InputDecoration(
                  hintText: "SEARCH",
                  hintStyle:
                      GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
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
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.search, color: cyan),
                ),
                cursorColor: grey,
                onTap: () {
                  showSearch(context: context, 
                    delegate: CustomSearchDelegate(beaches),
                  );
                },
              ),
            ),
          ],
        ),
        
        Container(
          color: white,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'EXPLORE BEACHES',
                style: GoogleFonts.montserrat(
                  color: Colors.lightBlue[600],
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  letterSpacing: 2.5,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: white,
            child: 
            (MediaQuery.sizeOf(context).width < 600)
            ?
            ListView.builder(
              itemCount: beaches.length,
              itemBuilder: (context, index) {
                return beachContainer(context, beaches[index], white, black);
              },
            )
            :
            GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 4 / 1.5,
              ),
              itemCount: beaches.length,
              itemBuilder: (context, index) {
                return beachContainer(context, beaches[index], white, black);
              },
            )
          ),
        ),
      ],
    ),
  );
}

class CustomSearchDelegate extends SearchDelegate{

  final List<Beach> beaches;
  CustomSearchDelegate(this.beaches);

  @override


  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    if (query.isEmpty) {
      return Center(child: Text("PLEASE ENTER A SEARCH TERM", style: GoogleFonts.montserrat(),));
    }

    List<Beach> matchQuery = beaches
        .where((beach) => beach.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return matchQuery.isEmpty
        ? Center(child: Text("NO RESULTS FOUND", style: GoogleFonts.montserrat(),))
        : ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              var result = matchQuery[index];
              return ListTile(
                title: Text(result.name, style: GoogleFonts.montserrat(),),
                onTap: () {
                  close(context, null);
                  showDialog(
                    context: context,
                    builder: (context) => InfoDialog(beach: result, w: white, b: black),
                  );
                },
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
  if (query.isEmpty) return Container();
    List<Beach> matchQuery = beaches
        .where((beach) => beach.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return matchQuery.isEmpty
        ? Center(child: Text("NO RESULTS FOUND", style: GoogleFonts.montserrat(),))
        : ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              var result = matchQuery[index];
              return ListTile(
                title: Text(result.name, style: GoogleFonts.montserrat(),),
                onTap: () {
                  close(context, null);
                  showDialog(
                    context: context,
                    builder: (context) => InfoDialog(beach: result, w: white, b: black),
                  );
                },
              );
            },
          );
  }
}
