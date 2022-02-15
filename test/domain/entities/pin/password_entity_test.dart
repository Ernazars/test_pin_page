import 'package:flutter_test/flutter_test.dart';
import 'package:test_auth_pin_app/domain/entities/pin/password_entity.dart';

void main() {
  group('PinEntity', () {
    PasswordEntity password = PasswordEntity();
    test('Start pin value', () {
      expect(password.value, "");
    });

    test('enter password 4 symbol', () {
      for (int i = 0; i < 4; i++) {
        password.addPasswordSymbol("$i");
      }

      expect(password.value, "0123");
    });

    test('delete 4 password symbol', () {
      for (int i = 0; i < 4; i++) {
        password.removePasswordLastSymbol();
      }
      expect(password.length(), 0);
    });

    test('enter 2 and delete 1 password symbol', () {
      password.addPasswordSymbol("1");
      password.addPasswordSymbol("2");
      password.removePasswordLastSymbol();
      expect(password.value, "1");
    });
  });
}
