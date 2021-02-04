import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Getting_Started extends StatefulWidget {
  @override
  _Getting_StartedState createState() => _Getting_StartedState();
}

class _Getting_StartedState extends State<Getting_Started> {

  @override
  initState(){
    SystemChrome.setEnabledSystemUIOverlays([]);

  }
  Widget build(BuildContext context) {
    // createData();

    SystemChrome.setEnabledSystemUIOverlays([]);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Container(
                      child:
                      Column(
                        children: [
                          Container(
                              height: 120,
                              width: 120,
                              child: Image.asset("assets/dish.png")),
                        ],
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35,right: 35),
                  child: Container(
                    child: Column(
                      children: [
                        // Text("Bid Football Matches and Win Cash",
                        //   style: TextStyle(
                        //     fontSize: 23,
                        //     fontWeight: FontWeight.bold,
                        //     fontFamily: 'OpenSans',
                        //     color: Colors.white,
                        //   ),),
                        // SizedBox(height: 10,),
                        // Text("With our app you can win prize with foodball anytime and everywhere",
                        //   style: TextStyle(
                        //     fontSize: 13,
                        //
                        //     fontFamily: 'OpenSans',
                        //     color: Colors.white.withOpacity(.8),
                        //   ),),
                        // SizedBox(height: 30,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.white)),
                            onPressed: () {
                              Navigator.pushNamed(context, "signup");
                            },
                            color: Colors.white,
                            textColor: Colors.black87,
                            child: Text("Create an Account",
                                style: TextStyle(fontSize: 14)),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.white)),
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            color: Colors.transparent,
                            textColor: Colors.white,
                            child: Text("Login with e-mail",
                                style: TextStyle(fontSize: 14)),
                          ),
                        ),
                        SizedBox(height: 30,),

                      ],

                    ),
                  ),
                ),
              ],
            ),
            decoration: new BoxDecoration(
              color: Colors.black,
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: new AssetImage("assets/bg.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}