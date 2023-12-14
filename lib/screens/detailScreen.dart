import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tix_id/constants.dart';
import '../colors.dart';
import '../models/movie.dart';

class detailScreen extends StatelessWidget {
  const detailScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: MediaQuery.of(context).size.height *0.03,
              width: MediaQuery.of(context).size.width *0.06,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *0.01,
                left: MediaQuery.of(context).size.height *0.01
              ),
              decoration: BoxDecoration(
                color: colors.scaffoldBgColor,
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height *0.01)
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_rounded
                )
              ),
            ),
            backgroundColor: colors.scaffoldBgColor,
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(MediaQuery.of(context).size.height * 0.03),
                  bottomRight: Radius.circular(MediaQuery.of(context).size.height * 0.03)
                ),
                child: Image.network(
                  '${Constants.imagePath}${movie.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
              child : Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    'Overview',
                    style: GoogleFonts.openSans(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                    child: Text(
                      movie.overview,
                      style: GoogleFonts.openSans(
                        fontSize: MediaQuery.of(context).size.height * 0.0175,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.justify
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.01)
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Release date: ',
                                style: GoogleFonts.openSans(
                                  fontSize: MediaQuery.of(context).size.height * 0.0175,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                movie.releaseDate,
                                style: GoogleFonts.openSans(
                                  fontSize: MediaQuery.of(context).size.height * 0.0175,
                                  fontWeight: FontWeight.normal
                                ),                                
                              )
                            ]
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                        Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.01)
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Rating: ',
                                style: GoogleFonts.openSans(
                                  fontSize: MediaQuery.of(context).size.height * 0.0175,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: colors.ratingColor,
                                size: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                '${movie.voteAverage.toStringAsFixed(1)}/10',
                                style: GoogleFonts.openSans(
                                  fontSize: MediaQuery.of(context).size.height * 0.0175,
                                  fontWeight: FontWeight.normal
                                ),                                
                              )
                            ]
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              ),
          )
        ],
      ),
    );
  }
}