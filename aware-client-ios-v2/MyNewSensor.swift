//
//  MyNewSensor.swift
//  aware-client-ios-v2
//
//  Created by JessieW on 1/27/23.
//  Copyright © 2023 Yuuki Nishiyama. All rights reserved.
//
import Foundation
import AWAREFramework

class MyNewSensor: AWAREStorage {
    override static func isSyncable() -> Bool {
        return true
    }
    
    override static func tableName() -> String {
        return "my_new_sensor"
    }
    
    override static func tableSchema() -> String {
        return "timestamp real default 0, device_id text default '', value real default 0"
    }
}
