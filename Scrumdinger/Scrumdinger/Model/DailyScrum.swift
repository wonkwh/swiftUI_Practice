//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by wonkwh on 2020/12/16.
//

import SwiftUI

struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(title: "Desing", attendees: ["Cathy", "Simon", "John", "Daisy"], lengthInMinutes: 10, color: Color("Design")),
            DailyScrum(title: "App Dev", attendees: ["kwanghyun", "Gray", "Luis", "Katie"], lengthInMinutes: 5, color: Color("App Dev")),
            DailyScrum(title: "Web Dev", attendees: ["Chris", "Eden", "Chella", "Lindsey", "Aga", "Chad", "Jenn" , "Sarah"], lengthInMinutes: 1, color: Color("Web Dev"))
        ]
    }
}
