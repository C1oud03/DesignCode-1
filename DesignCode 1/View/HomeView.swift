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
    @Binding var showContent: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Watching")
                        .modifier(CustomFontModifier(size: 28))
                    
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
                    WatchRingsView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .onTapGesture {
                            showContent = true
                        }
                }
                
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
                .offset(y: -30)
                
                HStack {
                    Text("Courses")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                } //: HSTACK
                .padding(.leading, 30)
                .offset(y: -60)
                
                SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
                    .offset(y: -60)
                
                Spacer()
            } //: VSTACK
        } //: SCROLL VIEW
    } //: BODY
}

struct HomeView_Previews: PreviewProvider {    
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
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
    var width: CGFloat = 275
    var height: CGFloat = 275
    
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
        .frame(width: width, height: height)
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

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30.0) {
            HStack(spacing: 12.0) {
                RingView(
                    color1: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),
                    color2: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
                    width: 44,
                    height: 44,
                    percent: 68,
                    show: .constant(true)
                )
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left")
                        .bold()
                        .modifier(FontModifier(style: .subheadline))
                    Text("Watched 10 minutes today")
                        .modifier(FontModifier(style: .caption))
                } //: VSTACK
            } //: HSTACK
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(
                    color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),
                    color2: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1),
                    width: 32,
                    height: 32,
                    percent: 54,
                    show: .constant(true)
                )
            } //: HSTACK
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(
                    color1: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),
                    color2: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),
                    width: 32,
                    height: 32,
                    percent: 32,
                    show: .constant(true)
                )
            } //: HSTACK
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
        } //: HSTACK
    } //: BODY
}
