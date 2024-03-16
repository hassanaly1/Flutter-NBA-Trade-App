import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/rich_text_field.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/helper/textfield.dart';
import 'package:readmore/readmore.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late final ExpansionTileController expansionTileController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColorHelper.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              stretch: true,
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              expandedHeight: context.height * 0.4,
              flexibleSpace: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const CustomAppBar(title: 'Post Title'),
                  Container(
                    height: context.height * 0.3,
                    decoration: const BoxDecoration(
                      color: MyColorHelper.white,
                    ),
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: context.height * 0.2,
                          enlargeCenterPage: true,
                          viewportFraction: 0.7,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2)),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://media.gettyimages.com/id/514703910/photo/boston-celtics-player-bill-russell-hooks-a-shot-during-the-nba-championships-final-game-in.jpg?s=612x612&w=0&k=20&c=wmaT4e8j7EpmDUla4KJxsGiBFzZzVdUSreLgq_FhTrw='),
                                    fit: BoxFit.cover),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ];
        },
        // body: CustomCommentWidget(
        //   expansionTileController: ExpansionTileController(),
        //   isExpanded: isExpanded,
        // ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://img.fanspo.com/image/fetch/c_fill,g_face,h_96,w_96/f_auto/https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Ftradenba-1000.appspot.com%2Fo%2Fprofile-avatar-images%252F2eNawaj074PprZmik2NOPFk7QSz1%252Favatar%3Falt%3Dmedia%26token%3Dceeb262f-3778-4d8d-b39d-6d2f9fedc971'),
                ),
                title: CustomTextWidget(
                  text: 'Strawther for Walsh',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
                subtitle: CustomTextWidget(
                  text: 's/general ⬤ Posted by u/southbeachclip 1 hour ago',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.start,
                ),
              ),
              const Description(
                  description:
                      'This would be a MASSIVE upgrade over Wiggins 29% from 3 and Moody 36%. Does anyone REALLY want to face the Warriors in the playoffs with a healthy Steph and Dray shooting more 3s than anyone on 38-40% as a team? Hell no! That\'s why this trade is worth the FRP. They will live and die by the 3 but they get hot they can torch anyone. Twolves... Nuggets... Lakers... So watch out Celtics... Curry could do something historical this year.'),
              SizedBox(height: context.height * 0.02),
              Container(
                padding: const EdgeInsets.all(12.0),
                color: Colors.grey.shade200,
                width: 800,
                child: Column(
                  children: [
                    MyQuillToolBar(
                      controller: QuillController.basic(),
                    ),
                    MyQuillEditor(
                      textStyles: const DefaultStyles(),
                      hints: 'Comment',
                      controller: QuillController.basic(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.height * 0.02),
              const CustomTextWidget(
                text: 'Comments',
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: context.height * 0.02),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => CustomCommentWidget(
                  expansionTileController: ExpansionTileController(),
                ),
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 30.0,
                    endIndent: 30.0,
                  );
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class Description extends StatelessWidget {
  final String description;
  const Description({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      description,
      style: const TextStyle(fontFamily: 'Roboto', fontSize: 12.0),
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Length,
      trimLength: 120,
      trimCollapsedText: ' Show more',
      trimExpandedText: ' Show less',
      moreStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
      lessStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
    );
  }
}

class CustomCommentWidget extends StatefulWidget {
  const CustomCommentWidget({
    super.key,
    required this.expansionTileController,
  });

  final ExpansionTileController expansionTileController;

  @override
  _CustomCommentWidgetState createState() => _CustomCommentWidgetState();
}

class _CustomCommentWidgetState extends State<CustomCommentWidget> {
  // Use local state for the expansion state
  RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.grey.shade200,
      maintainState: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      visualDensity: VisualDensity.comfortable,
      tilePadding: const EdgeInsets.all(12.0),
      controller: widget.expansionTileController,
      onExpansionChanged: (value) {
        isExpanded.value = value;
      },
      enabled: false,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: () {}, child: const Icon(Icons.favorite_border)),
          InkWell(
            onTap: () {
              widget.expansionTileController.expand();
            },
            child: const CustomTextWidget(
              text: 'Reply',
              fontSize: 14.0,
              textColor: Colors.black38,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(
            'https://img.fanspo.com/image/fetch/c_fill,g_face,h_96,w_96/f_auto/https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Ftradenba-1000.appspot.com%2Fo%2Fprofile-avatar-images%252F2eNawaj074PprZmik2NOPFk7QSz1%252Favatar%3Falt%3Dmedia%26token%3Dceeb262f-3778-4d8d-b39d-6d2f9fedc971'),
      ),
      title: const CustomTextWidget(
        text: 'Strawther for Walsh',
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.start,
      ),
      subtitle: const CustomTextWidget(
        text: 's/general ⬤ Posted by u/southbeachclip 1 hour ago',
        fontSize: 12.0,
        maxLines: 5,
        fontWeight: FontWeight.w300,
        textAlign: TextAlign.start,
      ),
      children: [
        CustomTextFormField(
          controller: TextEditingController(),
          hint: 'Write Comment',
          fillColor: MyColorHelper.white,
          maxLines: 3,
          sufixIcon: IconButton(
            onPressed: () {
              widget.expansionTileController.collapse();
            },
            icon: const Icon(Icons.keyboard_double_arrow_up_outlined),
          ),
        ),
      ],
    );
  }
}
