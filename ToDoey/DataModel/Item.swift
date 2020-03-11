//
//  Item.swift
//  ToDoey
//
//  Created by Home Computer on 06/03/2020.
//  Copyright © 2020 Home Computer. All rights reserved.
//

import Foundation

class Item : Encodable, Decodable {
    
    var title : String = ""
    var done : Bool = false
}
