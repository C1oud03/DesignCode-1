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
            .padding(.top, 30)
            
            Spacer()
        } //: VSTACK
    } //: BODY
}

struct HomeView_Previews: PreviewProvider {    
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}
