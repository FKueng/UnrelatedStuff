function [ parryChance, parryFlag ] = chanceToParry( character, weapon )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    parryFlag = false;
    weaponParry = weapon.wp_defence;
    %quality = weapon.wp_quality;
    quality = 1;
    agility = character.attributes.agility;
    
    
    defenderdefense = (100/5) + weaponParry*(1-1/5);
    if weapon.wp_weapontype ~= 14
        defenderdefense = defenderdefense/2;
    end
    
    parryChance = character.skills.blockSkill/5;
    parryChance = parryChance * (0.5 + agility/20);
    
    parryChance = min(95,max(5, weaponAccuracy*(1+(perception-10)/500)));
    
    if rand*100<= parryChance 
        parryFlag = true;
    end


end

