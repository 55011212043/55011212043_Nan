//
//  ViewController.swift
//  UIKit_Animation
//
//  Created by iStudents on 3/27/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit
//เพิ่ม protocol UICollisionBehaviorDelegate
class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var square: UIView! //เพิ่มสี่เหลี่ยม
    
    var animator: UIDynamicAnimator!//เพิ่มตัวแปรแรงดึงดูด
    var gravity: UIGravityBehavior!//เพิ่มตัวแปรแรงดึงดูด

    ///เพิ่มตัวแปรขอบเขต
    var collision: UICollisionBehavior!
    
    
    ///เพิ่มตัวแปรสิ่งกีดขวาง
    var barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
    
    ////////
    var snap: UISnapBehavior!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))// เรียกใช้สี่เหลี่ยม
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        ///เรียกใช้ตัวแปรแรงดึงดูด
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        //เรียกใช้ตัวแปรสิ่งกีดขวาง
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
        
        ///ใช้ตัวแปรขอบเขต
        //collision = UICollisionBehavior(items: [square,barrier])//ตั้งให้ สี่เหลี่ยม มีคุณลักษณะที่รองรับการชน
        collision = UICollisionBehavior(items: [square])
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        
        collision.translatesReferenceBoundsIntoBoundary = true// ตั้งให้มีขอบเขตของการชนยุ่ที่ขอบเขตของ view นั้น
        animator.addBehavior(collision)
        
        
        
        collision.action = {
            println("\(NSStringFromCGAffineTransform(self.square.transform)) \(NSStringFromCGPoint(self.square.center))")//ให้แสดงค่าใน log ทุกครั้งที่มีการชน
        }
        
        collision.collisionDelegate = self//ประกาศตั้งค่าเริ่มต้น
        
        ///เพิ่มคุณลักษณะการชน
        let itemBehavour = UIDynamicItemBehavior(items: [square])
        itemBehavour.elasticity = 0.6
        animator.addBehavior(itemBehavour)
   
    }
    
    var firstContact = false
   
    func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint) {
            println("Boundary contact occurred - \(identifier)")
        
        ////ชนแล้วมีการเปลี่ยนแปลง
        let collidingView = item as UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(0.3){
            collidingView.backgroundColor = UIColor.grayColor()
        }
       // var firstContact = false
        if(!firstContact){
            firstContact = true
            
            let square = UIView(frame: CGRect(x: 30, y: 0, width: 100, height: 100))
            square.backgroundColor = UIColor.grayColor()
            view.addSubview(square)
            
            collision.addItem(square)
            gravity.addItem(square)
            
            let attact = UIAttachmentBehavior(item: collidingView, attachedToItem: square)
            animator.addBehavior(attact)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if (snap != nil){
            animator.removeBehavior(snap)
        }
        
        let touch = touches.anyObject() as UITouch
        snap = UISnapBehavior(item: square, snapToPoint: touch.locationInView(view))
        animator.addBehavior(snap)
    }
    

}

