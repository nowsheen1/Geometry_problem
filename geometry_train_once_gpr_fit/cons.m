 function [c,ceq]=cons(x,xs_g_con1, fsmp_con1)

            Mdl_con=fitrgp(xs_g_con1, fsmp_con1);
            c=predict(Mdl_con,x);
            ceq=[];
   end