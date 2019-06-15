class Beans {
  String name;
  String shortInfo;
  String image;
  List<String> tags;
  Beans(this.name, {this.shortInfo, this.image, this.tags}) {}
}

List<Beans> dataBeans = [
  Beans("Sweet Love - AVA", shortInfo: "Arabica Beans With Italian Style Roasting", image: "images/ava_coffee_sweet_love.jpg", tags: ["Arabica",]),
  Beans("Hazelnut - Wood Roast - AVA", shortInfo: "Arabica Beans Roasted Over Hazelnut Wood", image: "images/ava_hazelnut_wood_roast.jpg", tags: ["Arabica","Hazeknut"]),
  Beans("Kona - Peaberry", shortInfo: "High Aroma 100% Kona Beans", image: "images/kona_peaberry.jpg", tags: ["Kona","Aroma"]),
];