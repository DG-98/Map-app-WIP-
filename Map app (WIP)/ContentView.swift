//
//  ContentView.swift
//  Map app (WIP)
//
//  Created by Derrick on 4/7/23.
//

import SwiftUI

struct TaskListItemView: View {
    let task: Task
    @State private var isChecked = false
    
    
    var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.circle" : "circle")
                .foregroundColor(isChecked ? .blue : .gray)
                .onTapGesture {
                    isChecked.toggle()
                }
            Text(task.title)
        }
    }
}


struct ContentView: View {
    let tasks:[Task] = Task.mockedTasks
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    NavigationLink(destination: DetailVIew(tasks: task)) {
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
