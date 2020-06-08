//
//  ViewController.swift
//  Create Notification
//
//  Created by Can Balkaya on 6/8/20.
//  Copyright © 2020 TurkishKit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNotifications()
    }

    // MARK: - Functions
    func configureNotifications() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus == .notDetermined {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, _ in
                    if success {
                        let content = UNMutableNotificationContent()
                        content.title = "Bildirim Başlığı"
                        content.subtitle = "Bildirim Alt Başlığı"
                        content.sound = UNNotificationSound.default
                      
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2 * 60 * 60, repeats: true)
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                      
                        UNUserNotificationCenter.current().add(request)
                    }
                }
            }
        }
    }
}
