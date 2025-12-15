import router from '@ohos.router';

// 首页四个功能入口的小组件
@Component
struct HomeFunctionItem {
  @Prop label: string;
  @Prop icon: Resource;

  build() {
    Column() {
      // 图标
      Image(this.icon)
        .width($r('app.float.home_function_icon_size'))
        .height($r('app.float.home_function_icon_size'))
        .borderRadius($r('app.float.home_function_icon_radius'))
        .objectFit(ImageFit.Cover)
        .backgroundColor(0xFF2EC7A8)

      // 文字
      Text(this.label)
        .fontSize($r('app.float.home_function_text_font_size'))
        .fontColor(0xFF333333)
        .margin({ top: $r('app.float.home_function_text_top_margin') })
        .textAlign(TextAlign.Center)
    }
    .alignItems(HorizontalAlign.Center)
  }
}

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
            Text('首页')
              .fontSize($r('app.float.home_header_title_font_size'))
              .fontWeight(FontWeight.Normal)
              .fontColor(0xFFFFFFFF)
          }
          .height($r('app.float.home_header_height'))
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)

          // 2. Banner 区域
          Image($r('app.media.home_banner'))
            .width('100%')
            .margin({ top: $r('app.float.home_banner_top_margin') })
            .objectFit(ImageFit.Cover)

          // 3. 四个功能入口卡片
          Column() {
            Row() {
              // 问诊记录
              Column() {
                HomeFunctionItem({
                  label: '问诊记录',
                  icon: $r('app.media.home_icon1')
                })
              }
              .onClick(() => {
                router.pushUrl({ url: 'pages/VisitRecordsPage' });
              })

              // 服务订单
              Column() {
                HomeFunctionItem({
                  label: '服务订单',
                  icon: $r('app.media.home_icon2')
                })
              }
              .onClick(() => {
                router.pushUrl({ url: 'pages/ServiceOrdersPage' });
              })

              // 服务采购
              Column() {
                HomeFunctionItem({
                  label: '服务采购',
                  icon: $r('app.media.home_icon3')
                })
              }
              .onClick(() => {
                router.pushUrl({ url: 'pages/ServicePurchasePage' });
              })

              // 入住申请
              Column() {
                HomeFunctionItem({
                  label: '入住申请',
                  icon: $r('app.media.home_icon4')
                })
              }
              .onClick(() => {
                router.pushUrl({ url: 'pages/AdmissionApplyPage' });
              })
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceAround)
            .alignItems(VerticalAlign.Center)
            .height($r('app.float.home_function_row_height'))
          }
          .margin({
            left: $r('app.float.home_function_area_horizontal_margin'),
            right: $r('app.float.home_function_area_horizontal_margin'),
            top: $r('app.float.home_function_area_top_margin')
          })
          .backgroundColor(0xFFFFFFFF)
          .borderRadius($r('app.float.home_function_area_radius'))
          .padding({
            left: $r('app.float.home_function_area_horizontal_padding'),
            right: $r('app.float.home_function_area_horizontal_padding')
          })


          // 4. “健康宣教” 标题行
          Row() {
            Text('健康宣教')
              .fontSize($r('app.float.home_health_section_title_font_size'))
              .margin({ left: $r('app.float.home_health_section_title_left_margin') })
              .fontWeight(FontWeight.Normal)
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
