import 'package:test/test.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/player.dart';

void main() {
  group('Initialize empty playlist', () {
    test('Test isEmpty field', () {
      Playlist playlist = Playlist();
      expect(playlist.isEmpty, true);
    });

    test('Test isNotEmpty field', () {
      Playlist playlist = Playlist();
      expect(playlist.isNotEmpty, false);
    });

    test('Test length field', () {
      Playlist playlist = Playlist();
      expect(playlist.length, 0);
    });

    test('Test first field', () {
      Playlist playlist = Playlist();
      expect(playlist.first, null);
    });

    test('Test last field', () {
      Playlist playlist = Playlist();
      expect(playlist.last, null);
    });
  });

  group('Initialize playlist with one player', () {
    Player player = Player('Nick', 'OH', 0, null);
    Playlist playlist = Playlist.byPlayer(player);

    test('Test isEmpty field', () {
      expect(playlist.isEmpty, false);
    });

    test('Test isNotEmpty field', () {
      expect(playlist.isNotEmpty, true);
    });

    test('Test lenth field', () {
      expect(playlist.length, 1);
    });

    test('Test first field', () {
      expect(playlist.first, player);
    });

    test('test last field', () {
      expect(playlist.last, player);
    });
  });

  group('Test add method', () {
    Playlist playlist = Playlist();
    Player player = Player('Nick', 'OH', 0, null);

    playlist.add(player);

    test('Test isEmpty field', () {
      expect(playlist.isEmpty, false);
    });

    test('Test isNotEmpty field', () {
      expect(playlist.isNotEmpty, true);
    });

    test('Test lenth field', () {
      expect(playlist.length, 1);
    });

    test('Test first field', () {
      expect(playlist.first, player);
    });

    test('test last field', () {
      expect(playlist.last, player);
    });
  });

  group('Test addAll method', () {
    Playlist playlist = Playlist();

    List<Player> list1 = List();

    list1.add(Player('Nick', 'OH', 0, null));
    list1.add(Player('Jack', 'MH', 0, null));
    list1.add(Player('Jane', 'Libero', 0, null));

    playlist.addAll(list1);

    test('Test length field', () {
      expect(playlist.length, 3);
    });

    test('Test first field', () {
      expect(playlist.first, list1.first);
    });

    test('Test last field', () {
      expect(playlist.last, list1.last);
    });

    test('Test middle player', () {
      Iterator iterator = playlist.iterator;

      iterator.moveNext();
      iterator.moveNext();
      expect(iterator.current, list1[1]);
    });
  });

  group('Test prioritize method', () {
    Playlist playlist = Playlist();

    List<Player> list1 = List();

    list1.add(Player('Nick', 'OH', 0, null));
    list1.add(Player('Jack', 'MH', 0, null));
    list1.add(Player('Jane', 'Libero', 0, null));

    playlist.addAll(list1);

    playlist.prioritize(list1.last);

    test('Test first field', () {
      expect(playlist.first, list1.last);
    });

    test('Test last field', () {
      expect(playlist.last, list1[1]);
    });

    test('Test prioritized player Waitedtime field', () {
      expect(playlist.first.getWaitingTime(), -1);
    });
  });

  group('Test wait method', () {
    Playlist playlist = Playlist();

    List<Player> list1 = List();

    list1.add(Player('Nick', 'OH', 0, null));
    list1.add(Player('Jack', 'MH', 0, null));
    list1.add(Player('Jane', 'Libero', 0, null));

    playlist.addAll(list1);

    playlist.wait(list1.first);

    test('Test first field', () {
      expect(playlist.first, list1[1]);
    });

    test('Test last field', () {
      expect(playlist.last, list1.first);
    });
  });

  group('Test contains method', () {
    Playlist playlist = Playlist();

    List<Player> list1 = List();

    list1.add(Player('Nick', 'OH', 0, null));
    list1.add(Player('Jack', 'MH', 0, null));
    list1.add(Player('Jane', 'Libero', 0, null));

    playlist.addAll(list1);

    test('Test contains', () {
      expect(playlist.contains(list1.last), true);
    });

    test('Test does not contains', () {
      expect(playlist.contains(Player('Jack', 'OH', 0, null)), false);
    });
  });

  group('Test containsAll method', () {
    Playlist playlist = Playlist();

    List<Player> list1 = List();

    list1.add(Player('Nick', 'OH', 0, null));
    list1.add(Player('Jack', 'MH', 0, null));
    list1.add(Player('Jane', 'Libero', 0, null));

    playlist.addAll(list1);

    playlist.add(Player('Meghan', 'RH', 0, null));

    test('Test contains all', () {
      expect(playlist.containsAll(list1), true);
    });

    test('Test does not contains all', () {
      List<Player> list2 = List();

      list2.add(Player('Mike', 'OH', 0, null));
      list2.add(Player('Nick', 'OH', 0, null));

      expect(playlist.containsAll(list2), false);
    });
  });

  group('Test remove method', () {
    Playlist playlist = Playlist();

    List<Player> list1 = List();

    list1.add(Player('Nick', 'OH', 0, null));
    list1.add(Player('Jack', 'MH', 0, null));
    list1.add(Player('Jane', 'Libero', 0, null));

    playlist.addAll(list1);

    playlist.remove(Player('Jack', 'MH', 0, null));

    test('Test middle player', () {
      Iterator iterator = playlist.iterator;
      iterator.moveNext();
      iterator.moveNext();
      iterator.moveNext();
      expect(iterator.current, list1[2]);
    });

    test('Test length method', () {
      expect(playlist.length, list1.length - 1);
    });
  });

  group('Test removeAll method', () {
    Playlist playlist = Playlist();

    List<Player> list1 = List();

    list1.add(Player('Nick', 'OH', 0, null));
    list1.add(Player('Jack', 'MH', 0, null));
    list1.add(Player('Jane', 'Libero', 0, null));

    playlist.addAll(list1);

    List<Player> list2 = List();

    list2.add(Player('Nick', 'OH', 0, null));
    list2.add(Player('Jane', 'Libero', 0, null));

    playlist.removeAll(list2);

    test('Test first field', () {
      expect(playlist.first, list1[1]);
    });

    test('Test last field', () {
      expect(playlist.last, list1[1]);
    });

    test('Test length method', () {
      expect(playlist.length, 1);
    });
  });

  group('Test clear method', () {
    Playlist playlist = Playlist();

    List<Player> list1 = List();

    list1.add(Player('Nick', 'OH', 0, null));
    list1.add(Player('Jack', 'MH', 0, null));
    list1.add(Player('Jane', 'Libero', 0, null));

    playlist.addAll(list1);

    playlist.clear();

    test('Test first field', () {
      expect(playlist.first, null);
    });

    test('Test last field', () {
      expect(playlist.last, null);
    });

    test('Test langth field', () {
      expect(playlist.length, 0);
    });
  });
}
