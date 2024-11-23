function [c,ceq]=cons_2(x,xs_g_con1, fsmp_con1,xs_g_con2, fsmp_con2)

            Mdl_con=fitrgp(xs_g_con1, fsmp_con1);
            c1=predict(Mdl_con,x);

            Mdl_con2=fitrgp(xs_g_con2, fsmp_con2);
            c2=predict(Mdl_con2,x);
            c=[c1;c2];
            ceq=[];
   end