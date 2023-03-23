import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView() {
                
                HomeView()
                    .tabItem {
                        Label("Ana Sayfa", systemImage: "house")
                            
                            
                    }
                
                PhotoGridView(columns: 4, spacing: 10,headline: "",morePhoto: "",showSearchBox: true)
                    .tabItem {
                        Label("Ara", systemImage: "magnifyingglass")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profil", systemImage: "person.crop.circle")
                    }
            }
            .accentColor(Color.orange)
            
            
        
       }
   }





struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
