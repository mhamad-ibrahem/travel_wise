class UserModel {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.emailVerifiedAt,
    required this.gender,
    required this.birthDate,
    required this.nationalityId,
    required this.mobile,
    this.imagePath,
    required this.passportImagePath,
    required this.nationalIdImagePath,
    required this.countryId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String? firstName;
  late final String? lastName;
  late final String? email;
  late final dynamic emailVerifiedAt;
  late final String? gender;
  late final String? birthDate;
  late final String? nationalityId;
  late final String? mobile;
  late final String? imagePath;
  late final String? passportImagePath;
  late final String? nationalIdImagePath;
  late final String? countryId;
  late final String? type;
  late final String? createdAt;
  late final String? updatedAt;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    nationalityId = json['nationality_id'];
    mobile = json['mobile'];
    imagePath = json['image_path'];
    passportImagePath = json['passport_image_path'];
    nationalIdImagePath = json['national_id_image_path'];
    countryId = json['country_id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
