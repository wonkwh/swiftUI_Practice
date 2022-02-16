//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by wonkwh on 2020/12/16.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
  //    @ObservedObject private var data = ScrumData()
  @State private var scrums = DailyScrum.sampleData
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ScrumsView(scrums: $scrums) {
          //                    data.save()
        }
      }
      .onAppear() {
        //                data.load()
      }
    }
  }
}
