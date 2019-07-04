class Post {
  const Post({
    this.title,
    this.author,
    this.imageUrl
  });

  final String title;
  final String author;
  final String imageUrl;
}

final List<Post> post = [
  Post(
    title: '1',
    author: 'qq',
    imageUrl: 'https://heras.igengmei.com/2019/06/27/1469deaf2b'
  ),
  Post(
      title: '2',
      author: 'ee',
      imageUrl: 'https://heras.igengmei.com/2019/06/27/1469deaf2b'
  ),
  Post(
      title: '3',
      author: 'fsdf',
      imageUrl: 'https://heras.igengmei.com/2019/06/27/1469deaf2b'
  )
];