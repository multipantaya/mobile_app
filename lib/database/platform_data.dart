import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
part 'platform_data.g.dart';

@HiveType(typeId: 6)
class PlatformData extends HiveObject {
  @HiveField(0)
  late List<PlatformsModel> platforms;

  PlatformData({required this.platforms});
}