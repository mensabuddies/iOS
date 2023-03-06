//
//  AboutView.swift
//  Mensa
//
//  Created by Timo Reusch on 12.09.22.
//

import SwiftUI

struct AboutView: View {
    @Binding var showAbout: Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("Allgemeines")){
                        Text(
"""
Diese App entstand als Spaßprojekt zweier Informatikstudenten der Universität Würzburg.

**Es handelt sich um keine offizielle App des Studentenwerks!**
                     
Aufgrund dessen kann es vorkommen, dass die angezeigten Daten nicht aktuell oder Informationen zu z.B. Inhaltsstoffen, Allergenen oder Preisen nicht korrekt sind. Beachte - besondes wenn du Allergiker bist - bitte immer die Aushänge vor Ort!
""")
                    }
                    
                    Section(header: Text("Für Entwickler")){
                        Text("Der komplette Code des Projektes ist OpenSource und auf GitHub. Solltest du einen Fehler entdecken, kannst du gerne ein Issue im passenden Repository eröffnen. Auch Pull-Requests sind herzlich willkommen :)")
                        Link("Mensa App Würzburg Organisation", destination: URL(string: "https://github.com/mensa-app-wuerzburg")!)
                        Link("iOS-App Repository", destination: URL(string: "https://github.com/mensa-app-wuerzburg/iOS")!)
                    }
                    Section(header: Text("Impressum")){
                        Text("""
**Angaben gemäß § 5 TMG**
Timo Reusch
Würzburg

Da dies ein privates Spaßprojekt ist teile ich meine genaue Anschrift nur bei berechtigten, juristischen Anliegen mit. Kontaktieren Sie mich hierzu bitte eine E-Mail.

Vertreten durch:
Timo Reusch

**Kontakt:**
"""
                             )
                             Image("n").resizable().frame(width: 150.0, height: 13.0)
                            Text("ios@mensa-app.timo-reusch.de")
                             Text(
"""
Verantwortlich für den Inhalt nach § 55 Abs. 2 RStV: Timo Reusch, Anschrift wie oben.
""")
                        Text("""
**Haftungsausschluss:**
**Haftung für Inhalte**
Die Inhalte dieser Applikation wurden mit größter Sorgfalt erstellt. Für die Richtigkeit, Vollständigkeit und Aktualität der Inhalte können wir jedoch keine Gewähr übernehmen. Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen. Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden Rechtsverletzungen werden wir diese Inhalte umgehend entfernen.
    
**Haftung für Links**
Unser Angebot enthält Links zu externen Webseiten Dritter, auf deren Inhalte wir keinen Einfluss haben. Deshalb können wir für diese fremden Inhalte auch keine Gewähr übernehmen. Für die Inhalte der verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich. Die verlinkten Seiten wurden zum Zeitpunkt der Verlinkung auf mögliche Rechtsverstöße überprüft. Rechtswidrige Inhalte waren zum Zeitpunkt der Verlinkung nicht erkennbar. Eine permanente inhaltliche Kontrolle der verlinkten Seiten ist jedoch ohne konkrete Anhaltspunkte einer Rechtsverletzung nicht zumutbar. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Links umgehend entfernen.
""")
                    }
                }
            }
            .navigationTitle("Über v\(Bundle.main.appVersionShort)")
            .navigationBarItems(
                trailing: Button(action: {
                    self.showAbout.toggle()
                }, label: {
                    Image(systemName: "xmark.circle")
                }))
        }
    }
}

struct BindingViewAboutViewContainer : View {
     @State
     private var value = false

     var body: some View {
          AboutView(showAbout: $value)
     }
}

#if DEBUG
struct BindingViewAboutViewContainer_Previews : PreviewProvider {
    static var previews: some View {
        BindingViewAboutViewContainer()
    }
}
#endif

extension Bundle {
    
    public var appVersionShort: String {
        if let result = infoDictionary?["CFBundleShortVersionString"] as? String {
            return result
        } else {
            return "⚠️"
        }
    }
}
