void main() {
  String name = 'pizza';
  bool isDone = false;
  int age = 20;
  double price = 10.5;

  num x = 12;
  x = 1.1;

  // List
  var giveMeFive = true;
  // collection if
  var numbers = [1, 2, 3, 4, if (giveMeFive) 5];
  print(numbers);

  // collection for
  var oldFriends = ['pizza', 'chicken'];
  var newFriends = [
    'pizza',
    'chicken',
    for (var friend in oldFriends) 'best friend $friend',
  ];

  // String Interpolation
  var name2 = 'apple';
  var age2 = 20;
  var greeting = 'Hello, my name is $name and I am $age years old';
  print(greeting);

  // Map
  var player = {'name': 'pizza', 'age': 20};
  List<Map<String, Object>> players = [
    {'name': 'pizza', 'age': 20},
    {'name': 'chicken', 'age': 21},
  ];

  print(players);

  // Set - 유니크한 값을 저장하는 컬렉션
  var numbers2 = {1, 2, 3, 4, 5};
  numbers2.add(6);
  print(numbers2);
}
