//
//  ContentView.swift
//  Map app (WIP)
//
//  Created by Derrick on 4/7/23.
//

import SwiftUI

struct ContentView: View {
    let tasks:[Task] = Task.mockedTasks
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    NavigationLink(destination: DetailVIew(tasks: task)) {
                        /*@START_MENU_TOKEN@*/Text(task.title)/*@END_MENU_TOKEN@*/
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
