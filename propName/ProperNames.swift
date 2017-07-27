//
//  ProperNames.swift
//  propName
//
//  Created by Lijie Zhao on 7/27/17.
//  Copyright © 2017 Lijie Zhao. All rights reserved.
//

import Foundation

class Names {
//    Load the entire file into a variable.
    let namesURL: URL
    var namesString: String
    var namesArray: [String]
    
//  The class names will be an optional object since we init? 
    init?() {
//        ensure there is a value and its valid. This is process of unwrap.
//        Guard is similar to if.
        guard let url = Bundle.main.url(forResource: "propernames", withExtension: "txt")
            else {
                print("failed to get URL")
                return nil
        }
        
        namesURL = url
        
        guard let names = try? String(contentsOf: namesURL, encoding: .utf8)
            else {
                print("Could not load name file")
                return nil
        }
        
        namesString = names
        
        namesArray = namesString.components(separatedBy: "\n")
        
//        print(namesArray)
    }
    
//  This is a function used in viewController
    func add(name:String?) {
        guard let newName = name else {
            return
        }
        
        if newName.isEmpty {
            return
        }
        
        namesArray.append(newName)
        namesArray.sort()
        
        namesString = namesArray.joined(separator: "\n")
    }
}
