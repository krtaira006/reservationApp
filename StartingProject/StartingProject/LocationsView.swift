import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    var body: some View {
        VStack {
            LittleLemonLogo() // 1 shows LittleLemon logo
                .padding(.top, 50)
            // 2 text displaying "select location or reservation"
            Text(model.displayingReservationForm ? "Reservation Details" : "Select a location")
            .padding([.leading, .trailing], 40)
            .padding([.top, .bottom], 8)
            .background(Color.yellow.opacity(0.6))
            .cornerRadius(20)
            
            NavigationView {
                // 3 create a list of restaurantView and when clicked, take them to ReservationForm
                List{
                    ForEach(model.restaurants, id: \.self) {restaurant in
                        NavigationLink(destination: ReservationForm(restaurant)) {
                            RestaurantView(restaurant)
                        }
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .background(Color.green.opacity(0.5))
                
            }
        }
        .padding(.top, -10)
        .background(Color.green.opacity(0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}

