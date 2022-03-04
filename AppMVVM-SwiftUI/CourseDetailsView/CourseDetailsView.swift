//
//  CourseDetailsView.swift
//  AppMVVM-SwiftUI
//
//  Created by Igor on 04.03.2022.
//

import SwiftUI

struct CourseDetailsView: View {
    @StateObject var viewModel: CourseDeteilsViewModel
    var body: some View {
        VStack {
            Text(viewModel.courseName)
                .font(.largeTitle)
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    CourseImageView(
                        imageData: viewModel.imageData,
                        imageSize: CGSize(width: 230, height: 180),
                        cornerRadius: 10,
                        shadowIsOn: true
                    )
                    IsFavoriteButton(isFavorite: viewModel.isFavorite) {
                        viewModel.favoriteButtonPressed()
                    }
                }
                Text(viewModel.numberOfLessons)
                    .font(.headline)
                Text(viewModel.numberOfTests)
                    .font(.headline)
            }
            Spacer()
            
        }
    }
}

struct IsFavoriteButton: View {
    var isFavorite: Bool
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(isFavorite ? .red : .gray)
        }
        .offset(x: 90, y: 65)
    }
}

struct CourseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailsView(
            viewModel: CourseDeteilsViewModel(course: Course.getCourse())
        )
    }
}
