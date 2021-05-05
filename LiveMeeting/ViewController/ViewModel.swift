//
//  ViewModel.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 02.05.2021.
//

import Foundation

class ViewModel {
    @PublishedDidSet<Int?>(nil) var personAge
    
    let person: PersonEntity
    
    init() {
        self.person = PersonEntity(object: Fetcher<PersonData>().items.first)
        
        _personAge.didSet = { [weak self] value in
            guard let value = value,
                  let self = self else { return }
            self.person.age = value
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.personAge = 26
        }
    }
    
    var fullName: String {
        "Name is \(person.name), age: \(person.age)"
    }
}
