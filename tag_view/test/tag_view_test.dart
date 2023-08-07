import 'package:flutter_test/flutter_test.dart';

import 'package:tag_view/tag_view.dart';

void main() {
  test('adds one to input values', () {
    final calculator = TagView();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
}
