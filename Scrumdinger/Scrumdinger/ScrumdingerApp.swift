//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by wonkwh on 2020/12/16.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
