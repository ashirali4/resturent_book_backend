import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name="Ashir Ali";
  String email="muhammadashirali4@icloud.com";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 65,),
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(100)),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.all(Radius.circular(100)),

                    ),
                    child: SvgPicture.asset("assets/s.svg"),
                  ),
                ),
              ),
             SizedBox(height: 50,),
              Center(
                  child:   Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(

                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.transparent,
                          primaryColorDark: Colors.transparent,

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 05),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 10,),
                              Icon(LineAwesomeIcons.user,color: Colors.white,),
                              SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Your Name",
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(.5),
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  Text(name,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                    ),),
                                ],
                              )
                            ],
                          ),
                        )
                    ),
                  )
              ),
              SizedBox(height: 10,),
              Center(
                  child:   Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(

                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.transparent,
                          primaryColorDark: Colors.transparent,

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 13,bottom: 05),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 10,),
                              Icon(LineAwesomeIcons.envelope_open_text,color: Colors.white,),
                              SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Your Email",
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(.5),
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  Text(email,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500
                                    ),),
                                ],
                              )
                            ],
                          ),
                        )
                    ),
                  )
              ),
              SizedBox(height: 10,),

              Center(
                  child:   Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(

                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.transparent,
                          primaryColorDark: Colors.transparent,

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 08),
                          child: ListTile(
                            title:  Text("FAQS",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),),
                            trailing: Icon(LineAwesomeIcons.question_circle,color: Colors.white,),
                          ),
                        )
                    ),
                  )
              ),
              SizedBox(height: 10,),

              Center(
                  child:   Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(

                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.transparent,
                          primaryColorDark: Colors.transparent,

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 08),
                          child: ListTile(
                            title:  Text("Help & Support",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),),
                            trailing: Icon(LineAwesomeIcons.headset,color: Colors.white,),
                          ),
                        )
                    ),
                  )
              ),
              SizedBox(height: 10,),

              Center(
                  child:   Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(

                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.transparent,
                          primaryColorDark: Colors.transparent,

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 08),
                          child: ListTile(
                            title:  Text("Logout",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),),
                            trailing: Icon(LineAwesomeIcons.alternate_sign_out,color: Colors.white,),
                          ),
                        )
                    ),
                  )
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
