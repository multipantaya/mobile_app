
import 'package:domain/domain.dart';
import 'package:mobile_app/widgets/widgets.dart';

class infoPlans {
  infoPlans._();
  static List<PlansModel> dataPlansNetflix(AppLocalizations texts) => [
    PlansModel(
      id: '1', 
      namePlan: texts.planOneNetflix, 
      price: 6.00,  
      description: [
        SimpleTextModel(
          title: texts.yourAcount, 
          content: texts.yourAcountNetflix
        ),
        SimpleTextModel(
          title: texts.maxQualityHeader, 
          content: texts.maxQualityText
        ),
        SimpleTextModel(
          title: texts.allAccessHeader, 
          content: texts.allAccessText
        ),
      ]
    ),
    PlansModel(
      id: '2', 
      namePlan: texts.planTwoNetflix,  
      price: 15.00, 
      description: [
        SimpleTextModel(
          title: texts.sixViewsHeader, 
          content: texts.sixViewsText
        ),
        SimpleTextModel(
          title: texts.maxQualityHeader, 
          content: texts.maxQualityText
        ),
        SimpleTextModel(
          title: texts.allAccessHeader, 
          content: texts.allAccessText
        ),
      ]
    ),
  ];

  static List<PlansModel> dataPlansYoutube(AppLocalizations texts) => [
    PlansModel(
      id: '3', 
      namePlan: texts.planOneYoutube, 
      price: 6.00, 
      description: [
        SimpleTextModel(
          title: texts.yourAcount, 
          content: texts.yourAcountYoutube
        ),
        SimpleTextModel(
          title: texts.maxQualityHeader, 
          content: texts.maxQualityText
        ),
        SimpleTextModel(
          title: texts.noAdsYoutube, 
          content: texts.noAdsYoutubeText
        ),
      ]
    ),
    PlansModel(
      id: '4', 
      namePlan: texts.planTwoYoutube, 
      price: 15.00, 
      description: [
        SimpleTextModel(
          title: texts.sixViewsHeader, 
          content: texts.sixViewsTextYoutube
        ),
        SimpleTextModel(
          title: texts.maxQualityHeader, 
          content: texts.maxQualityText
        ),
        SimpleTextModel(
          title: texts.noAdsYoutube, 
          content: texts.noAdsYoutubeText
        ),
      ]
    ),
  ];

  static List<PlansModel> dataPlansSpotify(AppLocalizations texts) => [
    PlansModel(
      id: '5', 
      namePlan: texts.planOneSpotify, 
      price: 5.00, 
      description: [
        SimpleTextModel(
          title: texts.yourAcount, 
          content: texts.yourAcountSpotify
        ),
        SimpleTextModel(
          title: texts.experienceSpotify, 
          content: texts.experienceSpotifyText
        ),
        SimpleTextModel(
          title: texts.noAdsSpotify, 
          content: texts.noAdsSpotifyText
        ),
      ]
    ),
    PlansModel(
      id: '6', 
      namePlan: texts.planTwoSpotify, 
      price: 12.00, 
      description: [
        SimpleTextModel(
          title: texts.sixViewsHeader, 
          content: texts.sixViewsTextSpotify
        ),
        SimpleTextModel(
          title: texts.experienceSpotify, 
          content: texts.experienceSpotifyText
        ),
        SimpleTextModel(
          title: texts.noAdsSpotify, 
          content: texts.noAdsSpotifyText
        ),
      ]
    ),
  ];
}