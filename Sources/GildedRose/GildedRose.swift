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
            upgradeQuality(for: item)

            if item.sellIn < 11 {
                upgradeQuality(for: item)
            }

            if item.sellIn < 6 {
                upgradeQuality(for: item)
            }
        case .generic:
            degradeQuality(for: item)
        case .sulfuras:
            break
        }

        // Update sell in

        switch itemType {
        case .agedBrie:
            itemUpdater.updateSellIn()
        case .generic:
            decreaseSellIn(for: item)
        case .sulfuras:
            break
        case .backstagePass:
            decreaseSellIn(for: item)
        }

        // Update quiality after sell in
        if item.sellIn < 0 {
            switch itemType {
            case .agedBrie:
                itemUpdater.updateQualityExpired()
            case .backstagePass:
                item.quality = 0
            case .generic:
                degradeQuality(for: item)
            case .sulfuras:
                break
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
            return BrieItemUpdater(item: item)
        default:
            return GenericItemUpdater(item: item)
        }
    }
}
