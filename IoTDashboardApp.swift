import SwiftUI

@main
struct IoTDashboardApp: App {
    @StateObject private var authVM = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authVM.isLoggedIn {
                MainTabView()
                    .environmentObject(authVM)
                    .transition(.opacity)
            } else {
                LoginView()
                    .environmentObject(authVM)
                    .transition(.opacity)
            }
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Início", systemImage: "house.fill") }
            
            AutomationsView()
                .tabItem { Label("Automações", systemImage: "bolt.fill") }
            
            ProfileView()
                .tabItem { Label("Perfil", systemImage: "person.fill") }
        }
        .accentColor(.indigo)
    }
}
