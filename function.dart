//void function
// 아무것도 return 하지 않을 경우
void sayHello(String name, int age) {
  print("Hello $name you are $age years old");
}

//normal function
// 값을 반환할 경우
String sayHello2(String name, int age) {
  return ("Hello $name you are $age years old");
}

//arrow function
// 한 줄로 표현할 경우 (javascript 화살표 함수와 유사)
String sayHello3(String name, int age) => "Hello $name you are $age years old";

// named parameter
// 함수의 매개변수를 이름으로 전달할 수 있게 해준다.
// required 키워드를 사용하면 필수 매개변수가 된다.
// = 20 처럼 기본값을 설정할 수 있다.
String sayHello4({
  required String name,
  int age = 20,
  required String country,
}) => "Hello $name you are $age years old and you are from $country";

// optional Positional parameter
String sayHello5(String name, int age, [String? country = "USA"]) =>
    "Hello $name you are $age years old and you are from $country";

// QQ Operator
// 매개변수가 null일 경우 기본값을 설정할 수 있다.
String sayHello6(String? name) {
  // if(name == null) {
  //   return "Hello";
  // }else {
  //   return name.toUpperCase()
  // }

  // 왼쪽이 null이 아니면 왼쪽을 반환, 왼쪽이 null 이면 오른쪽을 반환
  // 위에 주석처리한 코드와 같은 결과 값
  return name?.toUpperCase() ?? "Hello";
}

// type alias
// 타입을 별명으로 지정할 수 있다.
typedef ListOfInts = List<int>;

ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversedList = list.reversed.toList();
  return reversedList;
}

void main() {
  sayHello("John", 20);
  print(sayHello2("John", 20));
  print(sayHello3("John", 20));
  print(sayHello4(name: "John", age: 20, country: "USA"));

  // ??= 연산자
  // 값이 없으면 초기값을 할당
  String? name;
  name ??= "John";
  print(name);
}
