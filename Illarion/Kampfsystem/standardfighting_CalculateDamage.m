function [ damage ] = standardfighting_CalculateDamage( charakter, weapon)
%STANDARDFIGHTING_CALCULATEDAMAGE Summary of this function goes here
%   Detailed explanation goes here
% Missing is the chance for a real crit with CritBonus = 1.5. This will be
% based on the attack speed and the chance for a crit at all

    BaseDamage = weapon.wp_attack*40;
    StrengthBonus = (charakter.attributes.strength - 6)*3;
    PerceptionBonus = (charakter.attributes.perception - 6)*1;
    DexterityBonus = (charakter.attributes.dexterity - 6)*1;
    SkillBonus = (charakter.skills.attackSkill - 20)*1.5;
%    SkillBonus = (skill - 20)*1.5;
    CritBonus=1;
    QualityBonus = 0.91 + 0.02*floor(999/100);
    GemBonus = 0;

    GlobalDamageFactor = 1/180;
    
    damage = GlobalDamageFactor*BaseDamage * CritBonus * QualityBonus * (100 + StrengthBonus + PerceptionBonus + DexterityBonus + SkillBonus + GemBonus);

end

