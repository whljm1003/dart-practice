// enum은 열거형 타입
// enum 내부에 따음표 사용 불가
enum Team { red, blue }

// Mixins
// 클래스 상속 대신 사용
// with 키워드를 사용
mixin Strong {
  final double strenghtLevel = 1500.99;
}

mixin class QuickRunner {
  void runQuick() {
    print('run quickly...');
  }
}

mixin class Tall {
  final double height = 1.99;
}

// Abstract Class
// 추상화 클래스는 다른 클래스들이 직접 구현 해야하는 메소드들을 모아놓은 일종의 '청사진'이라고 보면 된다.
// Human 클래스는 walk 라는 메소드가 존재하며, Human 클래스를 상속한 클래스는 반드시 구현해야할 메소드이다.
abstract class Human {
  String name;
  int age;
  Human({required this.name, required this.age});

  void walk();

  void sayHello() {
    print('Hello, my name is $name');
  }
}

// 클래스
class Player extends Human with Strong, QuickRunner, Tall {
  // final 변수는 변경 불가능한 변수

  int xp;
  Team team;

  // Constructor
  // 클래스 이름과 동일 해야 함.
  Player({
    required super.age,
    required super.name,
    required this.xp,
    required this.team,
  });

  //named constructor
  Player.createRedPlayer({required String name, required int age})
    : team = Team.red,
      xp = 0,
      super(name: name, age: age);

  Player.formJson(Map<String, dynamic> playerJson)
    : xp = playerJson['xp'],
      team = playerJson['team'],
      super(name: playerJson['name'], age: playerJson['age']);

  // Method
  String walk() {
    return 'walking...';
  }

  @override
  void sayHello() {
    super.sayHello();
    print('Hello2, my name is $name');
  }
}

void main() {
  // new 키워드는 생략 가능
  var player =
      Player(name: 'jungmin', xp: 1500, team: Team.red, age: 20)
        // cascade operator;
        // player 마지막에 세미콜론을 제거하고, .. 을 붙여 사용 가능.
        ..name =
            'jungmin2' // player.name = 'jungmin2' 와 동일
        ..age = 26
        ..team = Team.blue
        ..xp = 2500;
  player.sayHello();

  var redPayer = Player.createRedPlayer(name: "jungmin", age: 26);
  print(redPayer);

  const apiData = [
    {"name": "apple", "team": Team.blue, "age": 20, "xp": 1500},
    {"name": "banana", "team": Team.red, "age": 21, "xp": 1000},
    {"name": "orange", "team": Team.blue, "age": 22, "xp": 1200},
  ];

  apiData.forEach((playerJson) {
    var player = Player.formJson(playerJson);
    player.sayHello();
  });
}
