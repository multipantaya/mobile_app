
import 'package:domain/domain.dart';
import 'package:mobile_app/widgets/widgets.dart';

class infoPlans {
  infoPlans._();
  static List<PlansModel> dataPlansNetflix(AppLocalizations texts) => [
    PlansModel(
      id: '1', 
      namePlan: texts.planOneNetflix, 
      price: 7.00,  
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
          title: texts.sixViewsHeaderNetflix, 
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
      price: 60.00, 
      description: [
        SimpleTextModel(
          title: texts.youtubeAnuality, 
          content: texts.youtubeAnualityText
        ),
        SimpleTextModel(
          title: texts.yourAcount, 
          content: texts.yourAcountYoutube
        ),
        SimpleTextModel(
          title: texts.maxQualityHeader, 
          content: texts.maxQualityTextYotube
        ),
        SimpleTextModel(
          title: texts.noAdsYoutube, 
          content: texts.noAdsYoutubeText
        ),
      ]
    ),
    // PlansModel(
    //   id: '4', 
    //   namePlan: texts.planTwoYoutube, 
    //   price: 15.00, 
    //   description: [
    //     SimpleTextModel(
    //       title: texts.youtubeAnuality, 
    //       content: texts.youtubeAnualityText
    //     ),
    //     SimpleTextModel(
    //       title: texts.sixViewsHeader, 
    //       content: texts.sixViewsTextYoutube
    //     ),
    //     SimpleTextModel(
    //       title: texts.maxQualityHeader, 
    //       content: texts.maxQualityTextYotube
    //     ),
    //     SimpleTextModel(
    //       title: texts.noAdsYoutube, 
    //       content: texts.noAdsYoutubeText
    //     ),
    //   ]
    // ),
  ];

  static List<PlansModel> dataPlansSpotify(AppLocalizations texts) => [
    PlansModel(
      id: '5', 
      namePlan: texts.planOneSpotify, 
      price: 6.00, 
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
      price: 13.00, 
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

  static List<PlansModel> dataPlansDisney(AppLocalizations texts) => [
    PlansModel(
      id: '1', 
      namePlan: texts.planOneDisneyPrime, 
      price: 5.00,  
      description: [
        SimpleTextModel(
          title: texts.yourAcount, 
          content: (texts.yourAcountNetflix).replaceAll('Netflix', 'Disney Plus')
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
      namePlan: texts.planTwoDisneyPrime,  
      price: 8.00, 
      description: [
        SimpleTextModel(
          title: texts.fourViewsHeader, 
          content: texts.fourViewsText
        ),
        SimpleTextModel(
          title: texts.maxQualityHeader, 
          content: texts.maxQualityText
        ),
        SimpleTextModel(
          title: texts.allAccessHeader,  
          content: (texts.allAccessText).replaceAll('Netflix', 'Disney Plus')
        ),
      ]
    ),
  ];

  // static List<PlansModel> dataPlansHboUsa(AppLocalizations texts) => [
  //   PlansModel(
  //     id: '1', 
  //     namePlan: texts.planOneNetflix, 
  //     price: 6.00,  
  //     description: [
  //       SimpleTextModel(
  //         title: texts.hboUsa, 
  //         content: texts.hboUsaText
  //       ),
  //       SimpleTextModel(
  //         title: texts.yourAcount, 
  //         content: texts.yourAcountNetflix.replaceAll('Netflix', 'HBO MAX')
  //       ),
  //       SimpleTextModel(
  //         title: texts.maxQualityHeader, 
  //         content: texts.maxQualityText
  //       ),
  //       SimpleTextModel(
  //         title: texts.allAccessHeader, 
  //         content: texts.allAccessText
  //       ),
  //     ]
  //   ),
  //   PlansModel(
  //     id: '2', 
  //     namePlan: texts.planTwoNetflix,  
  //     price: 15.00, 
  //     description: [
  //       SimpleTextModel(
  //         title: texts.hboUsa, 
  //         content: texts.hboUsaText
  //       ),
  //       SimpleTextModel(
  //         title: texts.sixViewsHeaderNetflix, 
  //         content: texts.sixViewsText
  //       ),
  //       SimpleTextModel(
  //         title: texts.maxQualityHeader, 
  //         content: texts.maxQualityText
  //       ),
  //       SimpleTextModel(
  //         title: texts.allAccessHeader, 
  //         content: texts.allAccessText.replaceAll('Netflix', 'HBO MAX')
  //       ),
  //     ]
  //   ),
  // ];

  static List<PlansModel> dataPlansHboLatam(AppLocalizations texts) => [
    PlansModel(
      id: '1', 
      namePlan: texts.planOneDisneyPrime, 
      price: 6.00,  
      description: [
        SimpleTextModel(
          title: texts.hboUsa.replaceAll('USA', 'LATAM'), 
          content: texts.hboLatamText
        ),
        SimpleTextModel(
          title: texts.yourAcount, 
          content: texts.yourAcountNetflix.replaceAll('Netflix', 'HBO MAX')
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
      namePlan: texts.planTwoDisneyPrime,  
      price: 12.00, 
      description: [
        SimpleTextModel(
          title: texts.hboUsa.replaceAll('USA', 'LATAM'), 
          content: texts.hboLatamText
        ),
        SimpleTextModel(
          title: texts.fourViewsHeader, 
          content: texts.fourViewsText
        ),
        SimpleTextModel(
          title: texts.maxQualityHeader, 
          content: texts.maxQualityText
        ),
        SimpleTextModel(
          title: texts.allAccessHeader, 
          content: texts.allAccessText.replaceAll('Netflix', 'HBO MAX')
        ),
      ]
    ),
  ];

  static List<PlansModel> dataPlansPrime(AppLocalizations texts) => [
    PlansModel(
      id: '1', 
      namePlan: texts.planOneDisneyPrime, 
      price: 7.00,  
      description: [
        SimpleTextModel(
          title: texts.yourAcount, 
          content: texts.yourAcountNetflix.replaceAll('Netflix', 'Prime Video')
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
      namePlan: texts.planTwoDisneyPrime,  
      price: 14.00, 
      description: [
        SimpleTextModel(
          title: texts.fourViewsHeader, 
          content: texts.fourViewsText
        ),
        SimpleTextModel(
          title: texts.maxQualityHeader, 
          content: texts.maxQualityText 
        ),
        SimpleTextModel(
          title: texts.allAccessHeader, 
          content: texts.allAccessText.replaceAll('Netflix', 'Prime Video')
        ),
      ]
    ),
  ];
}