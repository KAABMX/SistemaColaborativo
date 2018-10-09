DELIMITER %%
create trigger tipoUsuario_creacion after insert on usuario for each row
	begin
		if (new.tipoUsuario='alumno') then
			insert into alumno (aIdUsuario)
			values (new.username);
        elseif (new.tipoUsuario='profesor') then
			insert into profesor (pIdUsuario)
			values (new.username);
		end if;

    end%%
