import 'package:cloud_firestore/cloud_firestore.dart';

class Person
{
  String? uid;
  String? imageProfile;
  String? email;
  String? password;
  String? name;
  int? age;
  String? phoneNo;
  String? city;
  String? country;
  String? profileHeading;
  String? lookingForInaPartner;

  int? publishedDataTime;

  //внешность
  String? height;
  String? weight;
  String? bodyType;

  //образ жизни
  String? drink;
  String? smoke;
  String? martialStatus;
  String? haveChildren;
  String? noOfChildren;
  String? profession;
  String? employmentStatus;
  String? income;
  String? livingSituation;
  String? willingToRelocate;
  String? relationshipYouAreLookingFor;

  //культурные ценности
  String? nationality;
  String? education;
  String? languageSpoken;
  String? religion;
  String? ethnicity;

  Person({
    this.uid,
    this.imageProfile,
    this.email,
    this.password,
    this.name,
    this.age,
    this.phoneNo,
    this.city,
    this.country,
    this.profileHeading,
    this.lookingForInaPartner,
    this.publishedDataTime,

    this.height,
    this.weight,
    this.bodyType,

    this.drink,
    this.smoke,
    this.martialStatus,
    this.haveChildren,
    this.noOfChildren,
    this.profession,
    this.employmentStatus,
    this.income,
    this.livingSituation,
    this.willingToRelocate,
    this.relationshipYouAreLookingFor,

    this.nationality,
    this.education,
    this.languageSpoken,
    this.religion,
    this.ethnicity,


  });
  static Person fromDataSnapshot(DocumentSnapshot snapshot)
  {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Person(
      //личная информация
      uid: dataSnapshot["uid"],
      imageProfile: dataSnapshot["imageProfile"],
      email: dataSnapshot["email"],
      password: dataSnapshot["password"],
      name: dataSnapshot["name"],
      age: dataSnapshot["age"],
      phoneNo: dataSnapshot["phoneNo"],
      city: dataSnapshot["city"],
      country: dataSnapshot["country"],
      profileHeading: dataSnapshot["profileHeading"],
      lookingForInaPartner: dataSnapshot["lookingForInaPartner"],
      publishedDataTime: dataSnapshot["publishedDataTime"],
      //внешность
      height: dataSnapshot["height"],
      weight: dataSnapshot["weight"],
      bodyType: dataSnapshot["bodyType"],
      //образ жизни
      drink: dataSnapshot["drink"],
      smoke: dataSnapshot["smoke"],
      martialStatus: dataSnapshot["martialStatus"],
      haveChildren: dataSnapshot["haveChildren"],
      noOfChildren: dataSnapshot["noOfChildren"],
      profession: dataSnapshot["profession"],
      employmentStatus: dataSnapshot["employmentStatus"],
      income: dataSnapshot["income"],
      livingSituation: dataSnapshot["livingSituation"],
      willingToRelocate: dataSnapshot["willingToRelocate"],
      relationshipYouAreLookingFor: dataSnapshot["relationshipYouAreLookingFor"],
      //культурные ценности
      nationality: dataSnapshot["nationality"],
      education: dataSnapshot["education"],
      languageSpoken: dataSnapshot["languageSpoken"],
      religion: dataSnapshot["religion"],
      ethnicity: dataSnapshot["ethnicity"],

    );

  }

  Map<String, dynamic> toJson() =>
      {
    "uid": uid,
    "imageProfile": imageProfile,
    "email": email,
    "password": password,
    "name": name,
    "age": age,
    "phoneNo": phoneNo,
    "city": city,
    "country": country,
    "profileHeading": profileHeading,
    "lookingForInaPartner": lookingForInaPartner,
    "publishedDataTime": publishedDataTime,
    "height": height,
    "weight": weight,
    "bodyType": bodyType,
    "drink": drink,
    "smoke": smoke,
    "martialStatus": martialStatus,
    "haveChildren": haveChildren,
    "noOfChildren": noOfChildren,
    "profession": profession,
    "employmentStatus": employmentStatus,
    "income": income,
    "livingSituation": livingSituation,
    "willingToRelocate": willingToRelocate,
    "relationshipYouAreLookingFor": relationshipYouAreLookingFor,
    "nationality": nationality,
    "education": education,
    "languageSpoken": languageSpoken,
    "religion": religion,
    "ethnicity": ethnicity,

  };

}