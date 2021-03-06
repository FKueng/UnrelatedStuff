characters = cell(26,3);
statPos = [1 2 6 4];
types = [1 2 3 4 5 6 7 14];
typeNames = {'1 Handed Slashing' '1 Handed Blunt' '1 Handed Stabbing' '2 Handed Slashing' '2 Handed Blunt' '2 Handed Stabbing' 'Bows' 'Shields'};
[dimension,~] = size(weaponsCell);
dpaByAttributes = cell(8,3);

for kindOfStat = 1:4
stats = [10 10 10 10 10 10 10 10];
    for whatKind = 1:length(types)
        dpa = zeros(10,26);
        currentType = types(whatKind);    
        for placeOfWeapon=1:dimension
            if weaponsCell{placeOfWeapon,2}.wp_weapontype == currentType
                for valueOfStat = 1:26
                    weaponLevel = weaponsCell{placeOfWeapon,2}.level;
                    if rem(weaponLevel,2) == 0
                    stats(statPos(kindOfStat)) = valueOfStat;
                    attacker = charakterGeneration(stats, [weaponLevel 0 0]);
      %              actionPoints = max(7, weaponsCell{placeOfWeapon,2}.wp_actionpoints * (100- (attacker.attributes.agility-6)*2.5)/100);
                    actionPoints = max(7, weaponsCell{placeOfWeapon,2}.wp_actionpoints / ...
                    min(1+2*0.2, (1-0.2) + 0.2 * (attacker.attributes.agility / 10)));
                    dpa(weaponLevel/10+1,valueOfStat) = standardfighting_CalculateDamage(attacker,weaponsCell{placeOfWeapon,2})...
                        .*(min(95,weaponsCell{placeOfWeapon,2}.wp_accuracy)/100)./actionPoints;
                    end
                end
            end
        end
        dpaByAttributes{whatKind,kindOfStat} = dpa;
    end
end

x = 0:10:100;
y = 1:26;
attributes = {'Strength' 'Dexterity' 'Perception' 'Agility'};

for kindOfStat = 1:4
    figure;
    for whatKind = 1:length(types)
        subplot(2,4,whatKind);
        surf(x,y,dpaByAttributes{whatKind,kindOfStat}');
        xlabel('Level')
        ylabel(attributes{kindOfStat});
        zlabel('Damage/Actionpoint');
        title(typeNames{whatKind});
      %  axis([0 100 1 26 0 250]);
    end
    
end