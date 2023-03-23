import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Image(systemName: "arrow.left")
                    .padding(.leading,10)
                Text("Mağaza İsmi")
                    .font(Font.title)
                Spacer()
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 30,height: 30)
                    .padding(.trailing,10)

                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .padding(.trailing,10)

            }
            
            .frame(alignment: .leading)
            HStack(spacing:0) {
                Image("story1")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding(.leading,10)
                VStack(alignment: .leading) {
                    Text("Mağaza İsmi")
                        .padding(.leading,10)
                        .font(Font.title2)
                    Text("Ünvan")
                        .font(Font.footnote)
                        .padding(.leading,10)
                }
            }
            HStack(spacing:0) {
                VStack (alignment: .leading,spacing: 5){
                    HStack {
                        Text("0505 050 12 50")
                        Image(systemName: "phone")
                        
                    }
                    
                    HStack {
                        Text("İstanbul-Sisli / Osmanbey")
                        Image(systemName: "plus.magnifyingglass")
                    }
                    .padding(.bottom,10)
                    Button {
                    } label: {
                        Text("Takip Et")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    
                }
            }
            .padding(20)
            
            HStack {
                
                VStack {
                    PhotoGridView(columns: 1 , spacing: 5,headline: "Gönderiler",morePhoto: "Daha Fazla Göster",showSearchBox: false)
                        .frame(width: .infinity,height: 150)
                    Text("Here's what needs to be done in order to gain access to production-level rate limits (5,000 requests/hour). Before applying, review the guidelines in full to ensure your application isn't rejected.")
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .padding(.horizontal, 10)
                }
            }
            VStack() {
                HStack(alignment: .center) {
                    Spacer()
                    Buttonn(url: "https://www.instagram.com", imageName: "instagram-logo")
                    Spacer()
                    Buttonn(url: "https://www.youtube.com", imageName: "youtube")
                    Spacer()
                    Buttonn(url: "https://www.twitter.com", imageName: "twitter")
                    Spacer()
                    Buttonn(url: "https://www.trendyol.com", imageName: "trendyol")
                    Spacer()
                    
                }
                HStack(alignment: .center) {
                    Spacer()
                    Buttonn(url: "https://www.telegram.com", imageName: "telegram")
                    Spacer()
                    Buttonn(url: "https://www.tiktok.com", imageName: "tiktok")
                    Spacer()
                    Buttonn(url: "https://www.whatsapp.com", imageName: "whatsapp")
                        .clipShape(Circle())
                    Spacer()
                    Buttonn(url: "https://www.amazon.com", imageName: "amazon")
                    
                    Spacer()
                }
            }
            Spacer()
        }
    }
    
    
    struct Buttonn: View {
        let url: String
        let imageName: String
    
        var body: some View {
            Button(action: {
                if let url = URL(string: url) {
                    UIApplication.shared.open(url)
                }
            }) {
                Image(imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
    }

    
    struct Pr: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
}
