//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by wonkwh on 2020/12/28.
//

import SwiftUI

struct MeetingTimerView: View {
    @Binding var speakers: [ScrumTimer.Speaker]
    var scrumColor: Color
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted } )?.name ?? "Someone"
    }
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 24.0, antialiased: true)
            VStack {
                Text(currentSpeaker)
                    .font(.title)
                Text("is speaking")
            }
            .accessibilityElement(children: .combine) //두문장을 하나로
            .foregroundColor(scrumColor.accessibleFontColor)
        }
        .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    @State static var speakers = [
        ScrumTimer.Speaker(name: "Won", isCompleted: true),
        ScrumTimer.Speaker(name: "Kim", isCompleted: false)
    ]

    static var previews: some View {
        MeetingTimerView(speakers: $speakers, scrumColor: Color("Design"))
    }
}
