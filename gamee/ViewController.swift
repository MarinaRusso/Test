//
//  ViewController.swift
//  gamee
//
//  Created by Marina Russo on 05/06/17.
//  Copyright © 2017 Marina Russo. All rights reserved.
//

import UIKit
import SpriteKit
class ViewController: UIViewController {
    let corpoPallina = SKPhysicsBody(circleOfRadius: 25)
    let corpoBarretta = SKPhysicsBody(rectangleOf: CGSize(width: 100,height: 30))
    let corpoTerra = SKPhysicsBody(rectangleOf: CGSize(width: 500,height: 200))
    let corpoLimite = SKPhysicsBody(rectangleOf: CGSize(width: 500,height: 1))
    

    

    @IBOutlet weak var skView: SKView!
    func didBegin(_ contact : SKPhysicsContact){
        contact.bodyA.applyImpulse(CGVector(dx: Int(arc4random_uniform(20)) - 20, dy:50))
    }
    @IBAction func DESTRA(_ sender: Any) {
        corpoBarretta.applyImpulse(CGVector(dx:5, dy:0))
        

        
    }
    
    @IBAction func SINISTRA(_ sender: Any) {
    corpoBarretta.applyImpulse(CGVector(dx:-5, dy:0))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let scena = SKScene(size: skView.frame.size)
        scena.physicsWorld.speed = 1.3
        
        skView.presentScene(scena)
        
        let pallina = SKShapeNode(circleOfRadius: 25)
        pallina.fillColor = .blue
        pallina.name = "pallina"
        pallina.position = CGPoint(x: scena.frame.midX, y: scena.frame.midY + 50)
        scena.addChild(pallina)
        corpoPallina.applyImpulse(CGVector(dx: 0,dy : -50))
        corpoPallina.affectedByGravity = true
        pallina.physicsBody = corpoPallina
        
        
        
        let barretta = SKShapeNode(rectOf: CGSize(width: 100, height: 30))
        barretta.fillColor = .red
        barretta.name = "barretta"
        barretta.position = CGPoint(x: scena.frame.midX, y: scena.frame.midY - 180)
        scena.addChild(barretta)
        
        barretta.physicsBody = corpoBarretta
        corpoBarretta.affectedByGravity = false
        corpoBarretta.isDynamic = true
        corpoBarretta.restitution = 1.2
        
        let terra = SKShapeNode(rectOf: CGSize(width: 500, height: 200))
        terra.fillColor = .white
        terra.name = "barretta"
        terra.position = CGPoint(x: scena.frame.midX, y: scena.frame.midY - 250)
        scena.addChild(terra)
        
        terra.physicsBody = corpoTerra
        corpoTerra.affectedByGravity = false
        corpoTerra.isDynamic = false
        
        corpoTerra.contactTestBitMask = 3

        
        
        corpoBarretta.contactTestBitMask = 1
        
        let bordi = SKPhysicsBody(edgeLoopFrom: scena.frame)
        scena.physicsBody =  bordi
        scena.backgroundColor = .white
        

    }

    func didBegin(_ contact : SKPhysicsContact){
        contact.bodyB.applyImpulse(CGVector(dx: Int(arc4random_uniform(20)) - 20, dy:50))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

