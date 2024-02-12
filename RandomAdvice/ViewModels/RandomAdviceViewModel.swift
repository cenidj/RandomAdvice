//
//  RandomAdviceViewModel.swift
//  RandomAdvice
//
//  Created by Cesario Nivar on 2/12/24.
//

import Foundation


public class RandomAdviceViewModel: ObservableObject {
    @Published var advice: RandomAdvice?
    @Published var adviceNumber: Int = 0
    
    let apiService = APIService(urlString: "https://api.adviceslip.com/advice")
    
    @MainActor
    func getAdvice() async {
        do {
            let advice: RandomAdvice = try await apiService.getJSON()
            self.advice = advice
            self.adviceNumber += 1
            
        } catch {
            print("❌ Error: \(error)")
        }
        
    }
    
    
}
