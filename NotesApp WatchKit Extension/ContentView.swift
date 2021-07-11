import SwiftUI

struct ContentView: View {
    var body: some View {
        //tenemos que ligar nuestras 2 vistas
        VStack{
            NavigationLink("Agregar Nota", destination: AddNote())
            NavigationLink("Listar notas", destination: ListNotes())
        }.navigationTitle("Notes App")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
