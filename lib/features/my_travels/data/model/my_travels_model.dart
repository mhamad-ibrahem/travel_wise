class MyTravelsModel {
  // final String name;
  // final int id;
  MyTravelsModel(
  //   {
  //   required this.name,
  //   required this.id,
  // }
  );

  factory MyTravelsModel.fromJson(Map<String, dynamic> jsonResponse) {
    return MyTravelsModel(
      // name: jsonResponse['name'], id: jsonResponse['id']
      );
  }
}
