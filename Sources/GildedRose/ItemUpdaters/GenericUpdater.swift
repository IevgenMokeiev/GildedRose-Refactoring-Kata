//
//  GenericUpdater.swift
//  
//
//  Created by Yevhen Mokeiev on 03.02.2023.
//

import Foundation

class GenericUpdater: ItemUpdater {

    let item: Item

    required init(item: Item) {
        self.item = item
    }

    static func make(item: Item) -> Self {
        return self.init(item: item)
    }

    func updateQuality() {
        degradeQuality()
    }

    func updateSellIn() {
        decreaseSellIn()
    }

    func updateQualityExpired() {
        degradeQuality()
    }
}
