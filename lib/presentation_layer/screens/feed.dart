// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:spaces/spaces.dart';
import 'package:spotlas_feed/data_layer/spotlas_model.dart';
import 'package:spotlas_feed/bloc_layer/feed_bloc/spotlas_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  final SpotlasBloc _feedBloc = SpotlasBloc();

  @override
  void initState() {
    _feedBloc.add(GetSpotlasList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: _buildFeedList(),
    );
  }

  Widget _buildFeedList() {
    return BlocProvider(
      create: (_) => _feedBloc,
      child: BlocListener<SpotlasBloc, SpotlasState>(
        listener: (context, state) {
          if (state is SpotlasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<SpotlasBloc, SpotlasState>(
          builder: (context, state) {
            if (state is SpotlasInitial) {
              return _loadingList();
            } else if (state is SpotlasLoading) {
              return _loadingList();
            } else if (state is SpotlasLoaded) {
              return _cardBuilder(context, state.spotlasModel);
            } else if (state is SpotlasError) {
              return const Center(child: Text('Feed Error! Check your internet connection.'));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _cardBuilder(BuildContext context, List<SpotlasModel> model) {
    final spacing = Spacing.of(context);

    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    aspectRatio: 4 / 5,
                  ),
                  items: model[index].media?.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 0.0),
                            child: Image.network(
                              fit: BoxFit.cover,
                              '${i.url}',
                            ));
                      },
                    );
                  }).toList(),
                ),
                ListTile(
                  horizontalTitleGap: 0,
                  contentPadding:
                      EdgeInsets.only(top: spacing.spaces.small, right: spacing.spaces.normal),
                  minLeadingWidth: 0,
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.red,
                    child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage('${model[index].author?.photoUrl}')),
                  ),
                  title: Text("${model[index].author?.username}", style: titleText),
                  subtitle: Text("${model[index].author?.fullName}", style: subtitleText),
                  trailing: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 6.0)],
                    size: 30,
                  ),
                  isThreeLine: false,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ListTile(
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.only(
                        top: spacing.spaces.small,
                        right: spacing.spaces.normal,
                        bottom: spacing.spaces.semiSmall),
                    leading: Container(
                      height: double.infinity,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage('${model[index].spot?.logo?.url}')),
                      ),
                    ),
                    title: Text("${model[index].spot?.name}", style: titleText),
                    subtitle: Text(
                      "${model[index].spot?.location?.display} • ${model[index].spot?.location?.display}",
                      style: subtitleText,
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.star_outline,
                        shadows: <Shadow>[
                          Shadow(color: Colors.black.withOpacity(0.8), blurRadius: 6.0)
                        ],
                        size: 35,
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                width: double.infinity,
                height: 33,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/map.png'),
                    Image.asset('assets/bubble.png'),
                    Image.asset('assets/like.png'),
                    Image.asset('assets/plane.png'),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ExpandableText(
                    "${model[index].author?.username}  ${model[index].caption?.text} . This place is super awesome! After hearing about it I couldn't to go and see for myself. So much flavor, great service, affordable prices. I can't wait to visit again. They are open late and serve breakfast and lunch hours too. Highly recommended!",
                    expandText: 'more',
                    collapseText: 'less',
                    maxLines: 2,
                    linkColor: Colors.grey,
                    style: captionText,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SizedBox(width: 10),
                  Chip(
                      elevation: 5,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      label: Text(
                        "Outdoors",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  SizedBox(width: 4),
                  Chip(
                      elevation: 5,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      label: Text(
                        "Cheap",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  SizedBox(width: 4),
                  Chip(
                      elevation: 5,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      label: Text(
                        "Live Music",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  SizedBox(width: 4),
                  Chip(
                      elevation: 5,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      label: Text(
                        "Fancy",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  SizedBox(width: 4),
                  Chip(
                      elevation: 5,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      label: Text(
                        "Romantic",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  SizedBox(width: 4),
                  Chip(
                      elevation: 5,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      label: Text(
                        "International",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  SizedBox(width: 4),
                  Chip(
                      elevation: 5,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      label: Text(
                        "Hipster",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0, left: 10),
                  child: Text('4 days ago',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ))
          ],
        );
      },
    );
  }

  Widget _loadingList() => const Center(child: CircularProgressIndicator());
}

var titleText = TextStyle(
    fontSize: 20,
    height: 1.4, //line height 150% of actual height
    color: Colors.white,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        offset: const Offset(0.0, 0.0), //position of shadow
        blurRadius: 3.0, //blur intensity of shadow
        color: Colors.black.withOpacity(0.8), //color of shadow with opacity
      ),
    ]);

var subtitleText = TextStyle(
    fontSize: 17,
    height: 1.2, //line height 150% of actual height
    color: Colors.white,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        offset: const Offset(0.0, 0.0), //position of shadow
        blurRadius: 4.0, //blur intensity of shadow
        color: Colors.black.withOpacity(0.8), //color of shadow with opacity
      ),
    ]);

var captionUser = TextStyle(
    fontSize: 17,
    height: 1.2, //line height 150% of actual height
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        offset: const Offset(0.0, 0.0), //position of shadow
        blurRadius: 4.0, //blur intensity of shadow
        color: Colors.black.withOpacity(0.5), //color of shadow with opacity
      ),
    ]);

var captionText = TextStyle(
    fontSize: 17,
    height: 1.2, //line height 150% of actual height
    fontWeight: FontWeight.w400,
    shadows: [
      Shadow(
        offset: const Offset(0.0, 0.0), //position of shadow
        blurRadius: 3.0, //blur intensity of shadow
        color: Colors.black.withOpacity(0.5), //color of shadow with opacity
      ),
    ]);
