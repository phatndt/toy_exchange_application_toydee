import '../../../core/styles/resources.dart';

class Product {
  final String? title, image;

  Product({this.title, this.image});
}

List<Product> demo_products = [
  Product(title: "Cabbage", image: R.images.homeToy_1),
  Product(title: "Broccoli", image:  R.images.homeToy_2),
  Product(title: "Carrot", image:  R.images.homeToy_3),
  Product(title: "Pakcoy", image:  R.images.homeToy_4),
];