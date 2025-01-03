//
//  ChainTabView.swift
//  Chain-Loop
//
//  Created by Raiyani Jignesh on 12/29/24.
//

import SwiftUI

struct ChainTabView: View {
    @State private var selectedTab = 0
    @State private var showCreateChainView: Bool = false
    @EnvironmentObject private var appCoordinator: AppCoordinator

    var body: some View {
        //    NavigationStack {
        //       ZStack {
        TabView(selection: $selectedTab) {
            NavigationView {
                FeedView()
            }
            .tabItem {
                Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                    .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
            }
            .onAppear { selectedTab = 0 }
            .tag(0)
            
            NavigationView {
                ExploreView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
            }
            .onAppear { selectedTab = 1 }
            .tag(1)
            
            Text("")
            .tabItem {
                Image(systemName: "plus")
            }
            .onAppear { selectedTab = 2 }
            .tag(2)
            
            NavigationView {
                CurrentUserProfile()
            }
            .tabItem {
                Image(systemName: selectedTab == 3 ? "person.fill" : "person")
                    .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
            }
            .onAppear { selectedTab = 3 }
            .tag(3)
        }
        .onChange(of: selectedTab, perform: { newValue in
            showCreateChainView = selectedTab == 2
        })
        .sheet(isPresented: $showCreateChainView, onDismiss: {
            selectedTab = 0
        }, content: {
            NavigationView {
                CreateChainView()
            }
        })
        .tint(Color.theme.primaryColor)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct ChainTabView_Previews: PreviewProvider {
    static var previews: some View {
        ChainTabView()
    }
}
