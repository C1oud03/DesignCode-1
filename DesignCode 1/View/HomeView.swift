//
//  HomeView.swift
//  DesignCode 1
//
//  Created by Семён Рытенков on 03.03.2021.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
            } //: HSTACK
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(0 ..< 5) { item in
                        SectionView()
                    } //: LOOP
                } //: HSTACK
                .padding(30)
                .padding(.bottom, 30)
            } //: SCROLL VIEW
            
            Spacer()
        } //: VSTACK
    } //: BODY
}

struct HomeView_Previews: PreviewProvider {    
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Prototype designs in SwiftUI")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image("Logo1")
            } //: HSTACK
            
            Text("18 Sections".uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        } //: VSTACK
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(Color("card1"))
        .cornerRadius(30)
        .shadow(color: Color("card1").opacity(0.4), radius: 20, x: 0, y: 20)
    }
}
