

import SwiftUI

struct OnboardingView: View {
    
    //MARK: State Variables
    
    @State var onBoardingState : Int = 0
    @State var name : String = ""
    @State var age : Double = 50
    @State var gender : String = ""
    
    //MARK: AppStorage Variables
    
    @AppStorage("name") var currentUserName : String?
    @AppStorage("age") var currentUserAge : Double = 50
    @AppStorage("gender") var currentUserGender : String?
    @AppStorage("signed_in") var currentUserSignedIn : Bool = false
    
    //MARK: Variables
    
    let transition : AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    
    // MARK: View
    
    var body: some View {
        ZStack{
                LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            
            ZStack(){
                switch onBoardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                    
                case 1:
                    addNameSection
                        .transition(transition)
                    
                case 2:
                    addAgeSection
                        .transition(transition)
                    
                case 3:
                    addGenderSection
                        .transition(transition)
                    
                default:
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.green)
                }
            }
            
            VStack(){
                Spacer()
                bottomButton
            }
            .padding(30)
        }
    }
}

// MARK: Components

extension OnboardingView{
    
    private var bottomButton : some View{
        Text( onBoardingState == 0 ? "SIGN UP" :
                onBoardingState == 3 ? "Finish" :
                "Next"
        )
        .font(.headline)
        .foregroundColor(.purple)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(
            Color.white
            
        )
        .cornerRadius(10)
        .onTapGesture {
            handleSignInButtonPressed()
        }
    }
    
    private var welcomeSection : some View{
        VStack(spacing: 40){
            
            Spacer()
            
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            
            Text("Find Your Match")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .underline()
            
            Text("This is the #1 app to find you life partner. Hope you will enjoy it. Let's sign in and get started. See yaaaaa.")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addNameSection : some View{
        VStack(spacing: 40){
            
            Spacer()
            
            Text("What Is Your Name?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            TextField("Enter you name here.....", text: $name)
                .font(.headline)
                .frame(height: 30)
                .padding()
                .background(Color.white.cornerRadius(15))
            
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection : some View{
        VStack(spacing: 40){
            
            Spacer()
            
            Text("What Is Your Age?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Slider(value: $age, in: 18...100, step: 1)
                .accentColor(.white)
            
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection : some View{
        VStack(spacing: 40){
            
            Spacer()
            
            Text("What's Your Gender?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Picker(selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Others").tag("Others")
            } label: {
                Text("Select A Gender")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding()
            .background(
                Color.white
            )
            .cornerRadius(10)
            .pickerStyle(PalettePickerStyle())
            .shadow(color: .black, radius: 5, x: 5, y: 5)
            
            
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
}

// MARK: Functions

extension OnboardingView{
    
    func handleSignInButtonPressed(){
        if(onBoardingState == 3){
            currentUserName = name
            currentUserAge = age
            currentUserGender = gender
            withAnimation(.spring()){
                currentUserSignedIn = true
            }
        }
        else{
            onBoardingState += 1
        }
        
    }
    
}

#Preview {
    OnboardingView()
}
