import SwiftUI

public struct ContentView: View {
    public init() {}

    public var body: some View {
      NavigationView {
        DiscoveryCategoryView()
        .navigationTitle("Discovery")
      }
    }
}

struct DiscoveryCategoryView: View {
  var body: some View {
    ScrollView(.horizontal) {
      HStack(spacing: 16) {
        ForEach(0..<5, id: \.self) { num in
          VStack(spacing: 4) {
            Spacer().frame(width: 50, height: 50)
              .background(Color.gray)
              .cornerRadius(.infinity)
              .shadow(radius: 5)
            Text("Artss")
              .font(.system(size: 12, weight: .semibold))
          }
        }
      }
      Spacer()
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
