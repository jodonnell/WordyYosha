//
//  BoardLetter.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/15/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation
import SpriteKit

class BoardLetter: Letter {
    var position: Point

    init(sprite: SKSpriteNode, id: Int, point: Point) {
        self.position = point
        super.init(sprite: sprite, id: id)
        if self.position.y > 7 {
            self.sprite.hidden = true
        }
    }

    func isPointIn(point: CGPoint) -> Bool {
        let inset = 10.0
        var frame = CGRectMake(self.sprite.frame.origin.x + inset, self.sprite.frame.origin.y + inset, self.sprite.frame.size.width - inset, self.sprite.frame.size.height - inset)

        return CGRectContainsPoint(frame, point)
    }

    func moveDown(number: Int) {
        if number == 0 { return }
        self.position = Point(x: self.position.x, y: self.position.y - number)

        if (self.position.y < 8) {
            self.sprite.hidden = false
        }
        
        let moveDownY = Float(-self.sprite.frame.size.height - 1) * Float(number)
        let duration = 0.3 * Float(number)
        let moveDownAction = SKAction.moveByX(0.0, y: CGFloat(moveDownY), duration: NSTimeInterval(duration))
        self.sprite.runAction(moveDownAction)
    }

}
