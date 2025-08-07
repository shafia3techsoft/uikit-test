//
//  ViewController.swift
//  uikit-test
//
//  Created by shafia on 07/08/2025.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

//    let drawRectView = MyView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemGray5
//        
//        drawRectView.translatesAutoresizingMaskIntoConstraints = false
//                
//        view.addSubview(drawRectView)
//        
//        NSLayoutConstraint.activate([
//            drawRectView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            drawRectView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            drawRectView.widthAnchor.constraint(equalToConstant: 400),
//            drawRectView.heightAnchor.constraint(equalToConstant: 400),
//        ])
//
//        print(UIScreen.main.bounds.size)
//    }
    
    
    let animView = UIView()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            // MARK: 1. Setup the animatable view
            animView.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
            animView.backgroundColor = .white
            animView.layer.cornerRadius = 10
            view.addSubview(animView)
            
            // Trigger all animations
            applyCABasicAnimation()
            applyCAKeyframeAnimation()
            applyCAAnimationGroup()
            applyCATransition()
            applyCAGradientLayer()
            applyCAShapeLayer()
            applyCATransform3D()
        }

        // MARK: 2. CABasicAnimation - Fade In & Move
        func applyCABasicAnimation() {
            let fade = CABasicAnimation(keyPath: "opacity")
            fade.fromValue = 0
            fade.toValue = 1
            fade.duration = 1.0
            
            let move = CABasicAnimation(keyPath: "position")
            move.fromValue = CGPoint(x: animView.center.x, y: animView.center.y + 150)
            move.toValue = animView.center
            move.duration = 1.0
            
            animView.layer.add(fade, forKey: "fadeIn")
            animView.layer.add(move, forKey: "moveUp")
        }

        // MARK: 3. CAKeyframeAnimation - Bouncy path
        func applyCAKeyframeAnimation() {
            let bounce = CAKeyframeAnimation(keyPath: "position.y")
            bounce.values = [animView.center.y, animView.center.y - 40, animView.center.y, animView.center.y - 20, animView.center.y]
            bounce.keyTimes = [0, 0.25, 0.5, 0.75, 1]
            bounce.duration = 1.5
            bounce.beginTime = CACurrentMediaTime() + 1.2
            animView.layer.add(bounce, forKey: "bounce")
        }

        // MARK: 4. CAAnimationGroup - Scale and Rotate
        func applyCAAnimationGroup() {
            let scale = CABasicAnimation(keyPath: "transform.scale")
            scale.fromValue = 1
            scale.toValue = 1.5

            let rotate = CABasicAnimation(keyPath: "transform.rotation")
            rotate.fromValue = 0
            rotate.toValue = Double.pi * 2

            let group = CAAnimationGroup()
            group.animations = [scale, rotate]
            group.duration = 2.0
            group.beginTime = CACurrentMediaTime() + 2.5
            animView.layer.add(group, forKey: "groupAnimation")
        }

        // MARK: 5. CATransition - Fade Transition (for layer content)
        func applyCATransition() {
            let transition = CATransition()
            transition.type = .fade
            transition.duration = 1.0
            transition.beginTime = CACurrentMediaTime() + 5
            animView.layer.add(transition, forKey: "fadeTransition")

            // Change background color after transition
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.animView.backgroundColor = .systemPink
            }
        }

        // MARK: 6. CAGradientLayer - Add background gradient
        func applyCAGradientLayer() {
            let gradient = CAGradientLayer()
            gradient.frame = animView.bounds
            gradient.colors = [UIColor.blue.cgColor, UIColor.cyan.cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            gradient.cornerRadius = animView.layer.cornerRadius
            animView.layer.insertSublayer(gradient, at: 0)
        }

        // MARK: 7. CAShapeLayer - Add a circular shape outline
        func applyCAShapeLayer() {
            let shapeLayer = CAShapeLayer()
            let path = UIBezierPath(ovalIn: animView.bounds.insetBy(dx: 5, dy: 5))
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = UIColor.yellow.cgColor
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineWidth = 3

            animView.layer.addSublayer(shapeLayer)
        }

        // MARK: 8. CATransform3D - 3D Flip Animation
        func applyCATransform3D() {
            var transform = CATransform3DIdentity
            transform.m34 = -1.0 / 500 // Perspective
            transform = CATransform3DRotate(transform, CGFloat.pi, 1, 0, 0)

            UIView.animate(withDuration: 2.0, delay: 6.5, options: []) {
                self.animView.layer.transform = transform
            }
        }

}

class MyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let rectangle1 = CGRect(x: 0, y: 0, width: 200, height: 180).insetBy(dx: 10, dy: 10)
        
        context.setFillColor(UIColor.systemRed.cgColor)
        context.setStrokeColor(UIColor.systemGreen.cgColor)
        context.setLineWidth(20)
        context.addRect(rectangle1)
        context.drawPath(using: .fillStroke)
        context.fill(rectangle1)
        
        let rectangle2 = CGRect(x: 256, y: 256, width: 128, height: 128)
        
        context.setFillColor(UIColor.systemYellow.cgColor)
        context.setStrokeColor(UIColor.systemBlue.cgColor)
        context.setLineWidth(10)
        context.addEllipse(in: rectangle2)
        context.drawPath(using: .fillStroke)
    }
}
