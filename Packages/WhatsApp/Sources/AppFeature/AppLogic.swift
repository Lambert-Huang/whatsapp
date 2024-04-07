import SwiftUI
import ComposableArchitecture
import OnboardingFeature
import AuthentificationFeature
import NavigationFeature

@Reducer
public struct AppLogic {
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

public struct AppView: View {
  @Perception.Bindable var store: StoreOf<AppLogic>
  public init(store: StoreOf<AppLogic>) {
    self.store = store
  }
  public var body: some View {
    WithPerceptionTracking {
      
    }
  }
}
