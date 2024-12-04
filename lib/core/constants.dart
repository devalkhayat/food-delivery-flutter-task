const String fontFamilyName="roboto";
const String appName="Food Delivery";
const String baseUrl="https://www.themealdb.com/api/json/v1/1/";

const String hiveDatabase="database";
const String hiveCart="cart";
const String hiveFavorites="favorites";

enum NetworkCalls {
  categories('${baseUrl}categories.php'),
  mealsByCategory('${baseUrl}filter.php?'),
  mealDetails('${baseUrl}lookup.php?');

  final String name;
  const NetworkCalls(this.name);

  @override
  String toString(){
    super.toString();
    return name;
  }
}