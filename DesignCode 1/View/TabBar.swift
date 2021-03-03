//
//  TabBar.swift
//  DesignCode 1
//
//  Created by Семён Рытенков on 03.03.2021.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            Home()
                .tabItem {
                    Image(systemName: "play.circle.fill")
                    Text("Home")
                }
            
            ContentView()
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("Certificates")
                }
        }
        .edgesIgnoringSafeArea(.top)
    } //: BODY
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
                .previewDevice("iPhone 11 Pro")
            TabBar()
                .previewDevice("iPhone 8")
        }
    }
}
