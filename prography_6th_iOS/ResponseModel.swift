//
//  ResponseModel.swift
//  prography_6th_iOS
//
//  Created by Gwang_Ho on 03/03/2020.
//  Copyright © 2020 Gwang-Ho Heo. All rights reserved.
//

import Foundation
//// MARK: - MovieResponse
//struct MovieResponse: Codable {
//    let status: String?
//    let statusMessage: String?
//    let data: DataClass?
//}
//// MARK: - DataClass
//struct DataClass: Codable {
//    let movieCount: Int?
//    let limit: Int?
//    let movies: [Movie]?
//}
//// MARK: - Movie
//struct Movie: Codable {
//    let title: String?
//    let rating: Double?
//}

// MARK: - BookResponse
struct BookResponse: Codable {
    let error, total, page: String
    let books: [Book]
}

// MARK: - Book
struct Book: Codable {
    let title: String?
    let price: String?
}
