//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by wonkwh on 2020/12/20.
//

import SwiftUI

struct MeetingHeaderView: View {
    @Binding var secondsElapsed: Int
    @Binding var secondsRemaining: Int
    private var progress: Double {
        guard secondsRemaining > 0 else { return 1 }
        let totalSeconds = Double(secondsElapsed + secondsRemaining)
        return Double(secondsElapsed) / totalSeconds
    }
    
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    private var minutesRemainingMetric: String {
        minutesRemaining == 1 ? "minute" : "minutes"
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Time Remaining"))
        .accessibilityValue(Text("10 minutes"))
        .accessibilityValue(Text("\(minutesRemaining) \(minutesRemainingMetric)"))
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: .constant(60), secondsRemaining: .constant(180))
            .previewLayout(.sizeThatFits)
    }
}
