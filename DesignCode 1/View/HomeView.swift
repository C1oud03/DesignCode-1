//
//  HomeView.swift
//  DesignCode 1
//
//  Created by Семён Рытенков on 03.03.2021.
//

import SwiftUI

let sectionData = [
    Section(
        title: "Prototype designs in SwiftUI",
        logo: "Logo1",
        text: "18 Sections",
        image: Image("Card1"),
        color: Color("card1")
    ),
    Section(
        title: "Build a SwiftUI App",
        logo: "Logo1",
        text: "20 Sections",
        image: Image("Card2"),
        color: Color("card2")
    ),
    Section(
        title: "SwiftUI Advanced",
        logo: "Logo1",
        text: "20 Sections",
        image: Image("Card3"),
        color: Color("card3")
    )
]

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
                
                Button(action: {
                    showUpdate.toggle()
                }) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                }
                .sheet(isPresented: $showUpdate) {
                    UpdateList()
                }
            } //: HSTACK
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(
                                    Angle(
                                        degrees: Double(
                                            (geometry.frame(in: .global).minX - 30)  / -20
                                        )
                                    ),
                                    axis: (x: 0, y: 10, z: 0)
                                )
                        }
                        .frame(width: 275, height: 275)
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

struct AvatarView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: {
            showProfile.toggle()
        }) {
            Image("Avatar")
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        } //: BUTTON
    } //: BODY
}

struct SectionView: View {
    var section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(section.logo)
            } //: HSTACK
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        } //: VSTACK
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.4), radius: 20, x: 0, y: 20)
    } //: BODY
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var logo: String
    var text: String
    var image: Image
    var color: Color
}
