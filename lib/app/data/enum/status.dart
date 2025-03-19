

import 'package:user_feed/app/data/enum/enum_values.dart';

enum Status {
  APPROVED,
  REJECTED
}

final statusValues = EnumValues({
  "approved": Status.APPROVED,
  "rejected": Status.REJECTED
});