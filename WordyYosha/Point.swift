//
//  Point.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/15/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation

struct Point {
    var x = 0
    var y = 0
}

@infix func == (left: Point, right: Point) -> Bool {
    return left.x == right.x && left.y == right.y
}
