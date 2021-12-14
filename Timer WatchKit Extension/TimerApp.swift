//
//  TimerApp.swift
//  Timer WatchKit Extension
//
//  Created by Henrique Marques on 14/12/21.
//

import SwiftUI

@main
struct TimerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
