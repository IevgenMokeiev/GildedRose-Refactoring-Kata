public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        items.forEach { item in
            updateQuality(for: item)
        }
    }

    // MARK :- Private

    private func updateQuality(for item: Item) {
        let itemType = Self.itemType(for: item)
        let itemUpdater = Self.itemUpdater(for: item)

        // Update quiality before sell in
        switch itemType {
        case .agedBrie:
            itemUpdater.updateQuality()
        case .backstagePass:
            itemUpdater.updateQuality()
        case .generic:
            itemUpdater.updateQuality()
        case .sulfuras:
            itemUpdater.updateQuality()
        }

        // Update sell in

        switch itemType {
        case .agedBrie:
            itemUpdater.updateSellIn()
        case .generic:
            itemUpdater.updateSellIn()
        case .sulfuras:
            itemUpdater.updateSellIn()
        case .backstagePass:
            itemUpdater.updateSellIn()
        }

        // Update quiality after sell in
        if item.sellIn < 0 {
            switch itemType {
            case .agedBrie:
                itemUpdater.updateQualityExpired()
            case .backstagePass:
                itemUpdater.updateQualityExpired()
            case .generic:
                itemUpdater.updateQualityExpired()
            case .sulfuras:
                itemUpdater.updateQualityExpired()
            }
        }
    }

    // MARK :- Generic methods

    private func degradeQuality(for item: Item) {
        if item.quality > 0 {
            item.quality -= 1
        }
    }

    private func decreaseSellIn(for item: Item) {
        item.sellIn -= 1
    }

    private func upgradeQuality(for item: Item) {
        if item.quality < 50 {
            item.quality += 1
        }
    }

    // MARK :- Utility

    private static func itemType(for item: Item) -> ItemType {
        return ItemType(rawValue: item.name) ?? .generic
    }

    private static func itemUpdater(for item: Item) -> ItemUpdater {
        let itemType = itemType(for: item)

        switch itemType {
        case .agedBrie:
            return BrieUpdater(item: item)
        case .sulfuras:
            return SulfurasUpdater(item: item)
        case .generic:
            return GenericUpdater(item: item)
        case .backstagePass:
            return BackstagePassUpdater(item: item)
        }
    }
}
