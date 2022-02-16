//
//  DetailView.swift
//  Scrumdinger
//
//  Created by wonkwh on 2020/12/16.
//

import SwiftUI

struct DetailView: View {
  @Binding var scrum: DailyScrum
  @State private var data = DailyScrum.Data()
  @State private var isPresented = false
  
  var body: some View {
    List {
      Section(header: Text("Metting Info")) {
        NavigationLink(destination: MeetingView(scrum: $scrum)) {
          Label("Start Meeting", systemImage: "timer")
            .font(.headline)
            .foregroundColor(.accentColor)
        }
        
        HStack {
          Label("Length", systemImage: "clock")
          Spacer()
          Text("\(scrum.lengthInMinutes) minutes")
        }
        .accessibilityElement(children: .combine)
        HStack {
          Label("Theme", systemImage: "paintpalette")
          Spacer()
//          Image(systemName: "checkmark.circle.fill")
//            .foregroundColor(scrum.theme.mainColor)
          Text(scrum.theme.name)
            .padding(4)
            .foregroundColor(scrum.theme.accentColor)
            .background(scrum.theme.mainColor)
            .cornerRadius(4)
        }
        .accessibilityElement(children: .combine)
      }
      Section(header: Text("Attendees")) {
        ForEach(scrum.attendees) { attendee in
          Label(attendee.name, systemImage: "person")
        }
      }
      Section(header: Text("History")) {
        if scrum.history.isEmpty {
          Label("No meeting yet", systemImage: "calendar.badge.exclamationmark")
        }
        ForEach(scrum.history) { history in
          HStack {
            Image(systemName: "calendar")
            Text(history.date, style: .date)
          }
        }
      }
    }
    .navigationTitle(scrum.title)
    .toolbar {
      Button("Edit") {
        isPresented = true
        data = scrum.data
      }
    }
    .sheet(isPresented: $isPresented) {
      NavigationView {
        DetailEditView(data: $data)
          .navigationTitle(scrum.title)
          .toolbar {
            ToolbarItem(placement: .cancellationAction) {
              Button("Cancel") {
                isPresented = false
              }
            }
            
            ToolbarItem(placement: .confirmationAction) {
              Button("Done") {
                isPresented = false
                scrum.update(from: data)
              }
            }
          }
      }
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      DetailView(scrum: .constant(DailyScrum.sampleData[0]) )
    }
    
  }
}
