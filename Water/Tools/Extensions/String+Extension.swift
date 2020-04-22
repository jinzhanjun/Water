//
//  String+Extension.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/22.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import Foundation

extension String {
    var addNameSpace: String {
        let nameSpace = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        return nameSpace + "." + self
    }
}
