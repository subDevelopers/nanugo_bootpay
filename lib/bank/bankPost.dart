import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) =>  random.nextInt(255));
  return base64UrlEncode(values);
}

void _createPost() async {
  final response = await http.post(
    Uri.parse(
        'https://openapi.openbanking.or.kr/v2.0/transfer/withdraw/fin_num'),
    body: jsonEncode(
      {
        "bank_tran_id": "F123456789U4BC34239Z",
        "cntr_account_type": "N",
        "cntr_account_num": "00012345678901234",
        "dps_print_content": "쇼핑몰환불",
        "fintech_use_num": "123456789012345678901234",
        "wd_print_content": "오픈뱅킹출금",
        "tran_amt": "10000",
        "tran_dtime": "20190910101921",
        "req_client_name": '홍길동',
        "req_client_bank_code": "097",
        "req_client_account_num": '1101230000678',
        "req_client_num": 'HONGGILDONG1234',
        "transfer_purpose": 'TR',
        "sub_frnc_name": '하위가맹점',
        "sub_frnc_num": '123456789012',
        "sub_frnc_business_num": '1234567890',
        "recv_client_name": '김오픈',
        "recv_client_bank_code": '097',
        "recv_client_account_num": '232000067812'
      },
    ),
    headers: {'Content-Type': "application/json"},
  );
}
