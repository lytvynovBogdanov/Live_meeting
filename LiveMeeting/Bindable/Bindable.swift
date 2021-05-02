//
//  Bindable.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 02.05.2021.
//

import Foundation

protocol Bindable {
    associatedtype ViewModel
    
    var viewModel: ViewModel { get }
    
    init(_ viewModel: ViewModel)
}

extension Bindable {
    func bindViewModel() {}
}
