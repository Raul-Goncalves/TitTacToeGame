import 'package:flutter/material.dart';

class PlayedController extends ChangeNotifier {
  final String player;
  late final String ia;

  List<String?> board = List.filled(9, null);
  String currentPlayer = '';
  String? winner;
  bool isGameOver = false;
  int xWins = 0;
  int oWins = 0;

  PlayedController(this.player) {
    ia = player == 'X' ? 'O' : 'X';
    currentPlayer = player;
  }

  void playerMove(int index) {
    if (board[index] != null || isGameOver) return;
    board[index] = currentPlayer;
    _checkWinner();

    if (!isGameOver) {
      _switchTurn();

      if (currentPlayer == ia) {
        Future.delayed(Duration(milliseconds: 300), () {
          iaBotPlay();
        });
      }
    }

    notifyListeners();
  }

  void iaBotPlay() {
    int? move = _getMediumIABotMove();

    if (move != null && board[move] == null) {
      board[move] = ia;
      _checkWinner();
      if (!isGameOver) {
        _switchTurn();
      }
      notifyListeners();
    }
  }

  void _switchTurn() {
    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }

  void _checkWinner() {
    const List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    winner = null;

    for (var combo in winningCombinations) {
      final a = combo[0], b = combo[1], c = combo[2];
      if (board[a] != null && board[a] == board[b] && board[a] == board[c]) {
        winner = board[a];
        isGameOver = true;

        notifyListeners();
        return;
      }
    }

    if (!board.contains(null)) {
      isGameOver = true;
      winner = null;
      notifyListeners();
    } else {
      isGameOver = false;
    }
  }

  int? _getMediumIABotMove() {
    // 1. Ganhar se possível
    for (int i = 0; i < 9; i++) {
      if (board[i] == null) {
        board[i] = ia;
        _checkWinner();
        if (winner == ia) {
          board[i] = null;
          return i;
        }
        board[i] = null;
        winner = null;
        isGameOver = false;
      }
    }

    // 2. Bloquear jogador se ele puder ganhar
    for (int i = 0; i < 9; i++) {
      if (board[i] == null) {
        board[i] = player;
        _checkWinner();
        if (winner == player) {
          board[i] = null;
          winner = null;
          isGameOver = false;
          return i;
        }
        board[i] = null;
      }
    }

    // 3. Jogada estratégica (centro > cantos > laterais)
    if (board[4] == null) return 4;
    for (var i in [0, 2, 6, 8]) {
      if (board[i] == null) return i;
    }
    for (var i in [1, 3, 5, 7]) {
      if (board[i] == null) return i;
    }

    return null;
  }

  void resetGame() {
    board = List.filled(9, null);
    currentPlayer = player;
    winner = null;
    isGameOver = false;
    notifyListeners();
  }
}
