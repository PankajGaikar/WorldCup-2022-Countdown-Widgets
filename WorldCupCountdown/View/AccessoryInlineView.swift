//
//  AccessoryInline.swift
//  WorldCupCountdownExtension
//
//  Created by Pankaj Gaikar on 16/10/22.
//

import SwiftUI

struct AccessoryInlineView: View {
    var body: some View {
        HStack {
            Text("Qatar 2022 in \(WorldCupViewModel.getDate()!, style: .relative)")
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .font(.caption)
        }
    }
}

struct AccessoryInline_Previews: PreviewProvider {
    static var previews: some View {
        AccessoryInlineView()
    }
}
