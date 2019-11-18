

class Person{

  final String id;
  final String name;
  final int age;
  final List<String> place;
  final List<Images> images;
  final Address address;

  Person({this.id, this.name, this.age, this.place, this.images, this.address});

  factory Person.fromJson(Map<String, dynamic> json){
    return Person(

      id: json ['id'],
      name: json ['name'],
      age: json ['age'],
      place: parsePlace(json['place']),
      images: parseImages(json),
      address: Address.fromJson(json['address']),
    );

  }

  static List<String> parsePlace(placeJson){

    List<String> placeString = new List<String>.from(placeJson);
    return placeString;
  }

  static List<Images> parseImages(imageJson){
    var list =  imageJson['images'] as List;
    List<Images> imageList = list.map((data) => Images.fromJson(data)).toList();
    return imageList;
  }

}


class Images{

  int id;
  String name;

  Images({this.id, this.name});

  factory Images.fromJson(Map<String, dynamic> parseJson){
    return Images(
      id: parseJson['id'],
      name: parseJson['name']
    );

  }

}

class Details{

  int houseNo;
  String town;

  Details({this.houseNo, this.town});

  factory Details.fromJson(Map<String, dynamic> json){
    return Details(
      houseNo: json['house_no'] as int,
      town: json['town']
    );
  }
}

class Address{
  String streetNo;
  Details details;

  Address({this.streetNo, this.details});

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
    streetNo: json['street_no'],
    details: Details.fromJson(json['details'])
    );
  }


}
































