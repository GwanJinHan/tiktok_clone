import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: Sizes.size3,
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size3,
              right: Sizes.size5,
              bottom: Sizes.size5,
            ),
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: Sizes.size24,
                  foregroundImage: NetworkImage(
                    "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
                  ),
                  child: Text(""),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: Sizes.size20,
                    height: Sizes.size20,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 97, 233, 104),
                      borderRadius: BorderRadius.circular(
                        Sizes.size10,
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: Sizes.size3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: const Text(
            "Flutter",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text("Active Now"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Theme.of(context).iconTheme.color,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Theme.of(context).iconTheme.color,
                size: Sizes.size20,
              ),
              Gaps.h14,
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size14,
              ),
              itemBuilder: (context, index) {
                final isMine = index % 2 == 0;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(Sizes.size14),
                      decoration: BoxDecoration(
                        color: isMine
                            ? Colors.blue
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(
                            Sizes.size20,
                          ),
                          topRight: const Radius.circular(
                            Sizes.size20,
                          ),
                          bottomLeft: Radius.circular(
                            isMine ? Sizes.size20 : Sizes.size5,
                          ),
                          bottomRight: Radius.circular(
                            !isMine ? Sizes.size20 : Sizes.size5,
                          ),
                        ),
                      ),
                      child: const Text(
                        "This is a message!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 10),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                  vertical: Sizes.size14,
                ),
                color: isDarkMode(context) ? Colors.black : Colors.grey.shade50,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Sizes.size16,
                          ),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Send a message...",
                            suffixIcon: Align(
                              alignment: Alignment.centerRight,
                              heightFactor: 1,
                              widthFactor: 0,
                              child: Padding(
                                padding: EdgeInsets.all(
                                  Sizes.size10,
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.faceSmile,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gaps.h20,
                    Container(
                      alignment: Alignment.center,
                      height: Sizes.size40,
                      width: Sizes.size40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Sizes.size20,
                        ),
                        color: Colors.grey.shade400,
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.solidPaperPlane,
                        color: Colors.white,
                        size: Sizes.size20,
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
