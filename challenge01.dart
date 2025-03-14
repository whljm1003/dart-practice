typedef WordList = List<Map<String, String>>;

class Dictionary {
  final WordList words = [];

  Dictionary({required WordList words});

  // 단어 추가 ADD
  void addWord({required String word, required String meaning}) {
    words.add({'word': word, 'meaning': meaning});
  }

  // 단어 조회 GET
  void getWord({required String word}) {
    words.forEach((e) {
      if (e['word'] == word) {
        print(e['meaning']);
      }
    });
  }

  // 단어 삭제 REMOVE
  void removeWord({required String word}) {
    words.removeWhere((e) => e['word'] == word);
  }

  // 단어 수정 UPDATE
  // 존재하지 않을 시 추가
  void updateWord({required String word, required String meaning}) {
    bool found = false;
    for (var e in words) {
      if (e['word'] == word) {
        e['meaning'] = meaning;
        found = true;
        break;
      }
    }
    if (!found) {
      addWord(word: word, meaning: meaning);
    }
  }

  // 사전에 등록된 모든 단어 조회
  String showAllWords() {
    String allWords = words
        .map((e) => "${e["word"]}: ${e["meaning"]}")
        .join(", ");
    return "all words: [$allWords]";
  }

  // 사전에 등록된 단어 갯수 리턴
  int getWordCount() => words.length;

  // 사전 단어가 존재하는지 여부 확인
  bool isWordExist({required String word}) {
    return words.any((e) => e['word'] == word);
  }

  // 여러개 단어를 한번에 추가 함.
  void addWords({required WordList words}) {
    this.words.addAll(words);
  }

  // 여러개 단어 삭제
  void removeWords({required List<String> words}) {
    this.words.removeWhere((e) => words.contains(e['word']));
  }
}

void main() {
  Dictionary dictionary = Dictionary(words: []);

  // 단어 추가 테스트
  dictionary.addWord(word: 'apple', meaning: '사과');
  dictionary.addWord(word: 'banana', meaning: '바나나');
  print(dictionary.getWordCount() == 2); // true

  // 단어 조회 테스트
  dictionary.getWord(word: 'apple'); // 예상 출력: 사과
  dictionary.getWord(word: 'banana'); // 예상 출력: 바나나

  // 단어 존재 여부 확인 테스트
  print(dictionary.isWordExist(word: 'apple') == true); // true
  print(dictionary.isWordExist(word: 'orange') == false); // true

  // 단어 수정 테스트
  dictionary.updateWord(word: 'apple', meaning: '애플');
  dictionary.getWord(word: 'apple'); // 예상 출력: 애플

  // 단어 삭제 테스트
  dictionary.removeWord(word: 'banana');
  print(dictionary.getWordCount() == 1); // true
  print(dictionary.isWordExist(word: 'banana') == false); // true

  // 여러 단어 추가 테스트
  dictionary.addWords(
    words: [
      {'word': 'orange', 'meaning': '오렌지'},
      {'word': 'grape', 'meaning': '포도'},
    ],
  );
  print(dictionary.getWordCount() == 3); // true

  // 여러 단어 삭제 테스트
  dictionary.removeWords(words: ['apple', 'orange']); // true
  print(dictionary.getWordCount() == 1); // true
  print(dictionary.isWordExist(word: 'apple') == false); // true
  print(dictionary.isWordExist(word: 'orange') == false); // true

  // 모든 단어 조회 테스트
  print(dictionary.showAllWords()); // 예상 출력: all words: grape: 포도
}
