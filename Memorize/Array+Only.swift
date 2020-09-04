//
//  Array+Only.swift
//  Memorize
//
//  Created by ShinyMimikyu on 05/09/2020.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
