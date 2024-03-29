//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by wonkwh on 2020/12/16.
//

import SwiftUI

struct ScrumsView: View {
  @Binding var scrums: [DailyScrum]
  @Environment(\.scenePhase) private var scenePhase
  @State private var isPresented = false
  @State private var newScrumData = DailyScrum.Data()
  
  let saveAction : () -> Void
  
  var body: some View {
    List {
      ForEach($scrums) { $scrum in
        NavigationLink(destination: DetailEditView(scrum: $scrum)) {
          CardView(scrum: scrum)
        }
        .listRowBackground(scrum.theme.mainColor)
      }
    }
    .navigationTitle("Daily Scrums")
    .toolbar {
      Button(action: {}) {
        Image(systemName: "plus")
      }
      .accessibilityLabel("New Scrum")
    }
//    .navigationBarItems(trailing: Button(action: {
//      isPresented = true
//    }) {
//      Image(systemName: "plus")
//    })
    .sheet(isPresented: $isPresented) {
      NavigationView {
        DetailEditView(scrumData: $newScrumData)
          .navigationBarItems(leading: Button("Dismiss") {
            isPresented = false
          }, trailing: Button("Add") {
            let newScrum = DailyScrum(title: newScrumData.title, attendees: newScrumData.attendees, lengthInMinutes: Int(newScrumData.lengthInMinutes), theme: newScrumData.theme)
            scrums.append(newScrum)
            isPresented = false
          })
      }
    }
    .onChange(of: scenePhase, perform: { phase in
      if phase == .inactive {
        saveAction()
      }
    })
  }
  
  private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
    guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else {
      fatalError("Can't find scrum in array")
    }
    return $scrums[scrumIndex]
  }
}

struct ScrumsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
    }
  }
}
