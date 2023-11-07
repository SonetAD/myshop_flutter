void main(List<String> args) {
  for (int l in num()) {
    print(l);
  }
}

Iterable<int> num() sync* {
  for (int i = 0; i < 8; i++) {
    yield i;
  }
}
