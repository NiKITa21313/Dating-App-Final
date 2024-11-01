import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/authenticationScreen/login_screen.dart';
import 'package:dating_app/homeScreen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dating_app/models/person.dart' as personModel;

class AuthenticationController extends GetxController
{
  static AuthenticationController authController = Get.find();

  late Rx<User?> firebaseCurrentUser;

  late Rx<File?> pickedFile;

  File? get profileImage => pickedFile.value;

  XFile? imageFile;

  pickImageFileFromGallery() async
  {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "Вы выбрали фотографию профиля из галереи");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  captureImageFromPhoneCamera() async
  {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "Вы создали фотографию профиля используя камеру");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<String> uploadImageToStorage(File imageFile) async
  {
    Reference referenceStorage = FirebaseStorage.instance.ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;

    String downloadUrlOfImage = await snapshot.ref.getDownloadURL();

    return downloadUrlOfImage;

  }

  createNewUserAccount(
  File imageProfile,
  String email, String password,String name,
  String age, String phoneNo,
  String city, String country,
  String profileHeading, String lookingForInaPartner,

  String height, String weight, String bodyType,

  String drink, String smoke,
  String martialStatus, String haveChildren,
  String noOfChildren, String profession,
  String employmentStatus, String income,
  String livingSituation, String willingToRelocate,
  String relationshipYouAreLookingFor,

  String nationality, String education,
  String languageSpoken, String religion, String ethnicity,

  ) async
  {
    try {
      //создание пользователя в базе данных с почтой и паролем
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      //авторизация существующего пользователя
      String urlOfDownloadedImage = await uploadImageToStorage(imageProfile);

      //сохранение данных о пользователе в базу данных
      personModel.Person personInstance = personModel.Person(
        uid: FirebaseAuth.instance.currentUser!.uid,
        imageProfile: urlOfDownloadedImage,
        email: email,
        password: password,
        name: name,
        age: int.parse(age),
        phoneNo: phoneNo,
        city: city,
        country: country,
        profileHeading: profileHeading,
        lookingForInaPartner: lookingForInaPartner,
        publishedDataTime: DateTime.now().millisecondsSinceEpoch,

        height: height,
        weight: weight,
        bodyType: bodyType,

        drink: drink,
        smoke: smoke,
        martialStatus: martialStatus,
        haveChildren: haveChildren,
        noOfChildren: noOfChildren,
        profession: profession,
        employmentStatus: employmentStatus,
        income: income,
        livingSituation: livingSituation,
        willingToRelocate: willingToRelocate,
        relationshipYouAreLookingFor: relationshipYouAreLookingFor,

        nationality: nationality,
        education: education,
        languageSpoken: languageSpoken,
        religion: religion,
        ethnicity: ethnicity,
      );

      await FirebaseFirestore.instance.collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(personInstance.toJson());


      Get.snackbar("Аккаунт создан", "");

      Get.to(HomeScreen());


    }
    catch(errorMsg)
    {
      Get.snackbar("Ошибка создания аккаунта", "Ошибка: $errorMsg");
    }

  }

  loginUser(String emailUser, String passwordUser) async
  {
    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailUser,
          password: passwordUser
      );
      Get.snackbar("Доступ к аккаунту", "Вы зашли в аккаунт");
      Get.to(HomeScreen());

    }
    catch(errorMsg)
    {
      Get.snackbar("Ошибка доступа", "Ошибка: $errorMsg");
    }
  }

  checkIfUserLoggedIn(User? currentUser)
  {
    if(currentUser == null)
    {
      Get.to(LoginScreen());
    }
    else
    {
      Get.to(HomeScreen());
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    firebaseCurrentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    firebaseCurrentUser.bindStream(FirebaseAuth.instance.authStateChanges());


    ever(firebaseCurrentUser, checkIfUserLoggedIn);
  }

}
