//
//  ViewController.swift
//  uikit-test
//
//  Created by shafia on 07/08/2025.
//

import UIKit

class ViewController: UIViewController {

    let drawRectView = MyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        
        drawRectView.translatesAutoresizingMaskIntoConstraints = false
                
        view.addSubview(drawRectView)
        
        NSLayoutConstraint.activate([
            drawRectView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            drawRectView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            drawRectView.widthAnchor.constraint(equalToConstant: 400),
            drawRectView.heightAnchor.constraint(equalToConstant: 400),
        ])
        
        print(UIScreen.main.bounds.size)
    }

}

class MyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder){
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
