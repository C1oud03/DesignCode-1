//
//  UpdateDetail.swift
//  DesignCode 1
//
//  Created by Семён Рытенков on 03.03.2021.
//

import SwiftUI

struct UpdateDetail: View {
    @State var update: Update = updateData[0]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } //: VSTACK
        } //: SCROLL VIEW
        .padding(.horizontal)
        .navigationBarTitle(update.title, displayMode: .large)
    } //: BODY
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
