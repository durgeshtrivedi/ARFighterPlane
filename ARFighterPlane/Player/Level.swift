//
//  TutorialLevel2.swift
//
//  Part of the SceneKit Tutorial Series: From Zero to Hero at:
//  http://www.rogerboesch.com:2368/scenekit-tutorial-series-from-zero-to-hero/
//
//  Created by Roger Boesch on 12/10/16.
//  Copyright © 2016 Roger Boesch. All rights reserved.
//
//  Feel free to use this code in every way you want, but please consider also
//  to give esomething back to the community.
//
//  I don't own the license rights for the assets used in this tutorials
//  So before you use for something else then self-learning, please check by yourself the license behind
//  or even better replace it with your own art. Thank you!
//

import UIKit
import SceneKit

// -----------------------------------------------------------------------------

class Level: SCNScene, SCNSceneRendererDelegate, SCNPhysicsContactDelegate {
    private let levelWidth = 220
    private let levelLength = 220
    var player: Player?
    
    // -------------------------------------------------------------------------
    // MARK: - Input handling
    
    func swipeLeft() {
        player!.moveLeft()
    }

    // Right Swipe

    func swipeRight() {
        player!.moveRight()
    }

    // Swipe UP
    func swipeUP() {
        player!.moveUP()
    }
    
    // Swipe Down
    func swipeDown() {
        player!.moveDown()
    }

    // Keep in center
    func swipeDefault() {
        player!.moveDefault()
    }
    
    // MOve Front
    func moveFront() {
        player!.moveFront()
    }
    
    //Move Back
    func moveBack() {
        player!.moveBack()
    }
    // -------------------------------------------------------------------------
    // MARK: - Place objects
    
    private func addPlayer() {
        player = Player()
        
        let posX = floatBetween(-0.5, and: 0.5)
        let posY = floatBetween(-0.5, and: 0.5  )
        player!.position = SCNVector3(posX, posY, -1) // SceneKit/AR coordinates are in meters
        
       // player!.position = SCNVector3(0, 3, 0)
        self.rootNode.addChildNode(player!)
        
        let moveAction = SCNAction.moveBy(x: 0, y: 0, z: 0, duration: 20)
        player!.runAction(moveAction)
    }
    
    
    // -------------------------------------------------------------------------
    // MARK: - Initialisation
    
    func create() {
        addPlayer()
    }
    
    // -------------------------------------------------------------------------
    
    override init() {
        super.init()
    }
    
    // -------------------------------------------------------------------------
    
    required init(coder: NSCoder) {
        fatalError("Not yet implemented")
    }
    
    // -------------------------------------------------------------------------
    
}
