//
//  RingView.swift
//  DesignCode 1
//
//  Created by Семён Рытенков on 04.03.2021.
//

import SwiftUI

struct RingView: View {
    @State var color1 = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    @State var color2 = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    @State var width: CGFloat = 300
    @State var height: CGFloat = 300
    @State var percent: CGFloat = 88
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        
        return ZStack {
            Circle()
                .stroke(
                    Color.black.opacity(0.2),
                    style: StrokeStyle(lineWidth: 5 * multiplier)
                )
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: show ? progress : 1, to: 1.0)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(color1), Color(color2)]),
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading
                    ),
                    style: StrokeStyle(
                        lineWidth: 5 * multiplier,
                        lineCap: .round,
                        lineJoin: .round,
                        miterLimit: .infinity,
                        dash: [20, 0],
                        dashPhase: 0
                    )
                )
                .animation(Animation.easeInOut.delay(0.3))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                    )
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.2), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("\(Int(percent))%")
                .bold()
                .font(.system(size: 14 * multiplier))
        } //: ZSTACK
    } //: BODY
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
