import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mehome/utils/colors.dart';

class PropertyCard extends StatefulWidget {
  const PropertyCard({super.key});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      // color: Colors.black,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              color: AppColors().colorPrimary,
            ),
            Container(
              height: 35,
              color: Colors.red,
              child: Row(),
            ),Container(
              height: 30,
              color: Colors.yellow,
              child: Row(),
            ),
            Container(
              height: 30,
              color: Colors.green,
              child: Row(),
            )
          ],
        ),
      ),
    );
  }
}
