//
//  File.swift
//  
//
//  Created by lambert on 2024/4/7.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import NavigationBarColorViewModifier

@Reducer
public struct InboxLogic {
  public init() {}
  
  @ObservableState
  public struct State: Equatable {
    public init() {}
  }
  
  public enum Action {
    
  }
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
        .none
    }
  }
}

public struct InboxView: View {
  @Perception.Bindable var store: StoreOf<InboxLogic>
  public init(store: StoreOf<InboxLogic>) {
    self.store = store
  }
  public var body: some View {
    WithPerceptionTracking {
      ZStack(alignment: .bottomTrailing) {
        List {
          ForEach(0 ..< 5) { _ in
            Text("test")
          }
        }
        .listStyle(.plain)
        
        Button {
          
        } label: {
          RoundedRectangle(cornerRadius: 10)
            .fill(Color(.darkGray).gradient)
            .frame(width: 50, height: 50)
            .padding()
            .overlay {
              Image(systemName: "plus.bubble.fill")
                .foregroundStyle(Color.white.gradient)
            }
        }
      }
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Text("WhatsApp")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white.gradient)
            .navigationBarColor(backgroundColor: Color(.darkGray))
        }
        ToolbarItem(placement: .topBarTrailing) {
          HStack(spacing: 24) {
            Image(systemName: "camera")
            Image(systemName: "magnifyingglass")
            Image(systemName: "ellipsis")
          }
          .fontWeight(.semibold)
          .foregroundStyle(Color.white.gradient)
        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    InboxView(
      store: Store(
        initialState: InboxLogic.State(),
        reducer: InboxLogic.init
      )
    )
  }
}
