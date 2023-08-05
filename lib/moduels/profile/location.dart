import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';
import 'package:zchat/shared/styles/colors/colors.dart';

class LocationProfileScreen extends StatelessWidget {
  const LocationProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedListView(
        duration: 100,
        extendedSpaceBetween: 30,
        spaceBetween:20,
        children: List.generate(
            21,
                (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Stack(
                      alignment: Alignment.bottomRight,
                      children:[
                        Container(
                          width: 40,
                          height: 40,
                          child: SvgPicture.asset(
                            'assets/icons/location-pin-svgrepo-com.svg',

                            fit: BoxFit.contain,
                            color: defaultColor,


                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey[200],

                            // image: DecorationImage(
                            //   image:
                            //   // fit: BoxFit.cover,
                            // )
                          ),
                        ),


                      ]
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        'Location ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'USA',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),



                ],
              ),
            )
        ));
  }
}
