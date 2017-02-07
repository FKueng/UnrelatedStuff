function [ currentWeapon, weaponId ] = getWeapons( textData, data, index)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    currentWeapon = struct();
    weaponId = data(index,2);
    
    for i = 3:11 
        currentWeapon = setfield(currentWeapon, textData{1,i}, data(index,i));
    end
    
   
end

