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
        let itemUpdater = ItemUpdaterFactory.itemUpdater(for: item)
        itemUpdater.updateQuality()
        itemUpdater.updateSellIn()
        if item.sellIn < 0 {
            itemUpdater.updateQualityExpired()
        }
    }
}
