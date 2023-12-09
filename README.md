# AnimalsApp

This project is a SwiftUI app that displays a list of animals and their details. The app uses the MVVM architecture and the Combine framework. Core Data is used to persist the data. MapKit is used to display the location of the animals.

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* Xcode 15.0.1 or later
* iOS 17.0 or later

### Installation

1. Clone the repo
```sh
git clone https://github.com/Juanfr97/AnimalsApp
```

2. Open the project in Xcode
```sh
open AnimalsApp.xcodeproj
```

3. Build and run the project

## Usage

The app displays a list of animals and their details. The user can add new animals and edit or delete existing ones. Map view is used to display the location of the animals. The user must add a location to the animal in order to display it on the map with latitude and longitude.

## Entities

### Animal

| Property | Type | Description |
| --- | --- | --- |
| id | UUID | Unique identifier |
| name | String | Name of the animal |
| headline | String | Headline of the animal |
| description | String | Description of the animal |
| latitude | Double | Latitude of the animal's location |
| longitude | Double | Longitude of the animal's location |
| image | String | Image of the animal |

### Gallery

| Property | Type | Description |
| --- | --- | --- |
| id | UUID | Unique identifier |
| image | String | Animal image |
| animal | Animal | Animal that the image belongs to |

### Facts

| Property | Type | Description |
| --- | --- | --- |
| id | UUID | Unique identifier |
| fact | String | Fact about the animal |
| animal | Animal | Animal that the fact belongs to |

## Testing

### Adding new animals

To add a new animal, tap the plus button on the top right corner of the home screen. Fill in the fields and tap the save button on the end to save the animal. The animal will be added to the list of animals.

### Editing animals

To edit an animal, press the animal list item and tap the edit button on the context menu. Edit the fields and tap the save button on the end to save the changes. The animal will be updated in the list of animals.

### Deleting animals

To delete an animal, slide the animal list item to the left and tap the delete button. The animal will be deleted from the list of animals.

### Mock Data

You can use the following mock data to test the app:

