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
    var position: CGPoint

    init(sprite: SKSpriteNode, id: Int, point: CGPoint) {
        self.position = point
        super.init(sprite: sprite, id: id)
    }

    func isPointIn(point: CGPoint) -> Bool {
        return CGRectContainsPoint(self.sprite.frame, point)
    }

    func moveDown(number: Int) {
        if number == 0 { return }
        self.position = CGPointMake(self.position.x, self.position.y - CGFloat(number))

        let moveDownY = Float(-self.sprite.frame.size.height - 1) * Float(number)
        let duration = 0.3 * Float(number)
        let moveDownAction = SKAction.moveByX(0.0, y: CGFloat(moveDownY), duration: NSTimeInterval(duration))
        self.sprite.runAction(moveDownAction)
    }

}
