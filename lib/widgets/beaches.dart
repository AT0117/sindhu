// ignore_for_file: prefer_const_constructors, prefer_adjacent_string_concatenation
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sindhu/tools/colors.dart';
import 'package:sindhu/widgets/info.dart';

Widget beachContainer(BuildContext context, Beach beach, Color white, Color black) =>  Padding(
  padding:EdgeInsets.fromLTRB(30,20,30,20),
  child: GestureDetector(
    onTap: () {
      showDialog(context: context, builder: (context) => InfoDialog(beach: beach, w: white, b: black));
    },
    child: Container(
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
            Image.network(beach.imgurl, width: 120, height: 120, fit: BoxFit.fill,),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(beach.name, style: GoogleFonts.montserrat(color: black, fontWeight: FontWeight.bold),),
                  Text(beach.location, style: GoogleFonts.montserrat(color: black,),),
                  Text(beach.cord, style: GoogleFonts.montserrat(color: black),)
                ],
              ),
            )
          ],
        ),
      ),
    ),
  ),
);

class Beach{
  Beach(this.imgurl, this.name, this.location, this.cord, this.lat, this.lon,this.isBlueFlag);
  String imgurl;
  String name;
  String location;
  String cord;
  String lat;
  String lon;
  bool isFav = false;
  bool isBlueFlag;
}

List<Beach> favoritesList = [];

