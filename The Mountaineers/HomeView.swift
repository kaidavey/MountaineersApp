import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    FilterTile(hasIcon: false, icon: "person.fill", iconColor: 0xffffff, color: 0x282828, border: 0x000000, textColor: 0xffffff, filterText: "All Saves")
                    FilterTile(hasIcon: true, icon: "person.fill", iconColor: 0xff2c55, color: 0xfcfcfc, border: 0xe0e0e0, textColor: 0x323232, filterText: "Backpacking")
                    FilterTile(hasIcon: true, icon: "person.fill", iconColor: 0xa15fc4, color: 0xfcfcfc, border: 0xe0e0e0, textColor: 0x323232, filterText: "Skiing")
                    FilterTile(hasIcon: true, icon: "person.fill", iconColor: 0xff2c55, color: 0xfcfcfc, border: 0xe0e0e0, textColor: 0x323232, filterText: "Skiing")
                }
            }
            .padding(.bottom, 6)
            .padding(.horizontal, 14)

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(0..<10) { _ in
                        ActivityTile()
                    }
                }
            }
        }
        .padding(.top, 14)
    }
}

#Preview {
    HomeView()
}
