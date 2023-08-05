import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';

class DocumentProfileScreen extends StatelessWidget {
  const DocumentProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedListView(
        duration: 100,
        extendedSpaceBetween: 30,
        spaceBetween:10,
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
                          width: 50,
                          height: 50,
                          child: SvgPicture.asset(
                            'assets/icons/document-text-svgrepo-com.svg',
                            height: 20,
                            width: 20,
                            fit: BoxFit.contain,


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
                        'Document ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '13.2 MB , 04.08.23 at 10:30 PM',
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
