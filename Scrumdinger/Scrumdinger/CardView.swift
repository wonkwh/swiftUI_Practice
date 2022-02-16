//
//  CardView.swift
//  Scrumdinger
//
//  Created by wonkwh on 2020/12/16.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.title
      configuration.icon
    }
  }
}

/// .labelStyle(.trailingIcon) 같은식으로 사용가능
extension LabelStyle where Self == TrailingIconLabelStyle {
  static var trailingIcon: Self { Self() }
}

struct CardView: View {
  let scrum: DailyScrum
  var body: some View {
    VStack(alignment: .leading) {
      Text(scrum.title)
        .font(.headline)
        .accessibilityAddTraits(.isHeader)
      Spacer()
      HStack {
        Label("\(scrum.attendees.count)", systemImage: "person.3")
          .accessibilityLabel("\(scrum.attendees.count) attendees")
        Spacer()
        Label("\(scrum.lengthInMinutes)", systemImage: "clock")
          .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
          .labelStyle(.trailingIcon)
      }
      .font(.caption)
    }
    .padding()
    .foregroundColor(scrum.theme.accentColor)
  }
}

struct CardView_Previews: PreviewProvider {
  static var scrum = DailyScrum.sampleData[0]
  static var previews: some View {
    CardView(scrum: scrum)
      .background(scrum.theme.mainColor)
      .previewLayout(.fixed(width: 400, height: 60))
  }
}
