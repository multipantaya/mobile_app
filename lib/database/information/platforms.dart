
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
    plans: index == 0 
    ? infoPlans.dataPlansNetflix(texts) : index == 1 
      ? infoPlans.dataPlansSpotify(texts)
      : index == 2
        ? infoPlans.dataPlansYoutube(texts)
        : index == 3
          ? infoPlans.dataPlansDisney(texts)
          : index == 4
            // ? infoPlans.dataPlansHboUsa(texts)
            // : index == 5
              ? infoPlans.dataPlansHboLatam(texts)
              : infoPlans.dataPlansPrime(texts)
    )
  );
} 

final List<String> namesPlatform = ['NETFLIX','SPOTIFY','YOUTUBE PREMIUM','DISNEY PLUS'/*,'HBO MAX USA'*/,'HBO MAX LATAM','PRIME VIDEO',];