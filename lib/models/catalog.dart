class CatalogModel {
  static final  catModel=CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catModel;

  static List <Item> items = [
    Item(
        id: 1,
        name: "Male Outfit",
        desc: "Male Outfit Size :Xl",
        price: 999,
        color: "#33505a",
        image:"https://upload.wikimedia.org/wikipedia/en/0/05/NCC_cadet_wearing_ceremonial_dress.PNG"
    )
  ];
  Item getById(num id) =>
      items.firstWhere((element) => element.id==id ,orElse: null );
  Item getByPosition(int pos) => items[pos];
}

class Item
{
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});

  factory Item.fromMap(Map<String,dynamic>map){
    return Item(
      id: map["id"],
      name: map["name"] ,
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],

    );
  }

  toMap() =>{
    "id":id,
    "name":name,
    "desc":desc,
    "price":price,
    "color":color,
    "image":image,
  };


}