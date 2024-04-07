//
//  File.swift
//  
//
//  Created by lambert on 2024/4/7.
//

import Foundation
import SwiftUI
import ComposableArchitecture

@Reducer
public struct NewMessageLogic {
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

public struct NewMessageView: View {
  @Perception.Bindable var store: StoreOf<NewMessageLogic>
  public init(store: StoreOf<NewMessageLogic>) {
    self.store = store
  }
  public var body: some View {
    WithPerceptionTracking {
      
    }
  }
}
