class ProductModel {
  String?  title,  description, category, image,  rate, count;
int? id;
Map<String,dynamic>?rating;
  dynamic price;
  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating,
      this.rate,
      this.count});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'],
      rate: json['rate'],
      count: json['count'],
    );
  }
}
