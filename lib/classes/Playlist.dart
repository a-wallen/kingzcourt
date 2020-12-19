import 'Node.dart';
import 'player.dart';

class Playlist extends Iterable {
  Node _head; //First object in playlist.
  Node _tail; //Last object in playlist.
  int _size = 0; //The size of the playlist.

  /// Initializes empty plailist.
  Playlist();

  /// Initializes playlist containing one player.
  Playlist.byPlayer(Player player) {
    add(player);
  }

  /// Returns the first element.
  @override
  Player get first => _head == null ? null : _head.player;

  /// Returns the last element.
  @override
  Player get last => _tail == null ? null : _tail.player;

  /// Returns true if there are no elements in the playlist.
  @override
  bool get isEmpty => _size == 0;

  /// Returns true if there is at least one element in the playlist.
  @override
  bool get isNotEmpty => !(_size == 0);

  /// Returns the number of elements in the playlist.
  @override
  int get length => _size;

  /// Returns a new Iterator that allows iterating the elements of the playlist.
  @override
  Iterator get iterator {
    return PlaylistIterator(_head);
  }

  /// Prioritizes a player in playlist (invoked by Queue button).
  void prioritize(Player player) {
    if (player.getSkipGame()) {
      player.changeSkipGame();
    }
    if (player.equals(_head.player)) {
      return;
    }
    Node curNode = _head.next;
    Node targetPlayer = Node(player, null, null);
    int maxWaitingTime = _head.player.getWaitingTime();

    for (int i = 1; i < _size; i++) {
      if (curNode.player.equals(targetPlayer.player)) {
        remove(player);
        _size++;
        _head.previous = targetPlayer;
        targetPlayer.next = _head;
        _head = targetPlayer;
        _head.player.waitingTime = maxWaitingTime;
        return;
      }
      curNode = curNode.next;
    }
  }

  /// Deprioritizes plyer in playlist so player can have a rest (invoked by Wait button).
  void wait(Player player) {
    if (player.equals(_tail.player)) {
      player.changeSkipGame();
      return;
    }

    Node curNode = _head;
    Node targetPlayer = Node(player, null, null);

    for (int i = 0; i < _size; i++) {
      if (curNode.player.equals(targetPlayer.player)) {
        remove(player);
        _size++;
        _tail.next = targetPlayer;
        targetPlayer.previous = _tail;
        _tail = targetPlayer;
        player.changeSkipGame();
        return;
      }
      curNode = curNode.next;
    }
  }

  /// Returns true if object is in the playlist.
  bool contains(Object o) {
    for (Player player in this) {
      if (player.equals(o)) {
        return true;
      }
    }
    return false;
  }

  /// Returns whether the playlist contains all the elements of other.
  bool containsAll(Iterable<Object> other) {
    for (Object player in other) {
      if (!contains(player)) return false;
    }
    return true;
  }

  /// Adds value to the playlist.
  /// Returns true if value was not yet in the playlist.
  /// Otherwise returns false and the playlist is not changed.
  bool add(Player player) {
    Node node = Node(player, null, null);
    if (_head == null) {
      _head = node;
    } else {
      if (!contains(node.player)) {
        _tail.next = node;
        node.previous = _tail;
      } else {
        return false;
      }
    }
    _tail = node;
    _size++;
    return true;
  }

  /// Adds all elements to the playlist.
  void addAll(Iterable<Player> elements) {
    for (Player player in elements) {
      add(player);
    }
  }

  /// Removes value from the playlist.
  /// Returns true if value was in the playlist.
  /// Returns false otherwise.
  /// The method has no effect if value value was not in the playlist.
  bool remove(Object value) {
    Player curPlayer = value;

    if (!contains(curPlayer)) return false;
    Node curNode = _head;

    for (int i = 0; i < _size; i += 1) {
      if (i == 0 && curNode.player.equals(curPlayer)) {
        _head = curNode.next;
        curNode.next = null;
        if (_head != null) {
          _head.previous = null;
        }
        _size--;
        return true;
      } else if (curNode.next.player.equals(curPlayer) &&
          curNode.next != _tail) {
        curNode.next = curNode.next.next;
        curNode.next.previous = curNode;
        _size--;
        return true;
      } else if (curNode.next.player.equals(curPlayer) &&
          curNode.next == _tail) {
        curNode.next.previous = null;
        curNode.next = null;
        _tail = curNode;
        _size--;
        return true;
      }
      curNode = curNode.next;
    }
    return false;
  }

  /// Removes each element of elements from the playlist.
  void removeAll(Iterable<Player> elements) {
    for (Player player in elements) {
      if (contains(player)) {
        remove(player);
      }
    }
  }

  int numberOfPlayersByWaitingTime(int waitingTime) {
    int number = 0;
    for (Player player in this) {
      if (player.getWaitingTime() == waitingTime) {
        number++;
      }
    }
    return number;
  }

  /// Removes all elements in the playlist.
  void clear() {
    _head = null;
    _tail = null;
    _size = 0;
  }
}

/// Class to implement iterator for playlist.
class PlaylistIterator extends Iterator<Player> {
  Node _curNode;

  PlaylistIterator(Node node) {
    _curNode = Node(null, node, null);
  }

  @override
  Player get current => _curNode.player;

  @override
  bool moveNext() {
    if (_curNode.next == null) {
      return false;
    } else {
      _curNode = _curNode.next;
      return true;
    }
  }
}
