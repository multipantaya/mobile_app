
import 'package:domain/domain.dart';
import 'package:mobile_app/database/information/plans.dart';
import 'package:mobile_app/widgets/widgets.dart';

class InfoPlatform {
  InfoPlatform._();

  static List<PlatformsModel> dataPlatforms(AppLocalizations texts) => List.generate(namesPlatform.length, (index) => PlatformsModel(
    id: (index + 10).toString(), 
    namePlatform: namesPlatform[index], 
    image: '', 
    favorite: false,
    totalAmount: 1,
    plans: index == 0 ? infoPlans.dataPlansNetflix(texts) : index == 1 ? infoPlans.dataPlansSpotify(texts): infoPlans.dataPlansYoutube(texts)
    )
  );
} 

final List<String> namesPlatform = [/*'HBO MAX','PRIME VIDEO','DISNEY PLUS',*/'NETFLIX','SPOTIFY','YOUTUBE PREMIUM'];