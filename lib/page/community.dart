import 'package:community/data/dummy_posts.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  int selectedTeamIndex = 0;

  final List<String> teamTabs = ['전체보기', '팀이름1', '팀이름2', '팀이름3', '팀이름3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('커뮤니티', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          // 팀 필터 탭
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: teamTabs.length,
              itemBuilder: (context, index) {
                final isFirst = index == 0;
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: isFirst ? Colors.tealAccent[700] : Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: isFirst
                            ? Text(
                                'All',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Icon(Icons.image_outlined), // 또는 NetworkImage 등으로 대체 가능
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(teamTabs[index]),
                  ],
                );
              },
            ),
          ),

          Divider(
            color: Colors.grey,
            thickness: 0.5,
            height: 20,
          ),

          // 게시글 목록 (샘플 박스)
          Expanded(
            child: ListView.builder(
              itemCount: dummyPosts.length,
              itemBuilder: (context, i) {
                final post = dummyPosts[i];
                return Card(
                  color: Colors.white,
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 상단: 작성자 + 시간
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(post.username, style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(post.timeAgo, style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // 내용
                        Text(post.content, style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 12),
                        // 하단: 좋아요 + 댓글
                        Row(
                          children: [
                            Icon(Icons.favorite_border, size: 20),
                            SizedBox(width: 4),
                            Text('${post.likes}'),
                            SizedBox(width: 16),
                            Icon(Icons.mode_comment_outlined, size: 20),
                            SizedBox(width: 4),
                            Text('${post.comments}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Floating Action Button (글쓰기)
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.tealAccent[700],
        shape: CircleBorder(),
        child: const Icon(
          Icons.edit_square,
          color: Colors.white,
        ),
      ),
    );
  }
}
