//
//  Point.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/15/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation

struct Point: Printable {
    var x = 0
    var y = 0

    var description: String {
        return "\(self.x) \(self.y)"
    }
}

@infix func == (left: Point, right: Point) -> Bool {
    return left.x == right.x && left.y == right.y
}
