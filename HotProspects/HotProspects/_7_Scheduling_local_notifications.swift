//
//  _7_Scheduling_local_notifications.swift
//  HotProspects
//
//  Created by Michael C. Herrera on 11/22/25.
//

import SwiftUI
import UserNotifications

struct _7_Scheduling_local_notifications: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter
                    .current()
                    .requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error {
                            print(error.localizedDescription)
                        }
                    }
            }
            
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It's been a while!"
                content.sound = .default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    _7_Scheduling_local_notifications()
}
