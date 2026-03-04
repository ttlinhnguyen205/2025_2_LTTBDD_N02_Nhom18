import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const String key = "favorites";

  // Lấy danh sách ID đã lưu
  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  // Thêm / Xóa favorite
  static Future<void> toggleFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites =
        prefs.getStringList(key) ?? [];

    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }

    await prefs.setStringList(key, favorites);
  }

  // Kiểm tra 1 id có được yêu thích không
  static Future<bool> isFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites =
        prefs.getStringList(key) ?? [];
    return favorites.contains(id);
  }
}