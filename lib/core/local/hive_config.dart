import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:food_delivery_app/core/constants.dart' as constants;

class HiveConfig {
  static late BoxCollection collection;
  static late CollectionBox<Map> box;

  static Future<void> init() async {
    //
    WidgetsFlutterBinding.ensureInitialized();

    final directory = await getApplicationDocumentsDirectory();
    collection =
        await BoxCollection.open(constants.hiveDatabase, {constants.hiveCart,constants.hiveFavorites}, path: directory.path);
  }

  static Future<CollectionBox<Map>> open({required String boxName}) async {
    box = await collection.openBox<Map>(boxName);
    return box;
  }
}
