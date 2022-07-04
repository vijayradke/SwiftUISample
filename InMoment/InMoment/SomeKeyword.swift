//
//  SomeKeyword.swift
//  InMoment
//
//  Created by Gourav on 03/07/22.
//

import Foundation
import UIKit

//A function or method with an opaque return type hides its return value’s type information. Instead of providing a concrete type as the function’s return type, the return value is described in terms of the protocols it supports. Hiding type information is useful at boundaries between a module and code that calls into the module, because the underlying type of the return value can remain private. Unlike returning a value whose type is a protocol type, opaque types preserve type identity—the compiler has access to the type information, but clients of the module don’t.


//Opaque return type in swift or sometimes referred to like the some keyword in swift are a fantastic way of hiding concrete type in your code and return a protocol instead.

protocol Product
{
    associatedtype Code
    var productCode: Code { get }
    func description() -> String
}

struct Laptop : Product
{
   // typealias Code = String
    var productCode: String

    func description() -> String {
        "This is a Laptop"
    }
}

struct Keyboard : Product
{
   // typealias Code = Int
    var productCode: Int

    func description() -> String {
        "This is a Keyboard"
    }
}

struct Factory
{
    func makeLaptops() -> some Product
    {
        return Laptop(productCode: "KP")
    }
    
    func makeKeyboard() -> some Product{
        
        return Keyboard(productCode: 81)
    }

//    func makeProducts() -> Laptop
//    {
//        return Laptop(productCode: "test")
//    }
//
//    func makeProducts() -> Keyboard
//    {
//        return Keyboard(productCode: 1)
//    }
}

class FactoryView : UIViewController {
    
    override func viewDidLoad() {
        let factory = Factory()
        
        let keybaord = factory.makeKeyboard()
        print(keybaord.description())
        
        let laptop = factory.makeLaptops()
        print(laptop.description())
        
      
        //Column breakpoint
        print([1,2,3,4,6].filter({$0.isMultiple(of: 2)}).map({"\($0)"}))
        //https://www.youtube.com/watch?v=33193iaQwiA
    }
}


func SquareArrayElements<T: Numeric>(array: Array<T>) -> some Sequence
{
    return array.lazy.map {$0 * $0}
}
