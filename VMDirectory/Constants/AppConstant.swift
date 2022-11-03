//
//  AppConstant.swift
//  VMDirectory
//
//  Created by ANSK Vivek on 30/10/22.
//

import UIKit

class AppConstant: NSObject {
    
    static let sharedInstance = AppConstant()
    
    var currentAPIError : AppAPIError? = nil
    
    let isPrintAllowed = true

    func log(message: Any,
             file: String = #file,
             function: String = #function,
             line: Int = #line) {
        if isPrintAllowed
        {
            let url = NSURL(fileURLWithPath: file)

            print("\(message)\" \n(File: \(url.lastPathComponent ?? "?"), \nFunction: \(function),Line: \(line))\n\n")
        }
    }
}
