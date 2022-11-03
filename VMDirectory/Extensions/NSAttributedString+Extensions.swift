//
//  NSAttributedString+Extensions.swift
//  VMDirectory
//
//  Created by ANSK Vivek on 27/10/22.
//

import UIKit

extension NSAttributedString {
    func getAttributedString(text: String) -> NSAttributedString {
        let regularAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: CGFloat(Constants.fontTextSize))]
        let largeAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: Constants.fontTextSize)]
        let attributedSentence = NSMutableAttributedString(string: text, attributes: regularAttributes)

        let range = text.range(of: ":")!
        let convertedRange = NSRange(range, in: text)
        let attributedString = NSMutableAttributedString(string: text)
        print(attributedString)
        
        attributedSentence.setAttributes(largeAttributes, range: NSRange(location: 0, length: convertedRange.location+1))
        return attributedSentence
    }
}
