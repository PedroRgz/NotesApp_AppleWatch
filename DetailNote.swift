import SwiftUI

struct DetailNote: View {
    //En este, solo desplegaremos la información de la nota -> título y fecha de creación
    let note:Note
    
    var body: some View {
        VStack{
            Text(note.title)
                .font(.system(size: 20))
                .foregroundColor(.white)
            Spacer()
            
            Text(note.creationDate)
                .font(.system(size: 12))
                .fontWeight(.bold)
                .foregroundColor(.gray)
        }
    }
}

struct DetailNote_Previews: PreviewProvider {
    static var previews: some View {
        DetailNote(note: Note(titleForNote: "Hola nota"))
    }
}
