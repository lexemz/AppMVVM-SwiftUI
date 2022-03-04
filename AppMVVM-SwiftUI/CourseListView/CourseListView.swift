//
//  ContentView.swift
//  AppMVVM-SwiftUI
//
//  Created by Igor on 04.03.2022.
//

import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel = CourseListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.rows, id: \.courseName) { courseDetailsVM in
                NavigationLink(destination: CourseDetailsView(viewModel: courseDetailsVM)) {
                    RowView(viewModel: courseDetailsVM)
                }
            }
            .navigationTitle("Courses")
        }.task {
            viewModel.fetchCourses()
        }
    }
}

struct RowView: View {
    var viewModel: CourseDeteilsViewModel
    var body: some View {
        HStack {
            CourseImageView(
                imageData: viewModel.imageData,
                imageSize: CGSize(width: 130, height: 100),
                cornerRadius: 10,
                shadowIsOn: false
            )
            Text(viewModel.courseName)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
