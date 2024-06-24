//
//  HalfEmbedingUnwindSegue.swift
//  HelloSegue
//
//  Created by 김상준 on 6/25/24.
//

import UIKit

class HalfEmbedingUnwindSegue: UIStoryboardSegue {
    
    override func perform() {
        var frame = source.view.frame
        frame = frame.offsetBy(dx: 0, dy: frame.height)
        
        UIView.animate(withDuration: 0.3) {
            self.source.view.frame = frame
            self.source.view.alpha = 0.0
            
        } completion: { _ in
            self.source.view.removeFromSuperview()
            self.source.removeFromParent()
            // 이렇게 해야지 메모리에서도 정상적으로 제거된다.
        }
    }

}
