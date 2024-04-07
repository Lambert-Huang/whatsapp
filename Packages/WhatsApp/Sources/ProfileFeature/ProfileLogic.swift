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
public struct ProfileLogic {
  public init() {}
  
  @ObservableState
  public struct State: Equatable {
    
  }
  
  public enum Action {
    
  }
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
        .none
    }
  }
}

public struct ProfileView: View {
  @Perception.Bindable var store: StoreOf<ProfileLogic>
  public init(store: StoreOf<ProfileLogic>) {
    self.store = store
  }
  public var body: some View {
    WithPerceptionTracking {
      
    }
  }
}
