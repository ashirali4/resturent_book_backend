import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smart_select/smart_select.dart';

import '../firebase.dart';
class book extends StatefulWidget {
  DataSnapshot data;
  @override
  _bookState createState() => _bookState();
  book(this.data);
}

class _bookState extends State<book> {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('kk:mm').format(DateTime.now());
  //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
// simple usage

  TimeOfDay selectedTime =TimeOfDay.now();
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime, builder: (BuildContext context, Widget child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );});

    if (picked_s != null && picked_s != selectedTime )
      setState(() {
        selectedTime = picked_s;
      });
  }
  TextEditingController howpeople =new TextEditingController();
  List<int> value = [2];
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'ion', title: 'Deal 1'),
    S2Choice<String>(value: 'flu', title: 'Deal 2'),
    S2Choice<String>(value: 'rea', title: 'MidNight Deal'),
    S2Choice<String>(value: 'ion', title: 'Pizza Partha'),
    S2Choice<String>(value: 'flu', title: 'Pasta'),
    S2Choice<String>(value: 'rea', title: 'Burger Fied'),
    S2Choice<String>(value: 'ion', title: 'Fries'),
    S2Choice<String>(value: 'flu', title: 'Baryani'),
    S2Choice<String>(value: 'rea', title: 'Subway'),
  ];
  List<S2Choice<int>> frameworks = [
    S2Choice<int>(value: 1, title: 'Deal 1'),
    S2Choice<int>(value: 2, title: 'Deal 2'),
    S2Choice<int>(value: 3, title: 'MidNight Deal'),
    S2Choice<int>(value: 4, title: 'Pizza Partha'),
    S2Choice<int>(value: 5, title: 'Pasta'),
    S2Choice<int>(value: 6, title: 'Burger Fied'),
    S2Choice<int>(value: 7, title: 'Fries'),
    S2Choice<int>(value: 8, title: 'Baryani'),
    S2Choice<int>(value: 9, title: 'Subway'),
  ];


  DateTime selectedDate = DateTime.now();




  List<int> value2 = [];
  List<S2Choice<String>> options2 = [
    S2Choice<String>(value: 'ion', title: 'Party Baloons'),
    S2Choice<String>(value: 'flu', title: 'Goody Gifts'),
    S2Choice<String>(value: 'rea', title: 'Invite a Clown'),
    S2Choice<String>(value: 'ion', title: 'Celebration Place'),

  ];
  List<S2Choice<int>> frameworks2 = [
    S2Choice<int>(value: 1, title: 'Party Baloons'),
    S2Choice<int>(value: 2, title: 'Goody Gifts'),
    S2Choice<int>(value: 3, title: 'Invite a Clown'),
    S2Choice<int>(value: 4, title: 'Celebration Place'),

  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Bookingitem(widget.data),
              ),

              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: Container(
                    child:Row(
                      children: [
                        InkWell(
                          onTap: (){
                            _selectDate(context);
                          },
                          child: Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.black26,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(17),
                              child: SvgPicture.asset("assets/cc.svg",color: Colors.white,),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Booking Date",
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white.withOpacity(.5)
                                ),),
                              SizedBox(height: 05,),
                              Text(selectedDate.toString().substring(0,10),
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,

                                ),),
                            ],
                          ),
                        )
                      ],
                    )
                  ),flex: 1,),
                  Expanded(child: Container(
                      child:Row(
                        children: [
                          InkWell(
                            onTap: (){
                              _selectTime(context);
                            },
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.black26,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(17),
                                child: SvgPicture.asset("assets/c.svg",color: Colors.white,),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Booking Time",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white.withOpacity(.5)
                                  ),),
                                SizedBox(height: 05,),
                                Text(selectedTime.hour.toString()+":"+selectedTime.minute.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,

                                  ),),
                              ],
                            ),
                          )
                        ],
                      )
                  ),flex: 1,),

                ],
              ),


              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: Container(
                      child:Row(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.black26,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(17),
                              child: SvgPicture.asset("assets/team.svg",color: Colors.white,),
                            ),
                          ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(



                                child: TextFormField(

                                 controller: howpeople,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter number of People';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(


                                      contentPadding: EdgeInsets.only(left: 15),
                                      labelText: "Enter your People",
                                      labelStyle:GoogleFonts.poppins(
                                        // fontFamily: "OpenSansBold",
                                        color: Colors.white,
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                                      ),
                                      border: UnderlineInputBorder(
                                      )
                                  ),

                                ),
                              ),
                            ),
                          )
                        ],
                      )
                  ),flex: 1,),


                ],
              ),
              SizedBox(height: 20,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black26,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child:  SmartSelect<int>.multiple(
                    title: 'Choose Food',

                    choiceStyle: S2ChoiceStyle(subtitleStyle: GoogleFonts.poppins(color: Colors.white),titleStyle:GoogleFonts.poppins(color: Colors.white),
                     brightness: Brightness.dark
                    ),
                    modalType: S2ModalType.fullPage,
                    modalHeaderStyle: S2ModalHeaderStyle(
                      backgroundColor: Theme.of(context).primaryColor,
                      textStyle: GoogleFonts.poppins(color: Colors.white)
                    ),
                    value: value,
                    choiceItems: frameworks ,
                    onChange: (state) => setState(() => value = state.value),
                    tileBuilder: (context, state) {
                      return S2Tile.fromState(

                        state,
                        hideValue: true,
                        body: S2TileChips(
                          chipLength: state.valueObject.length,
                          chipLabelBuilder: (context, i) {
                            return Text(state.valueObject[i].title,style: GoogleFonts.poppins(color: Colors.white),);
                          },
                          chipAvatarBuilder: (context, i) {
                            return CircleAvatar(
                              backgroundImage: NetworkImage("https://i.dlpng.com/static/png/6934792_preview.png"),
                            );
                          },
                          chipOnDelete: (i) {
                            print(state.valueObject[i].value);
                            setState(() => value.remove(state.valueObject[i].value));
                            print(value);
                          },
                          chipColor: Colors.grey,

                          chipBrightness: Brightness.dark,
                          chipBorderOpacity: .5,

                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black26,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child:  SmartSelect<int>.multiple(
                    title: 'Party Options',

                    choiceStyle: S2ChoiceStyle(subtitleStyle: GoogleFonts.poppins(color: Colors.white),titleStyle:GoogleFonts.poppins(color: Colors.white),
                        brightness: Brightness.dark
                    ),
                    modalType: S2ModalType.popupDialog,
                    modalHeaderStyle: S2ModalHeaderStyle(
                        backgroundColor: Theme.of(context).primaryColor,
                        textStyle: GoogleFonts.poppins(color: Colors.white)
                    ),
                    value: value2,
                    choiceItems: frameworks2 ,
                    onChange: (state) => setState(() => value2 = state.value),
                    tileBuilder: (context, state2) {
                      return S2Tile.fromState(

                        state2,
                        hideValue: true,
                        body: S2TileChips(
                          chipLength: state2.valueObject.length,
                          chipLabelBuilder: (context, i) {
                            return Text(state2.valueObject[i].title,style: GoogleFonts.poppins(color: Colors.white),);
                          },
                          chipAvatarBuilder: (context, i) {
                            return CircleAvatar(
                              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtQch1lrtvRWHo2_pO2eA0DO4bgDlorWaZQ&usqp=CAU"),
                            );
                          },
                          chipOnDelete: (i) {
                            print(state2.valueObject[i].value);
                            setState(() => value2.remove(state2.valueObject[i].value));
                            print(value);
                          },
                          chipColor: Colors.grey,

                          chipBrightness: Brightness.dark,
                          chipBorderOpacity: .5,

                        ),
                      );
                    },
                  ),
                ),
              ),

             SizedBox(height: 20,),


              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.white)),
                  onPressed: () async {
                    List<String> food=[];
                    List<String> party=[];

                    for(int a=0;a<value.length;a++){
                      food.add(options[a].title);
                    }
                    for(int a=0;a<value2.length;a++){
                      party.add(options2[a].title);
                    }


                    Firebase_Helper helper=new Firebase_Helper();
                    helper.create_booking(widget.data.value['id'], widget.data.value['name'], selectedDate.toString().substring(0,10), selectedTime.hour.toString()+":"+selectedTime.minute.toString(), howpeople.text, food, party,widget.data.value['image']);
                    showDialog(
                        barrierColor: Colors.black.withOpacity(.9),
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10.0)), //this right here
                            child: Container(
                              height: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Container(
                                      height:80,
                                      width:80,
                                      child: SvgPicture.asset("assets/reservedd.svg",color: Colors.white,),
                                    ),
                                    SizedBox(height: 15,),
                                    Text(

                                      "Thanks! Your Booking has been Done!",
                                      style: GoogleFonts.poppins(),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 15,),
                                    SizedBox(
                                      width: 100.0,
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);

                                        },
                                        child: Text(
                                          "Back",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.black87,


                  child: Text("MAKE BOOKING",
                      style: GoogleFonts.poppins(fontSize: 14)),
                ),
              ),

              SizedBox(height: 20,),


            ],
          ),
        ),
      ),
    );
  }



  Widget Bookingitem(DataSnapshot data){

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black26,
      ),
      height: 120,

      child: Row(
        children: [
         Expanded(child:  Padding(
           padding: const EdgeInsets.only(left: 10,right: 10),
           child: Container(

             decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(10)),
                 color: Colors.black26,
                 image: DecorationImage(
                     image: NetworkImage(data.value['image'].toString()),
                     fit: BoxFit.cover
                 )
             ),
             height: 100,
           ),
         ),flex: 5,),
         Expanded(child:  Padding(
             padding: const EdgeInsets.only(left: 15,right: 15),
             child:Container(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Expanded(child:  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children:[
                       SizedBox(height: 03,),
                       Text("You are Booking for",
                         style: GoogleFonts.poppins(
                             fontSize: 15,
                             fontWeight: FontWeight.w500
                         ),),
                       SizedBox(height: 08,),
                       Text(data.value['name'].toString(),
                         style: GoogleFonts.poppins(
                             fontSize: 18,
                             fontWeight: FontWeight.bold
                         ),),
                       SizedBox(height: 03,),
                       Row(
                         children: [
                           Container(

                             child: RatingBar.builder(
                               itemSize: 12,
                               initialRating: 3,
                               minRating: 1,
                               direction: Axis.horizontal,
                               allowHalfRating: true,
                               itemCount: 5,
                               itemBuilder: (context, _) => Icon(
                                 Icons.star,
                                 color: Colors.amber,
                               ),

                             ),
                           ),
                           SizedBox(width: 03,),
                           Text("("+data.value['reviews'].toString()+")",
                             style: GoogleFonts.poppins(fontSize: 10),)
                         ],
                       )
                     ],
                   ),flex: 3,),

                 ],
               ),
             )
         ),flex: 10,)


        ],
      ),
    );
  }

}
