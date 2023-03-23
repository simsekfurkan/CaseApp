import SwiftUI

struct HomeView: View {
    var images:[String] = ["story1","story2","story3","story4"]
    @ObservedObject var countTimer:CountTimer = CountTimer(items: 4,interval: 4.0)
    
    var body: some View {
        GeometryReader{geometry in
            ZStack(alignment: .top){
                Image(self.images[Int(self.countTimer.progress)])
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.top)
                    .frame(width: geometry.size.width,height: nil,alignment: .center)
                    .animation(.none)
                    
                HStack(alignment: .center, spacing: 4){
                    ForEach(self.images.indices){ image in LoadingBar(progress: min( max( (CGFloat(self.countTimer.progress) - CGFloat(image)), 0.0) , 1.0) )
                            .frame(width:nil,height: 2, alignment:.leading)
                            .animation(.linear)
                    }
                    
                }
                .padding()
                HStack(alignment:.center,spacing:0){
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.countTimer.advancePage(by: -1)
                        }
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.countTimer.advancePage(by: 1)
                        }
                    
                }
        }
            .onAppear{
                self.countTimer.start()
            }
    }
}
}

struct LoadingBar: View {
    
    var progress:CGFloat
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment:.leading){
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.5))
                    .cornerRadius(5)
                Rectangle().frame(width: geometry.size.width * self.progress,height: nil,alignment: .leading)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
        }
    }
}

struct LoadingBar_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBar(progress: 0.1)
    }
}


struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
