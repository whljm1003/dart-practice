void main() {
  // 1. 변수 선언 방법
  var name = 'pizza'; // var 키워드 사용
  String name2 = 'chicken'; // 타입 직접 지정

  // 같은 타입으로만 재할당 가능
  name = 'hamburger'; // String → String (O)
  // name = 123;       // String → int (X)

  // 2. dynamic 타입
  // 여러 타입으로 변경 가능한 변수
  dynamic dynamicVar = 'pizza';
  dynamicVar = 123; // 타입 변경 가능

  // 타입 체크를 통한 안전한 사용
  if (dynamicVar is String) {
    print(dynamicVar.toUpperCase());
  }
  if (dynamicVar is int) {
    print(dynamicVar + 1);
  }

  // 3. Null Safety
  // nullable 변수 - null 값을 가질 수 있음
  String? nullableString;
  nullableString = 'pizza';
  nullableString = null;

  // 4. final 키워드
  // 한 번만 할당 가능한 상수
  final String constantString = 'pizza';
  // constantString = 'chicken';  // 재할당 불가

  // 5. late 키워드
  // 초기 데이터가 없고, 나중에 초기화할 변수 (데이터 페칭 등에 유용)
  late String delayedString;
  delayedString = 'pizza'; // 나중에 값 할당

  // 6. const 키워드
  // 컴파일 시점에 값이 결정되는 상수
  const String constantString2 = 'pizza';
  // constantString2 = 'chicken'; // 재할당 불가
}
