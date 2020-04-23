//
//  WTStatusViewModel.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/23.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import Foundation

class WTStatusViewModel {
    
    
    var array = [String]()
    
    func loadData(isPullUp: Bool, completion: (_ isSuccess: Bool) -> ()) {
        
        for i in 0...20 {
            if isPullUp {
                array.insert(("上拉 \(i)"), at: 0)
            } else {
                array.append("下拉 \(i)")
            }
            
            completion(true)
        }
    }
}
