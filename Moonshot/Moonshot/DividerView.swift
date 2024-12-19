//
//  DividerView.swift
//  Moonshot
//
//  Created by Mishoni Mihaylov on 19.12.24.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    DividerView()
}
