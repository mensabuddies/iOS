//
//  CanteenDetail.swift
//  Mensa
//
//  Created by Timo Reusch on 26.12.22.
//

import SwiftUI

struct CanteenDetail: View {
    @State private var descriptionExpanded: Bool = false
    @State private var selectedDay = 0
    
    var canteen: Canteen
    let weekdays: [String] = ["Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag"]
    
    var body: some View {
        ScrollView{
            ZStack{
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    Image("\(canteen.firebaseId)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: 250)
                }
                .frame(height: 250)
                
                LinearGradient(colors: [
                    .black.opacity(0.7),
                    .black.opacity(0.4),
                    .black.opacity(0.1),
                    .clear
                ], startPoint: .top, endPoint: .bottom)
            }
            
            VStack(alignment: .leading){
                Text(canteen.type)
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Text(canteen.name)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            VStack{
                DisclosureGroup("Über diese Mensa", isExpanded: $descriptionExpanded) {
                    Text(canteen.description_de)
                        .padding(.top)
                }
                .tint(.blue)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("secondary_accent"))
                )
                .padding()
            }
            
            VStack {
                SegmentedControlView(selectedIndex: $selectedDay, titles: weekdays)
                
                switch(selectedDay) {
                case 0: Text("M")
                case 1: Text("2")
                case 2: Text("3")
                default:
                    Text("default")
                }
            }
        }
        .ignoresSafeArea()
    }
}


struct CanteenDetail_Previews: PreviewProvider {
    static var previews: some View {
        CanteenDetail(canteen: Canteen(
            id: UUID(),
            firebaseId: 10,
            documentId: "mensateria_campus_hubland_nord_wuerzburg",
            name: "Campus Hubland Nord",
            location: "Würzburg",
            type: "Mensateria",
            info: "Bis auf weiteres geschlossen",
            additionalInfo: "Keine Abendmensa während der vorlesungsfreien Zeit",
            address: "Mensateria Campus Hubland Nord, Magdalene-Schoch-Str., 97074 Würzburg",
            description_de: "Die Mensateria mit 500 Innen- und 60 Balkonplätzen befindet sich im Obergeschoss des Gebäudes am westlichen Rand des Campus Nord am Hubland. Zur Südseite hin trägt die Mensateria einen Balkon, so dass ein Aufenthalt im Freien mit Blick auf den Hubland-Campus möglich ist.Ausgestattet ist die Mensateria mit einem modernen Speiseleitsystem sowie speziellen Angebotsvarianten.",
            openingHours: OpeningHours(
                id: UUID(),
                monday: OpeningHoursItem(id: UUID(), opensAt: "10.00", closesAt: "14.00", getFoodTill: "13:30", isOpen: true),
                tuesday: OpeningHoursItem(id: UUID(), opensAt: "10.00", closesAt: "14.00", getFoodTill: "13:30", isOpen: true),
                wednesday: OpeningHoursItem(id: UUID(), opensAt: "10.00", closesAt: "14.00", getFoodTill: "13:30", isOpen: true),
                thursday: OpeningHoursItem(id: UUID(), opensAt: "10.00", closesAt: "14.00", getFoodTill: "13:30", isOpen: true),
                friday: OpeningHoursItem(id: UUID(), opensAt: "", closesAt: "", getFoodTill: "", isOpen: false)
            )))
    }
}
