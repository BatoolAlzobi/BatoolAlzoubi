


class Favorite_StoreModel{

  List<Favorite_Store>data ;
  Favorite_StoreModel({required this.data}) ;

  factory Favorite_StoreModel.fromJson(Map<String , dynamic> json)
  {
    return Favorite_StoreModel(
        data:List<Favorite_Store>.from(json['data'].map((p)=>Favorite_Store.fromJson(p)))
    ) ;
  }
}



class Favorite_Store {
  late int id;
  late String image ;
  late String name;



  Favorite_Store(
      {
        required this.id,
        required this.name,
        required this.image,


      });

  Favorite_Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];




  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();


    ;
    data['name'] = this.name;
    data['id'] = this.id;
    data['image'] = this.image;

    return data;
  }
}