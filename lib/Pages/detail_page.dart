import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg1_12/Widget/mycolors.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String Desc;
  DetailPage({super.key, required this.image, required this.Desc, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Details on ${name}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colortextW),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: colorheader,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
            width: double.infinity,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  image,
                  height: 95,
                ),
              ),
          ),
          SizedBox(height: 20.0,),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(Desc, 
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}