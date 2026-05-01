

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn : Bool = false
    
    var body: some View {
        ZStack(){
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            Group {
                if currentUserSignedIn {
                    ProfileApp()
                } else {
                    OnboardingView()
                }
            }
        }
    }
}

#Preview {
    IntroView()
}
