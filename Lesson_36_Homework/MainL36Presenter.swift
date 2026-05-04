//
//  Presenter.swift
//  My Homework App
//
//  Created by Egor on 04.05.2026.
//

import Foundation

final class MainL36Presenter {
    
    weak var view: MainViewControllerL36Protocol?
    
    private var count: Int = 0

    init(view: MainViewControllerL36Protocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        updateView()
    }
    
    func didTapIncrease() {
        guard count < 50 else { return }
        count += 1
        updateView()
    }
    
    func didTapDecrease() {
        guard count > 0 else { return }
        count -= 1
        updateView()
    }
    
    private func updateView() {
        view?.setValue("\(count)")
    }
    
    
}
