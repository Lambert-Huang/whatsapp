//
//  File.swift
//
//
//  Created by lambert on 2024/4/7.
//

import ComposableArchitecture
import Foundation
import InboxFeature
import NewMessageFeature
import SwiftUI

@Reducer
public struct RootNavigationLogic {
  public init() {}
  
  public enum Tab: LocalizedStringKey, Equatable, CaseIterable {
    case inbox = "Inbox"
    case updates = "Updates"
    case communities = "Communities"
    case calls = "Calls"
  }
  
  @ObservableState
  public struct State: Equatable {
    public init() {}
    var selectedTab: Tab = .inbox
    var inbox = InboxLogic.State()
    var path = StackState<Path.State>()
  }
  
  public enum Action {
    case task
    case didSelectTab(Tab)
    case inbox(InboxLogic.Action)
    case path(StackAction<Path.State, Path.Action>)
  }
  
  public var body: some ReducerOf<Self> {
    Scope(state: \.inbox, action: \.inbox, child: InboxLogic.init)
    Reduce { state, action in
      switch action {
      case .task:
        return .none
      case let .didSelectTab(tab):
        state.selectedTab = tab
        return .none
      default: return .none
      }
    }
    .forEach(\.path, action: \.path)
  }
  
  @Reducer(state: .equatable)
  public enum Path {
    case newMessage(NewMessageLogic)
  }
}

public struct RootNavigationView: View {
  @Perception.Bindable var store: StoreOf<RootNavigationLogic>
  public init(store: StoreOf<RootNavigationLogic>) {
    self.store = store
  }

  public var body: some View {
    WithPerceptionTracking {
      NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
        TabView(selection: $store.selectedTab.sending(\.didSelectTab)) {
          InboxView(
            store: store.scope(state: \.inbox, action: \.inbox)
          )
          .tabItem {
            VStack {
              Image(systemName: "bubble.fill")
                .environment(\.symbolVariants, store.selectedTab == .inbox ? .fill : .none)
              Text("Chats")
            }
          }
          .tag(RootNavigationLogic.Tab.inbox)
          
          Text(RootNavigationLogic.Tab.updates.rawValue)
            .tabItem {
              VStack {
                Image(systemName: "dial.low")
                  .environment(\.symbolVariants, store.selectedTab == .updates ? .fill : .none)
                Text("Updates")
              }
            }
            .tag(RootNavigationLogic.Tab.updates)
          
          Text(RootNavigationLogic.Tab.communities.rawValue)
            .tabItem {
              VStack {
                Image(systemName: "person.3")
                  .environment(\.symbolVariants, store.selectedTab == .communities ? .fill : .none)
                Text("Chats")
              }
            }
            .tag(RootNavigationLogic.Tab.communities)
          
          Text(RootNavigationLogic.Tab.calls.rawValue)
            .tabItem {
              VStack {
                Image(systemName: "phone")
                  .environment(\.symbolVariants, store.selectedTab == .calls ? .fill : .none)
                Text("Calls")
              }
            }
            .tag(RootNavigationLogic.Tab.calls)
        }
        .tint(.black)
      } destination: { pathStore in
        switch pathStore.case {
        case let .newMessage(store):
          NewMessageView(store: store)
        }
      }
    }
  }
}

#Preview {
  RootNavigationView(
    store: Store(
      initialState: RootNavigationLogic.State(),
      reducer: RootNavigationLogic.init
    )
  )
}
