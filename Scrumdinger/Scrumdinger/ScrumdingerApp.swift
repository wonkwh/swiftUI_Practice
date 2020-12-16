//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by wonkwh on 2020/12/16.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.data)
            }
        }
    }
}
