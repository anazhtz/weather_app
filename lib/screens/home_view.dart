
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/widgets/loader_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3C6FD1),
              Color(0xFF7CA9FF),
            ],
            stops: [0.25,0.87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
              child: Column(
                children: [
                  iconAndTemperature(),
                  Divider(),
                  weatherValues(),

                ],
              ),
              ),
            ),
            LoaderView()
          ],
        ),
      )
    );
  }
  AppBar appBar(){
    return AppBar(
      title: Text(""),
      actions: [
        IconButton(onPressed: (){
          Get.to(()=>LocationView());
        }, icon: Icon(Icons.location_on_outlined)),
      ],
    );
  }
  Widget iconAndTemperature(){
    return Column(
      children: [
        weatherImage(),
        Text("Current Date",style: TextStyle(
          fontSize: 17,color: Colors.white,
        ),
        ),
        Wrap(
          children: [
            Text("17",
              style: TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text('o',
              style: TextStyle(color: Colors.white,fontFeatures: [FontFeature.superscripts()]),
            )
          ],
        ),
        Text('Condition',style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600
        ),
        ),
      ],
    );
  }
  Widget weatherImage(){
    return CachedNetworkImage(imageUrl: '',height: 120,width: 120,imageBuilder: (context,imageProvider){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: imageProvider,
          fit: BoxFit.cover
          )
        ),
      );
    },
      errorWidget: (context,url,error){
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset('assets/images/clouds.png'),
      );
      },
      placeholder: (context, url){
      return Center(
        child: CircularProgressIndicator(strokeWidth: 2,color: Colors.white,),
      );
      },
    );
  }
  Widget divider(){
    return Divider(height: 28,);
  }
  Widget weatherValues(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            detailItem(title: 'Minimum', value: '', icon: CupertinoIcons.arrow_down , unit: ''),
            SizedBox(width: 10,),
            detailItem(title: 'Maximum', value: '', icon: CupertinoIcons.arrow_up , unit: ''),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            detailItem(title: 'Wind', value: '', icon: Icons.wind_power , unit: ''),
            SizedBox(width: 10,),
            detailItem(title: 'Feel Like', value: '', icon: Icons.cloudy_snowing , unit: ''),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            detailItem(title: 'Pressure', value: '', icon: Icons.thermostat , unit: ''),
            SizedBox(width: 10,),
            detailItem(title: 'Humidity', value: '', icon: Icons.water_drop_outlined , unit: ''),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            detailItem(title: 'Sun Rise', value: '', icon: Icons.sunny , unit: ''),
            SizedBox(width: 10,),
            detailItem(title: 'Sun Set', value: '', icon: Icons.sunny_snowing , unit: ''),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            detailItem(title: 'Latitude', value: '', icon: Icons.location_on , unit: ''),
            SizedBox(width: 10,),
            detailItem(title: 'Longitude', value: '', icon: Icons.location_on , unit: ''),
          ],
        ),
      ],
    );
  }

  Widget detailItem({required String title,required String value,required IconData icon,required String unit}){
    return Expanded(child: Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.17),
      ),
      child: Row(
        children: [
          Icon(icon,size: 32,),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value != 'N/A'? '$value $unit': value,style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,),
              ),
              SizedBox(height: 2,),
              Text(title,style: TextStyle(
                color: Colors.white,
                fontSize: 12,),
              ),
            ],
          )
        ],
      ),
    ));
  }


}
