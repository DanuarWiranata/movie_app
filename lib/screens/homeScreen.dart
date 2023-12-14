import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tix_id/api/api.dart';
import 'package:tix_id/models/movie.dart';
import 'package:tix_id/widgets/MoviesSlider.dart';
import 'package:tix_id/widgets/TrendingSlider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  late Future<List<Movie>> TrendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState(){
    super.initState();
    TrendingMovies = Api().getTrendingMov();
    topRatedMovies = Api().getTopRatedMov();
    upcomingMovies = Api().getUpcomingMov();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/NETPLIK.png',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.04,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Movies',
                style: GoogleFonts.aBeeZee(fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: TrendingMovies,
                  builder: ((context, snapshot) {
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData){
                      return TrendingSlider(snapshot: snapshot);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  })
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              //Top Rated Movies Text
              Text(
                'Top Rated Movies',
                style: GoogleFonts.aBeeZee(fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData){
                      return MoviesSlider(snapshot: snapshot);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              //Upcmong Movies Text
              Text(
                'Upcoming Movies',
                style: GoogleFonts.aBeeZee(fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData){
                      return MoviesSlider(snapshot: snapshot);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}