   function [obj]=objective_2(x,xs_g,fsmp)

            Mdl_obj_2=fitrgp(xs_g,fsmp);
            obj=predict( Mdl_obj_2,x);
   end
           