```javascript
[
    {
        "name": "Nutria Asian Small-Clawed",
        "headline": "Las nutrias asian small clawed otter, también conocidas como nutrias enanas de uñas cortas, son mamíferos semiacuáticos que se encuentran en Asia. Son conocidas por su sociabilidad y habilidades para usar sus garras cortas para manipular objetos y alimentos en su entorno acuático.",
        "description": "La nutria asian small clawed otter (Amblonyx cinereus) es una especie de la familia Mustelidae y es la más pequeña de todas las especies de nutrias. Se distingue por sus garras cortas y su capacidad para utilizarlas hábilmente. Estas nutrias son animales sociales y suelen vivir en grupos familiares. Pasan la mayor parte de su tiempo en el agua, donde cazan y se alimentan de una variedad de presas acuáticas.",
        "link": "https://en.wikipedia.org/wiki/Asian_small-clawed_otter",
        "image": "https://i.redd.it/04rwloagnx551.jpg",
        "gallery": [
            "https://i.ytimg.com/vi/VcF8U1FAjoc/maxresdefault.jpg",
            "https://i.ytimg.com/vi/BgkVsTNTebM/sddefault.jpg",
        ],
        "fact": [
            "Las nutrias asian small clawed otter son conocidas por su comportamiento social y a menudo forman grupos familiares.",
            "Utilizan sus garras cortas para capturar presas y manipular objetos en su entorno acuático.",
            "Son muy ágiles en el agua y pueden nadar rápidamente para cazar peces y otros animales acuáticos."
        ],
        "latitude": 25.0329694,
        "longitude": 121.5654177
    }
    ,
    {
      "name" : "Leon",
      "headline" : "Los leones, los felinos más sociables del mundo, deambulan por las sabanas y praderas del continente africano, cazando en cooperación y criando cachorros en manadas. ",
      "description" : "El león (Panthera leo) es una especie de la familia Felidae y miembro del género Panthera. Se reconoce sobre todo por su cuerpo musculoso y de pecho profundo, su cabeza corta y redondeada, sus orejas redondas y un mechón peludo al final de la cola. Es sexualmente dimórfico; los leones machos adultos tienen una melena prominente. Con una longitud típica entre la cabeza y el cuerpo de 184-208 cm, son más grandes que las hembras, con 160-184 cm. Es una especie social que forma grupos denominados manadas. Una manada de leones está formada por algunos machos adultos, hembras emparentadas y cachorros. Los grupos de leones hembras suelen cazar juntos, sobre todo grandes ungulados. ",
      "image" : "https://cdn0.bioenciclopedia.com/es/posts/2/3/0/leon_32_600_square.jpg",
      "gallery" : [
        "https://static.nationalgeographic.es/files/styles/image_3200/public/01-lion-populations-nationalgeographic_1777804.jpg?w=1600&h=900",
        "https://www.ngenespanol.com/wp-content/uploads/2023/02/leon-como-es-el-rey-de-la-selva-y-cuales-son-sus-caracteristicas.jpg",
        "https://www.ngenespanol.com/wp-content/uploads/2023/08/dia-mundial-del-leon-curiosidades-sobre-el-rey-de-la-sabana.jpg",
        "https://concepto.de/wp-content/uploads/2019/05/leon-sabana-africa-e1559242836802.jpg"
      ],
      "fact" : [
          "Las leonas crían a los cachorros y también son las principales cazadoras",
          "Los leones son los únicos felinos que viven en grupos. Una manada, puede tener hasta 30 leones, dependiendo de la cantidad de comida y agua disponible",
          "Sin su pelaje, los cuerpos del león y del tigre son tan parecidos que sólo los expertos pueden diferenciarlos"
      ],
      "latitude" : -2.3333333,
      "longitude" : 34.8333333
    },
      {
        "name": "Elefante",
        "headline": "Los elefantes, los animales terrestres más grandes, son conocidos por su inteligencia, fuertes vínculos sociales y trompas distintivas.",
        "description": "Los elefantes son mamíferos grandes de la familia Elephantidae y el orden Proboscidea. Actualmente se reconocen tres especies: el elefante africano de sabana, el elefante africano de bosque y el elefante asiático. Son herbívoros y se encuentran en diversos hábitats, incluyendo sabanas, bosques y desiertos. Los elefantes son conocidos por sus largas trompas, colmillos y grandes orejas.",
        "image": "https://files.worldwildlife.org/wwfcmsprod/images/elephants_at_water_hole_WW2122503_Anup_Shah/story_full_width/7ozyekgso2_Medium_WW2122503.jpg",
        "gallery": [
          "https://www.nationalgeographic.com.es/medio/2020/03/04/elefante-en-el-parque-nacional-de-amboseli-con-el-kilimanjaro-al-fondo_4308fa58_800x800.jpg",
          "https://www.nationalgeographic.com.es/medio/2023/04/28/agarran-los-objetos-envolviendolos-con-la-trompa_9626e53e_358525301_230428113115_800x800.jpg",
          "https://d7lju56vlbdri.cloudfront.net/var/ezwebin_site/storage/images/_aliases/seo/noticias/efectos-a-largo-plazo-de-la-caza-furtiva-los-elefantes-sin-madre-sobreviven-menos/9204524-1-esl-MX/Efectos-a-largo-plazo-de-la-caza-furtiva-los-elefantes-sin-madre-sobreviven-menos.jpg"
        ],
        "fact": [
          "Los elefantes son capaces de experimentar una amplia gama de emociones, incluyendo alegría, enojo, dolor y juego.",
          "La trompa de un elefante tiene más de 40,000 músculos y tendones.",
          "Los elefantes tienen un fuerte sentido de la familia y se sabe que lamentan a sus muertos."
        ],
        "latitude" : -23.9883848,
        "longitude" : 31.5525515
      },
      {
        "name": "Delfín",
        "headline": "Los delfines, mamíferos marinos altamente inteligentes, son conocidos por su comportamiento lúdico y habilidades de comunicación.",
        "description": "Los delfines son un grupo ampliamente distribuido de mamíferos marinos conocidos por su inteligencia, comportamiento social y exhibiciones acrobáticas. Pertenecen a la familia Delphinidae y se encuentran en océanos y mares de todo el mundo. Los delfines son carnívoros y se alimentan de una variedad de peces y calamares. Son conocidos por su naturaleza juguetona y a menudo interactúan con los humanos.",
        "image": "https://images.dolphinaris.com/images/2015/03/5-curiosidades-sobre-los-delfines-Dolphinaris.jpg",
        "gallery": [
          "https://www.delphinusworld.com/hubfs/Delph_Portada7_DatosDeLosDelfines.jpg",
          "https://aquaworld.com.mx/uploads/0000/1/2023/06/15/15-hechos-curiosos-sobre-delfines-1100x619.jpg",
          "https://imagenes.muyinteresante.es/files/composte_image/uploads/2023/05/12/645df57d041b4.jpeg"
        ],
        "fact": [
          "Los delfines utilizan un sistema complejo de clics y silbidos para comunicarse entre sí.",
          "Algunas especies de delfines pueden nadar a velocidades de hasta 37 mph (60 km/h).",
          "Los delfines han sido conocidos por salvar a los humanos de tiburones y guiar a nadadores perdidos de regreso a la orilla."
        ],
        "latitude" : -18.7305642,
        "longitude" : 24.4292148
      },
      {
        "name": "Tigre",
        "headline": "Los tigres, depredadores poderosos, son conocidos por sus distintivos pelajes naranjas con rayas negras y su naturaleza solitaria.",
        "description": "El tigre (Panthera tigris) es la especie de felino más grande y miembro del género Panthera. Los tigres son nativos de varios hábitats en Asia y son conocidos por su constitución poderosa, patrón de pelaje distintivo y habilidades formidables de caza. Son animales solitarios y se sabe que son capaces de nadar. Los tigres están en peligro de extinción, con varias subespecies ya extintas.",
        "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Tigress_at_Jim_Corbett_National_Park.jpg/250px-Tigress_at_Jim_Corbett_National_Park.jpg",
        "gallery": [
          "https://s1.eestatic.com/2023/07/29/ciencia/782681856_235038553_1706x960.jpg",
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Sumatratiger-004.jpg/220px-Sumatratiger-004.jpg",
          "https://files.worldwildlife.org/wwfcmsprod/images/Tiger_resting_Bandhavgarh_National_Park_India/hero_small/6aofsvaglm_Medium_WW226365.jpg"
        ],
        "fact": [
          "Los tigres son excelentes nadadores y a menudo se refrescan descansando en estanques o arroyos.",
          "Un grupo de tigres se conoce como una 'racha' o un 'emboscada'.",
          "Los tigres tienen manchas blancas distintivas en la parte posterior de sus orejas llamadas 'manchas oculares' que imitan ojos y pueden disuadir a posibles atacantes."
        ],
        "latitude" : -18.8555909,
        "longitude" : 16.327131
      }
]
```

## Screenshots

| ![HomeScreen](<Simulator Screenshot - iPhone 15 Pro - 2023-12-08 at 17.47.35.png>) | ![Add new animal](<Simulator Screenshot - iPhone 15 Pro - 2023-12-08 at 17.54.10.png>) | ![Animal list](<Simulator Screenshot - iPhone 15 Pro - 2023-12-08 at 17.54.51.png>) |
|:---:|:---:|:---:|
| ![Animal detail](<Simulator Screenshot - iPhone 15 Pro - 2023-12-08 at 17.55.02.png>) | ![Animal location](<Simulator Screenshot - iPhone 15 Pro - 2023-12-08 at 17.55.13.png>) | ![Edit view](<Simulator Screenshot - iPhone 15 Pro - 2023-12-08 at 18.00.37.png>)|
