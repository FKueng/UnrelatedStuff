function [ hitChance, hitFlag ] = chanceToHit( character, weapon )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    hitFlag = false;
    weaponAccuracy = weapon.wp_accuracy;
    perception = character.attributes.perception;
    
    hitChance = min(95,max(5, weaponAccuracy*(1+(perception-10)/500)));
    
    if rand*100<= hitChance 
        hitFlag = true;
    end
    
end

