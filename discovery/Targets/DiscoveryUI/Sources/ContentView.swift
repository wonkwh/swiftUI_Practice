import SwiftUI

public struct ContentView: View {
    public init() {}

    public var body: some View {
      NavigationView {
        ScrollView {
          DiscoveryCategoryView()
          PopularDestinationView()
          PopularPlacesToEatView()
          TrendingCreatorsView()
        }
        .navigationTitle("Discovery")
      }
    }
}


struct PopularDestinationView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Popular Destinations")
          .font(.system(size: 14, weight: .semibold))
        Spacer()
        Text("See All")
          .font(.system(size: 12, weight: .semibold))
      }.padding(.horizontal).padding(.top)

      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 8.0) {
          ForEach(0..<5, id: \.self) { num in
            Rectangle()
              .fill(Color.gray)
              .frame(width: 125, height: 160)
              .cornerRadius(10)
              .shadow(radius: 4)
              .padding(.bottom)
          }
        }.padding(.horizontal)
      }
    }
  }
}

struct PopularPlacesToEatView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Popular Place To Eat")
          .font(.system(size: 14, weight: .semibold))
        Spacer()
        Text("See All")
          .font(.system(size: 12, weight: .semibold))
      }.padding(.horizontal).padding(.top)

      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 12.0) {
          ForEach(0..<5, id: \.self) { num in
            Rectangle()
              .fill(Color.gray)
              .frame(width: 300, height: 120)
              .cornerRadius(10)
              .shadow(radius: 4)
              .padding(.bottom)
          }
        }.padding(.horizontal)
      }
    }
  }
}

struct TrendingCreatorsView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Trending Creator")
          .font(.system(size: 14, weight: .semibold))
        Spacer()
        Text("See All")
          .font(.system(size: 12, weight: .semibold))
      }.padding(.horizontal).padding(.top)

      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 12.0) {
          ForEach(0..<12, id: \.self) { num in
            Rectangle()
              .fill(Color.gray)
              .frame(width: 50, height: 50)
              .cornerRadius(25)
              .shadow(radius: 4)
              .padding(.bottom)
          }
        }.padding(.horizontal)
      }
    }
  }
}

struct DiscoveryCategoryView: View {
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        ForEach(0..<5, id: \.self) { num in
          VStack(spacing: 4) {
            Spacer().frame(width: 50, height: 50)
              .background(Color.gray)
              .cornerRadius(.infinity)
              .shadow(radius: 5)
            Text("Art")
              .font(.system(size: 12, weight: .semibold))
          }
        }
      }.padding(.horizontal)
//      Spacer()
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
