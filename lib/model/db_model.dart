class DbModel {

  late String title;
  late String description;
  late int price;


  DbModel(
      {
      required this.title,
      required this.description,
      required this.price,
      });

  factory DbModel.fetch(Map<String, dynamic> map) {
    return DbModel(
        title: map['title'],
        description: map['description'],
        price: map['price'],
       );
  }
}
