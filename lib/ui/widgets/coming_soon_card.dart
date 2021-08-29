part of 'widgets.dart';

class ComingSoonCard extends StatelessWidget {
  // untuk movienya
  final Movie movie;
  // untuk saat di tapnya
  final Function onTap;

  ComingSoonCard(this.movie, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: NetworkImage(imageBaseURL + "w780" + movie.backdropPath),
            fit: BoxFit.cover),
      ),
    );
  }
}
