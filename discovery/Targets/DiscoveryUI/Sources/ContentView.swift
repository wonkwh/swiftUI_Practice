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
              .frame(width: 200, height: 64)
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


struct Category: Hashable {
  let name: String
  let imageName: String
}

struct DiscoveryCategoryView: View {
  let categories: [Category] = [
    .init(name: "Art", imageName: "paintpalette.fill"),
    .init(name: "Sport", imageName: "sportscourt.fill"),
    .init(name: "Live Events", imageName: "music.mic"),
    .init(name: "Food", imageName: "music.mic"),
    .init(name: "History", imageName: "music.mic"),
  ]

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .top, spacing: 12) {
        ForEach(categories, id: \.self) { category in
          VStack(spacing: 8) {
            Image(systemName: category.imageName)
              .font(.system(size: 20))
              .foregroundColor(.white)
              .frame(width: 64, height: 64)
              .background(Color.gray)
              .cornerRadius(64)
              .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
            Text(category.name)
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
