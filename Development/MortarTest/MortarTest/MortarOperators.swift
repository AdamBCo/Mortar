//
//  Mortar+Operators.swift
//  MortarTest
//
//  Created by Jason Fieldman on 1/30/16.
//  Copyright © 2016 Jason Fieldman. All rights reserved.
//

import Foundation
import UIKit


/*

view1.m_TLcorner |=| (self.view.m_width * 0.5, self.view.m_height * 0.5 + 10) ! .Low
view1.m_size     |=| (40, 50)
view1.m_size     |=| (view1.m_width, view2.m_height)
view2.m_center   |=| self.view
view1.m_top      |=| [self.view, view2, view3]
view1            |=| [self.view.m_bottom, self.view.m_sides]
view1.m_height   |=| 40 !

[view1, view2, view3, view4].m_frame |=| (100, 100, 40, 40)  !?
[view1, view2, view3, view4].m_frame |=| view5               !!

*/

infix operator |=| { precedence 95 }
infix operator |>| { precedence 95 }
infix operator |<| { precedence 95 }


/**
 Handle the basic case of joining two Mortar Attributes into a constraint
 e.g: 
 
 view1.m_top |=| view2.m_bottom
 
 Will set the top of view1 to the bottom of view2
*/
public func |=|(lhs: MortarAttributable, rhs: MortarAttributable) -> MortarConstraint {
    return MortarConstraint(target: lhs, source: rhs, relation: .Equal)
}

public func |>|(lhs: MortarAttributable, rhs: MortarAttributable) -> MortarConstraint {
    return MortarConstraint(target: lhs, source: rhs, relation: .GreaterThanOrEqual)
}

public func |<|(lhs: MortarAttributable, rhs: MortarAttributable) -> MortarConstraint {
    return MortarConstraint(target: lhs, source: rhs, relation: .LessThanOrEqual)
}




public func |=|(lhs: MortarAttribute, rhs: MortarTwople) -> MortarConstraint {
    return MortarConstraint(target: lhs, source: MortarConvertTwople(rhs), relation: .Equal)
}

public func |>|(lhs: MortarAttribute, rhs: MortarTwople) -> MortarConstraint {
    return MortarConstraint(target: lhs, source: MortarConvertTwople(rhs), relation: .GreaterThanOrEqual)
}

public func |<|(lhs: MortarAttribute, rhs: MortarTwople) -> MortarConstraint {
    return MortarConstraint(target: lhs, source: MortarConvertTwople(rhs), relation: .LessThanOrEqual)
}



public func |=|(lhs: MortarAttribute, rhs: MortarFourple) -> MortarConstraint {
    return MortarConstraint(target: lhs, source: MortarConvertFourple(rhs), relation: .Equal)
}

public func |>|(lhs: MortarAttribute, rhs: MortarFourple) -> MortarConstraint {
    return MortarConstraint(target: lhs, source: MortarConvertFourple(rhs), relation: .GreaterThanOrEqual)
}

public func |<|(lhs: MortarAttribute, rhs: MortarFourple) -> MortarConstraint {
    return MortarConstraint(target: lhs, source: MortarConvertFourple(rhs), relation: .LessThanOrEqual)
}



public func |=|(lhs: MortarAttribute, rhs: MortarTuple) -> MortarConstraint {
    return MortarConstraint(target: lhs, source: rhs, relation: .Equal)
}

public func |>|(lhs: MortarAttribute, rhs: MortarTuple) -> MortarConstraint {
    return MortarConstraint(target: lhs, source: rhs, relation: .GreaterThanOrEqual)
}

public func |<|(lhs: MortarAttribute, rhs: MortarTuple) -> MortarConstraint {
    return MortarConstraint(target: lhs, source: rhs, relation: .LessThanOrEqual)
}



public func |=|(lhs: [MortarAttributable], rhs: [MortarAttributable]) -> MortarConstraint {
    return MortarConstraint(targetArray: lhs.map { $0.m_intoAttribute() },
                            sourceArray: rhs.map { $0.m_intoAttribute() },
                              crosslink: false,
                               relation: .Equal)
}

public func |>|(lhs: [MortarAttributable], rhs: [MortarAttributable]) -> MortarConstraint {
    return MortarConstraint(targetArray: lhs.map { $0.m_intoAttribute() },
                            sourceArray: rhs.map { $0.m_intoAttribute() },
                              crosslink: false,
                               relation: .GreaterThanOrEqual)
}

public func |<|(lhs: [MortarAttributable], rhs: [MortarAttributable]) -> MortarConstraint {
    return MortarConstraint(targetArray: lhs.map { $0.m_intoAttribute() },
                            sourceArray: rhs.map { $0.m_intoAttribute() },
                              crosslink: false,
                               relation: .LessThanOrEqual)
}


public func |=|(lhs: MortarAttributable, rhs: [MortarAttributable]) -> MortarConstraint {
    return MortarConstraint(targetArray: [lhs.m_intoAttribute()],
                            sourceArray: rhs.map { $0.m_intoAttribute() },
                              crosslink: true,
                               relation: .Equal)
}

public func |>|(lhs: MortarAttributable, rhs: [MortarAttributable]) -> MortarConstraint {
    return MortarConstraint(targetArray: [lhs.m_intoAttribute()],
                            sourceArray: rhs.map { $0.m_intoAttribute() },
                              crosslink: true,
                               relation: .GreaterThanOrEqual)
}

public func |<|(lhs: MortarAttributable, rhs: [MortarAttributable]) -> MortarConstraint {
    return MortarConstraint(targetArray: [lhs.m_intoAttribute()],
                            sourceArray: rhs.map { $0.m_intoAttribute() },
                              crosslink: true,
                               relation: .LessThanOrEqual)
}

