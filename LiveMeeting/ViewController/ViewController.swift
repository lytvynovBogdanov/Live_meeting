//
//  ViewController.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 02.05.2021.
//

import Combine
import UIKit

class ViewController: ViewControllerBindable<ViewModel> {
    private var cancellable = Set<AnyCancellable>()
    
    override func bindViewModel() {
        viewModel.$personAge
            .filter { $0 == nil }
            .sink(receiveValue: { value in
                print("age is empty")
            }).store(in: &cancellable)
        
        viewModel.$personAge
            .filter { $0 != nil }
            .sink { [unowned self] age in
                print("Age is \(age!)")
                self.printFullName()
            }
            .store(in: &cancellable)
        
        printFullName()
        
    }
    
    func printFullName() {
        print(viewModel.fullName)
    }
}
