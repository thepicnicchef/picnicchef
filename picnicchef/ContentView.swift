import SwiftUI
import CoreLocation

// 1. Create a protocol that defines the required functionality
protocol LocationServiceProtocol {
    func getLocation() -> String
}

// 2. Modify the LocationService class to conform to the LocationServiceProtocol protocol
class LocationService: NSObject, ObservableObject, LocationServiceProtocol {
   private var locationManager = CLLocationManager()
   
   override init() {
       super.init()
       locationManager.requestWhenInUseAuthorization()
   }
   
   func getLocation() -> String {
       if let location = locationManager.location {
           return "\(location.coordinate.latitude), \(location.coordinate.longitude)"
       } else {
           return "Location not available"
       }
   }
}

// ContentView with dependency injection for better testability
@available(iOS 17.0, *)
struct ContentView: View {
    @State private var selectedDate = Date()
    let items = ["Sandwich", "Salad", "Fruit", "Drink"]
    @State private var showItems = false
    @State private var location: String = "Unknown"
    
    // 3. Replace the @StateObject with a property that conforms to the LocationServiceProtocol
    var locationService: LocationServiceProtocol
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to PicnicChef!")
                .font(.largeTitle)
                .padding()

            DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
            Button("Get Location") {
                location = locationService.getLocation()
            }
            Text(location)
                .padding()

            Button(action: {
                showItems.toggle()
            }) {
                Text(showItems ? "Hide Available Items" : "View Available Items")
            }
            .padding()

            if showItems {
                List(items, id: \.self) { item in
                    Text(item)
                }
            }
        }
        // 4. Initialize ContentView with a default LocationService instance
        // For real use case
        // In tests, you can inject a mock service that conforms to LocationServiceProtocol
    }
}

// Extension to provide a default value for previews or call sites not providing a service
@available(iOS 17.0, *)
extension ContentView {
    init() {
        self.locationService = LocationService()
    }
}

// Example of a mock location service for testing
class MockLocationService: LocationServiceProtocol {
    func getLocation() -> String {
        // Return a fixed test location
        return "Test location"
    }
}
