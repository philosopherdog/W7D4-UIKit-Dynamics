//
//  ViewController.swift
//  AffineTransform
//
//  Created by steve on 2018-05-24.
//  Copyright © 2018 steve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var button: UIButton!
  var counter = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func buttonTapped(_ sender: UIButton) {
    let count = counter %  6
    button.isEnabled = false
    var trans: CGAffineTransform!
    switch count {
    case 0:
      trans = CGAffineTransform(scaleX: 2.0, y: 2.0)
    case 1:
      trans = .identity
    case 2:
      trans = CGAffineTransform(rotationAngle: .pi)
    case 3:
      trans = .identity
    case 4:
      trans = CGAffineTransform(translationX: 100, y: 300)
    case 5:
      trans = .identity
    default:
      print(#line, "default")
    }
    
    counter += 1
    UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, animations: {[weak self] in
      self?.button.transform = trans
    }) {[weak self] (success) in
      self?.button.isEnabled = success
    }
  }
  
}

