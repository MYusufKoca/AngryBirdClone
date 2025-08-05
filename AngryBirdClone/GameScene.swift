//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by Mehmet Yusuf Koca on 23.05.2025.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate {
    

    
    var ball = SKSpriteNode()
    var greenBox = SKSpriteNode()
    var greenBox2 = SKSpriteNode()
    var brownBox = SKSpriteNode()
    var brownBox2 = SKSpriteNode()
    var orangeBox = SKSpriteNode()
    var blueBox = SKSpriteNode()
    
    var gameStarted = false
    
    var originalPosition: CGPoint?
    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    
    enum ColliderType: UInt32 {
        case Ball = 1
        case Box = 2
        
    }
    
    override func didMove(to view: SKView) {
        
        let ballTexture = SKTexture(imageNamed:"ball")
        ball = childNode(withName:"ball") as! SKSpriteNode
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ballTexture.size().width / 4 )
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.mass = 0.1
        originalPosition = ball.position
        
        greenBox = childNode(withName:"greenBox") as! SKSpriteNode
        greenBox2 = childNode(withName:"greenbox2") as! SKSpriteNode
        brownBox = childNode(withName:"brownBox") as! SKSpriteNode
        brownBox2 = childNode(withName:"brownBox2") as! SKSpriteNode
        orangeBox = childNode(withName:"orangeBox") as! SKSpriteNode
        blueBox = childNode(withName:"blueBox") as! SKSpriteNode
        
        ball.physicsBody?.contactTestBitMask = ColliderType.Ball.rawValue
        ball.physicsBody?.categoryBitMask = ColliderType.Ball.rawValue
        ball.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
        
        let boxTextureBlue = SKTexture(imageNamed: "blueBox")
        let size = CGSize(width: boxTextureBlue.size().width / 8, height: boxTextureBlue.size().height / 8)
        
        greenBox.physicsBody = SKPhysicsBody(rectangleOf: size)
        greenBox.physicsBody?.isDynamic = true
        greenBox.physicsBody?.affectedByGravity = true
        greenBox.physicsBody?.allowsRotation = true
        greenBox.physicsBody?.mass = 0.3
        greenBox.physicsBody?.collisionBitMask = ColliderType.Ball.rawValue
        
        greenBox2.physicsBody = SKPhysicsBody(rectangleOf: size)
        greenBox2.physicsBody?.isDynamic = true
        greenBox2.physicsBody?.affectedByGravity = true
        greenBox2.physicsBody?.allowsRotation = true
        greenBox2.physicsBody?.mass = 0.3
        greenBox2.physicsBody?.collisionBitMask = ColliderType.Ball.rawValue
        
        brownBox.physicsBody = SKPhysicsBody(rectangleOf: size)
        brownBox.physicsBody?.isDynamic = true
        brownBox.physicsBody?.affectedByGravity = true
        brownBox.physicsBody?.allowsRotation = true
        brownBox.physicsBody?.mass = 0.3
        brownBox.physicsBody?.collisionBitMask = ColliderType.Ball.rawValue
        
        brownBox2.physicsBody = SKPhysicsBody(rectangleOf: size)
        brownBox2.physicsBody?.isDynamic = true
        brownBox2.physicsBody?.affectedByGravity = true
        brownBox2.physicsBody?.allowsRotation = true
        brownBox2.physicsBody?.mass = 0.3
        brownBox2.physicsBody?.collisionBitMask = ColliderType.Ball.rawValue
        
        orangeBox.physicsBody = SKPhysicsBody(rectangleOf: size)
        orangeBox.physicsBody?.isDynamic = true
        orangeBox.physicsBody?.affectedByGravity = true
        orangeBox.physicsBody?.allowsRotation = true
        orangeBox.physicsBody?.mass = 0.3
        orangeBox.physicsBody?.collisionBitMask = ColliderType.Ball.rawValue
        
        blueBox.physicsBody = SKPhysicsBody(rectangleOf: size)
        blueBox.physicsBody?.isDynamic = true
        blueBox.physicsBody?.affectedByGravity = true
        blueBox.physicsBody?.allowsRotation = true
        blueBox.physicsBody?.mass = 0.3
        blueBox.physicsBody?.collisionBitMask = ColliderType.Ball.rawValue
        

    
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
    
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 40
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x:0, y: self.frame.height / 4 )
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.collisionBitMask == ColliderType.Ball.rawValue || contact.bodyB.collisionBitMask == ColliderType.Ball.rawValue {
        
            score += 1
                scoreLabel.text = String(score)

            }

            
        
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
        ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 200 ))
        ball.physicsBody?.affectedByGravity = true */
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == ball {
                                
                                ball.position = touchLocation
                           
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == ball {
                                
                                ball.position = touchLocation
                           
                            }
                        }
                    }
                }
            }
        }
     }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == ball {
                                
                                let dx = -(touchLocation.x - originalPosition!.x)
                                let dy = -(touchLocation.y - originalPosition!.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                ball.physicsBody?.applyImpulse(impulse)
                                ball.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                                
                            }
                        }
                    }
                }
            }
        }
    }
        
    override func update(_ currentTime: TimeInterval) {
        
        if let ballPhysicsBody = ball.physicsBody {
             
            if ballPhysicsBody.velocity.dx <= 0.1 && ballPhysicsBody.velocity.dy <= 0.1 && ballPhysicsBody.angularVelocity <= 0.1 && gameStarted == true {
                
                ball.physicsBody?.affectedByGravity = false
                ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                ball.physicsBody?.angularVelocity = 0
                ball.zPosition = 1
                ball.position = originalPosition!
                gameStarted = false
                
            }
        }
    }
}
