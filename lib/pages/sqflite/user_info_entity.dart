import 'package:example/generated/json/base/json_convert_content.dart';

class UserInfoEntity with JsonConvert<UserInfoEntity> {
	int id;
	String mobile;
	String headImage;
}
