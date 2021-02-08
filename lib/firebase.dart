import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Firebase_Helper {
  final databaseReference = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void insert_user_info(String id,String mail,String fullname){


    databaseReference.child("users").child(id).set({
      'userid': id,
      'name' : fullname,
      'mail' : mail,

    });


  }


  void  create_booking(String res_id,String res_name,String date,String clock,String people,List<String> food,List<String> party,String image){
     String key=databaseReference.child("bookings").push().key.toUpperCase();


     databaseReference.child("bookings").child(auth.currentUser.uid.toString()).child(key).set({
      'res_id': res_id,
      'res_name': res_name,
      'date':date,
      'time':clock,
      'people':people,
      'food' : food,
      'party' : party,
      'image' : image,
      'booking_id':key
    });
    print(key);

  }
}