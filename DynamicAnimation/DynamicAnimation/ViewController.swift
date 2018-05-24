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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .yellow
    setupViews()
  }
  
  private func setupViews() {
    let rect = CGRect(x: 100, y: 100, width: 100, height: 100)
    let greenView = UIView(frame: rect)
    greenView.backgroundColor = .green
    view.addSubview(greenView)
    let redView = UIView(frame: CGRect(x: rect.origin.x + 200 , y: rect.origin.y + 100, width: rect.width-20, height: rect.height-30))
    redView.backgroundColor = .red
    view.addSubview(redView)
    let pan = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:) ))
    greenView.addGestureRecognizer(pan)
  }
  
  //1. TODO
  private func createAnimator() {
    
  }
  
}

//2. TODO
extension ViewController: UIDynamicAnimatorDelegate {
  
}

//  Behaviors

extension ViewController {
  
  //3. TODO
  private func collisionBehavior() {
  }
  
  //4. TODO
  private func gravityBehavior() {
    
  }
  
  //5. TODO
  private func addItemBehavior() {
    
  }
  
  //6. TODO
  private func addAttachmentBehavior(view: UIView) {
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
    case .ended:
      print(#line, "ended")
    case .changed:
      print(#line, "changed")
    default:
      print(#line, "default")
    }
  }
}


