//
//  ViewController.swift
//  DynamicAnimation
//
//  Created by steve on 2018-05-23.
//  Copyright © 2018 steve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var animator: UIDynamicAnimator!
  
  var gravity: UIGravityBehavior!
  var collision: UICollisionBehavior!
  var attachment: UIAttachmentBehavior!
  var itemBehavior: UIDynamicItemBehavior!
  
  var redView: UIView!
  var greenView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .yellow
    setupViews()
    createAnimator()
  }
  
  private func setupViews() {
    let rect = CGRect(x: 100, y: 100, width: 100, height: 100)
    greenView = UIView(frame: rect)
    greenView.backgroundColor = .green
    view.addSubview(greenView)
    redView = UIView(frame: CGRect(x: rect.origin.x + 200 , y: rect.origin.y + 100, width: rect.width-20, height: rect.height-30))
    redView.backgroundColor = .red
    view.addSubview(redView)
    let pan = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:) ))
    greenView.addGestureRecognizer(pan)
  }
  
  //1. TODO
  private func createAnimator() {
    animator = UIDynamicAnimator(referenceView: view)
    animator.delegate = self
  }
  
}

//2. TODO
extension ViewController: UIDynamicAnimatorDelegate {
  private func dynamicAnimatorDidPause(animator: UIDynamicAnimator) {
    print(#line, #function)
  }
}

//  Behaviors

extension ViewController {
  
  //3. TODO
  private func collisionBehavior() {
    collision = UICollisionBehavior(items: [greenView, redView])
    collision.translatesReferenceBoundsIntoBoundary = true
    animator.addBehavior(collision)
  }
  
  //4. TODO
  private func gravityBehavior() {
    gravity = UIGravityBehavior(items: [greenView, redView])
//    gravity.angle = 2.0
    animator.addBehavior(gravity)
  }
  
  //5. TODO
  private func addItemBehavior() {
    itemBehavior = UIDynamicItemBehavior(items: [redView])
    itemBehavior.elasticity = 0.8
    itemBehavior.friction = 1.0
    animator.addBehavior(itemBehavior)
  }
  
  //6. TODO
  private func addAttachmentBehavior() {
    attachment = UIAttachmentBehavior.init(item: redView, offsetFromCenter: .zero, attachedTo: greenView, offsetFromCenter: .zero)
    attachment.length = 100
    animator.addBehavior(attachment)
  }
}

//7. TODO Handle Pan

extension ViewController {
  
  @objc private func viewPanned(_ sender: UIPanGestureRecognizer) {
    sender.view?.center = sender.location(in: view)
    let state = sender.state
    switch state {
    case .began:
      print(#line, "began")
//      animator.removeAllBehaviors()
//      addAttachmentBehavior()
    case .ended:
      print(#line, "ended")
      animator.removeBehavior(attachment)
//      gravityBehavior()
//      collisionBehavior()
//      addItemBehavior()
    case .changed:
      print(#line, "changed")
      animator.removeAllBehaviors()
      addAttachmentBehavior()
      
    default:
      print(#line, "default")
    }
  }
}


