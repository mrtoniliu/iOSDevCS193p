//
//  Theme.swift
//  Memorize
//
//  Created by ShinyMimikyu on 07/09/2020.
//

import SwiftUI

struct Theme {
    var name: String
    var emojiList: [String]
    var numPairOfCards: Int?
    var color: Color
}

let themes: [Theme] = [
    Theme(name: "Animal", emojiList: ["🐶", "🐱", "🐹", "🦑", "🐙"], color: .red),
    Theme(name: "Flags", emojiList: ["🇸🇬","🇯🇵","🏴‍☠️","🏳️‍🌈","🇬🇧","🇹🇼","🇺🇸","🇦🇶","🇰🇵","🇭🇰","🇲🇨","🇼🇸"], numPairOfCards: 6, color: .green)

]
