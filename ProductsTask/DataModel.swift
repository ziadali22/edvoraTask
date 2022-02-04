//
//  DataModel.swift
//  ProductsTask
//
//  Created by ziad on 02/02/2022.
//

import Foundation
struct DataModel: Codable, Identifiable {
    let id = UUID()
    let productName, brandName, discription, date, time, image : String
    let price: Int
    let address: Address


    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case brandName = "brand_name"
        case price, address, discription, date, time, image
    }
}

// MARK: - Address
struct Address: Codable {
    let state, city: String
}
