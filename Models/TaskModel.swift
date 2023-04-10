//
//  TaskModel.swift
//  Map app (WIP)
//
//  Created by Derrick on 4/7/23.
//

import Foundation
struct Task: Identifiable {
    let id = UUID()
    
    let title: String
    let description:  String
}

extension Task {
    static var mockedTasks: [Task] {
        return [
            Task(title: "Show light novels",
                 description: "Show my friends all of my light novels."),
            Task(title: "Take a pic of my new shoes",
                 description: "My mom asked for a picture of the new shoes I bought."),
            Task(title: "Turn on the candle wax machine",
                 description: "Make the room smell nice!")
        ]
    }
}
