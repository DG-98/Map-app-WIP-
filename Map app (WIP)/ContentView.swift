//
//  ContentView.swift
//  Map app (WIP)
//
//  Created by Derrick on 4/7/23.
//

import SwiftUI

struct Checkbox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            .onTapGesture {
                isChecked.toggle()
            }
    }
}


struct TaskListItemView: View {
    let task: Task
    @State private var isChecked = false
    
    
    var body: some View {
        HStack {
            Checkbox(isChecked: $isChecked)
            Text(task.title)
        }
    }
}


struct ContentView: View {
    @State private var isChecked = false
    
    let tasks:[Task] = Task.mockedTasks
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    NavigationLink(destination: DetailVIew(tasks: task, isChecked: $isChecked)) {
                        TaskListItemView(task: task)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
