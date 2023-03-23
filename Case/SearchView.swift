import SwiftUI
import SDWebImageSwiftUI

struct PhotoGridView: View {
    @ObservedObject var randomImages = pictureViewModel()
    var columns: Int
    var spacing: CGFloat
    var headline: String
    var morePhoto: String
    var showSearchBox: Bool

    @State private var gridLayout = GridLayout(columns: 2, spacing: 10)
    @State private var showingAllPhotos = false

    var body: some View {
        NavigationView {
            VStack {
                if showSearchBox {
                    SearchBox()
                }
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: spacing), count: gridLayout.columns), spacing: spacing) {
                        ForEach(randomImages.photoArray.prefix(showingAllPhotos ? randomImages.photoArray.count : 40), id: \.id) { photo in
                            WebImage(url: URL(string: photo.urls["thumb"]!))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: gridLayout.itemSize.width, height: gridLayout.itemSize.height)
                                .cornerRadius(14)
                                .clipped()
                        }
                    }
                    .padding(.horizontal, spacing)
                    .padding(.vertical, spacing)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    Text(headline)
                        .font(Font.title),
                trailing:
                    Button(action: {
                        showingAllPhotos = true
                    }) {
                        Text(morePhoto)
                    }
            )
            .onAppear {
                gridLayout.updateItemSize(in: UIScreen.main.bounds.size)
            }
        }
    }
}
struct SearchBox: View {
    @State private var searchText = ""

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchText)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal, 5)
        }
        .padding(.horizontal, 10)
    }
}


struct GridLayout {
    let columns: Int
    let spacing: CGFloat

    var itemAspectRatio: CGFloat = 1

    private(set) var itemSize: CGSize = .zero

    init(columns: Int, spacing: CGFloat) {
        self.columns = columns
        self.spacing = spacing
    }

    mutating func updateItemSize(in size: CGSize) {
        let totalSpacing = spacing * CGFloat(columns + 1)
        let availableWidth = size.width - totalSpacing
        let itemWidth = availableWidth / CGFloat(columns)
        let itemHeight = itemWidth * itemAspectRatio
        itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
}




