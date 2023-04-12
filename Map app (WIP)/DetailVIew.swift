//
//  DetailVIew.swift
//  Map app (WIP)
//
//  Created by Derrick on 4/7/23.
//

import SwiftUI
import PhotosUI


struct DetailVIew: View {
    let tasks: Task
    
    @State private var selectedImage: UIImage?
    @State private var isShowingPhotoPicker = false
    @Binding var isChecked: Bool
    
    var body: some View {
        VStack {
            HStack{
                Text(tasks.title)
                Checkbox(isChecked: $isChecked)
            }
            Text(tasks.description)
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onAppear {
                        isChecked = true
                    }
            }
            Button("Attach Photo") {
                isShowingPhotoPicker = true
            }
        }
        .sheet(isPresented: $isShowingPhotoPicker) {
            PhotoPicker(selectedImage: $selectedImage)
        }
    }
}

struct DetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        DetailVIew(tasks: Task(title: "Show light novels", description: "Show my friends all of my light novels."), isChecked: .constant(false))
    }
}