public func |=|(lhs: [MortarAttributable], rhs: MortarAttributable) -> MortarConstraint {
    return MortarConstraint(targetArray: lhs.map { $0.m_intoAttribute() },
                            sourceArray: [rhs.m_intoAttribute()],
                              crosslink: true,
                               relation: .Equal)
}

public func |>|(lhs: [MortarAttributable], rhs: MortarAttributable) -> MortarConstraint {
    return MortarConstraint(targetArray: lhs.map { $0.m_intoAttribute() },
                            sourceArray: [rhs.m_intoAttribute()],
                              crosslink: true,
                               relation: .GreaterThanOrEqual)
}

public func |<|(lhs: [MortarAttributable], rhs: MortarAttributable) -> MortarConstraint {
    return MortarConstraint(targetArray: lhs.map { $0.m_intoAttribute() },
                            sourceArray: [rhs.m_intoAttribute()],
                              crosslink: true,
                               relation: .LessThanOrEqual)
}


/**
 Handle multiplier/constant modifiers to MortarAttributes using basic arithmetic operators
 
 e.g. these are valid:
 
 view1.m_top    + 40
 view1.m_bottom - 40
 view1.m_width  * 2.0
 view1.m_height / 3.0
 view1.m_size   * 2.0 + 10  <-- chains multiplier/constant together
 
*/
public func +(lhs: MortarAttribute, rhs: MortarCGFloatable) -> MortarAttribute {
    lhs.constant += rhs.m_cgfloatValue()
    return lhs
}

public func -(lhs: MortarAttribute, rhs: MortarCGFloatable) -> MortarAttribute {
    lhs.constant -= rhs.m_cgfloatValue()
    return lhs
}

public func *(lhs: MortarAttribute, rhs: MortarCGFloatable) -> MortarAttribute {
    lhs.multiplier *= rhs.m_cgfloatValue()
    return lhs
}

public func /(lhs: MortarAttribute, rhs: MortarCGFloatable) -> MortarAttribute {
    lhs.multiplier /= rhs.m_cgfloatValue()
    return lhs
}

/* This is only using for chaining constants with priorities attached */

public func +(lhs: MortarAttribute, rhs: MortarAttribute) -> MortarAttribute {
    if (rhs.view != nil || rhs.attribute != nil) {
        NSException(name: "Right side of arithmetic must be constant",
                  reason: "When performing mortar arithmetic, the right side must be a constant (cannot have view or attribute)",
                userInfo: nil).raise()
    }
    lhs.constant += rhs.constant
    lhs.priority =  rhs.priority
    return lhs
}

public func -(lhs: MortarAttribute, rhs: MortarAttribute) -> MortarAttribute {
    if (rhs.view != nil || rhs.attribute != nil) {
        NSException(name: "Right side of arithmetic must be constant",
                  reason: "When performing mortar arithmetic, the right side must be a constant (cannot have view or attribute)",
                userInfo: nil).raise()
    }
    lhs.constant -= rhs.constant
    lhs.priority =  rhs.priority
    return lhs
}

public func *(lhs: MortarAttribute, rhs: MortarAttribute) -> MortarAttribute {
    if (rhs.view != nil || rhs.attribute != nil) {
        NSException(name: "Right side of arithmetic must be constant",
                  reason: "When performing mortar arithmetic, the right side must be a constant (cannot have view or attribute)",
                userInfo: nil).raise()
    }
    lhs.multiplier *= rhs.constant
    lhs.priority    = rhs.priority
    return lhs
}

public func /(lhs: MortarAttribute, rhs: MortarAttribute) -> MortarAttribute {
    if (rhs.view != nil || rhs.attribute != nil) {
        NSException(name: "Right side of arithmetic must be constant",
                  reason: "When performing mortar arithmetic, the right side must be a constant (cannot have view or attribute)",
                userInfo: nil).raise()
    }
    lhs.multiplier /= rhs.constant
    lhs.priority    = rhs.priority
    return lhs
}


/**
 Priority operators
*/

infix operator ! { precedence 130 }

public func !(lhs: MortarAttributable, rhs: MortarLayoutPriority) -> MortarAttribute {
    let attr = lhs.m_intoAttribute()
    attr.priority = rhs.layoutPriority()
    return attr
}

public func !(lhs: MortarAttributable, rhs: UILayoutPriority) -> MortarAttribute {
    let attr = lhs.m_intoAttribute()
    attr.priority = rhs
    return attr
}


public func !(lhs: MortarTwople, rhs: MortarLayoutPriority) -> MortarTuple {
    var tup = MortarConvertTwople(lhs)
    tup.1 = rhs.layoutPriority()
    return tup
}

public func !(lhs: MortarTwople, rhs: UILayoutPriority) -> MortarTuple {
    var tup = MortarConvertTwople(lhs)
    tup.1 = rhs
    return tup
}


public func !(lhs: MortarFourple, rhs: MortarLayoutPriority) -> MortarTuple {
    var tup = MortarConvertFourple(lhs)
    tup.1 = rhs.layoutPriority()
    return tup
}

public func !(lhs: MortarFourple, rhs: UILayoutPriority) -> MortarTuple {
    var tup = MortarConvertFourple(lhs)
    tup.1 = rhs
    return tup
}

public func !(lhs: [MortarAttribute], rhs: MortarLayoutPriority) -> [MortarAttribute] {
    lhs.forEach { if $0.priority == nil { $0.priority = rhs.layoutPriority() } }
    return lhs
}

public func !(lhs: [MortarAttribute], rhs: UILayoutPriority) -> [MortarAttribute] {
    lhs.forEach { if $0.priority == nil { $0.priority = rhs } }
    return lhs
}



