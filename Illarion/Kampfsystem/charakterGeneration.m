function [ charakter ] = charakterGeneration(multiplyer)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
field = 'strength';  field2 = 'dexterity'; field3 = 'constitution'; field4 = 'agility';...
    field5 = 'intelligence'; field6 = 'perception'; field7 = 'willpower'; field8 = 'essence';
value = [1 1 1 1 1 1 1 1].*multiplyer;
attributes = struct(field,value(1),field2,value(2),field3,value(3),field4,value(4), ...
    field5,value(5), field6,value(6),field7,value(7),field8,value(8));

attributesField = 'attributes';
skillsField = 'skills';
attackSkillField = 'attackSkill';
attackSkillValue = 0;
reductionSkillField = 'reductionSkill';
reductionSkillValue = 0;
blockSkillField = 'blockSkill';
blockSkillValue = 0;

skills = struct(attackSkillField,attackSkillValue,reductionSkillField,reductionSkillValue,blockSkillField,blockSkillValue);

charakter = struct(attributesField,attributes,skillsField,skills);
end