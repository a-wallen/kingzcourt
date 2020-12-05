import 'player.dart';

/// Class that makes realisation like double-linked list
class Node {
  Player _player;
  Node _next;
  Node _previous;

  Node(Player player, Node next, Node previous) {
    this._player = player;
    this._next = next;
    this._previous = previous;
  }

  /// Sets _next value.
  set next(Node next) => _next = next;

  /// Returns _next value.
  Node get next => _next;

  /// Sets _previous value.
  set previous(Node previous) => _previous = previous;

  /// Returns _previous value.
  Node get previous => _previous;

  /// Returns _player value.
  Player get player => _player;
}
