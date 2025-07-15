const List<Map<String, dynamic>> tabs = [
  {'label': 'Thẻ tín dụng'},
  {'label': 'Khoản vay'},
  {'label': 'Chứng chỉ tiền gửi'},
  {'label': 'Đầu tư'},
];

const List<Map<String, dynamic>> favorites = [
  {'label': 'Thanh toán dư nợ', 'icon': 'favorites/icon-balance-payment'},
  {'label': 'Mở/Khóa thẻ', 'icon': 'favorites/icon-lock-card'},
  {
    'label': 'Lịch sử giao dịch',
    'icon': 'favorites/icon-trans-history',
    "route": "/history",
  },
  {'label': 'Xem sao kê', 'icon': 'favorites/icon-card-statement'},
  {
    'label': 'Yêu cầu thẻ vật lý',
    'icon': 'favorites/icon-physical-card',
    "route": "/card-service",
  },
  {'label': 'Kích hoạt thẻ vật lý', 'icon': 'favorites/icon-active-card'},
  {'label': 'Dịch vụ ATM PIN', 'icon': 'favorites/icon-pin-card'},
  {'label': 'Chuyển phát thẻ', 'icon': 'favorites/icon-delivery'},
  {'label': 'Rút tiền QR', 'icon': 'favorites/icon-scan-qr'},
  {'label': 'Tap & Pay', 'icon': 'favorites/icon-ecard'},
  {'label': 'Mở thẻ tín dụng', 'icon': 'favorites/icon-new-card'},
  {'label': 'Tất cả chức năng', 'icon': 'favorites/icon-category'},
];

const List<Map<String, dynamic>> ortherUtil = [
  {'label': 'Biểu mẫu biểu phí', 'icon': 'icon-template-document'},
  {'label': 'Câu hỏi thường gặp', 'icon': 'icon-help'},
  {'label': 'Liên hệ VietCredit', 'icon': 'icon-support'},
];

const List<Map<String, dynamic>> settings = [
  {'label': 'Đăng nhập bằng sinh trắc học', 'preIcon': 'settings/icon-faceID'},
  {'label': 'Đổi mật khẩu', 'preIcon': 'settings/icon-lock'},
  {'label': 'Cài đặt SmartOTP', 'preIcon': 'settings/icon-smart-otp'},
  {'label': 'Xóa tài khoản', 'preIcon': 'settings/icon-trash'},
];

const List<Map<String, dynamic>> supports = [
  {'label': 'Liên hệ VietCredit', 'preIcon': 'settings/icon-support'},
  {'label': 'Câu hỏi thường gặp', 'preIcon': 'settings/icon-help'},
  {'label': 'Biểu mẫu và phí', 'preIcon': 'settings/icon-template-document'},
  {'label': 'Đăng xuất', 'preIcon': 'settings/icon-sign-out'},
];

const List<Map<String, dynamic>> quickAccess = [
  {'label': 'Thông tin chi tiết thẻ', 'icon': 'favorites/icon-balance-payment'},
  {'label': 'Lịch sử giao dịch', 'icon': 'favorites/icon-trans-history'},
  {'label': 'Xem sao kê', 'icon': 'favorites/icon-card-statement'},
  {'label': 'Thanh toán dư nợ', 'icon': 'favorites/icon-balance-payment'},
  {'label': 'Quét mã QR', 'icon': 'favorites/icon-scan-qr'},
];

const List<Map<String, dynamic>> profileInfo = [
  {'label': 'Số căn cước', 'value': '123456577'},
  {'label': 'Ngày sinh', 'value': '11/08/1992'},
  {'label': 'Giới tính', 'value': 'Nam'},
];

const List<Map<String, dynamic>> profileContact = [
  {'label': 'Email', 'value': 'harrytran1108@gmail.com'},
  {'label': 'Số điện thoại', 'value': '123456789', "edit": 'true'},
  {
    'label': 'Địa chỉ',
    'value': '123 An Khánh, Hoài Đức, Hà Nội',
    "edit": 'true',
  },
];
