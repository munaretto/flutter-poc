import 'package:poc/models/favorites.dart';
import 'package:test/test.dart';

void main() {
  group('Testing App Provider', () {
    final favorites = Favorites();

    test('A new item should be added to the listing', () {
      var number = 35;
      var listSizeBeforeAdding = favorites.items.length - 1;
      favorites.add(number); //Função sendo testada
      var listSizeAfterAdding = favorites.items.length - 1;
      expect(favorites.items.contains(number), true);
      expect(listSizeAfterAdding - listSizeBeforeAdding, 1);
    });

    test('An item should be removed from the listing', () {
      var number = 45;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      favorites.remove(number); //Função sendo testada
      expect(favorites.items.contains(number), false);
    });
  });
}
