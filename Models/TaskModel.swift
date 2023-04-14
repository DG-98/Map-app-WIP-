//
//  TaskModel.swift
//  Map app (WIP)
//
//  Created by Derrick on 4/7/23.
//

import SwiftUI
import CoreLocation
import CoreGraphics

class Task: ObservableObject, Identifiable {
    let id = UUID() 
    
    let title: String
    let description:  String
    @Published public internal(set) var image: CGImage?
    @Published var imageLocation: CLLocation?
    @Published var isComplete: Bool {
        didSet {
            if image == nil {
                isComplete = false
            }
        }
    }
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.isComplete = false
    }
    
    func set(_ image: CGImage, with location: CLLocation) {
        self.image = image
        self.imageLocation = imageLocation
    }
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
