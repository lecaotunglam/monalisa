import 'package:flutter/material.dart';

class ArtworkWidget extends StatefulWidget {

  const ArtworkWidget({Key? key}) : super(key: key);

  @override
  State<ArtworkWidget> createState() => _ArtworkWidgetState();

}

class _ArtworkWidgetState extends State<ArtworkWidget> {
  bool _isFavorite = false;
  bool _showDescription = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Museum')),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  Center(
                    child: SizedBox(
                    width: 400, // Adjust the width as needed
                    height: 500, // Adjust the height as needed
                    child: Image.asset(
                      'images/Mona_Lisa.jpg',
                      fit: BoxFit.cover, // Adjust the fit property as needed
                    ),
                  ),),
                  if (_isFavorite)
                    Align(
                      alignment: Alignment.center,
                      child: Opacity(
                        opacity: _isFavorite ? 1.0 : 0.75,
                        child: Icon(
                        Icons.favorite,
                        size: 100,
                        color: _isFavorite ? Colors.red : Colors.white,
                    ),
                  )),
                  Visibility(
                    visible: _showDescription, // Toggle visibility based on _showDescription
                    child: const Positioned(
                            bottom: 20, // Adjust the bottom position as needed
                            left: 20, // Adjust the left position as needed
                            right: 20, // Adjust the right position as needed
                            child: Text(
                                    "La Joconde, ou Portrait de Mona Lisa, est un tableau de Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 1516 , et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci."
                                    "La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au XXIe siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                          ), // Text to display when _showDescription is true
                  ),
                ],
              ),
              const SizedBox(height: 10), // Add some spacing
              const Text('MonaLisa', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.brown)),
              const SizedBox(height: 5), // Add some spacing
              const Text('Léonard DeVinci', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.brown)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.article),
                      onPressed: (){setState(() {
                        _showDescription = !_showDescription; // Toggle the value of _isFavorite
                      });},
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      onPressed: (){setState(() {
                        _isFavorite = !_isFavorite; // Toggle the value of _isFavorite
                        if (_isFavorite) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Oeuvre ajoutée à vos favoris'),
                            ),
                          );
                        }
                      });},
                      color: _isFavorite ? Colors.red : Colors.brown, // Change the color based on _isFavorite
                    ),
                  ]
              )
            ],
          )
      ),
    );
  }
}
