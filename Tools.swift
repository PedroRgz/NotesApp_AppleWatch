import Foundation

class Tools{
    let userDefaultsKey:String = "NotesApp"
    
    static let shared = Tools() //a través de shared accederemos a las funciones que contiene la clase
    
    private init(){}
    
    func save(notesArray: [Note]){
        //transformamos lo que contiene el arreglo a JSON
        let data = notesArray.map { try? JSONEncoder().encode($0)}
        
        //guardamos el JSON en userdefaults
        UserDefaults.standard.setValue(data, forKey: userDefaultsKey)
    }
    
    func load() -> [Note] {
        guard let savedData = UserDefaults.standard.array(forKey: userDefaultsKey) as? [Data] else {
            return [Note]()
        }
        
        return savedData.map{try! JSONDecoder().decode(Note.self, from: $0)}
    }
    
}
