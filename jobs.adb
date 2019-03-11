with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

----------------------------------
--Procedure for jobs
----------------------------------

procedure jobs is

        --Array for the people working
        type WorkingArray is array(1..4, 1..4) of character;
        Working: WorkingArray;
       
       	Delimiter: character;
        NumPeople: Integer;
	
	--Record 
	type Skills is 
	    record
		Name : Character;
		Phone : Integer;
		Computer: Integer;
		Network:Integer;
	    end record;

        --Arrray for the people's skills
        type SkillArray is array(1..26) of Skills;
        Skill: SkillArray;


	function checkSkills(Working:WorkingArray;Skill:SkillArray;NumPeople:Integer) return Boolean is
		
		HasSkill: Boolean := false;

		Phone1:character;
		Phone2:character;
		Comp:character;
		Net:character;

	begin 
		--loop through the people in the working list and then assign them to their position
		for i in 1..4 loop
			Phone1 := Working(i,1);
			Phone2 := Working(i,2);
			Comp := Working(i,3);
			Net := Working(i,4);

			--loops through everyone and their skills
			for j in 1..NumPeople loop
				--checks to see if the persons name fits that working in phone1
				if Skill(j).Name = Phone1 then 
					--checks to see if the persons phone skill is 1 if so its good
					if Skill(j).Phone = 1 then 
						HasSkill := true;

					end if;
				end if;
				if Skill(j).Name = Phone2 then 
					if Skill(j).Phone = 1 then 
						HasSkill := true;
					end if;
				end if;
				if Skill(j).Name = Comp then 
					if Skill(j).Computer = 1 then
						HasSkill := true;
					end if;
				end if;

				if Skill(j).Name = Net then 
					if Skill(j).Network = 1 then 
						HasSkill := true;
					end if;
				end if;
			end loop;
		end loop;
		return HasSkill;
	end checkSkills;

	function duplicates(Working:WorkingArray) return Boolean is

		Dup:Boolean:= true;

		type Warray is array(1..16) of character;
		Wa:Warray;

	begin

		Wa(1):=Working(1,1);
		Wa(2):=Working(1,2);
		Wa(3):=Working(1,3);
		Wa(4):=Working(1,4);
		Wa(5):=Working(2,1);
		Wa(6):=Working(2,2);
		Wa(7):=Working(2,3);
		Wa(8):=Working(2,4);
		Wa(9):=Working(3,1);
		Wa(10):=Working(3,2);
		Wa(11):=Working(3,3);
		Wa(12):=Working(3,4);
		Wa(13):=Working(4,1);
		Wa(14):=Working(4,2);
		Wa(15):=Working(4,3);
		Wa(16):=Working(4,4);

		for i in   1..15 loop
			for j in (i+1)..16 loop
				if Wa(i) = Wa(j) then
					Dup := false;
				end if;
			end loop;
		end loop;

		return Dup;
	end duplicates;

begin

	for i in 1..4 loop 
		for j in 1..3 loop
			get(Working(i,j));
			get(Delimiter);

		end loop;
		get(Working(i,4));
		skip_Line;
	end loop;	

	get(NumPeople);
	for emp in 1..NumPeople loop
		get(Skill(emp).Name);
		get(Skill(emp).Phone);
	        get(Skill(emp).Computer);
		get(Skill(emp).Network);
	end loop;

	if checkSkills(Working,Skill,NumPeople) and duplicates(Working) then 
		put("Acceptable");
	else
		put("Not Acceptable");
	end if;
end jobs;
