//
//  CourseListVIewModel.swift
//  AppMVVM-SwiftUI
//
//  Created by Igor on 04.03.2022.
//

import SwiftUI

class CourseListViewModel: ObservableObject {
    @Published var rows: [CourseDeteilsViewModel] = []
    
    func fetchCourses() {
        NetworkManager.shared.fetchCourses { result in
            switch result {
                
            case .success(let courses):
                
                courses.forEach { course in
                    let courseDetailsVM = CourseDeteilsViewModel(course: course)
                    self.rows.append(courseDetailsVM)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
