//
//  Course.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import Foundation

struct Course: Decodable {
    let name: String
    let imageUrl: URL
    let numberOfLessons: Int
    let numberOfTests: Int
}

extension Course {
    static func getCourse() -> Course {
        Course(name: "SUT",
               imageUrl: URL(string: "https://i.kym-cdn.com/entries/icons/mobile/000/031/015/cover5.jpg")!,
               numberOfLessons: 10,
               numberOfTests: 20)
    }
}
