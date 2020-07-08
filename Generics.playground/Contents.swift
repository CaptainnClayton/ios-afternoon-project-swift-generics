import Foundation

struct CountedSet<Element: Hashable>{
    //MARK: - Properties
    private var myDictionary = [Element : Int]()
    var count: Int{
        return myDictionary.count
    }
    var isEmpty: Bool{
        return count == 0
    }
    
    //MARK: - Functions
    mutating func insert(element: Element){
        if let elementCount = myDictionary[element]{
            myDictionary[element] = elementCount + 1
        } else {
            myDictionary[element] = 1
        }
    }
    
    mutating func remove(element: Element){
        
    }
    
    subscript(_ member: Element) -> Int{
        return myDictionary[member] ?? 0
    }
}

//MARK: - Extenstion
extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element: element)
        }
    }
}


//MARK: - Tests
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
