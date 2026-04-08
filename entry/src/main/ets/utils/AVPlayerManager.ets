import { media } from '@kit.MediaKit';
export default class AVPlayerManager {
  static player: media.AVPlayer;//静态属性
  static async init() {//静态方法
    if (!AVPlayerManager.player) {
      // 创建AVPlayer实例
      AVPlayerManager.player = await media.createAVPlayer();
    }
  }
}