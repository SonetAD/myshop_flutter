void main(List<String> args) {
  Future x = Future(() async {
    await Future.delayed(Duration(seconds: 4));
    return 'I am future';
  });
  x.then((value) => print(value));
  print('fuck');
}
