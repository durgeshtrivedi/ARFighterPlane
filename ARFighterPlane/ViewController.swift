//
//  ViewController.swift
//  ARFighterPlan
//
//  Created by Durgesh Trivedi on 20/07/17.
//  Copyright © 2017 durgesh. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
   // var sceneView: SCNView?
    var level: Level?
    
    var movement = LongPress.FRONT
    enum LongPress {
        case FRONT
        case BACK
    }
    
    // -------------------------------------------------------------------------
    // MARK: - Swipe gestures
    
    @objc func handleSwipe(_ gestureRecognize: UISwipeGestureRecognizer) {
        
        switch gestureRecognize.direction {
        case .left :
             level!.swipeLeft()
        case .right :
            level!.swipeRight()
        case .up :
                level!.swipeUP()
        case .down :
            level!.swipeDown()
        default :
            level!.swipeDefault()
        }
        
      /*  if (gestureRecognize.direction == .left) {
            level!.swipeLeft()
        }
        else if (gestureRecognize.direction == .right) {
            level!.swipeRight()
        } */
    }
    
    @objc func handleLongPress(_ gestureRecognize: UILongPressGestureRecognizer) {
        
        if gestureRecognize.numberOfTapsRequired == 1  {
           // movement = movement == .BACK ? .FRONT : .BACK
        }
            if movement == .FRONT {
                level!.moveFront()
                
            }
            else {
                level!.moveBack()
                movement = .FRONT
            }
        
    }
    
    // -------------------------------------------------------------------------
    // MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        level = Level()
        level!.create()
        
     //   let posX = floatBetween(-0.5, and: 0.5)
       // let posY = floatBetween(-0.5, and: 0.5  )
       // level!.position = SCNVector3(posX, posY, -1) // SceneKit/AR coordinates are in meters
       // sceneView.scene.rootNode.addChildNode(cubeNode!)
        
        sceneView.delegate = self
        sceneView!.scene = level!
        sceneView!.allowsCameraControl = false
        sceneView!.showsStatistics = true
        sceneView!.backgroundColor = UIColor.black
        //_sceneView!.debugOptions = .showWireframe
       // self.view = sceneView
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeftGesture.direction = .left
        sceneView!.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRightGesture.direction = .right
        sceneView!.addGestureRecognizer(swipeRightGesture)
        
        let swipeUPGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeUPGesture.direction = .up
        sceneView!.addGestureRecognizer(swipeUPGesture)
        
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeDownGesture.direction = .down
        sceneView!.addGestureRecognizer(swipeDownGesture)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        sceneView!.addGestureRecognizer(longPressGesture)
    }
    
    // -------------------------------------------------------------------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingSessionConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
        
    }
    
    // MARK: - ARSCNViewDelegate
    

    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        return node
    }

    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
