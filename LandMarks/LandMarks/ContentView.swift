//
//  ContentView.swift
//  LandMarks
//
//  Created by wonkwh on 2019/07/03.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading, spacing: 10) {
                Text("Tortle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
