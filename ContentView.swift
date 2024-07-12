//
//  ContentView.swift
//  ShowTitle
//
//  Created by Shinhyuk Park on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showing = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear{
                                self.showing = false
                            }
                            .onChange(of: geometry.frame(in: .global).minY) { oldMinY, newMinY in
                                if newMinY < oldMinY {
                                    if newMinY < -15 {
                                        withAnimation {
                                            self.showing = true
                                        }
                                    }else{
                                        withAnimation {
                                            self.showing = false
                                        }
                                    }
                                }
                            }
                    }
                    .frame(height: 0)
                    
                    ForEach(0..<50){ _ in
                        Image("fiercebear")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                }
            }
            .navigationTitle(showing ? "NavigationTitle" : "")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
