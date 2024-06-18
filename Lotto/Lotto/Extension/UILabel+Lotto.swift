//
//  UILabel+Lotto.swift
//  Lotto
//
//  Created by 김상준 on 6/18/24.
//

import Foundation
import UIKit


extension UILabel {
    func setLottoNumber(
        _ number: Int,
        with backgroundColor: UIColor? = nil,
        textColor: UIColor? = nil
    ){
        layer.cornerRadius = bounds.width / 2
        clipsToBounds = true
        text = String(number)
        
        self.backgroundColor = backgroundColor ?? getColors(from: number).backgroundColor
        self.textColor = textColor ?? getColors(from: number).textColor
    }
    
    // access modigier. 접근 지정자
    fileprivate func getColors(from number: Int
    ) -> (backgroundColor: UIColor,
          textColor: UIColor
    ){
        switch number{
        case 1...10:
            return (UIColor.yellow,UIColor.black)
        case 11...20:
            return (UIColor.blue,UIColor.white)
        case 21...30:
            return (UIColor.red,UIColor.white)
        case 31 ... 40:
            return (UIColor.gray,UIColor.white)
        case 41 ... 45:
            return (UIColor.green,UIColor.black)
        default:
            return (UIColor.purple,UIColor.white)
            
        }
    }
}
