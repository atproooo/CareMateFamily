import router from '@ohos.router';

@Entry
@Component
export default struct ServiceOrderDetailPage {
  @State currentIndex: number = 0;

  build() {
    Column() {
      /** ---------- 顶部导航栏 ---------- */
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

        Text('服务订单详情')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
          .fontSize($r('app.float.common_nav_title_font_size'))
          .fontColor($r('app.color.common_nav_text_color'))

        Blank().width($r('app.float.common_nav_side_width'))
      }
      .height($r('app.float.common_nav_height'))

      /** ---------- Tab 区域 ---------- */
      Column() {
        Tabs({ index: this.currentIndex }) {
          TabContent() {
            this.ServiceIntroTab();
          }.tabBar(this.TabTitle('服务介绍', 0))

          TabContent() {
            this.CareInfoTab();
          }.tabBar(this.TabTitle('看护信息', 1))

          TabContent() {
            this.ServiceRecordTab();
          }.tabBar(this.TabTitle('服务记录', 2))

          TabContent() {
            this.RehabAssessmentTab();
          }.tabBar(this.TabTitle('康复评估', 3))
        }
        .onChange(index => this.currentIndex = index)
        .barMode(BarMode.Fixed)
        .barHeight(48)
        .width('100%')
        .layoutWeight(1)
      }
      .backgroundColor($r('app.color.service_card_background_color'))
      .borderRadius($r('app.float.service_card_radius'))
      .borderWidth($r('app.float.service_card_border_width'))
      .borderColor($r('app.color.service_card_border_color'))
      .margin({
        left: $r('app.float.service_detail_card_space'),
        right: $r('app.float.service_detail_card_space'),
        top: $r('app.float.service_detail_card_space')
      })
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

  /** ---------- Tab 标题（绿色选中态） ---------- */
  @Builder
  TabTitle(title: string, index: number) {
    Column() {
      Text(title)
        .fontSize($r('app.float.service_body_font_size'))
        .fontColor(
          this.currentIndex === index
            ? $r('app.color.service_button_background_color')
            : $r('app.color.service_secondary_text_color')
        )

      if (this.currentIndex === index) {
        Blank()
          .height(2)
          .width(24)
          .backgroundColor($r('app.color.service_button_background_color'))
          .margin({ top: 4 })
      }
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  CustomTabBar() {
    Row() {
      this.TabTitle('服务介绍', 0)
      this.TabTitle('看护信息', 1)
      this.TabTitle('服务记录', 2)
      this.TabTitle('康复评估', 3)
    }
    .backgroundColor($r('app.color.service_card_background_color'))
    .borderRadius($r('app.float.service_card_radius'))
    .borderWidth($r('app.float.service_card_border_width'))
    .borderColor($r('app.color.service_card_border_color'))
    .margin({
      left: $r('app.float.service_detail_card_space'),
      right: $r('app.float.service_detail_card_space'),
      top: $r('app.float.service_detail_card_space')
    })
  }


  /** ---------- 公共行：左标题 / 右内容 ---------- */
  @Builder
  InfoRow(label: string, value: string) {
    Row() {
      Text(label)
        .fontSize($r('app.float.service_body_font_size'))
        .fontColor($r('app.color.service_secondary_text_color'))

      Blank().layoutWeight(1)

      Text(value)
        .fontSize($r('app.float.service_body_font_size'))
        // .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.service_primary_text_color'))
    }
    .margin({
      left: $r('app.float.service_text_left_right_margin'),
      right: $r('app.float.service_text_left_right_margin'),
      // top: $r('app.float.service_blank_width'),
      bottom: $r('app.float.service_text_bottom_margin')
    })
  }

  /** ---------- 服务介绍 Tab ---------- */
  @Builder
  ServiceIntroTab() {
    Scroll() {
      Column() {
        Column() {
          Row() {
            Text('检查')
              .fontSize($r('app.float.service_card_title_font_size'))
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.service_primary_text_color'))

            Blank().layoutWeight(1)

            Text('待服务')
              .fontSize($r('app.float.service_body_font_size'))
              .fontColor($r('app.color.service_secondary_text_color'))
          }
          .margin({
            left: $r('app.float.service_text_left_right_margin'),
            right: $r('app.float.service_text_left_right_margin'),
            // top: $r('app.float.service_text_bottom_margin'),
            bottom: $r('app.float.service_item_large_bottom_margin')
          })

          Column() {
            this.InfoRow('被看护人', '王国栋')
            this.InfoRow('服务单号', 'kh_1011237333469')
            this.InfoRow('预约时间', '2024-09-12 11:00-12:00')
            this.InfoRow('联系电话', '18862492805')
            this.InfoRow('联系地址', '上海')
            this.InfoRow('服务机构', '中山大学展示中心')
            this.InfoRow('服务类型', '')
          }
          .margin({
            bottom: $r('app.float.service_item_large_bottom_margin')
          })

          Column() {
            SectionTitle('服务介绍')
            SectionText('检查：心率、血压、血脂检查：心率、血压、血脂检查')
          }
          .margin({
            bottom: $r('app.float.service_item_large_bottom_margin')
          })

          Column() {
            SectionTitle('预约须知')
            SectionText('测试')
          }
          .margin({
            bottom: $r('app.float.service_item_large_bottom_margin')
          })

          Column() {
            SectionTitle('费用须知')
            SectionText('测试')
          }
          .margin({
            bottom: $r('app.float.service_item_large_bottom_margin')
          })

          Column() {
            SectionTitle('费用')

            this.InfoRow('出诊费', '￥12')
            this.InfoRow('技术费', '￥12')
            this.InfoRow('耗材费', '￥12')

            Row() {
              Text('总金额')
                .fontWeight(FontWeight.Medium)
              Blank().layoutWeight(1)
              Text('￥36')
                .fontWeight(FontWeight.Medium)
                .fontColor($r('app.color.service_price_text_color'))
            }
            .margin({
              left: $r('app.float.service_text_left_right_margin'),
              right: $r('app.float.service_text_left_right_margin'),
              bottom: $r('app.float.service_item_large_bottom_margin')
            })

          }
          .margin({
            bottom: $r('app.float.service_item_large_bottom_margin')
          })

        }
        .backgroundColor($r('app.color.service_card_background_color'))
        // .borderRadius($r('app.float.service_card_radius'))
        // .borderWidth($r('app.float.service_card_border_width'))
        // .borderColor($r('app.color.service_card_border_color'))
        .margin({
          left: $r('app.float.service_detail_card_space'),
          right: $r('app.float.service_detail_card_space'),
          top: $r('app.float.service_detail_card_space'),
          bottom: $r('app.float.service_detail_card_space')
        })

        Blank().height(8)
      }
      .width('100%')
      // .height('100%')
      // .justifyContent(FlexAlign.Start)
    }
  }

  /** ---------- 看护信息 Tab ---------- */
  @Builder
  CareInfoTab() {
    Scroll() {
      Column() {
        Column() {
          Row() {
            Text('王国栋')
              .fontSize($r('app.float.service_card_title_font_size'))
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.service_primary_text_color'))

          }
          .alignSelf(ItemAlign.Start)
          .margin({
            left: $r('app.float.service_text_left_right_margin'),
            right: $r('app.float.service_text_left_right_margin'),
            // top: $r('app.float.service_text_bottom_margin'),
            bottom: $r('app.float.service_item_large_bottom_margin')
          })

          Column() {
            this.InfoRow('看护名称', '王国栋')
            this.InfoRow('看护电话', '13620240001')
            this.InfoRow('机构名称', '中山大学展示中心')
            this.InfoRow('部门名称', '25')
          }
          .margin({
            bottom: $r('app.float.service_item_large_bottom_margin')
          })

        }
        .backgroundColor($r('app.color.service_card_background_color'))
        // .borderRadius($r('app.float.service_card_radius'))
        // .borderWidth($r('app.float.service_card_border_width'))
        // .borderColor($r('app.color.service_card_border_color'))
        .margin({
          left: $r('app.float.service_detail_card_space'),
          right: $r('app.float.service_detail_card_space'),
          top: $r('app.float.service_detail_card_space'),
          bottom: $r('app.float.service_detail_card_space')
        })

        Blank().height(8)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
    }
  }

  /** ---------- 服务记录 Tab ---------- */
  @Builder
  ServiceRecordTab() {
    Scroll() {
      Column() {
        Column() {
          Text('未上传服务记录')
            .fontSize($r('app.float.service_body_font_size'))
            .fontColor($r('app.color.service_secondary_text_color'))
        }
        .backgroundColor($r('app.color.service_card_background_color'))
        // .borderRadius($r('app.float.service_card_radius'))
        // .borderWidth($r('app.float.service_card_border_width'))
        // .borderColor($r('app.color.service_card_border_color'))
        .margin({
          left: $r('app.float.service_detail_card_space'),
          right: $r('app.float.service_detail_card_space'),
          top: $r('app.float.service_detail_card_space'),
          bottom: $r('app.float.service_detail_card_space')
        })
        .alignSelf(ItemAlign.Center)

        Blank().height(8)
      }
      .width('100%')
      // .height('100%')
    }
  }

  /** ---------- 康复评估 Tab ---------- */
  @Builder
  RehabAssessmentTab() {
    Scroll() {
      Column() {
        Column() {
          this.InfoRow('有无心血管疾病？', '无')
          this.InfoRow('有无心血管疾病家族史？', '无')
          this.InfoRow('有无糖尿病？', '无')
          this.InfoRow('有无吸烟？', '无')
          this.InfoRow('身高（cm）', '170')
          this.InfoRow('体重（kg）', '70')
          this.InfoRow('血压水平', '80-110')
          this.InfoRow('血脂水平', '10 / 10 / 10')
          this.InfoRow('体育锻炼情况？', '无')
          this.InfoRow('康复情况评估', '康复情况良好')
        }
        .backgroundColor($r('app.color.service_card_background_color'))
        // .borderRadius($r('app.float.service_card_radius'))
        // .borderWidth($r('app.float.service_card_border_width'))
        // .borderColor($r('app.color.service_card_border_color'))
        .margin({
          left: $r('app.float.service_detail_card_space'),
          right: $r('app.float.service_detail_card_space'),
          top: $r('app.float.service_item_large_bottom_margin'),
          bottom: $r('app.float.service_detail_card_space')
        })

        Blank().height(8)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
    }
  }

}

// SectionTitle和SectionText
@Builder
function SectionTitle(title: string) {
  Row() {
    Blank()
      .width($r('app.float.service_blank_width'))
      .height($r('app.float.service_blank_height'))
      .backgroundColor($r('app.color.service_blank_background_color'))
      .borderRadius($r('app.float.service_blank_border_radius'))
      .margin({ right: $r('app.float.service_blank_right_margin') })

    Text(title)
      .fontSize($r('app.float.service_body_font_size'))
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.service_primary_text_color'))

  }
  .alignSelf(ItemAlign.Start)
  .margin({
    left: $r('app.float.service_text_left_right_margin'),
    right: $r('app.float.service_text_left_right_margin'),
    bottom: $r('app.float.service_item_small_bottom_margin')
  })
}

@Builder
function SectionText(title: string) {
  Row() {
    Text(title)
      .fontSize($r('app.float.service_body_font_size'))
      .fontColor($r('app.color.service_tertiary_text_color'))
      .margin({
        left: $r('app.float.service_text_left_right_margin'),
        right: $r('app.float.service_text_left_right_margin'),
        top: $r('app.float.service_reservation_top_bottom_margin'),
        bottom: $r('app.float.service_item_large_bottom_margin')
      })
  }
  .width('100%')
  .justifyContent(FlexAlign.SpaceBetween)

}
