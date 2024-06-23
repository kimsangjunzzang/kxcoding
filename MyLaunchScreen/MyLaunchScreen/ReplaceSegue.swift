//
//  ReplaceSegue.swift
//  MyLaunchScreen
//
//  Created by 김상준 on 6/23/24.
//

import UIKit

class ReplaceSegue: UIStoryboardSegue {
    override func perform() {
        guard let window = source.view.window else { return }
        
        window.rootViewController = destination
        
        UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: nil)
    }

}
