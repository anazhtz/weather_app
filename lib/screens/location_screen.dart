import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_textfiled.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Locations"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            CustomTextField(
              hint: 'Search Location',
              prefixIcon: Icons.location_on,
              onChanged: (value) {},
            ),
            Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.only(top: 20),
                    itemBuilder: (context,index){
                      return listViewItem(index);
                    }, separatorBuilder: (context,index){
                  return SizedBox(
                    height: 10,
                  );
                }, itemCount: 5))
          ],
        ),
      ),
    );
  }
  Widget listViewItem(int index){
    return ListTile(
      tileColor:  Colors.white.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onTap: (){},
      leading:  Icon(Icons.location_on,color: Colors.white,size: 22,),
      title: Text(
        'City',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

}
