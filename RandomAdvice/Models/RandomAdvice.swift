//
//  RandomAdvice.swift
//  RandomAdvice
//
//  Created by Cesario Nivar on 2/12/24.
//

import Foundation


struct RandomAdvice: Codable {
    let slip: Advice
}

struct Advice: Codable {
    let id: Int
    let advice: String
}
