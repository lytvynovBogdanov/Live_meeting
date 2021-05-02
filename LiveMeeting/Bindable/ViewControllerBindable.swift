//
//  ViewControllerBindable.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 02.05.2021.
//

import UIKit

class ViewControllerBindable<Type>: UIViewController, Bindable {
    
    var viewModel: Type
    
    required init(_ viewModel: Type) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        preconditionFailure("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {}
}
