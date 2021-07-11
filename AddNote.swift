//
//  AddNote.swift
//  NotesApp WatchKit Extension
//
//  Created by Pedro Rodríguez on 10/07/21.
//

import SwiftUI

struct AddNote: View {
    
    /*
     Para SwiftUI, todas las variables deberían ser inmutables, por lo que deberemos agregar una propiedad de $State, y debe ser privada... además, la varible será llamada con un signo de "$"
     */
    @State private var newTextFromeNote = ""
    @State private var notesArray = [Note]()
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            TextField("Nota", text: $newTextFromeNote)
            
            //el botón llevará toda la lógica de esta pantalla
            Button("Agregar nota"){
                //si el usuario no tecleó nada... entonces nos saldremos
                guard newTextFromeNote.isEmpty == false else{
                    return
                }
                
                //creamos el objeto de tipo Note en donde guardaremos la info en turno
                let currentNote = Note(titleForNote: newTextFromeNote)
                
                //la agregamos a nuestro array de notas
                notesArray.append(currentNote)
                
                //guardamos el array a través de Tools
                Tools.shared.save(notesArray: notesArray)
                
                //limpiamos el campo de texto
                newTextFromeNote = ""
                
                //Cerramos la vista
                presentation.wrappedValue.dismiss()
            }
        }.onAppear(perform: {
            //tomamos el array de notas ya existente para que al sobreescribir, no solo se agregue la nota recien hecha
            notesArray = Tools.shared.load()
        })
    }
}

struct AddNote_Previews: PreviewProvider {
    static var previews: some View {
        AddNote()
    }
}
