main() {
  List<String> fruits = [
    'Banana',
    'Pineapple',
    'watermelon',
    'cashew',
    'mango',
  ];

//    fruits.forEach((f)=>print(f.trimRight()));
//  var mappedFruits = fruits.map((f) => 'I love $f').toList();
//  print(mappedFruits);

  fruits.sort((a, b) => a.length.compareTo(b.length));
  print(fruits);
}