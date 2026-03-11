@Entry
@Component
struct Index {
  tabData: string[] = ['推荐', '发现', '动态', '我的'];
  build() {
    Tabs({ barPosition: BarPosition.End }) {
      ForEach(this.tabData, (item: string) => {
        TabContent() {
          Text(item + '内容')
        }
        .backgroundColor('#131215')
        .tabBar(item)
      })
    }
    .backgroundColor('#3b3f42')
  }
}