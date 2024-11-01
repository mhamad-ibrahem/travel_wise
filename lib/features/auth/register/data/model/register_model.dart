import 'package:dio/dio.dart';

class RegisterModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String mobile;
  final String gender;
  final String birthDate;
  final String image;
  final String passportImage;
  final String nationImage;
  RegisterModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.gender,
    required this.birthDate,
    required this.image,
    required this.nationImage,
    required this.passportImage,
  });

  Future<FormData> toJson() async {
    return FormData.fromMap({
      if (image.isNotEmpty)
        "image_path": await MultipartFile.fromFile(image, filename: image),
      'passport_image_path':
          await MultipartFile.fromFile(passportImage, filename: passportImage),
      'national_id_image_path':
          await MultipartFile.fromFile(nationImage, filename: nationImage),
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'mobile': mobile,
      'gender': gender,
      'type': 'user',
      'birth_date': birthDate,
      'nationality_id': '1',
      'country_id': '1',
    });
  }
}
