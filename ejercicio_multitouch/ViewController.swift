//
//  ViewController.swift
//  ejercicio_multitouch
//
//  Created by Dianelys Saldaña on 11/19/23.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var lp: UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(handleTap))
        tap.delegate = self
        self.imageView.addGestureRecognizer(tap)
        
        // Gesto de pulsar y arrastrar
        let pan = UIPanGestureRecognizer(target: self, action:#selector(handlePan))
        pan.delegate = self
        self.imageView.addGestureRecognizer(pan)

        // Gesto de rotación
        let rotation = UIRotationGestureRecognizer(target: self, action:#selector(handleRotation))
        rotation.delegate = self
        self.imageView.addGestureRecognizer(rotation)

        // Gesto de pellizcar
        let pinch = UIPinchGestureRecognizer(target: self, action:#selector(handlePinch))
        pinch.delegate = self
        self.imageView.addGestureRecognizer(pinch)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        longPress.delegate = self
        self.imageView.addGestureRecognizer(longPress)


    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        print("Tap");
    }

    @objc func handlePan(sender: UIPanGestureRecognizer) {
        print("Pan")
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }

    @objc func handleRotation(sender: UIRotationGestureRecognizer) {
        print("Rotation")
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }

    @objc func handlePinch(sender: UIPinchGestureRecognizer) {
        print("Pinch")
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1;
        }
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    @objc func longPress(sender: UILongPressGestureRecognizer) {
        print("long press")
    }
}

