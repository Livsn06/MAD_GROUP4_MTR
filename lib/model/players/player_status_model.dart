class PlayerStatusModel {
  String uid;
  String username;
  int currentLevel;
  int coins;

  PlayerStatusModel({
    required this.uid,
    required this.username,
    this.currentLevel = 0,
    this.coins = 0,
  });
}
