//
//  CourseDetailsViewModel.swift
//  AppMVVM-SwiftUI
//
//  Created by Igor on 04.03.2022.
//

import Foundation

class CourseDeteilsViewModel: ObservableObject {
    
    var courseName: String {
        course.name
    }
    var imageData: Data? {
        try? NetworkManager.shared.fetchImage(url: course.imageUrl)
    }
    var numberOfLessons: String {
        "Number of lessons \(course.numberOfLessons)"
    }
    var numberOfTests: String {
        "Number of tests \(course.numberOfTests)"
    }
    
    @Published var isFavorite: Bool {
        didSet {
            UDManager.shared.saveDataUD(status: isFavorite, courseName: course.name)
        }
    }
    
    private let course: Course
    
    init(course: Course) {
        isFavorite = UDManager.shared.getDataUD(courseName: course.name)
        self.course = course
    }
    
    func favoriteButtonPressed() {
        isFavorite.toggle()
    }
}
