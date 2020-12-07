import 'package:flutter/material.dart';

import '../model/category.dart';
import '../model/meal.dart';

const DUMMY_CATEGORIES = const [
  Category(
    id: 'c1',
    title: 'Praia',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c2',
    title: 'Montanha',
    color: Colors.lightBlueAccent,
  ),
  Category(
    id: 'c3',
    title: 'Campo',
    color: Colors.blue,
  ),
  Category(
    id: 'c4',
    title: 'Cidade',
    color: Colors.blueAccent,
  ),
  Category(
    id: 'c5',
    title: 'Nacional',
    color: Colors.indigo,
  ),
  Category(
    id: 'c6',
    title: 'Internacional',
    color: Colors.lightBlue,
  ),
];

const DUMMY_MEALS = const [
  Meal(
    id: 'm1',
    categories: ['c1', 'c5'],
    title: 'Fernando de Noronha',
    cost: Cost.Expensive,
    complexity: Complexity.Medium,
    imageUrl:
        'http://www.noronha.pe.gov.br/arqConteudo/arqBanner/banner5.png',
    duration: '5h 30min',
    details: [
      'Fernando de Noronha é um arquipélago brasileiro do estado de Pernambuco. Formado por 21 ilhas, ilhotas e rochedos de origem vulcânica, ocupa uma área total de 26 km² — dos quais 17 km² são da ilha principal — e se situa no Oceano Atlântico a nordeste do Brasil continental',
    ],
    steps: [
      
     
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm2',
    categories: ['c1', 'c6'],
    title: 'Maldivas',
    cost: Cost.Expensive,
    complexity: Complexity.Difficult,
    imageUrl:
        'https://i2.wp.com/passageirodeprimeira.com/wp-content/uploads/2019/12/Conrad-Maldivas-2-scaled.jpg?resize=2560%2C1715&ssl=1',
    duration: '1d 10h',
    details: [
      'A República das Maldivas é um pequeno país insular situado no Oceano Índico ao sudoeste do Sri Lanka e da Índia, ao sul do continente asiático, constituído por 1 196 ilhas, das quais 203 são habitadas, localizadas a cerca de 450 km ao sul da península do Decão. ',
      'A sua única fronteira real é com o território indiano das Laquedivas, a norte, mas são também os vizinhos mais próximos do Território Britânico do Oceano Índico, um conjunto de ilhas localizadas ao sul das Maldivas.',

    ],
    steps: [
      
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm3',
    categories: ['c2', 'c5'],
    title: 'Garanhuns',
    cost: Cost.Fair,
    complexity: Complexity.Simple,
    imageUrl:
        'https://img.itinari.com/pages/images/original/8c98e9ec-aae8-4e42-a484-6ce6f0c3309f-floral_clock_-_garanhuns-_pernambuco-_brazil-2.jpg?ch=DPR&dpr=1&w=1600&s=7bb4fbc448cb46e5c5928edbaa73a0ae',
    duration: '2h 50min',
    details: [
      'Garanhuns está situada no planalto da Borborema, entre sete colinas: Monte Sinai, Triunfo, Columinho, Ipiranga, Antas, Magano e Quilombo, proporcionando clima de montanha, à 896 metros acima do nível do mar, sendo o principal Município do Agreste Meridional, distante apenas 230km da Capital do Estado Pernambuco.',
      'Garanhuns é conhecida como a “Cidade das Flores”, “Terra da Garoa”, “Suíça Pernambucana”, “Cidade do clima maravilhoso”, entre outros títulos. A paisagem permanentemente verde, a exuberância das flores espalhadas por suas praças, o clima frio e o ar europeu também foram as responsáveis pelos carinhosos títulos. São referências às características marcantes e diferenciadas desta cidade que é um verdadeiro oásis no Agreste Pernambucano.',

    ],
    steps: [
      
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm4',
    categories: ['c2', 'c6'],
    title: 'Machu Picchu',
    cost: Cost.Expensive,
    complexity: Complexity.Medium,
    imageUrl:
        'https://ca-times.brightspotcdn.com/dims4/default/66e69b2/2147483647/strip/true/crop/580x419+0+0/resize/840x607!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fae%2Fca%2F1421747955c2b3621a198e050bd4%2Flat-100-facts-for-100-years-of-machu-picchu-fa-002',
    duration: '8h 50min',
    details: [
      'Machu Picchu (em quíchua Machu Picchu, "velha montanha"),[1] também chamada "cidade perdida dos Incas",[2] é uma cidade pré-colombiana bem conservada, localizada no topo de uma montanha, a 2 400 metros de altitude, no vale do rio Urubamba, atual Peru.',
      'Foi construída no século XV, sob as ordens de Pachacuti. O local é, provavelmente, o símbolo mais típico do Império Inca, quer devido à sua original localização e características geológicas, quer devido à sua descoberta tardia em 1911. Apenas cerca de 30% da cidade é de construção original, o restante foi reconstruído. As áreas reconstruídas são facilmente reconhecidas, pelo encaixe entre as pedras. A construção original é formada por pedras maiores, e com encaixes com pouco espaço entre as rochas.',

    ],
    steps: [
     
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm5',
    categories: ['c3', 'c5'],
    title: 'Caminhos de Pedra',
    cost: Cost.Cheap,
    complexity: Complexity.Simple,
    imageUrl:
        'https://www.feriasbrasil.com.br/fotosfb/279309081-MOB.jpg',
    duration: '1h 40min',
    details: [
      'Bastam poucos minutos na região de Bento Gonçalves, no Rio Grande do Sul, para perceber o sotaque carregado de seus moradores, em sua imensa maioria descendentes de imigrantes italianos. Os vestígios do passado também estão nos nomes das ruas, nas placas dos estabelecimentos (que levam o sobrenome das famílias) e, como não poderia deixar de ser, no turismo. A imigração italiana do fim do século 19 é tema presente neste canto do país!',
      
    ],
    steps: [
      
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm6',
    categories: ['c3', 'c5'],
    title: 'Vale do Café',
    cost: Cost.Fair,
    complexity: Complexity.Simple,
    imageUrl:
        'https://www.trilhaseaventuras.com.br/wp-content/uploads/2016/10/Vale-do-Caf%C3%A9-Fazendas-Hist%C3%B3ricas-RJ-05.jpg',
    duration: '1h',
    details: [
      'História, natureza, arte, cultura, além de boa música. Tudo isso você encontra no Vale do Café, região que abrange 15 municípios* no interior do Rio. Do glamour dos áureos tempos - quando chegou a produzir 75% do café consumido no mundo - sobrou pouco, mas a região desponta para o turismo histórico e de experiência, com mais de 30 fazendas históricas, que outrora produziam café, abertas à visitação.',

    ],
    steps: [
     
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm7',
    categories: ['c4', 'c5'],
    title: 'São Paulo',
    cost: Cost.Cheap,
    complexity: Complexity.Simple,
    imageUrl:
        'https://arc-anglerfish-eu-central-1-prod-prisa.s3.amazonaws.com/public/FQ36D3BPPI3HF2T6ICX2NPWLUY.jpg',
    duration: '0h',
    details: [
      'São Paulo é um município brasileiro, capital do estado homônimo e principal centro financeiro, corporativo e mercantil da América do Sul. É a cidade mais populosa do Brasil, do continente americano, da lusofonia e de todo o hemisfério sul. São Paulo é a cidade brasileira mais influente no cenário global, sendo, em 2016, a 11.ª cidade mais globalizada do planeta,[10] recebendo a classificação de cidade global alfa, por parte do Globalization and World Cities Study Group & Network (GaWC). O lema da cidade, presente em seu brasão oficial, é Non ducor, duco, frase latina que significa "Não sou conduzido, conduzo".',

    ],
    steps: [
     
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm8',
    categories: ['c4', 'c5'],
    title: 'Rio de Janeiro',
    cost: Cost.Fair,
    complexity: Complexity.Simple,
    imageUrl:
        'https://jpimg.com.br/uploads/2020/09/rio-de-janeiro-praia-lotada.jpg',
    duration: '1h',
    details: [
      'Rio de Janeiro é um município brasileiro, capital do estado homônimo, situado no Sudeste do país. Maior destino turístico internacional no Brasil, da América Latina e de todo o Hemisfério Sul, a capital fluminense é a cidade brasileira mais conhecida no exterior, funcionando como um "espelho", ou "retrato" nacional, seja positiva ou negativamente. É a segunda maior metrópole do Brasil (depois de São Paulo), a sexta maior da América e a trigésima quinta do mundo.',

    ],
    steps: [
      
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm9',
    categories: ['c4', 'c6'],
    title: 'Londres',
    cost: Cost.Expensive,
    complexity: Complexity.Difficult,
    imageUrl:
        'https://www.euandopelomundo.com/wp-content/uploads/2015/03/londres_big_ben.jpg',
    duration: '12h',
    details: [
      'Londres é a capital da Inglaterra e do Reino Unido. Por dois milênios, foi um grande povoado e sua história remonta à sua fundação pelos romanos, quando foi nomeada Londínio. O centro de Londres, a antiga City of London, também conhecida como The Square Mile ("a milha quadrada") ou The City, mantém suas fronteiras medievais. Pelo menos desde o século XIX, o nome "Londres" se refere à metrópole desenvolvida em torno desse núcleo. Hoje, a maior parte dessa conurbação constitui a região da Grande Londres, cuja área administrativa tem seu próprio prefeito eleito e assembleia.',

    ],
    steps: [
      
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
 
];