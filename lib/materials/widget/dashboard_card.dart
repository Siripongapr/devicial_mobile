import 'package:flutter/material.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard(
      {super.key,
      this.username = 'Username',
      this.date = '03-04-2024',
      this.title = 'How to print  “Hello world” with Golang and insert....',
      this.content =
          'lorem example lorem example lorem example lorem example lorem example lorem examplelorem example lorem example lorem example lorem example lorem exa......',
      this.visit = '140',
      this.like = '30'});
  final String username;
  final String date;
  final String title;
  final String content;
  final String visit;
  final String like;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: Colors.white,
              shadowColor: Colors.white,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(0), // Set the border radius here
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.person,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              username,
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              date,
                              style: const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Visit ',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          visit,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight
                                  .w600), // Change the font size for $visit
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Like ',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          like,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight
                                  .w600), // Change the font size for $like
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
