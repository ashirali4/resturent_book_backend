import 'package:firebase_database/firebase_database.dart';

class Firebase_Helper {
  final databaseReference = FirebaseDatabase.instance.reference();


   void  create_booking(String res_id,String res_name,String date,String clock,String people,List<String> food,List<String> party,String image){
     String key=databaseReference.child("bookings").push().key.toUpperCase();


     databaseReference.child("bookings").child(key).set({
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