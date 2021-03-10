//
//  ContentView.swift
//  DesignCode 1
//
//  Created by Семён Рытенков on 01.03.2021.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
                )
            
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(Angle(degrees: showCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 10), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
                
            BackCardView()
                .frame(width: 340.0, height: 220.0)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(Angle(degrees: showCard ? -5 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 5), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeOut(duration: 0.3))
            
            CardView()
                .frame(width: showCard ? 375.0 : 340.0, height: 220.0)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    showCard.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            viewState = value.translation
                            show = true
                        }
                        .onEnded { value in
                            viewState =  .zero
                            show = false
                        }
                )            
            
            BottomCardView(show: $showCard)
                .offset(x: 0.0, y: showCard ? 360 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(
                    .timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8)
                )
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            bottomState = value.translation
                            if showFull {
                                bottomState.height += -300
                            }
                            if bottomState.height < -300 {
                                bottomState.height = -300
                            }
                        }
                        .onEnded { value in
                            if bottomState.height > 50 {
                                showCard = false
                                bottomState = .zero
                            }
                            if (bottomState.height < -100 && !showFull) || (bottomState.height < -250 && showFull) {
                                bottomState.height = -300
                                showFull = true
                            } else {
                                bottomState = .zero
                                showFull = false
                            }
                        }
                )
            
        } //: ZSTACK
    } //: BODY
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                Spacer()
            } //: HSTACK
            .padding()
            
            Image("Background1")
            
            Spacer()
        } //: VSTACK
    } //: BODY
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        } //: VSTACK
    } //: BODY
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.system(.title, design: .rounded))
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
    } //: BODY
}

struct BottomCardView: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.system(.subheadline, design: .rounded))
                .lineSpacing(5)
            
            HStack(spacing: 20.0) {
                RingView(
                    color1: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
                    color2: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),
                    width: 88,
                    height: 88,
                    percent: 78,
                    show: $show
                )
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI")
                        .bold()
                    Text("12 of 12 sections completed\n10 hours spent so far")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                } //: VSTACK
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            } //: HSTACK
            
            Spacer()
        } //: VSTACK
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    } //: BODY
}
