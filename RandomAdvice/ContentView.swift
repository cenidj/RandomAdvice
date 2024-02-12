//
//  ContentView.swift
//  RandomAdvice
//
//  Created by Cesario Nivar on 2/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            
            
            VStack (spacing: 20) {
                Text("Advice #118")
                    .font(.title2.bold())
                    .foregroundStyle(Color("textColor"))
                
                Text("A common regret in life is wishing one hadn't worked so hard.")
                    .font(.system(size: 24))
                    .foregroundStyle(Color("adviceColor"))
                    .frame(maxHeight: .infinity)
                    .padding(.bottom)
            }
            .padding()
            .frame(width: 350, height: 250)
            .background(Color("secondaryBackgroundColor"))
            .clipShape(.rect(cornerRadius: 20))
            
            
            Button {
                
                
            } label: {
                Image(systemName: "dice.fill")
                    .font(.title2)
                    .foregroundStyle(Color("backgroundColor"))
            }
            .padding()
            .background(Color("textColor"))
            .clipShape(Circle())
            .offset(y: 120)
        }
    }
}

#Preview {
    ContentView()
}
