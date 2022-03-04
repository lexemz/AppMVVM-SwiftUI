//
//  CourseImageView.swift
//  AppMVVM-SwiftUI
//
//  Created by Igor on 04.03.2022.
//

import SwiftUI

struct CourseImageView: View {
    let imageData: Data?
    let imageSize: CGSize
    let cornerRadius: CGFloat
    
    let shadowIsOn: Bool
    
    var body: some View {
        getImage(from: imageData)
            .resizable()
            .frame(
                width: imageSize.width,
                height: imageSize.height
            )
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowIsOn ? 10 : 0)
    }
    
    private func getImage(from data: Data?) -> Image {
        guard let data = data else {
            return Image(systemName: "xmark")
        }
        guard let image = UIImage(data: data) else {
            return Image(systemName: "xmark")
        }
        
        return Image(uiImage: image)
    }
}

struct CourseImageView_Previews: PreviewProvider {
    static var previews: some View {
        CourseImageView(imageData: Data(), imageSize: CGSize(width: 230, height: 180), cornerRadius: 30, shadowIsOn: true)
    }
}
