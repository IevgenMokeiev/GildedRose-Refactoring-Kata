//
//  SulfurasUpdater.swift
//  
//
//  Created by Yevhen Mokeiev on 03.02.2023.
//

class SulfurasUpdater: ItemUpdater {

    let item: Item

    required init(item: Item) {
        self.item = item
    }

    static func make(item: Item) -> Self {
        return self.init(item: item)
    }

    func updateQuality() {
    }

    func updateSellIn() {
    }

    func updateQualityExpired() {
    }
}

