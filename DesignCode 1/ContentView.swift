//
//  ContentView.swift
//  DesignCode 1
//
//  Created by Семён Рытенков on 01.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
            } //: VSTACK
            .frame(width: 300, height: 220)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(radius: 20)
            .offset(x: 0, y: -20)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("UI Design")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                        Text("certificate")
                            .foregroundColor(Color("accent"))
                    } //: VSTACK
                    
                    Spacer()
                    
                    Image("Logo1")
                } //: HSTACK
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                Spacer()
                
                Image("Card1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300.0, height: 110.0, alignment: .top)
            } //: VSTACK
            .frame(width: 340.0, height: 220.0)
            .background(Color.black)
            .cornerRadius(20)
            .shadow(radius: 20)
        } //: ZSTACK
    } //: BODY
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
