@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {

    func test_whenGenericProduct_AndNotSellIn_thenNormalDegrade() throws {
        let items = [Item(name: "generic", sellIn: 2, quality: 2)]
        let app = GildedRose(items: items)
        app.updateQuality()
        let item = app.items[0]
        XCTAssertEqual(item.name, "generic")
        XCTAssertEqual(item.sellIn, 1)
        XCTAssertEqual(item.quality, 1)
    }

    func test_whenGenericProduct_andSellInPassed_thenIncreasedQuialityDegrade() {
        let items = [Item(name: "generic", sellIn: 0, quality: 2)]
        let app = GildedRose(items: items)
        app.updateQuality()
        let item = app.items[0]
        XCTAssertEqual(item.name, "generic")
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 0)
    }

    func test_whenGenericProduct_thenQualityNeverNegative() {
        let items = [Item(name: "generic", sellIn: 0, quality: 2)]
        let app = GildedRose(items: items)
        app.updateQuality()
        app.updateQuality()
        let item = app.items[0]
        XCTAssertEqual(item.name, "generic")
        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 0)
    }

    func test_whenAgedBrie_thenQualityIncreases() {
        let items = [Item(name: "Aged Brie", sellIn: 2, quality: 2)]
        let app = GildedRose(items: items)
        app.updateQuality()
        let item = app.items[0]
        XCTAssertEqual(item.name, "Aged Brie")
        XCTAssertEqual(item.sellIn, 1)
        XCTAssertEqual(item.quality, 3)
    }
}
