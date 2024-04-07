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
public struct SettingsLogic {
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

public struct SettingsView: View {
  @Perception.Bindable var store: StoreOf<SettingsLogic>
  public init(store: StoreOf<SettingsLogic>) {
    self.store = store
  }
  public var body: some View {
    WithPerceptionTracking {
      
    }
  }
}
