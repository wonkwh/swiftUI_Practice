//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by wonkwh on 2020/12/16.
//

import SwiftUI

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
    }
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