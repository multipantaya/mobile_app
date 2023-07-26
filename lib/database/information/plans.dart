
import 'package:domain/domain.dart';
import 'package:mobile_app/widgets/widgets.dart';

class infoPlans {
  infoPlans._();
  static List<PlansModel> dataPlansNetflix(AppLocalizations texts) => [
    PlansModel(
      id: '1', 
      namePlan: 'Basico', 
      price: 6.00, 
      description: [
        SimpleTextModel(
          title: 'Streaming en calidad Ultra HD (4K):', 
          content: 'Puedes disfrutar del contenido en la más alta calidad disponible. Esto significa que podrás ver películas y series en resolución 4K en televisores compatibles, lo que ofrece una imagen más nítida, colores vibrantes y detalles impresionantes.'
        ),
        SimpleTextModel(
          title: 'Acceso al catálogo completo:', 
          content: 'El plan Premium te brinda acceso ilimitado a todo el catálogo de contenido de Netflix. Puedes explorar y ver todas las películas, series, documentales y programas originales disponibles en la plataforma sin limitaciones.'
        ),
      ]
    ),
    PlansModel(
      id: '2', 
      namePlan: 'Premium', 
      price: 15.00, 
      description: [
        SimpleTextModel(
          title: 'Hasta seis pantallas simultáneas:', 
          content: 'Este plan te permite ver contenido en hasta seis dispositivos diferentes al mismo tiempo. Puedes compartir tu cuenta con familiares o amigos y disfrutar de tus programas favoritos sin restricciones, incluso si cada persona desea ver algo diferente en diferentes dispositivos.'
        ),
        SimpleTextModel(
          title: 'Streaming en calidad Ultra HD (4K):', 
          content: 'Puedes disfrutar del contenido en la más alta calidad disponible. Esto significa que podrás ver películas y series en resolución 4K en televisores compatibles, lo que ofrece una imagen más nítida, colores vibrantes y detalles impresionantes.'
        ),
        SimpleTextModel(
          title: 'Acceso al catálogo completo:', 
          content: 'El plan Premium te brinda acceso ilimitado a todo el catálogo de contenido. Puedes explorar y ver todas las películas, series, documentales y programas originales disponibles en la plataforma sin limitaciones.'
        ),
      ]
    ),
  ];

  static List<PlansModel> dataPlansYoutube(AppLocalizations texts) => [
    PlansModel(
      id: '3', 
      namePlan: 'Basico', 
      price: 6.00, 
      description: [
        SimpleTextModel(
          title: 'Streaming en calidad Ultra HD (4K):', 
          content: 'Puedes disfrutar del contenido en la más alta calidad disponible. Esto significa que podrás ver contenido en resolución 4K en televisores compatibles, lo que ofrece una imagen más nítida, colores vibrantes y detalles impresionantes.'
        ),
        SimpleTextModel(
          title: ' Sin Anuncios, sin Interrupciones:', 
          content: 'Disfruta de YouTube sin interrupciones publicitarias con YouTube Premium. Accede a tus videos favoritos, series originales y música sin anuncios molestos. ¡Sumérgete en un mundo de entretenimiento ininterrumpido!.'
        ),
      ]
    ),
    PlansModel(
      id: '4', 
      namePlan: 'Premium', 
      price: 15.00, 
      description: [
        SimpleTextModel(
          title: 'Hasta seis pantallas simultáneas:', 
          content: 'Este plan te permite ver contenido en hasta seis dispositivos diferentes al mismo tiempo. Puedes compartir tu cuenta con familiares o amigos y disfrutar de tus programas favoritos sin restricciones, incluso si cada persona desea ver algo diferente en diferentes dispositivos.'
        ),
        SimpleTextModel(
          title: 'Streaming en calidad Ultra HD (4K):', 
          content: 'Puedes disfrutar del contenido en la más alta calidad disponible. Esto significa que podrás ver películas y series en resolución 4K en televisores compatibles, lo que ofrece una imagen más nítida, colores vibrantes y detalles impresionantes.'
        ),
        SimpleTextModel(
          title: ' Sin Anuncios, sin Interrupciones:', 
          content: 'Disfruta de YouTube sin interrupciones publicitarias con YouTube Premium. Accede a tus videos favoritos, series originales y música sin anuncios molestos. ¡Sumérgete en un mundo de entretenimiento ininterrumpido!.'
        ),
      ]
    ),
  ];

  static List<PlansModel> dataPlansSpotify(AppLocalizations texts) => [
    PlansModel(
      id: '5', 
      namePlan: 'Basico', 
      price: 5.00, 
      description: [
        SimpleTextModel(
          title: 'Descubre la Experiencia Premium de Spotify:', 
          content: 'Vive la música de una manera completamente nueva con Spotify Premium. Descubre un amplio catálogo de canciones, crea listas de reproducción personalizadas y escucha música en cualquier momento y lugar, incluso sin conexión.'
        ),
        SimpleTextModel(
          title: 'Música Sin Anuncios y Sin Interrupciones:', 
          content: 'Disfruta de la música que amas sin interrupciones publicitarias con Spotify Premium. Sumérgete en un mundo de melodías sin anuncios molestos y disfruta de tus canciones favoritas de principio a fin, sin interrupciones.'
        ),
      ]
    ),
    PlansModel(
      id: '6', 
      namePlan: 'Premium', 
      price: 12.00, 
      description: [
        SimpleTextModel(
          title: 'Hasta seis dispositivos en simultáneo:', 
          content: 'Este plan te permite escuchar contenido en hasta seis dispositivos diferentes al mismo tiempo. Puedes compartir tu cuenta con familiares o amigos y disfrutar de tus programas favoritos sin restricciones, incluso si cada persona desea ver escuchar diferente en diferentes dispositivos.'
        ),
        SimpleTextModel(
          title: 'Descubre la Experiencia Premium de Spotify:', 
          content: 'Vive la música de una manera completamente nueva con Spotify Premium. Descubre un amplio catálogo de canciones, crea listas de reproducción personalizadas y escucha música en cualquier momento y lugar, incluso sin conexión.'
        ),
        SimpleTextModel(
          title: 'Música Sin Anuncios y Sin Interrupciones:', 
          content: 'Disfruta de la música que amas sin interrupciones publicitarias con Spotify Premium. Sumérgete en un mundo de melodías sin anuncios molestos y disfruta de tus canciones favoritas de principio a fin, sin interrupciones.'
        ),
      ]
    ),
  ];
}