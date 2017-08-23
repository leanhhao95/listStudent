//
//  ListStudent.swift
//  ListStuden
//
//  Created by thang on 8/14/17.
//  Copyright © 2017 thang. All rights reserved.
//

import UIKit

class List {
    
    //MARK: Properties
    
    var name: String
    var age: String
    var phone: String
    
    
    // Initialization
    init?(name: String, age: String , phone: String) {
        
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        self.age = age
        self.phone = phone
    }
}
