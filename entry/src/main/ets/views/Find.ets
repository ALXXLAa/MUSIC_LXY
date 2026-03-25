import { getSongList } from '../apis/Index';
import { SongItemType } from '../models/Index';

// 定义类型接口
interface CategoryType {
  id: number;
  name: string;
  icon: Resource;
}

interface TopicType {
  id: number;
  title: string;
  image: Resource;
}

@Component
export default  struct Find {
  @State private searchText: string = '';
  @State songs: SongItemType[] = [];
  @State private categories: CategoryType[] = [
    { id: 1, name: '排行榜', icon: $r('app.media.ic_auto') },
    { id: 2, name: '歌单', icon: $r('app.media.ic_song_list') },
    { id: 3, name: '歌手', icon: $r('app.media.ic_boy') },
    { id: 4, name: '新歌', icon: $r('app.media.ic_stylus') },
    { id: 5, name: '电台', icon: $r('app.media.ic_bells_o') },
    { id: 6, name: 'MV', icon: $r('app.media.ic_share') }
  ];

  @State private hotTopics: TopicType[] = [
    { id: 1, title: '夏日清凉歌单', image: $r('app.media.background') },
    { id: 2, title: '华语流行金曲', image: $r('app.media.logo') },
    { id: 3, title: '欧美经典老歌', image: $r('app.media.ic_cd') },
    { id: 4, title: 'KTV必点歌曲', image: $r('app.media.startIcon') }
  ];

  async aboutToAppear() {
    this.songs = await getSongList() as SongItemType[];
  }

  build() {
    Column() {
      // 搜索栏
      Row() {
        TextInput({ text: this.searchText, placeholder: '搜索音乐、歌手、歌单...' })
          .width('90%')
          .height(40)
          .backgroundColor('#f5f5f5')
          .borderRadius(20)
          .padding({ left: 15, right: 15 })
          .onChange((value: string) => {
            this.searchText = value;
          })

        Button('搜索')
          .width(60)
          .height(40)
          .backgroundColor('#ff3a3a')
          .fontColor(Color.White)
          .borderRadius(20)
          .onClick(() => {
            // 搜索逻辑
            console.log('搜索关键词:', this.searchText);
          })
      }
      .width('100%')
      .padding({ left: 15, right: 15, top: 10, bottom: 10 })

      // 分类导航
      Text('音乐分类')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Start)
        .padding({ left: 15, top: 10, bottom: 10 })

      Grid() {
        ForEach(this.categories, (item: CategoryType) => {
          GridItem() {
            Column() {
              Image(item.icon)
                .width(40)
                .height(40)
                .margin({ bottom: 5 })
              Text(item.name)
                .fontSize(12)
                .fontColor('#666')
            }
            .width('100%')
            .height(80)
            .justifyContent(FlexAlign.Center)
            .onClick(() => {
              console.log('点击分类:', item.name);
            })
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('100%')
      .height(180)
      .padding({ left: 15, right: 15 })

      // 猜你喜欢歌曲列表
      Text('猜你喜欢')
        .fontColor('#fff')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Start)
        .margin({ top: 20, bottom: 10 })
        .padding({ left: 15 })

      List() {
        ForEach(this.songs, (item: SongItemType) => {
          ListItem() {
            Row({ space: 10 }) {
              // 封面图
              Image(item.img)
                .width(80)
                .aspectRatio(1)
                .borderRadius(8)
              Column({ space: 15 }) {
                // 歌曲名称
                Text(item.title)
                  .fontColor('#fff')
                  .fontWeight(700)
                  .fontSize(16)
                  .width('100%')
                Row({ space: 8 }) {
                  Text('VIP')
                    .fontSize(14)
                    .fontColor('#bab128')
                    .border({ width: 1, color: '#bab128', radius: 12 })
                    .padding({ left: 5, right: 5, top: 3, bottom: 3 })
                  // 艺术家
                  Text(item.artist)
                    .fontColor('#808082')
                    .fontSize(14)
                }
                .width('100%')
              }
              .layoutWeight(1)
              Image($r('app.media.ic_more'))
                .width(24)
                .fillColor('#fff')
            }
            .width('100%')
            .margin({ bottom: 10 })
            .padding({ left: 15, right: 15 })
          }
        })
      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#131215')
  }
}