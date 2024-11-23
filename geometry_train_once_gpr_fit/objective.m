
   function [obj]=objective(x,xs_g,fsmp)

            Mdl_obj_1=fitrgp(xs_g,fsmp);
            obj=predict( Mdl_obj_1,x);
   end
           