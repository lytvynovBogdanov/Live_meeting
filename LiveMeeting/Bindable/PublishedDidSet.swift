//
//  PublishedDidSet.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 02.05.2021.
//

import Combine

@propertyWrapper
public final class PublishedDidSet<Value> {
    private var value: Value {
        didSet {
            didSet?(value)
        }
    }
    private let subject: CurrentValueSubject<Value, Never>
    public var didSet: ((Value) -> Void)?

    public init(_ value: Value, didSet: ((Value) -> Void)? = nil) {
        self.value = value
        self.subject = CurrentValueSubject(value)
        self.didSet = didSet
        self.wrappedValue = value
    }

    public var wrappedValue: Value {
        get { value }
        set {
            value = newValue
            subject.send(value)
        }
    }

    public var projectedValue: CurrentValueSubject<Value, Never> {
        self.subject
    }
}
