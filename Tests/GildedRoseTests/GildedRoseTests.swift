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

    func test_whenAgedBrie_andAfterSellIn_thenIncreasesQuialityUpgrade() {
        let items = [Item(name: "Aged Brie", sellIn: 0, quality: 2)]
        let app = GildedRose(items: items)
        app.updateQuality()

        let item = app.items[0]
        XCTAssertEqual(item.name, "Aged Brie")
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 4)
    }

    func test_whenAgedBrie_thenCannotGoAboveQualityThreshold() {
        let items = [Item(name: "Aged Brie", sellIn: 2, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()

        let item = app.items[0]
        XCTAssertEqual(item.name, "Aged Brie")
        XCTAssertEqual(item.sellIn, 1)
        XCTAssertEqual(item.quality, 50)
    }

    func test_whenSulfuras_thenDontDegradeDateAndQuiality() {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 3, quality: 40)]
        let app = GildedRose(items: items)
        app.updateQuality()

        let item = app.items[0]
        XCTAssertEqual(item.name, "Sulfuras, Hand of Ragnaros")
        XCTAssertEqual(item.sellIn, 3)
        XCTAssertEqual(item.quality, 40)
    }

    func test_whenBackstagePass_andMoreThanTenDays_thenQuialityIncreasesByOne() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 11, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()

        let item = app.items[0]
        XCTAssertEqual(item.name, "Backstage passes to a TAFKAL80ETC concert")
        XCTAssertEqual(item.sellIn, 10)
        XCTAssertEqual(item.quality, 11)
    }

    func test_whenBackstagePass_andTenDaysOrLess_thenQuialityIncreasesByTwo() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()

        let item = app.items[0]
        XCTAssertEqual(item.name, "Backstage passes to a TAFKAL80ETC concert")
        XCTAssertEqual(item.sellIn, 9)
        XCTAssertEqual(item.quality, 12)
    }

    func test_whenBackstagePass_andFiveDaysOrLess_thenQuialityIncreasesByThree() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()

        let item = app.items[0]
        XCTAssertEqual(item.name, "Backstage passes to a TAFKAL80ETC concert")
        XCTAssertEqual(item.sellIn, 4)
        XCTAssertEqual(item.quality, 13)
    }

    func test_whenBackstagePass_andAfterSellIn_thenQuialityDropsToZero() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()

        let item = app.items[0]
        XCTAssertEqual(item.name, "Backstage passes to a TAFKAL80ETC concert")
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 0)
    }

    func test_whenBackstagePass_thenCannotGoAboveQualityThreshold() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 2, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()

        let item = app.items[0]
        XCTAssertEqual(item.name, "Backstage passes to a TAFKAL80ETC concert")
        XCTAssertEqual(item.sellIn, 1)
        XCTAssertEqual(item.quality, 50)
    }

    func test_whenConjured_thenTwiceDegrade() throws {
        let items = [Item(name: "Conjured Mana Cake", sellIn: 2, quality: 4)]
        let app = GildedRose(items: items)
        app.updateQuality()

        let item = app.items[0]
        XCTAssertEqual(item.name, "Conjured Mana Cake")
        XCTAssertEqual(item.sellIn, 1)
        XCTAssertEqual(item.quality, 2)
    }

    func test_whenConjured_andSellInPassed_thenIncreasedQuialityDegrade() {
        let items = [Item(name: "Conjured Mana Cake", sellIn: 0, quality: 4)]
        let app = GildedRose(items: items)
        app.updateQuality()

        let item = app.items[0]
        XCTAssertEqual(item.name, "Conjured Mana Cake")
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 0)
    }
}
