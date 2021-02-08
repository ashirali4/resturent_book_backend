import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
class Bookings_List extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Bookings_List> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20,right: 12,left: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                  child:   Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.transparent,
                        primaryColorDark: Colors.transparent,

                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.bookmark,color: Colors.white,),
                          SizedBox(width: 05,),

                          Text("Your Bookings",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                        ],
                      )
                    ),
                  )
              ),
              SizedBox(height: 20,),
              new Container(
                height: MediaQuery.of(context).size.height-167,
                child: new FirebaseAnimatedList(
                    query: FirebaseDatabase.instance
                        .reference().child("bookings").child(auth.currentUser.uid.toString())
                        .orderByChild("date"),
                    padding: new EdgeInsets.only(bottom: 100),
                    reverse: false,
                    itemBuilder: (_, DataSnapshot snapshot,
                        Animation<double> animation, int x) {

                      return new Column(
                        children: [
                          Bookingitem(snapshot),
                          SizedBox(height: 10,),

                        ],

                      );
                    }

                ),
              ),

              // SizedBox(height: 20,),
              // Item("Pizza Hut","assets/buger.png","(300)"),
              // SizedBox(height: 10,),
              // Item("Subway","assets/sub.jpeg","(200)"),
              // SizedBox(height: 10,),
              // Item("Biryani House","assets/kar.jpg","(330)"),
              // SizedBox(height: 10,),
              // Item("Pizza Hut","assets/buger.png","(300)"),


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
      height: 110,

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
              height: 90,
            ),
          ),flex: 5,),
          Expanded(child:  Padding(
              padding: const EdgeInsets.only(left: 05,right: 15,top: 04),
              child:Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        SizedBox(height: 03,),
                        Text("BOOKING ID",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white.withOpacity(.5),
                              fontWeight: FontWeight.w500,
                          ),),
                        Text(data.value['booking_id'].toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(.8)
                          ),),
                        SizedBox(height: 0,),
                        Text(data.value['res_name'].toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 05,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_today_outlined,size: 13,),
                            SizedBox(width: 03,),
                            Padding(
                              padding: const EdgeInsets.only(top: 01),
                              child: Text(data.value['date'].toString(),
                                style: GoogleFonts.poppins(fontSize: 10),),
                            ),
                            SizedBox(width: 08,),

                            Icon(Icons.timelapse_outlined,size: 13,),
                            SizedBox(width: 03,),
                            Padding(
                              padding: const EdgeInsets.only(top: 01),
                              child: Text(data.value['time'].toString(),
                                style: GoogleFonts.poppins(fontSize: 10),),
                            )

                            ,
                            SizedBox(width: 08,),

                            Icon(Icons.person_outline_outlined,size: 13,),
                            SizedBox(width: 03,),
                            Padding(
                              padding: const EdgeInsets.only(top: 01),
                              child: Text(data.value['people'].toString(),
                                style: GoogleFonts.poppins(fontSize: 10),),
                            )

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
