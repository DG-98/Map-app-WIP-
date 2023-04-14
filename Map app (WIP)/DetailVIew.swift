//
//  DetailVIew.swift
//  Map app (WIP)
//
//  Created by Derrick on 4/7/23.
//

import SwiftUI
import PhotosUI


struct DetailVIew: View {
    @Binding var tasks: Task
    @State private var selectedImage: UIImage?
    @State private var isShowingPhotoPicker = false
    @State private var showButton = true
    
    var body: some View {
        VStack {
            HStack{
                // CGImage change with picture upload
                Image(systemName: tasks.isComplete ? "circle.fill": "circle")
                Text(tasks.title)
            }
            Text(tasks.description)
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }
            
            // Add a button to request camera roll access
            Button(action: {
                requestCameraRollAccess()
                isShowingPhotoPicker = true
                showButton.toggle()
                tasks.isComplete = true
                //                Image(systemName: tasks.isComplete ? "circle.fill": "circle")
                
                
            }, label: {
                Text("Attach a photo")
            })
            .sheet(isPresented: $isShowingPhotoPicker) {
                PhotoPicker(selectedImage: $selectedImage)
            }

        }
        
    }
    
    // Function to request camera roll access
    func requestCameraRollAccess() {
        // Check if permission has already been granted
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            // Permission already granted, show the photo picker
            isShowingPhotoPicker = true
        case .notDetermined:
            // Request permission
            PHPhotoLibrary.requestAuthorization({ status in
                if status == .authorized {
                    // Permission granted, show the photo picker
                    DispatchQueue.main.async {
                        isShowingPhotoPicker = true
                    }
                }
            })
        case .denied, .restricted:
            // Permission denied or restricted, show an alert
            let alert = UIAlertController(title: "Camera Roll Access Denied", message: "Please enable camera roll access for this app in Settings > Privacy > Photos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        default:
            break
        }
    }
}


    
    struct DetailVIew_Previews: PreviewProvider {
        static var previews: some View {
            DetailVIew(tasks: .constant(Task(title: "Show light novels", description: "Show my friends all of my light novels.")))
        }
    }
