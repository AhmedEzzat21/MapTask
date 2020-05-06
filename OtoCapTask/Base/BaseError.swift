//
//  BaseError.swift
//  SurvvCustomer
//
//  Created by Ahmed Meguid on 5/19/19.
//  Copyright © 2019 VirginGates. All rights reserved.
//

import Foundation

class BaseError: Error, LocalizedError {
    
    func localizeError(errorCode: String, args: [String: String]) -> String {
        var message = Bundle.main.localizedString(forKey: errorCode, value: nil, table: "Errors")
        for (key, value) in args {
            let translatedValue = value
                .split(separator: ",")
                .map({localizeError(errorCode: String($0), args: [:])})
                .joined(separator: localizeError(errorCode: ",", args: [:]))
            message = message.replacingOccurrences(of: "$\(key)", with: translatedValue)
        }
        return message
    }
    
    public var errorDescription: String? {
        return nil
    }
}
