export interface TabType {
  icon: Resource;
  text: string;
  name: string;
}
export interface RecommendListType {
  img: string;		// 封面图
  title: string;	// 标题
  count: string;	// 播放量
}
export interface DailyRecommendType {
  img: string;	  // 封面图
  title: string;	// 标题
  type: string;	  // 类型
  top: string;	  // 类型背景色
  bottom: string;	// 标题背景色
}
