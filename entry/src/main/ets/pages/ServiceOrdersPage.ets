import router from '@ohos.router'

// ===== 服务订单数据结构 =====
interface ServiceOrder {
  id: number
  serviceType: string        // 服务类型
  status: string             // 已服务 / 待服务
  caredPerson: string        // 被看护人
  orderNo: string            // 服务单号
  nurseName: string          // 看护名称
  reserveTime: string        // 预约时间
  price: number              // 服务价格
}

// ===== 示例订单数据 =====
const SERVICE_ORDER_LIST: ServiceOrder[] = [
  {
    id: 1,
    serviceType: '检查',
    status: '已服务',
    caredPerson: '王国栋',
    orderNo: 'kh_1011237333469',
    nurseName: '王国栋',
    reserveTime: '2024-09-12 11:00 - 12:00',
    price: 10
  },
  {
    id: 2,
    serviceType: '检查',
    status: '已服务',
    caredPerson: '王国栋',
    orderNo: 'kh_1011237333469',
    nurseName: '王国栋',
    reserveTime: '2024-09-12 11:00 - 12:00',
    price: 10
  },
  {
    id: 3,
    serviceType: '检查',
    status: '已服务',
    caredPerson: '王国栋',
    orderNo: 'kh_1011237333469',
    nurseName: '王国栋',
    reserveTime: '2024-09-12 11:00 - 12:00',
    price: 10
  },
  {
    id: 4,
    serviceType: '检查',
    status: '已服务',
    caredPerson: '王国栋',
    orderNo: 'kh_1011237333470',
    nurseName: '王国栋',
    reserveTime: '2024-09-05 09:00 - 10:00',
    price: 10
  }
]

// ===== 单个服务订单卡片 =====
@Component
struct ServiceOrderCard {
  @Prop order: ServiceOrder

  build() {
    Column() {
      // 第一行：服务类型 + 状态
      Row() {
        Text(this.order.serviceType)
          .fontSize($r('app.float.service_card_title_font_size'))
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.service_primary_text_color'))

        Blank().layoutWeight(1)

        Text(this.order.status)
          .fontSize($r('app.float.service_body_font_size'))
          .fontColor($r('app.color.service_secondary_text_color'))
      }
      .margin({
        left: $r('app.float.service_text_left_right_margin'),
        right: $r('app.float.service_text_left_right_margin'),
        top: $r('app.float.service_text_bottom_margin'),
        bottom: $r('app.float.service_item_small_bottom_margin')
      })

      this.InfoRow('被看护人', this.order.caredPerson)
      this.InfoRow('服务单号', this.order.orderNo)
      this.InfoRow('看护名称', this.order.nurseName)
      this.InfoRow('预约时间', this.order.reserveTime)

      // 服务价格
      Row() {
        Text('服务价格')
          .fontSize($r('app.float.service_body_font_size'))
          .fontColor($r('app.color.service_secondary_text_color'))

        Blank().layoutWeight(1)

        Text('¥ ' + this.order.price.toString())
          .fontSize($r('app.float.service_emphasis_font_size'))
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.service_price_text_color'))
      }
      .margin({
        left: $r('app.float.service_text_left_right_margin'),
        right: $r('app.float.service_text_left_right_margin'),
        top: $r('app.float.service_blank_width'),
        bottom: $r('app.float.service_text_bottom_margin')
      })
    }
    .backgroundColor($r('app.color.service_card_background_color'))
    .borderRadius($r('app.float.service_card_radius'))
    .borderWidth($r('app.float.service_card_border_width'))
    .borderColor($r('app.color.service_card_border_color'))
    .margin({
      left: $r('app.float.service_card_space'),
      right: $r('app.float.service_card_space'),
      top: $r('app.float.service_card_space')
    })
    .onClick(() => {
      router.pushUrl({ url: 'pages/ServiceOrderDetailPage' })
    })
  }

  // ===== 左右对齐信息行 =====
  @Builder
  InfoRow(label: string, value: string) {
    Row() {
      Text(label)
        .fontSize($r('app.float.service_body_font_size'))
        .fontColor($r('app.color.service_secondary_text_color'))

      Blank().layoutWeight(1)

      Text(value)
        .fontSize($r('app.float.service_body_font_size'))
        .fontColor($r('app.color.service_primary_text_color'))
        .textAlign(TextAlign.End)
    }
    .margin({
      left: $r('app.float.service_text_left_right_margin'),
      right: $r('app.float.service_text_left_right_margin'),
      top: $r('app.float.service_item_small_bottom_margin'),
      bottom: $r('app.float.service_item_small_bottom_margin')
    })
  }
}

// ===== 页面内容 Builder =====
@Builder
function ServiceOrdersContent() {
  Column() {
    // 顶部标题栏
    Row() {
      Row() {
        Text('‹')
          .fontSize($r('app.float.common_nav_icon_font_size'))
          .fontColor($r('app.color.common_nav_text_color'))
      }
      .width($r('app.float.common_nav_side_width'))
      .height($r('app.float.common_nav_height'))
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .onClick(() => router.back())

      Text('服务订单')
        .fontSize($r('app.float.common_nav_title_font_size'))
        .fontColor($r('app.color.common_nav_text_color'))
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Blank().width($r('app.float.common_nav_side_width'))
    }
    .height($r('app.float.common_nav_height'))
    .width('100%')

    // 列表区域
    Scroll() {
      Column() {
        ForEach(
          SERVICE_ORDER_LIST,
          (order: ServiceOrder) => {
            ServiceOrderCard({ order: order })
          },
          (order: ServiceOrder) => order.id.toString()
        )

        Blank().height(16)
      }
      .width('100%')
      // .height('100%')
      // .justifyContent(FlexAlign.Start)
    }
    .layoutWeight(1)
  }
  .width('100%')
  .height('100%')
}

// ===== 页面入口 =====
@Entry
@Component
export default struct ServiceOrdersPage {
  build() {
    Column() {
      ServiceOrdersContent()
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      angle: 180,
      colors: [
        [0xFF2EC7A8, 0.0],
        [0xFFA0EACD, 0.35],
        [0xFFF5FFFC, 0.5],
        [0xFFFFFFFF, 1.0]
      ]
    })
    .expandSafeArea(
      [SafeAreaType.SYSTEM],
      [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM]
    )
  }
}
