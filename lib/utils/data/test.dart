import '../../modals/new_order.dart';

NewOrder get dummyOrder => NewOrder.fromJson({
        "id": 35,
        "product_quantity": 1,
        "total_amount": 994,
        "payment_status": 0,
        "is_delivered": 1,
        "return_status": 0,
        "refund_status": 0,
        "exchange_status": 0,
        "customer": {
          "first_name": "MK",
          "last_name": "123",
          "email": "wn11group+111@gmail.com",
          "mobile": "7906748534",
          "user_address": {
            "house_no": "house no -34",
            "colony": "valley enclave",
            "pin_code": "234123",
            "landmark": "Test",
            "state": "testtes",
            "city": "st",
            "phone": "1243434",
            "alternatePhone": "234234",
            "is_work": 1
          }
        },
        "shopDetails": {
          "shop_name": "Feb 23 Shop -00",
          "city": "dehradun",
          "address": "Delhi mayur vihar",
          "image_1": "shops/1708866590207-user.png",
          "image_2": "shops/1708866591751-craft-2.jpg",
          "shop_description": "This shop is for grocery shopping"
        }
      });