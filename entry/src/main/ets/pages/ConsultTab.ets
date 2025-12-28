// 咨询 Tab 页面
// 健康宣教卡片组件
@Component
struct HealthEduCard {
  @Prop img: Resource;
  @Prop title: string;

  build() {
    Column() {
      // 上方图片
      Image(this.img)
        .width('100%')

      // 下方标题
      Text(this.title)
        .width('100%')
        .fontSize($r('app.float.home_health_card_title_font_size'))
        .fontColor(0xFF333333)
        .margin({
          left: $r('app.float.home_health_card_title_left_margin'),
          top: $r('app.float.home_health_card_title_top_margin'),
          bottom: $r('app.float.home_health_card_title_bottom_margin')
        })
    }
    .backgroundColor(0xFFFFFFFF)
    .borderWidth($r('app.float.home_health_card_border_width'))
    .borderColor(0x28000000)
    .borderRadius($r('app.float.home_health_card_radius'))
    .clip(true)
    .margin({
      left: $r('app.float.home_health_card_horizontal_margin'),
      right: $r('app.float.home_health_card_horizontal_margin'),
      top: $r('app.float.home_health_card_top_margin')
    })
  }
}


@Component
export default struct HomeTab {
  build() {
    // 套上统一背景
    Column() {
      Scroll() {
        Column() {
          // 1. 顶部标题栏
          Row() {
            Text('健康资讯列表')
              .fontSize($r('app.float.home_header_title_font_size'))
              .fontWeight(FontWeight.Normal)
              .fontColor(0xFFFFFFFF)
          }
          .height($r('app.float.home_header_height'))
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)

          // 4. “资讯” 标题行
          Row() {
            Text('健康资讯')
              .fontSize($r('app.float.service_emphasis_font_size'))
              .margin({ left: $r('app.float.home_health_section_title_left_margin') })
              .fontWeight(FontWeight.Bold)
              .fontColor(0xFF333333)
          }
          .width('100%')
          .margin({
            top: $r('app.float.home_health_section_title_top_margin'),
            bottom: $r('app.float.home_health_section_title_bottom_margin')
          })
          .justifyContent(FlexAlign.Start)
          .alignItems(VerticalAlign.Center)

          // 5. 健康宣教卡片列表
          HealthEduCard({ img: $r('app.media.health_img1'), title: '老年痴呆' })
          HealthEduCard({ img: $r('app.media.health_img2'), title: '关注帕金森病' })
          HealthEduCard({ img: $r('app.media.health_img3'), title: '运动健康' })

          // 底部留一点空
          Blank()
            .height($r('app.float.home_bottom_blank_height'))
        }
        .width('100%')
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    // 直接在当前页添加渐变背景
    .linearGradient({
      angle: 180,
      colors: [
        [0xFF2EC7A8, 0.0],
        [0xFFA0EACD, 0.35],
        [0xFFF5FFFC, 0.5],
        [0xFFFFFFFF, 1.0]
      ]
    })
  }
}