List<Beach> beaches = [
  Beach(
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Puri_Sea_Beach_viewed_from_the_light_house.jpg/450px-Puri_Sea_Beach_viewed_from_the_light_house.jpg', 
  'PURI BEACH', 
  'PURI, ODISHA', 
  '19.81°N 85.83°E',
  '19.81',
  '85.83',
  true
  ),

  Beach(
  'https://upload.wikimedia.org/wikipedia/commons/0/09/Aerial_view_of_Rushikonda_beach.jpg',
  'RUSHIKONDA BEACH', 
  'VISHAKHAPATNAM, ANDHRA P.', 
  '17.7825201°N 83.3851154°E',
  '17.7825201',
  '83.3851154',
  true
  ),

  Beach(
    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Covelong_beach.jpg/375px-Covelong_beach.jpg', 
    'COVELONG BEACH', 
    'COVELONG, CHENNAI', 
    '12.7925°N 80.2530°E',
    '12.7925',
    '80.2530',
    true
    ),

  Beach(
    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/A_Beach_at_GanapatiPule.jpg/375px-A_Beach_at_GanapatiPule.jpg', 
    'GANPATIPULE BEACH', 
    'RATNAGIRI, MAHARASHTRA', 
    '17.1448°N 73.2666°E',
    '17.1448',
    '73.2666',
    false
    ),

  Beach(
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Alibag_Sea_beach_3%2C_Maharashtra.JPG/375px-Alibag_Sea_beach_3%2C_Maharashtra.JPG', 
    'ALIBAUG BEACH', 
    'RAIGAD, MAHARASHTRA', 
    '18.64°N 72.88°E',
    '18.64',
    '72.88',
    false
    ),

  Beach(
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Miramar_24022016.jpg/330px-Miramar_24022016.jpg', 
    'MIRAMAR BEACH', 
    'PANAJI, GOA', 
    '15.4775° N, 73.8121° E',
    '15.4775',
    '73.8121',
    false
    ),

    Beach(
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Dumasbeach1.jpg/375px-Dumasbeach1.jpg', 
    'DUMAS BEACH', 
    'SURAT, GUJARAT', 
    '21°04′45″N 72°42′55″E',
    '21.079167',
    '72.715278',
    false
    ),
    
    Beach(
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Aksa_Beach_afternoon.jpg/375px-Aksa_Beach_afternoon.jpg', 
    'AKSA BEACH', 
    'MUMBAI, MAHARASHTRA', 
    '19.1760°N 72.7954°E',
    '19.176',
    '72.7954',
    false
    ),

    Beach(
    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Sunset_at_Agonda_Beach.jpg/330px-Sunset_at_Agonda_Beach.jpg', 
    'AGONDA BEACH', 
    'AGONDA, GOA', 
    '15.04030°N 73.98648°E',
    '15.04030',
    '73.98648',
    false
    ),

    Beach(
    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Heading_for_a_new_journey_at_Tagore_Beach.JPG/300px-Heading_for_a_new_journey_at_Tagore_Beach.JPG', 
    'KARWAR BEACH', 
    'KARWAR, KARNATAKA', 
    '14.80°N 74.13°E',
    '14.80',
    '74.13',
    false
    ),
    
    Beach(
    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Chavakkad1.jpg/450px-Chavakkad1.jpg', 
    'CHAVVAKAD BEACH', 
    'THRISSUR, KERALA', 
    '10.5722°N 76.0081°E',
    '10.5722',
    '76.0081',
    false
    ),

    Beach(
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Henrys_Island.jpg/330px-Henrys_Island.jpg', 
    'HENRY ISLAND BEACH', 
    'BAKKHALI, WEST BENGAL', 
    '21.5769°N 88.2923°E',
    '21.5769',
    '88.2923',
    false
    ),

    Beach(
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Talsari_1.jpg/330px-Talsari_1.jpg', 
    'TALASARI BEACH', 
    'BALESWAR, ODISHA', 
    '21° 37′ 22.67″ N, 87° 24′ 21.07″ E',
    '21.622964',
    '87.405853',
    false
    ),

    Beach(
    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Baruva_Pillar.jpg/375px-Baruva_Pillar.jpg', 
    'BARUVA BEACH', 
    'BARUVA, ANDHRA PRADESH', 
    '18.881531°N 84.596289°E',
    '18.881531',
    '84.596289',
    false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Pondicherry-Rock_beach_aerial_view.jpg/330px-Pondicherry-Rock_beach_aerial_view.jpg',
      'PROMENADE BEACH',
      'PONDICHERRY, INDIA',
      '11°55′57″N 79°50′9″E',
      '11.9325',
      '79.835833',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Radha_Nagar_beach%2C_Havelock_Island%2C_Andamn%2C_India-_Sun_set_view.jpg/375px-Radha_Nagar_beach%2C_Havelock_Island%2C_Andamn%2C_India-_Sun_set_view.jpg',
      'RADHANAGAR BEACH',
      'HAVELOCK ISLANDS, ANDAMAN AND NICOBAR',
      '11.9820°N 92.9640°E',
      '11.9820',
      '92.9640',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Suvali_Beach.JPG/375px-Suvali_Beach.JPG',
      'SUVALI BEACH',
      'SURAT, GUJARAT',
      '21°09′43.4″N 72°38′28″E',
      '21.162056',
      '72.641111',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Fishing_in_Gorai_Beach%2C_Mumbai.jpg/375px-Fishing_in_Gorai_Beach%2C_Mumbai.jpg',
      'GORAI BEACH',
      'MUMBAI, MAHARASHTRA',
      '19°14′27″N 72°46′55″E',
      '19.240833',
      '72.781944',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/20191211_Benaulim_4885.jpg/375px-20191211_Benaulim_4885.jpg',
      'BENAULIM BEACH',
      'SOUTH GOA',
      '15.25°N 73.92°E',
      '15.25',
      '73.92',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Delight_india.jpg/375px-Delight_india.jpg',
      'KUDLE BEACH',
      'GOKARNA, KARNATAKA',
      '14.55°N 74.31667°E',
      '14.55',
      '74.31667',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Sunrise_at_Cherai_Beach.jpg/375px-Sunrise_at_Cherai_Beach.jpg',
      'CHERAI BEACH',
      'KOCHI, KERALA',
      '10.14227°N 76.178255°E',
      '10.14227',
      '76.178255',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Bakkhali1.jpg/450px-Bakkhali1.jpg',
      'BAKKHALI BEACH',
      'PARGANAS, WEST BENGAL',
      '21.5631°N 88.2595°E',
      '21.5631',
      '88.2595',
      false
    ),

    Beach(
      'https://www.travelandtourworld.com/wp-content/uploads/2022/11/Dagara-Beach-1.jpg',
      'DAGARA BEACH',
      'BALESWAR, ODISHA',
      '21.566389°N 87.3233°E',
      '21.566389',
      '87.3233',
      false
    ),

    Beach(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmLh4UH10MHJVuHEWn7K5TMgJbKZZQtueaOw&s',
      'KALINGAPATNAM BEACH',
      'SRIKAKULAM, ANDHRA PRADESH',
      '18.3339°N 84.1402°E',
      '18.3339',
      '84.1402',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Elliots_Beach_at_Besant_Nagar%2C_Chennai.JPG/375px-Elliots_Beach_at_Besant_Nagar%2C_Chennai.JPG',
      'ELLIOTS BEACH',
      'BESANT NAGAR, CHENNAI',
      '12.999529°N 80.272411°E',
      '12.999529',
      '80.272411',
      false
    ),

    Beach(
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/9a/8c/c5/photo1jpg.jpg?w=1800&h=1000&s=1',
      'KARAIKAL BEACH',
      'KARAIKAL, PONDICHERRY',
      '10.918°N 79.853°E',
      '10.918',
      '79.853',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/LakshadweepIsland.jpg/1920px-LakshadweepIsland.jpg',
      'BANGARAM BEACH',
      'LAKSHADWEEP, INDIA',
      '10.95°N 72.29°E',
      '10.95',
      '72.29',
      false
    ),

    Beach(
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/31/fd/03/dandi-beach-the-most.jpg?w=1200&h=1200&s=1',
      'DANDI BEACH',
      'DANDI, GUJARAT',
      '20.8761°N 72.8031°E',
      '20.8761',
      '72.8031',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Juhu_beach_%28Arial%29.jpg/375px-Juhu_beach_%28Arial%29.jpg',
      'JUHU BEACH',
      'MUMBAI MAHARASHTRA',
      '19.10°N 72.83°E',
      '19.10',
      '72.83',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Cavelossim_Beach.JPG/375px-Cavelossim_Beach.JPG',
      'CAVELOSSIM BEACH',
      'SOUTH GOA, GOA',
      '15.174°N 73.945°E',
      '15.174',
      '73.945',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Panambur_Beach_Mangalore.jpg/375px-Panambur_Beach_Mangalore.jpg',
      'PANAMBUR BEACH',
      'MANGALORE, KARNATAKA',
      '12.9371° N, 74.8043° E',
      '12.9371',
      '74.8043',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/%E0%B4%AB%E0%B5%8B%E0%B4%B0%E0%B5%8D%E0%B4%9F%E0%B5%8D%E0%B4%9F%E0%B5%8D-%E0%B4%95%E0%B5%8A%E0%B4%9A%E0%B5%8D%E0%B4%9A%E0%B4%BF-%E0%B4%9A%E0%B5%80%E0%B4%A8%E0%B4%B5%E0%B4%B2%E0%B4%95%E0%B5%BE.jpg/255px-%E0%B4%AB%E0%B5%8B%E0%B4%B0%E0%B5%8D%E0%B4%9F%E0%B5%8D%E0%B4%9F%E0%B5%8D-%E0%B4%95%E0%B5%8A%E0%B4%9A%E0%B5%8D%E0%B4%9A%E0%B4%BF-%E0%B4%9A%E0%B5%80%E0%B4%A8%E0%B4%B5%E0%B4%B2%E0%B4%95%E0%B5%BE.jpg',
      'FORT KOCHI BEACH',
      'KOCHI, KERALA',
      '9.968°N 76.244°E',
      '9.968',
      '76.244',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Sunset_at_Gangasagar.jpg/330px-Sunset_at_Gangasagar.jpg',
      'GANGASAGAR SEA BEACH',
      'PARGANAS, WEST BENGAL',
      '21.6528°N 88.0753°E',
      '21.6528',
      '88.0753',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Chandipur_sea_beach_Baleswar.jpg/330px-Chandipur_sea_beach_Baleswar.jpg',
      'CHANDIPUR BEACH',
      'BALASORE, ODISHA',
      '21.47°N 87.02°',
      '21.47',
      '87.02',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/River_Gosthani_at_bhimili.jpg/375px-River_Gosthani_at_bhimili.jpg',
      'BHEEMILI BEACH',
      'VISAKHAPATNAM, ANDHRA P.',
      '17.890382°N 83.455465°E',
      '17.890382',
      '83.455465',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Silver_Beach_New.jpg/375px-Silver_Beach_New.jpg',
      'SILVER BEACH',
      'CUDDALORE, TAMIL NADU',
      '11.7393°N 79.7865°E',
      '11.7393',
      '79.7865',
      false
    ),

    Beach(
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/ac/c6/60/kakinada-beach-to-uppada.jpg?w=400&h=300&s=1',
      'YANAM BEACH',
      'YANAM, PONDICHERRY',
      '16.4400°N 82.1500°E',
      '16.4400',
      '82.1500',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Tithal_Beach_Sun_Set.JPG/375px-Tithal_Beach_Sun_Set.JPG',
      'TITHAL BEACH',
      'VALSAD, GUJARAT',
      '20°35′53.6″N 72°53′41″E',
      '20.598222',
      '72.894722',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Manori-02.jpg/450px-Manori-02.jpg',
      'MANORI BEACH',
      'MUMBAI, MAHARASHTRA',
      '19.21°N 72.79°E',
      '19.21',
      '72.79',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Vagator_Beach%2C_Anjuna%2C_Goa%2C_India.jpg/375px-Vagator_Beach%2C_Anjuna%2C_Goa%2C_India.jpg',
      'CHAPORA BEACH',
      'MAPUSA, GOA',
      '15°36′22″N 73°44′25″E',
      '15.606111',
      '73.740278',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Surathkal_Lighthouse1.jpg/375px-Surathkal_Lighthouse1.jpg',
      'NITK BEACH',
      'MANGALORE, KARNATAKA',
      '13.0097° N, 74.7887° E',
      '13.0097',
      '74.7887',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Kollam%2C_Kerala.jpg/375px-Kollam%2C_Kerala.jpg',
      'KOLLAM BEACH',
      'KOLLAM, KERALA',
      '8°52′26″N 76°35′33″E',
      '8.873889',
      '76.5925',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/RK_Beach_Night.jpg/375px-RK_Beach_Night.jpg',
      'RK BEACH',
      'VISAKHAPATNAM, ANDHRA P.',
      '17°42′51″N 83°19′25″E',
      '17.71423',
      '83.323628',
      false
    ),

    Beach(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Road_to_Arichal_Munai.jpg/330px-Road_to_Arichal_Munai.jpg',
      'DHANUSHKODI BEACH',
      'RAMESWARAM, TAMIL NADU',
      '9.215135°N 79.358524°E',
      '9.215135',
      '79.358524',
      false
    ),

];

