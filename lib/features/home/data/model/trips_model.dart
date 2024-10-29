class TripsModel {
  TripsModel({
    required this.id,
    required this.type,
    required this.titleAr,
    required this.titleEn,
    required this.descriptionType,
    required this.fromDate,
    required this.toDate,
    required this.checkIn,
    required this.checkOut,
    required this.countryId,
    required this.currencyId,
    required this.minCapacity,
    required this.maxCapacity,
    required this.offerValue,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String? type;
  late final String? titleAr;
  late final String? titleEn;
  late final String? descriptionType;
  late final String? fromDate;
  late final String? toDate;
  late final String? checkIn;
  late final String? checkOut;
  late final int? countryId;
  late final int? currencyId;
  late final int? minCapacity;
  late final int? maxCapacity;
  late final int? offerValue;
  late final String? createdAt;
  late final String? updatedAt;

  TripsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    descriptionType = json['description_type'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    countryId = json['country_id'];
    currencyId = json['currency_id'];
    minCapacity = json['min_capacity'];
    maxCapacity = json['max_capacity'];
    offerValue = json['offer_value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
