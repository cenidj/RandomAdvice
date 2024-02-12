//
//  ContentView.swift
//  RandomAdvice
//
//  Created by Cesario Nivar on 2/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = RandomAdviceViewModel()
    
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            
            
            VStack (spacing: 20) {
                Text("Advice #\(viewModel.adviceNumber)")
                    .font(.title2.bold())
                    .foregroundStyle(.text)
                
                Text(viewModel.advice?.slip.advice ?? "")
                    .font(.system(size: 24))
                    .foregroundStyle(.advice)
                    .frame(maxHeight: .infinity)
                    .padding(.bottom)
            }
            .padding()
            .frame(width: 350, height: 250)
            .background(.secondaryBackground)
            .clipShape(.rect(cornerRadius: 20))
            
            
            Button {
                Task {
                    await viewModel.getAdvice()
                }
                
            } label: {
                Image(systemName: "dice.fill")
                    .font(.title2)
                    .foregroundStyle(Color(.background))
            }
            .padding()
            .background(.text)
            .clipShape(Circle())
            .offset(y: 120)
        }
        .task {
            await viewModel.getAdvice()
        }
    }
}

#Preview {
    ContentView()
}
