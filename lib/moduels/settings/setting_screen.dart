import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zchat/shared/components/components.dart';
import 'package:zchat/shared/styles/colors/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: defaultColor,
                    size: 15,
                  ),
                ),
                const Align(
                    alignment: Alignment.center,
                    child: Text(
                      '@Camewwamson',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        color: defaultColor,
                      ),
                    )),
              ]),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/Rectangle24.png'),
                          // fit: BoxFit.cover,
                        )),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'Cameron Williamson ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '(406) 555-0120',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 15,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  '(406) 555-0120',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: 17,
                        color: Colors.black87,
                      ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  'Tap to change phone number',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 14, fontFamily: 'Gilroy'),
                ),
              ),
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  '@Cameron Williamson',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 17, color: Colors.black, fontFamily: 'Gilroy'),
                ),
              ),
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  'Username',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 14, fontFamily: 'Gilroy'),
                ),
              ),
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.only(left: 15),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  'I am web designer i work on google  I am web designer i work on google',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 17,
                      color: Colors.black,
                      fontFamily: 'Gilroy',
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  'Bio',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 14, fontFamily: 'Gilroy'),
                ),
              ),

              SizedBox(height: 50),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

                SizedBox(height: 15),

                buildItemDrawer(icon: SvgPicture.asset('assets/icons/notification1.svg'),title: 'Notifications',color: Colors.black,weight:FontWeight.w600 ),
                buildItemDrawer(icon:SvgPicture.asset('assets/icons/lock2.svg',),title: 'Privaty and security',color: Colors.black,weight:FontWeight.w600 ),
                buildItemDrawer(icon:SvgPicture.asset('assets/icons/activity1.svg',),title: 'Date and strongs',color: Colors.black,weight:FontWeight.w600 ),
                buildItemDrawer(icon:SvgPicture.asset('assets/icons/message1.svg',),title: 'Chat settings',color: Colors.black,weight:FontWeight.w600 ),
                buildItemDrawer(icon:SvgPicture.asset('assets/icons/display4.svg',), title:'Devices',color: Colors.black,weight:FontWeight.w600 ),












                ]),
          ),
        )
    );
  }
}
