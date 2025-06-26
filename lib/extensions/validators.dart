extension InputValidator on String {
  String? get validatePhone {
    if (trim().isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    } else if (!RegExp(r'^[0-9]{9,11}$').hasMatch(this)) {
      return 'Số điện thoại không hợp lệ';
    }
    return '';
  }

  String? get validatePassword {
    if (trim().isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (length < 8) {
      return 'Ít nhất 8 ký tự';
    }
    if (!RegExp(r'[A-Z]').hasMatch(this)) {
      return 'Phải có ít nhất 1 chữ hoa';
    }
    if (!RegExp(r'[a-z]').hasMatch(this)) {
      return 'Phải có ít nhất 1 chữ thường';
    }
    if (!RegExp(r'[0-9]').hasMatch(this)) {
      return 'Phải có ít nhất 1 số';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this)) {
      return 'Phải có ít nhất 1 ký tự đặc biệt';
    }
    return '';
  }
}
