

import SwiftUI

struct ProfileApp: View {
    
    @AppStorage("name") var currentUserName : String?
    @AppStorage("age") var currentUserAge : Double?
    @AppStorage("gender") var currentUserGender : String?
    @AppStorage("signed_in") var currentUserSignedIn : Bool = false
    
    
    var body: some View {
        ZStack(){
            
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                Text(currentUserName ?? "Your Name Here")
                Text("\(Int(currentUserAge ?? 0)) years old.")
                Text("Gender - \(currentUserGender ?? "Unknown")")
                
                Text("Sign Out")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(
                        Color.black
                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                        
                    )
                    .cornerRadius(10)
                    .onTapGesture {
                        currentUserName = nil
                        currentUserAge = nil
                        currentUserGender = nil
                        currentUserSignedIn = false
                    }
            }
            .font(.title)
            .foregroundColor(.black)
            .frame(width: 300)
            .padding()
            .padding(.vertical, 40)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .black, radius: 5, y: 5)
        }
    }
}

#Preview {
    ProfileApp()
}
