//
//  ViewModel.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 02.05.2021.
//

import Foundation

var person = Person(name: "Bob", age: 25)

class ViewModel {
    @PublishedDidSet<Int?>(nil, didSet: { value in
    guard let value = value else { return }
        person.age = value
    }) var personAge
    
    var dd = 0
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.personAge = 26
        }
    }
    
    var fullName: String {
        "Name is \(person.name), age: \(person.age)"
    }
}
