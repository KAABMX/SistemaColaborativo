DELIMITER %%
create trigger usuario_calificacion after insert on resena for each row
	begin
    DECLARE a integer;
    DECLARE b integer;
    DECLARE c double; 
    set a = (select sum(calificacion) as suma from resena where rIdUsuario=new.rIdUsuario);
    set b = (select count(calificacion) as total from resena where rIdUsuario=new.rIdUsuario);
    set c = a/b; 
  
   update usuraio
			set calificacion= c
			where username = new.rIdUsuario;
		
        if (c<=1) then
        update usuraio
			set activo = 0
			where username = new.rIdUsuario;
		end if;
    end%%
