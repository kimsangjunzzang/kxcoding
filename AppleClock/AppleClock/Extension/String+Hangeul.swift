//
//  String+Hangeul.swift
//  AppleClock
//
//  Created by 김상준 on 7/8/24.
//

import Foundation

extension String {
    var chosung: String? {
        guard trimmingCharacters(in: .whitespacesAndNewlines).count > 0 else {
            return nil
        }
        
        guard let firstChar = first, let unicodeScalar = UnicodeScalar(String(firstChar))
        else {
            return nil
        }
        guard (0xAC00 ... 0xD7AF).contains(unicodeScalar.value) else {
            return String(firstChar)
        }
        
        let chosungList = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
        let chosungIndex = (unicodeScalar.value - 0xAC00) / (21 * 28)
        return chosungList[Int(chosungIndex)]
        
    }
}
