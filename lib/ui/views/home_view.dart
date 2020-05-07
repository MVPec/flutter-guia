import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:winncar/ui/helpers/constants.dart';
import 'package:winncar/ui/widgets/clipPath_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  Widget txtButtom(
    String txt,
  ) {
    return Text(
      txt,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }

  Widget titleCardSlider() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '¿Qué estás buscando?',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: customPrimaryColor),
      ),
    );
  }

  Widget rowPrimary(context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 230,
                child: Text(
                  'Hola, Pedro',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: customPrimaryColor),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                      width: 210.0,
                      child: Text(
                        'Guayaquil, Sauces 4 MZ 361 V33',
                        style: TextStyle(fontSize: 14.0),
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      width: 20.0, child: Icon(LineAwesomeIcons.sort_down))
                ],
              )
            ],
          ),
          Container(
            child: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/img/intro.jpg',
                    width: 120, fit: BoxFit.cover),
              ),
              radius: 30,
            ),
          )
        ],
      ),
    );
  }

  Widget borderGradienteLeft(double height) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 10.0,
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                tileMode: TileMode.clamp,
                colors: <Color>[
              Colors.white,
              Colors.white.withAlpha(50),
            ])),
      ),
    );
  }

  Widget borderGradienteRight(double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 10.0,
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                tileMode: TileMode.clamp,
                colors: <Color>[
              Colors.white.withAlpha(50),
              Colors.white,
            ])),
      ),
    );
  }

  Widget buttomOpt(IconData icon,) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: CircleAvatar(
          radius: 50,
          child: ClipOval(
            child: Material(
              color: customPrimaryColor, // button color
              child: InkWell(
                splashColor: Colors.orange.withOpacity(0.5), // inkwell color
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Icon(
                      icon,
                      size: 40.0,
                    )),
                onTap: () {},
              ),
            ),
          )),
    );
  }

  Widget rowButtom() {
    return Container(
        child: Stack(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 135.0,
            child: Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        buttomOpt(FontAwesomeIcons.wrench),
                        SizedBox(
                          height: 8.0,
                        ),
                        txtButtom('Talleres')
                      ],
                    )),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  children: <Widget>[
                    buttomOpt(FontAwesomeIcons.wrench),
                    SizedBox(
                      height: 8.0,
                    ),
                    txtButtom('Gasolineras')
                  ],
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  children: <Widget>[
                    buttomOpt(FontAwesomeIcons.wrench),
                    SizedBox(
                      height: 8.0,
                    ),
                    txtButtom('Parqueaderos')
                  ],
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10.0,
                      ),
                      child: buttomOpt(FontAwesomeIcons.wrench),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    txtButtom('Lavadoras')
                  ],
                ),
              ],
            ),
          ),
        ),
        borderGradienteLeft(135.0),
        borderGradienteRight(135.0)
      ],
    ));
  }

  Widget customCard( Icon icon, String name) {
    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            side:
                BorderSide(color: customPrimaryColor, style: BorderStyle.solid, width: 1),
            borderRadius: BorderRadius.circular(150.0),
          ),
          elevation: 3,
          child: InkWell(
            borderRadius: BorderRadius.circular(150.0),
            splashColor:customPrimaryColor.withAlpha(50),
            onTap: () {
              print('Card tapped.');
            },
            child: Container(
                width: 130,
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Image.asset('assets/img/taller.png', fit: BoxFit.cover, width: 60,),
                    icon,
                    SizedBox(height: 10.0,),
                    Text(name, style: TextStyle(fontSize: 16),)
                  ],
                )
            ),
          )),
    );
  }

  /* Widget scrollHorizontalCard() {
    return Container(
        child: Stack(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 220.0,
            child: Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: customCard()),
                SizedBox(
                  width: 10.0,
                ),
                customCard(),
                SizedBox(
                  width: 10.0,
                ),
                customCard(),
                SizedBox(
                  width: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: customCard(),
                )
              ],
            ),
          ),
        ),
        borderGradienteLeft(220.0),
        borderGradienteRight(220.0)
      ],
    ));
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: customSecondaryColor,
        body: ClipPath(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            color: Colors.white,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  rowPrimary(context),
                  SizedBox(
                    height: 20.0,
                  ),
                  titleCardSlider(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[customCard(Icon(FontAwesomeIcons.wrench, size: 35.0,), 'Taller'), customCard(Icon(Icons.local_gas_station, size: 40.0,), 'Gasolinera')],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[customCard(Icon(Icons.local_car_wash, size: 40.0,), 'Lavadora'), customCard(Icon(Icons.local_parking, size: 40.0,), 'Parqueadero')],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ),
          clipper: CustomClipPath(),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1)))),
          child: BottomNavigationBar(
            backgroundColor: customSecondaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            iconSize: 25.0,
            currentIndex: 0,
            type: BottomNavigationBarType
                .fixed, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: Icon(LineAwesomeIcons.search),
                title: Text('Buscar'),
              ),
              BottomNavigationBarItem(
                icon: Icon(LineAwesomeIcons.tags),
                title: Text('Ofertas'),
              ),
              BottomNavigationBarItem(
                icon: Icon(LineAwesomeIcons.wrench),
                title: Text('Tus Winn'),
              ),
              BottomNavigationBarItem(
                icon: Icon(LineAwesomeIcons.bell),
                title: Text('Notificaciones'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(LineAwesomeIcons.user), title: Text('Mi cuenta'))
            ],
          ),
        ));
  }
}
