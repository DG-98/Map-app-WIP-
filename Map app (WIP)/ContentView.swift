//
//  ContentView.swift
//  Map app (WIP)
//
//  Created by Derrick on 4/7/23.
//

import SwiftUI

struct ContentView: View {

   @State private var tasks:[Task] = Task.mockedTasks
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks.indices, id: \.self) { index in
                    NavigationLink(destination: DetailVIew(tasks: $tasks[index])) {
                        HStack {
                            Image(systemName: tasks[index].isComplete ? "circle.fill" : "circle")
                            Text(tasks[index].title)
                        }
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
