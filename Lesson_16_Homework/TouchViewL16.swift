//
//  TouchViewL16.swift
//  My Homework App
//
//  Created by Egor on 22.02.26.
//

import UIKit

class TouchViewL16: UIView {
    
    private let circle: UIView = {
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .systemOrange
        circle.layer.cornerRadius = 50
        circle.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return circle
    }()
    
    private let swipeView: UIView = {
        let swipeView = UIView()
        swipeView.translatesAutoresizingMaskIntoConstraints = false
        swipeView.layer.borderWidth = 1
        swipeView.backgroundColor = .systemGray6
        return swipeView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(swipeView)
        
        NSLayoutConstraint.activate([
            swipeView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            swipeView.leadingAnchor.constraint(equalTo: leadingAnchor),
            swipeView.trailingAnchor.constraint(equalTo: trailingAnchor),
            swipeView.topAnchor.constraint(equalTo: bottomAnchor, constant: -250),
        ])
        
        setupGestures()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGestures() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler))
        swipeLeft.direction = .left
        swipeView.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler))
        swipeRight.direction = .right
        swipeView.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler))
        swipeUp.direction = .up
        swipeView.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler))
        swipeDown.direction = .down
        swipeView.addGestureRecognizer(swipeDown)
    }
    
    @objc private func swipeHandler(_ gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .left:
            UIView.animate(withDuration: 0.2) {
                self.circle.center.x -= 100
            }
        case .right:
            UIView.animate(withDuration: 0.2) {
                self.circle.center.x += 100
            }
        case .up:
            UIView.animate(withDuration: 0.2) {
                self.circle.center.y -= 100
            }
        case .down:
            UIView.animate(withDuration: 0.2) {
                self.circle.center.y += 100
            }
        default:
            break
        }
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if swipeView.frame.contains(location) {
            return
        }
        
        if circle.frame.contains(location) && circle.superview != nil {
            circle.removeFromSuperview()
        } else {
            addSubview(circle)
            circle.center = location
        }
        print(location)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let previous = touch.previousLocation(in: self)
        
        if swipeView.frame.contains(location) {
            return
        } else {
            print("Движение: из \(previous) в \(location)")
            circle.center = location
        }
    }

}
