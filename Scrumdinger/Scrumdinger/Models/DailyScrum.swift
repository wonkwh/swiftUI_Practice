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
  var attendees: [Attendee]
  var lengthInMinutes: Int
  var theme: Theme
  var history: [History]
  
  init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme, history: [History] = []) {
    self.id = id
    self.title = title
    self.attendees = attendees.map { Attendee(name: $0) }
    self.lengthInMinutes = lengthInMinutes
    self.theme = theme
    self.history = history
  }
}

extension DailyScrum {
  struct Attendee: Identifiable {
    let id: UUID
    var name: String
    
    init(id: UUID = UUID(), name: String) {
      self.id = id
      self.name = name
    }
  }
}

extension DailyScrum {
  static var sampleData: [DailyScrum] {
    [
      DailyScrum(title: "Desing", attendees: ["Cathy", "Simon", "John", "Daisy"], lengthInMinutes: 10, theme: .yellow),
      DailyScrum(title: "App Dev", attendees: ["kwanghyun", "Gray", "Luis", "Katie"], lengthInMinutes: 5, theme: .orange),
      DailyScrum(title: "Web Dev", attendees: ["Chris", "Eden", "Chella", "Lindsey", "Aga", "Chad", "Jenn" , "Sarah"], lengthInMinutes: 1, theme: .poppy)
    ]
  }
}

extension DailyScrum {
  struct Data {
    var title: String = ""
    var attendees: [Attendee] = []
    var lengthInMinutes: Double = 5.0
    var theme: Theme = .seafoam
  }
  
  var data: Data {
    return Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
  }
  
  mutating func update(from data: Data) {
    title = data.title
    attendees = data.attendees
    lengthInMinutes = Int(data.lengthInMinutes)
    theme = data.theme
  }
}
