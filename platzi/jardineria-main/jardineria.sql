PGDMP     ;                    {         
   jardineria    14.6    14.6 $    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    33322 
   jardineria    DATABASE     j   CREATE DATABASE jardineria WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE jardineria;
                postgres    false            �            1259    33354    cliente    TABLE     <  CREATE TABLE public.cliente (
    codigo_cliente integer NOT NULL,
    nombre_cliente character varying(50) NOT NULL,
    nombre_contacto character varying(30) DEFAULT NULL::character varying,
    apellido_contacto character varying(30) DEFAULT NULL::character varying,
    telefono character varying(15) NOT NULL,
    fax character varying(15) NOT NULL,
    linea_direccion1 character varying(50) NOT NULL,
    linea_direccion2 character varying(50) DEFAULT NULL::character varying,
    ciudad character varying(50) NOT NULL,
    region character varying(50) DEFAULT NULL::character varying,
    pais character varying(50) DEFAULT NULL::character varying,
    codigo_postal character varying(10) DEFAULT NULL::character varying,
    codigo_empleado_rep_ventas integer,
    limite_credito numeric(15,2) DEFAULT NULL::numeric
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    33397    detalle_pedido    TABLE     �   CREATE TABLE public.detalle_pedido (
    codigo_pedido integer NOT NULL,
    codigo_producto character varying(15) NOT NULL,
    cantidad integer NOT NULL,
    precio_unidad numeric(15,2) NOT NULL,
    numero_linea smallint NOT NULL
);
 "   DROP TABLE public.detalle_pedido;
       public         heap    postgres    false            �            1259    33330    empleado    TABLE     �  CREATE TABLE public.empleado (
    codigo_empleado integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido1 character varying(50) NOT NULL,
    apellido2 character varying(50) DEFAULT NULL::character varying,
    extension character varying(10) NOT NULL,
    email character varying(100) NOT NULL,
    codigo_oficina character varying(10) NOT NULL,
    codigo_jefe integer,
    puesto character varying(50) DEFAULT NULL::character varying
);
    DROP TABLE public.empleado;
       public         heap    postgres    false            �            1259    33347    gama_producto    TABLE     �   CREATE TABLE public.gama_producto (
    gama character varying(50) NOT NULL,
    descripcion_texto text,
    descripcion_html text,
    imagen character varying(256)
);
 !   DROP TABLE public.gama_producto;
       public         heap    postgres    false            �            1259    33323    oficina    TABLE     �  CREATE TABLE public.oficina (
    codigo_oficina character varying(10) NOT NULL,
    ciudad character varying(30) NOT NULL,
    pais character varying(50) NOT NULL,
    region character varying(50) DEFAULT NULL::character varying,
    codigo_postal character varying(10) NOT NULL,
    telefono character varying(20) NOT NULL,
    linea_direccion1 character varying(50) NOT NULL,
    linea_direccion2 character varying(50) DEFAULT NULL::character varying
);
    DROP TABLE public.oficina;
       public         heap    postgres    false            �            1259    33412    pago    TABLE     �   CREATE TABLE public.pago (
    codigo_cliente integer NOT NULL,
    forma_pago character varying(40) NOT NULL,
    id_transaccion character varying(50) NOT NULL,
    fecha_pago date NOT NULL,
    total numeric(15,2) NOT NULL
);
    DROP TABLE public.pago;
       public         heap    postgres    false            �            1259    33371    pedido    TABLE       CREATE TABLE public.pedido (
    codigo_pedido integer NOT NULL,
    fecha_pedido date NOT NULL,
    fecha_esperada date NOT NULL,
    fecha_entrega date,
    estado character varying(15) NOT NULL,
    comentarios text,
    codigo_cliente integer NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    33383    producto    TABLE     �  CREATE TABLE public.producto (
    codigo_producto character varying(15) NOT NULL,
    nombre character varying(70) NOT NULL,
    gama character varying(50) NOT NULL,
    dimensiones character varying(25),
    proveedor character varying(50) DEFAULT NULL::character varying,
    descripcion text,
    cantidad_en_stock smallint NOT NULL,
    precio_venta numeric(15,2) NOT NULL,
    precio_proveedor numeric(15,2) DEFAULT NULL::numeric
);
    DROP TABLE public.producto;
       public         heap    postgres    false            *          0    33354    cliente 
   TABLE DATA           �   COPY public.cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito) FROM stdin;
    public          postgres    false    212   a4       -          0    33397    detalle_pedido 
   TABLE DATA           o   COPY public.detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea) FROM stdin;
    public          postgres    false    215   m<       (          0    33330    empleado 
   TABLE DATA           �   COPY public.empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto) FROM stdin;
    public          postgres    false    210   D       )          0    33347    gama_producto 
   TABLE DATA           Z   COPY public.gama_producto (gama, descripcion_texto, descripcion_html, imagen) FROM stdin;
    public          postgres    false    211   �G       '          0    33323    oficina 
   TABLE DATA           �   COPY public.oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2) FROM stdin;
    public          postgres    false    209   >H       .          0    33412    pago 
   TABLE DATA           ]   COPY public.pago (codigo_cliente, forma_pago, id_transaccion, fecha_pago, total) FROM stdin;
    public          postgres    false    216   sJ       +          0    33371    pedido 
   TABLE DATA           �   COPY public.pedido (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) FROM stdin;
    public          postgres    false    213   �K       ,          0    33383    producto 
   TABLE DATA           �   COPY public.producto (codigo_producto, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) FROM stdin;
    public          postgres    false    214   �T       �           2606    33365    cliente cliente_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (codigo_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    212            �           2606    33401 "   detalle_pedido detalle_pedido_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_pkey PRIMARY KEY (codigo_pedido, codigo_producto);
 L   ALTER TABLE ONLY public.detalle_pedido DROP CONSTRAINT detalle_pedido_pkey;
       public            postgres    false    215    215            �           2606    33336    empleado empleado_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (codigo_empleado);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    210            �           2606    33353     gama_producto gama_producto_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.gama_producto
    ADD CONSTRAINT gama_producto_pkey PRIMARY KEY (gama);
 J   ALTER TABLE ONLY public.gama_producto DROP CONSTRAINT gama_producto_pkey;
       public            postgres    false    211            �           2606    33329    oficina oficina_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.oficina
    ADD CONSTRAINT oficina_pkey PRIMARY KEY (codigo_oficina);
 >   ALTER TABLE ONLY public.oficina DROP CONSTRAINT oficina_pkey;
       public            postgres    false    209            �           2606    33416    pago pago_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (codigo_cliente, id_transaccion);
 8   ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_pkey;
       public            postgres    false    216    216            �           2606    33377    pedido pedido_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (codigo_pedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    213            �           2606    33391    producto producto_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (codigo_producto);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public            postgres    false    214            �           2606    33366 /   cliente cliente_codigo_empleado_rep_ventas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_codigo_empleado_rep_ventas_fkey FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES public.empleado(codigo_empleado);
 Y   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_codigo_empleado_rep_ventas_fkey;
       public          postgres    false    212    3207    210            �           2606    33402 0   detalle_pedido detalle_pedido_codigo_pedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_codigo_pedido_fkey FOREIGN KEY (codigo_pedido) REFERENCES public.pedido(codigo_pedido);
 Z   ALTER TABLE ONLY public.detalle_pedido DROP CONSTRAINT detalle_pedido_codigo_pedido_fkey;
       public          postgres    false    213    215    3213            �           2606    33407 2   detalle_pedido detalle_pedido_codigo_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_codigo_producto_fkey FOREIGN KEY (codigo_producto) REFERENCES public.producto(codigo_producto);
 \   ALTER TABLE ONLY public.detalle_pedido DROP CONSTRAINT detalle_pedido_codigo_producto_fkey;
       public          postgres    false    3215    214    215            �           2606    33342 "   empleado empleado_codigo_jefe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_codigo_jefe_fkey FOREIGN KEY (codigo_jefe) REFERENCES public.empleado(codigo_empleado);
 L   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_codigo_jefe_fkey;
       public          postgres    false    210    210    3207            �           2606    33337 %   empleado empleado_codigo_oficina_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_codigo_oficina_fkey FOREIGN KEY (codigo_oficina) REFERENCES public.oficina(codigo_oficina);
 O   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_codigo_oficina_fkey;
       public          postgres    false    209    210    3205            �           2606    33417    pago pago_codigo_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_codigo_cliente_fkey FOREIGN KEY (codigo_cliente) REFERENCES public.cliente(codigo_cliente);
 G   ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_codigo_cliente_fkey;
       public          postgres    false    216    212    3211            �           2606    33378 !   pedido pedido_codigo_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_codigo_cliente_fkey FOREIGN KEY (codigo_cliente) REFERENCES public.cliente(codigo_cliente);
 K   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_codigo_cliente_fkey;
       public          postgres    false    213    212    3211            �           2606    33392    producto producto_gama_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_gama_fkey FOREIGN KEY (gama) REFERENCES public.gama_producto(gama);
 E   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_gama_fkey;
       public          postgres    false    3209    214    211            *   �  x��W�r��]����IU�� K��+��15�J�lZd�lDk�&�6_�U��S������� HY��8��Ub�`���sϽ��3_�N]��g&�l�^��ي��0��.�4�����T��6X�r��O��laj~L�t����-&,�I�YZ2�$�Q���Gs��O��/�im�&um����7-A�2MD��/5��T�K�'���,?sf��T���$;��[y�[��p�-;�L�Z:8�H��,ط�x��C�Υ���͇�ѥB�R1<K�H�+[g�������^��L;�Sv�U�B ���� �Kz��iva�����!k}�|��L�B5Z�B���M���k���T�ѧ��+s�ʰ�Y�b�;�j�%�,UR�-g�6�ugعo,}��w��,rx�""քr�`N��]w���m͍~��,�*ش�9hw����+q�l���t���#әT�@(˴TB�;�i�s����?�|-��#t�.M��^�u<	[���z�n�jQfB� ��n��5�����coV�e~�Ӝ��������5mp���y؎��i�55@s�H��M�j}�O?��_Aj�T��X�_Tv�3ŕg׾�sze�f�3��"�I^�,`�Y��:T�IJ���'US��f�� <G#�|q��v
�4pW��g�@~����.I�σ�����x���qԶ$�~�<�'���L�ܮ��K�"�fIJ74��q8�L��xlYw�3� F���a]�\Kp��{U��2J�g��$p$.C��ݧ<�V�1� ��-�4P�Zid�+Q�9��K�_@*Q(�}ݤh�|>3��C��f���58���,�����L~E~�;����͟(�P"��yd�6Ԧ^T�T%+�"F�ܺ�h`���}�'��DS�14�؄��|mF|��b�/�x��X.[J?����t):I�5�ؼ2��Y`�K=�7�H��dQ#a�
mF?F=PE�3��@ps"�IӢ���M깄]D� t�uS��SSS��ZY	y�bo��Y�&[�Xnz1�a��nm���EL�g���EK	1��+-b~[�(Zr�Դ������{�@/�T~C�2�}�>�P䳔E�p��-*R�ީ��!�������`Zv�S f��S4D�26i����+w���u�N����@$*�D���Ӎ�Yt��P�Q{Lc{����c?�<9e�~�8"B6#��#J������m��P#+J(:��R�Ć�I��LdRD
ͨf�j��3��b��g</�<jA.E���J�S�>�+_?�����G��@Tȉ@�r���G0���P��f{y v6����˶k��'�Tva������C�B�9�j����W��k_{��^uԍM��͝�@-����0n���i}u����!��7��g������m|�����PA��׽^�3B����)2{n�	�-���H ��O8�I�`Z���M���u*��9
9Y�p�#\��B$�;�R2�֧C�>����`O�)��;l���8TT�Yp3�^S�Gក@g����AE����W�/���K�Q��b�D�b'�c�!�E5r[��/3�~�|JY�dCs`�{>w�@B�� 1l�%�]f�K�$��^��Wy�~Cy����]�-I����w��w�B�n%
�����U�W|BS+�6U8��ۨ�D&E�B?O����'t�m��`ٜ&n�^Y�|����9-*^O?J���{���桃&�9^u��	���9��k�8�qP1}�IG�B�L5.[���<e��=�}?l��G/EJ���"��Q-V5�{�uf���/��&TꦂS�a��!��&��ȊN9%ݤ_���LB�}{8�jP8t��<��f.�T��WK#�[��7h�X�ْ� ��J]�R����j�Y�twF����_�oߡ����X�SZ��N��˂z�0$�U8�vKc6E��b�����R��A�'k��rͧ���t��x�%G�_�6�K�E�����ŋ���      -   �  x�m�=�d)�m�.3���\g܍h{���P���zf}� !���%���5f��f��s�/I����2S˩�&�tG�QQ$=�6֜�JMr>�b�TS9� ]--S��[?�r�H�S��9�;II�S�j��?`��6��9�[UϊKG�#�o��Z|�F�����HMU-�W �����V*M=�{h�j�u�RN���[J�6�0�D�㤒��F��@3U�fv�������n��%�d��@:N��#�ńd�N����Y�R��Vj�(��������N�l��tD[�׳#��ق���58�W��_KDx�wY���P�q�C���1�N(-P�Q��0�+<Я���t����5����ٛ�R��x�y��B��8p`VrML3J�*W;���q����t�{_3��k�v��l�%�g�c.�Ef�N��ǠE���a�b菅�n��H��P��7vC6P��O���������NC�;�D�:��m=�[�/��VM ?bz����}�~G]���qP�kB���'��4Q��И&a�v��g���:��)	1n�q\�At�Mg1�ˊ�b��?��D�teB�;�:W��j7Yi؉(KА/Ev�K�L�L�P���n����ae�ޤҬ�7>[!���B��-�u�!"tp�ݖ������BP7�K�nVO�8rdU}�)��>�T�L�,�`�r��Y�q\��:���њ��{�!	�Ҥ�l�u8mӢ�ʪff¼��o��~�	8�����M�+���8pQ�tm,��a6�@|��s��w.�X���� �Ƥb��w2M�
�%N=jI�b��
� kk�[Л1s�&h]��ɼCO��]Yvh�܊z��|�z1I����hw�x	At�O�����~ՃLk��^=�清_�]_�@���ָ���� ��#6�2�~c%*���
1k�¯����+T�$�*Q��+(촚��;�;}g�����	�J*V��m���h��$ʏ~�n
2���4)�mEϒ�+%�<�ݟ_��A�h�rg8#��{G�ဃ�Q_=3R#�$����BM��U�.J}��6��L��鄢���R���/���
(q� :q�3��x˸Y��F���}�. ��������gz��8�AT��@��ɺO?_����En��:�[� �"_v�f��[Ӎ#�+j4`=�HpY <�>>�����O�UHO��s�h���d��DͼR�n+<���j?�2VB���H0��s�=�(��l�������ʠ-�mƵ��f�����Lo�繢��צv�^�4�/Fw�W�6x��gl`꜊�̇3*7r'��z�2��=y.���S�iVY�DZ�)�a�qs���ф��&��]��`M�ʼ���{�U��Ia}�p�����s��wb+�18&}m�ϵ,�y@k�++���z&Q^v4�p!�GJ}�-Ԡ^�Vʹ��X����͈]⦭�l</�y����ŏrv�Y@*j�l�𨎤�F?$�|�Z߮���掖rw���z�D#``z���T'Z\�D�,T���+Ly��ۥi�i�!E��J4��(���'Ul����;��W�z�ؑ�_a6�n\�"��&�����[�@*�Հ��v��9^7�=r�i�N��>��{)��;RnWg���=XC:�{���ܡ�ƸK���u�ا^��Ť&���b�A�*wS�jb�0�
l�mW�R�c3P{�7����
�6�*VBu�;J��-�Nik��\ũ��\���B��T�`����|ٻ��q߯\�mi>#Ygܸ���|Ȑàh�Dp����	ލ�k����N��>E�Uh�^�Oq���-�E�T��K$�h��C@'ԛ%/���KAѲ'�{��9Z����F~`��������x`�o&�`�ȃ�"&�<�(�`����n��|��<�Y��,Ov�';˃7��_�߯�����      (   X  x����r�0�ׇ����.ޅ$�B!I;��FY����y�.���x���q�2b:t�9�s>��&�T[<Vl���7���^ҥ�|s�af!7�]pK��Q���>��F���4�p�e�Ҵ�sE��� �{���$d���hV�5q[��U#���s�k�iD�53��T�u�Y��ÿ��ʙm�N03-��-�L�^�L���D�@���܅6�4�R�8M�e�h�sQAbZ��C"����	Q9�uhX0�D^-��^�8I*�cܦT;�Y�.pU͆"�ebHL}%{׿�p/�,E*k���AL��¤`�R�k���KKhT�BC`��,Ӧ���wUeZ�Ϣ�譐�ѕ�+ב��*�^��8��Y�T���z���G����z|��AHCm��0��a9nxS���2Mh�M~��yƄ��	1~�8�=��1�1�\�G[��/�$0��M���� �4��TK�RZ%I/�岴.W�q���HuFw�ik0�ְC#��7f摡x���Q���x��.�Xa`T+Wì3�DaQD�fPv�e���혲yi�f���ì��0�L��4g���͇ʭ���m[�}��r� C�WfxX��8ĮU)mwڴ~z�A�&�Sjà�x���7+ە�	D�ŅH�`�a����"sAc�����z�(&�j��~r��ys�ݰ��)k��?"<q+�m�g�5�Y��6媴�du��}�}�V�*��	���#�h2n=�z3s�o�0p�/���$a�j������z��r��B�<1�
����-�P�qV�[~Q�����M����0z�ϫ���������S���_<~$x�E�̻Q�u�t�e[g�G�t�h4~dH"      )   �   x�M�A� E��s��ƸR���Ch���0��	�M����?��IԄ��9�	#���iLv.���u&-Ui�4.�aH6pA����W�(<�w�z�w��:ɔ�Q��K.��(9V� l�f�E�rW�8� ���g�-�õO���f�l	��R�Ze      '   %  x�M�Mn�0���t��
�"-yI�v�����@7���b@II}���.����� K��`��8ʗ���Ԯ!�������}a�C�H$LԀ�L�~0��ǖ���&$M[Rm|�0ޔ�F�"�F��\��nLp��G�fI�,
�Rs���5���v9�|��w3�����f_Sg�/&&�X"���)Q0L�4LrPWu�#�¢��t�ͻ��pZ;磅�Ty[��9��%✝c���Y
��6��B��:\{k:Dk���X��-L=5�}�1U��aX�\b*��IC���\{����tsCMQ1͟�
j�<�-�Y0�0����� �	>D��^8c� g�װg���1���c՘#��<�a9��9,������A(�b�
�1�xm�����{�v�AD[=?�m���S���pc컷�S�ٺ�xN��@ ���U��A��[F���zo�Aտ�xo[��̯P�u�s�]��5l�����?�i ?أ�(��AęJ���8n!$*�Ș��:[D?�FQ�hmؚ      .   :  x����N�0��λ����ϼ@�DU�-���6���F9X���xf�n?��O7}������# G]�`@��NҚd�d��G(3�����/2�LQAo�Q����T�pM��r?��F���g%�{<N���|����fCM+Vg�lN������y��BɃsU�-K\żLUZ!�oз,��мZ�h��cl�
��K�&ʫ�o�clZw�sn�2���:@LJ��@��T��H�x�n kT(�̢d�x��=����nr/�Z���a�����К��0S̀M�w0����O�a~V���      +   	  x��Y���F�[O���Y�J?�}�q7نa;ܤF���B�K���f~�Μ�����%�׋���`�-U��"?~d��̲�6�bO⑋w�yЏ�1�o�����S̸+�/�oEv+s$Vl��*��C�u�6��zL�v&���2�;n� ��X��~��V����Y{j�׃nڳI�iޡ�eG�����
w�F�Mfh�P&�@���8���"�K��.N��B�`�j����Y��Y��ǯ�y�������IG8�N������ƌ郪�ӠƝH�	�VJ�$�����i���5��o��ݍ���&}�7�����f���F��a�����S'�{G�C=��I��/%�M���!�v0�Z7f�������i�?L�t
��x�a��9���d�^T�ʲw�R�����@~V]G�J�AUN$U��n�����=�$��>��ԣ�t3.@W��JGEK����Y�0;l*�Z�<=�Q������H�1l߰Z♢+�P1���i�[Ky�d��\e6�*��.���s��|y"��)�����k����"J�S�h�d;���}AI��,����"���9�$��Ҁ1���Qu`82���J�h�ݍ���V-�jsc{,�u�gC5�fC;�'5"84�P��=) \
"��SO�r�<�	zQ&�!mս>��y0�-4�g,nH!D�&��ޫ�^A������\��=�o>�r����7��c!<_~� k��v�#��:�h�6��o�"�<ə�b�NP���M{ ׇ�T,ܐ�eڴp�P�mx"0͞x��0�g��U7,�ӧi4�K��EV��w�:��<�`������X_�7s
���O"'�E5�]�3np1[�w8��7}��$_U5�~��e�r0e<��U�͞;���W�-�I~���,c��5EƟ�9�'��5��J�"����d"�����)�@�� 
���<)����N�5a��'�sGq�׸��5��2����k�G칸�b>�x������;�x��"ѿ].�0��qv�bi�dF��UR���t���<�x��H��/"@W��wӽ񀌩��(���°�Њ2[��/N�/��cYnb
���\��u8�!�#[G�ߙ����\~|n;�O�O��87Y�P|o�W���p�b���
�F�϶n�����������9'�X�`��N���P��6B�p�؏��s��-ٷg�{V�Wj�۰���e��[2fW�v�.?�Ұ��I9�"`��bv�*�\ᱝ#����a�%!-#�e,m��~��'#�@�No���428��2m7�hs������\�ȅ �*f��sF�֜�%6.�39q�(龏:BX}�0_���WE���#���W�o?���Wԣ�v;\/�=X�ZL��L��t0�_����<�����x��!M��D��CT���@�dOI�ڛmw\L(��d������̍�cZkҒ^��,�N69~�Q�8ؘ�t汭��@-��8��s�,��ioO���g�v�C��ڻ{���Z�5xV����o���&���!��&�qj{ /ڏPp1���$�m��D�<�� �{h��{m�呋�c��5��IK�(���}� �Jrn�,�$���m-r�ҋ�{s�j���{��0��qU�3%�6:@8�|�pS���}H�29��!�����60�^?��Z]~i���0P��bp������!~��F*������5�*%u{Q�Avmcjs���u�� y\�U�h����[o��(�l4z+1}�B�k�@~y���2�Zw��^�
���
v /�[ 
>���19WDfL����l���n���an��5��N���ZAR�=��B��'g��8FUE}`h�
j�1�1��٦���-��e��%W��2�}����Gz�xĒ� �W�ȶ���O.4����<�?2���jlBe7ddw�	V�fThU8�� �:�b���	�Q���Z�."o�4A��M�[���+�ζ=!*u��n��r�2k>����A���F)�M��]t�E(��b����g�҇re'.ƚ�a���x��5'��Ea~fv�YM�<��&hY��I��{Qw.���W���}��"Ъ���q��?���*6ÔtE��;���!����F��e��8Mio�v@n�"@ ��y��7EC��2��[`p�k��NS�ڏ�v�,�G˟fX�"��p�%�~�at�R�D>=��K`S�6�¦|	lʗ�&�A�&�%Z|,��"|L�qTO10�߾I���l�      ,      x��}K��H���+��I�w59�v�*���tW��	���(RŇ���}��;�����Q����'����N)�z�Үn��l4��L�0"�wN�W����`d]�*��𔸈<)������~7�U���j7�����_����=�WQ$ֳX��L��<�(�Fa�O3%�2�Y c���W7·B�f��[����Ћ��_G�\������D�Q"�Y���8���4�y�	��'J4���x�^�T�'��](�i@��jJmHLA��z���h����2z`K/j���� �UB�h �q��?�LK"�J��\�5�TE�����I�%Έ���bA�z4q=+7�4O&�nԜ��	=|��e�B�40.���7R/<i��TE�^АZb�)�=�ȉ��[��4rw��<3�'���������a"����������DϤX]z˒7�|ũ��-��Yv��n[�M���c�;}�B�
"���"|�' ]�5%fa ��� XFt���kZ�	�*�Yű
��x����B�L��/!�M���g�*�|!]Oy�7��g]�$�� `�}K�\�7�a7���y<���X	zU�L4�ی�~�3��
�������{1�n����[��@I���2���F�^�d�z���^�N�c���[�Ѥ���KzϢp꧙���u�-Qz��h��s����-�9��
�����Z<Ո̄G���R��X����"O̢I��'~� 8ġ�@m�9�w��Fз�7�l�۶5��uS���>�1CzM�m�g1�Q\)I�E�b���s㚀岖ʈE��N��cŉ3��C�|1�H@/$�%��_^{��$Z0˦��л�K�Ő�ň�L.!��#��!=b��"�մPs�����U�Nb�'K��@�9�qd
�WH�C_~-���Q���؟��kR��a�&pAMe��RK]��ow�rI��TT�ʊk������XYҝb�ib���gz/�*qGx-��[�T�Q��ǄPh�H��6_�f��Uh�x�|K��Z�7!asSe��[� l��OY�-�L��v	hb]�.�?�N�&X����τ"p�F}%�~|,a�W$`�ٜEs��0��)4re������㑽"Q!G�
����L�M�f%�9f�_���֩����/Ӑ=���'1e�$l�-K9m��H�]�	�x�fr�ѓ>��ŋ֛��/d����u�P�G�X�a6'SA?�/�[��:#���+/�x��� 8^e����$�4>b���isJ�9�o����2�;�k(E-0�D������C""x�؂� }��I�,4��`I��R� ���� �D�;�U%}ª"%	c�5��X`�g!Y�44X��d�h���D�'��h���j�fʄJ���n�Ka6V�V�.�C�� �u!�m9%F�Aa��B�0a�ޙ��o��.�V��3�#I��<BbAB�AX�p'<���O)�Q��T��M��<��ĒL. ̰�!�3ri�!�ļ�L!ʓ@��)��NL�u���9$3 ��-+��H�'��{��.�ᄔ�@��2�q�V�hf~'��x��[�V	ce.K̚�����aDQ"�}���\AC�f»K6��Ԉ&K暔�O9#�LjS(���Ψ��!�D�6�P�`9b�X����8F�8�d03hz5���E�4���єILOr��S�D!�8�B$	ĎOk��@}�NCR0��J �0��Elp� o֬�7:?�ڄ�҅6�w)x�M(�И�Ron6��w^12�(e+���, ��؟K�{'�{��0�lIc/��z��+cs:�4pYL�a)�����&C(ߌ����כac�6�ޤ��;�������Q���)���z-��ڐ��n�C���aK\d
[�y�-�G�B�!m~K�Ms�2(�uA5f�6俱PEځ�������φ�͂i&�����4օ����������'v��1K㪑Ш��D�ьr-�+�PG:?Φ��!���k�\��yF>{z�MIM*���}�>8)�IG��f��7^*�]����ڽ��k��YӴh���=,\+�~��n���Li%!���׬�U�F_M�$���Pol��%�n�ͱYkJ�¿��K2(d"���F��أks�O�	m�>�G���'	���r��{|d�,)lr!�!��T;'5	�����E��-e|��7R���%[ek���B�����F��Q���Iπ�@(�`Lj���&��`������S	��CxqHN0N��3� G�E����ݠXW2X���7w�������h��l�x�%�q\���Ik< 
o@[�@���_��t���T�Z��],�M����i��}������0dO��@V[���H�ece`9�;��'K�)�Q�~�M���1���#�������t��v�߸Z�f�sڝN��(y���+m��=��Y�W�Y�*V�(t�j�����rH���I�����	��J��<G�o��g��kǏ����I%7�pŜ
LT�$�S� ��<2"����8������)Ҧ6��1�ae%���l����g��b��S��@#נ)�58�����[�w��#\���
����s�E�C:0�ό5��Oo�X����G�����)d����Ҵ�v
�g@@�ר�Ch\� ���f�&څS���ODB�(i���ڛy"뀶Kx&o��=�?c�Xʍe
uL�_�~g�#'��U�pk�f���3Je5����f�m>��U؀�A,��~f��Mb?f�ϟ4/坖��V')uI�������x�H%fvm$=�䡘t<�8�,xy���%Uc�l�q�iT����B�!D3�R��o�1D�����<���1�s� %;��"��	d0�v��Q�\�g��'�LU"�Q+�Z��L^��_�k���R�?]��m���2:��k�{Kdo��-rO/��u���X�g,NV�����W�߲���M��_Д-aW����� {�bǶN��#W���(�kj{Ȭ~�'Q����Z�P۵2pe�ָa���q�����&��DLZ1*P:O�EMg&�LX�h�!���Uʚ�(-H<�x�}kN�kU2"˪/��P#g��1m��4��8��9���u�	/bqħ.-����9Ҷ�H�p`m�8o���*� ����G8���Z$́y�� �], i�l���e�������k\7Hora�ꨦ�v����9i&4+�f��QF^qT�҈�r���'%7�"V�zd��h���n9�v��/�Q��9�h~��2"�WL�یu�n����'GX�g�h���	���a���<���yu$�Lu�r�{5�y-H�h/�W王�Nx�ň��Ć��z�\DÒ���$o3�$
	�Oҋ?��$VwNb�F)��q"[��i�f�σ�2�}X`��P~YRMR��)�)__<WN�c�6�\C�?ϡ��t1���y7�U�Q/R����M�h��,�'����f�Aم�s����#K�^U�*��ZQ~����B?��e�d�e�/�ǐ9}�h�#���_H�}��� I��=L�?I�t��q�d���[q&���c��l�~�����h�<C,ɳ:c~��#���2'��q̌� {�:�QL��fO�-	�٣&/Q(���EH|�E�-�1xBK 9� ��fS>':�SM%)�.t!��o��sZfD���Й/��iR*ڊӸ4+�Gv��m��sh�2�|�hƦ�"�dJE�e#7�3zs�|"9�b�,e�gX��"��8S�B1=d��u�`�ǩ�mE���I=OZ���\���HBr��O�%��K(d�d�b�µǝ�8�ۏl�r���vH�Y+�� ;��5�k�8�Ψ�qo����~�ȟ+�m�[��*���&��_�KY�(���"��E��ಘj�lIs�<��3�=DK|��ނg�F�:Ni�7�ջ��H`�ɍ�{&�e�H�5��D�=�Ahp@�a�f    2Ю�ە���q�>&����օn��R���ȍ�20��2�s�f^Q+���=������CT��#�T�ݚ�H��Br�TW��]c=( ��AT�w�"���������A�����G�>K��ߧ�_���a{��u�u����qM{���a�8�wصe*�`�y�]�C�4���H
#]�F�)�p#U�>T:����/�"�ΕI��!��~��Sԅ�*$�@��&a~-�C�i��a�!�~��9��c?��9���"T|�Ȓ�lfs�? �@�Ff����/�Eᚾ<Ȟ�iU
�:�(Y�,(�ivD)����"[HE���A��~�Y$�T��=:8�v�Ib��F.嫟��.i>Tv�Bk��T1d�6�A��P׫k59�%��Â��G��[��E�����X��lw.P��E�p0��>M���*��4/�7�20�qF*�9%!�y���˰#�z��R�"�xj����H=�J�-
�y�<�GR>Ȳ�P��t��V�V��>AΦr"���▮�_D� �{:�[Ұ׌a��n������k�Wh��*�(cy˓Ŝ��XN�/���8X%}�SI5���HB���i-y�7�C&	���&�]X��B��?���$�^��ո�+��M{Ю�D�%j-�Eh������׵N���d5�~�ߙ��D��l6�z׫���l-QL�J>�W.�\K����|JYn��.��@g���N�	��� K֞;�ςA&��E�(%l�̶)�����F[m�ز�t������A.=�4;���G&+�(��P���@��k�T�;9���V�-jN%���z=���E��V3�n|�����AS,�P��zN0�y�e���������+��̯aT��nU�(�-i��d��r� �FW�.��Y��"X��
��Tث����i~��sD��Ȕ�ܩ��lt�oZ�/��g��������˻It���a�4F$8�&�c�@�8'��6	hk��P{Œ�c�7����_��F�����hI��uG�{Uw���>R��5������;��V�����h��w7�"�3j�h�`�>��ơDA�f�>�hg:��q��[Z	7�X��Ղ�g�̱���j���ul�l��~|���jL#�Qsm޷Kp�0�(.ʂ˒/L�)�Ɗ[R	>�l����iB��������Aʷ�4����`�9I}P9?�l�JħA�p�L��0�U�c�m�!�E�k5�7F��3���UL|��l�G�������w�Y_��@�aA����Ts o���JՇ�б.��}�c�%�e�lWR:]kL$��OȮ��O䆠��p�������TΗ���Db��V���.|�w��3fu��=�W8�\c_��AI�tk)�\��X�4�k����z�4E�y�#�Ey2�[��I�ے ���ӼV��Ӻ��V�ٙN�_�u >�aU$Y�*y�3֯[�\L��S�
�Σ��)�kN}v��W8�]�6^3�c��:���q����NO|4M�d&!r�:kYg�1A���fW�Ԋ�y��{����\�YH��\���!����o?�h�2ɒ�:Ld|���'ُ�����{dl�|L DѸ��|"K����&e� $�b�\ѳ���VD�oP���^6��%(��f}J�/Ԕ;+�s"�;A���'�w4E���gVg��������KQ��N��g��Ls�-f�,��ȹ�l]s��ʂ�[�()hN�q��i>�s �vy����l���/B���&��s�(�vq�I{hk~m�6�7�Z��
����$/�gఓ�$G�]ּh��9�/H爐�r���,�G9�_�E�Mﷆs���;Ep�Ϊ�ь�x4c��g�8�y�'��<���y��|}����%G����"/�AW�e�^�%���ݞ��H��3�r|��ʲ�d��01){���sIZ,�ӧ���^��B�� �8l�EJ���ywP��K��;�
>%�3������u��#�-�D��A��I��ǯc�X�\���O��c	�h��Mϣ С������/��f5]�*��(��+��t�1�ּ��e���;�J�m�:Vi��݆�������F8kN�ڴ�`�&�H�"�[��8/
�"�Z���4�����©>[�g�̤�ǺyH�,]n��-��I�;�H���z�n=4��R�F���+�Պ6�����(f�.�b?�dk�5��t�):��?����l�O��u<�������:�c�㈮�wי3�ԃ���qA߳��M�;�=�MKtsd�~�_P�r�^&b��5��=��d��]\���-J�C�V�G���G��1��r��xq���bҧ��'7$F+��^����7^C�k
*u7~�.Z���p]��c���:��M�?w�5-�s��b�\��w�p09h��0��L��$�k�wQѵ�������W����Kd0��I ȝh��y��H�<C�,��]ip����.0�*����zi&��y��̜k���C�`p�"QHv�qX��}��I���D �
 >�wj�8�8�a0��a}6���1��s�a(8y�J�m��g!�]�2����Q(y���(s�G7�cW'v[p���I˴h���֭�d����ࡉy����3�p��� �ذ�݌��iӸ8��0g!�7S8P�(��|T��1����d���Q��f_�V
��,��g8J:��\�"���^q�Is�6�KsgCn��T����n�����K��`�7�K���0}H~m��;p�%�n ��FU�r
˿r^u��v�v� �$Tz��Væ�M�)`c⨵ک�s���9oΈ~<�=?:+�/P�������R�StlI����j<_�Q,../#G#d.���WH�@�9��q}U�wKm�d�����#������q��q�t������k�8i/M��SN��M@0N"� DJ����yaz��|�^=O��Y��p�h�d�U��<s�0���: ���W�Z\�V��O���=��Y����J�D7@�����Z�3��b�-��h.v���H-z����F8�=F���9��p���6��Qs1"�G���8�q�g���X3��	,f����_}��A��c��]˔�,T����2�����$<U����5�=;�D��a���Z����5�5�}��	�{q����Y`��Ӓ�|��h;�=�|(��[���:��q����͹P�����4Iݟ����F�m�)_Ώ��9�yq��E���������g�Î�!�i�ā�1"�z[���ˮ�b�>���W�̚�7��^8 S����V��r��Wί����I?�m��ɡ?�U���ϟ?�Ț������7��Y/��&�Q&��r�qy��v���@!(�h�Uܤ�[���ξ�ԯW�눆M��tr�`Ʌoy�@dq)^��Uh�|݆����ɒ��1�3h7�<����%���b7�o���6�7�{p�C���5nn��v&Q{舍'N��9!��uC�!��m��������9��X��}n@"�>��Oߩ��u&�}ڀ?eN����&��Ll69[oms�9.8֙E֗�iGq�E�G����?,2C�U"�]�R����]=]u���sH�3�\R7
�F7����Q:Z���M��q0Q��-?b�ڥ|���+���S��T�Ӯ�+���I�-�����TiL�/�Q��G�8X�o��:7;�����^ig޷�2��5���U�~���eT��=���U�^�3�H�M���k��u��t��1O}L�o���=B�;"C�f�c/���GP����6���n�X�'�$�j�xB�_�I�����6�!)�f���	�n�P�M���&t���~w�ڀ��\C�s�2��+�~o�l��P���9Cy�����2;.5�k,�X޾`�?؆2�v5�k(�P�\1�nCy�ȩ��ʟ=���@��W�G[Pvڏ�^�ʟ;�G�8ʃR�gϩ��yl�����E�K��u���^��8�+W�[�Kw���/x�*n�w*;J\��d���dPC��>�Aw��P��$���    ��k��$��F$8�ZC�K�D%L9��)kH|)����Ewɣ�˺�_����[����J&��o��axȤ�qX��W�aŎZg�\7� �@��<ͪ�8L;$N�O�l�}����S���:���'x�q�uLY�.�6���y���A�C����Ka�� �~p��8��e��b^m��r��h�Ǩ� vʵ��qޜG�+1�Z>T"qȉ��`�(W��R�x�a�#ȝ?L�X��$�_�[��ɼa����a{�
9��*�V!��
��]C{�]5k�*8�8{Cg8{5k�*8�x���rEI����@V�A�]>�]	s�'����9�a���z멗�WZ�����
������[�,��6d��j�|��)��� ��:�s>��3��v�i��[Lǜ�q�b=dFa��	F�3fW�F��B���5��ʟQH�4@��׼����M���h�bZb����H�rͣ��p ���s��%.q��-���ޞ����[��h��&
t�U���Yǚ�Z�r���W����\$B����B��X�ޥ��%Ni�Ŗ�1�V���p�I4;O�M�<�(/Q��A���p�C�D�j��%��� ́�U�/4��h�.��]\u�䟙+����Ek��uc��ec�mWrd�BƁ�]���+2*���q-��]��	�	Jl�"F�=����`��Y�Ȫ���uW3�Z5�6�U�G�}к��b�Z�Ъ�����ǥt�)4'�����(¯��4�,⋢Y�\^�.���@7��48�#m&]�'0��8V\q��4:��X���^�M�H�T���^d�H6<9���n��P�h�{��2������=�u(:��,VU���,֡���Xe����n�y�'��q.]ܥ�+7dB��nAŕ����,Z�JS�|�s���f-N��W�O�≒�D�V��7m����+��J}��~�%^��o@C�4�2�Z��]s�B���k�\��@�Y>I>����e���k�˜1O��K�Y~-ƴF1�}h��=:����x�2q��`�K|��E��I�kD
n��	�āR�v��l��H�H���$��E��r�M�+[���A�4�(�pI;\HfŘ!�5^�3\vqi8s��T�#͆�\O�cT�����9��B c.o6�<�ް�h&T,�[�EM�/��������|��D��$&u�3��l�H���6�Qs?�� / z��g$9��F&��g�p������l[�Y�d4�("����=�T��_MV/5I�Di)[���n���XՎn�����X��6sM�EsW�Ww0����3���qI�<����ƑK�+�`�D�SeL ��@؎-!]J�c�;э1J�1��~�ͤ�Z��ؽn����5j���Vz��J��#Z@F�qjdB�+��E�g�Ё:�����8��P�$<>D�H"�(�u����S�R?�r�9X���L��pqAQn鳌|�L���ѽ|ʕNK5%5�@\�<��� m���"¥3q�v�4d�d+�o���s��j��;T~�M[��*�X��Ľz�s-(��|���9 (I!)i:�Ӡ��ZR~�����:�Ģҭ��	�I����s--����R��^UZN��E4[FX��$C��ZX�a�a�����Aċk+��/[T��ʠ*+��?��q�+��v.��l0m0�z����ː��3��>���#�lW�l����<������G�:��?�i6Al�ȍ�����r>�Ӎ|�K��'���I
�=�|o�z������_4'B0}zhf�9b�}׈�S�'�Xg���I���1�A#C_>�B$���Dn��c�&.����㙷�I�c�.�̜Fy����'��[��L���x��%L�g=���6��1ơ��:�݆�"�^wmn�b����_׀C-ȫ5�4�EGu~�7�_�{���v�W�'-L���o��#�Lf11�E�����fѴ�h>�U�Ҷ��u=�}�[����<���.������ѐ�P)�gt4�z�fgg����?�c���
�u6����㊓�e��ΐàfv�:�u�i��n�l�+�i�/�_�ϟ?9ݜ���en�geg��=�c'�����+��(n��Ϟ??�<��/����2�HA�4�zU���ͩ�4���r���ﾙ���w��^u�B��S��G�M�����{��ߢ=�|���E؛������:�Q]��u��j|&^]�^�����$��
_��)h�wm�4��,�M�%m�qE��V
s��!>�%�EIi��>6�@�c����Fƞ���׆Ds�B:�=ݶ����/T|M�tA���nrcU o��r������ж.��L��:fǺ"}K�N|+����*C�	s�^�mJK�c��s�y)��gE��UEs܉�X5R��-:�t�;H?������xrz������������ͺC���l*�K�J�kXl��W��G���ҿa��p��+�܋��vڴ=�ý�O�8����S{{��mڣ�Ҿ��L�.V���A��C�됭����c�س��!:"��V��8i�u��R��>[�s���C�ܑ5`�^��������WpԐ�y�D��5v_��7�^�E��I!�+Y�m%v����{M�"Q�i��}E?2�g��3 �y��#�L|�I����-�#h�ްA�2[(\IZMddue�}��$!]�ˁf;5Dg��G0�߱Nh�2X���8e�XAr|ʓv�-�$;�-�i�������#���Te�����5��u��2�]��?�(F||-���$��n�.�p��=?��]!��e�2�x8�e���T�z����8%}�Y\H������j����Vc`���1pJ4%��~g� ��/1�X��\�`rAߞ{w�ί5��u���B�}�\���rA�9~/j�E��I�&���Su����7�+Z�7ⱜ�:�DnN�e��H�`d]�d"y�QU��zr�W�f���B:��>8D��Jo{�C�� ��a�б^)��W�u��2�N��G��k������,!dI���I�����|�%��r>Y�M���*hsg0h�x�P�2̷OU:��Efp�̾�юU��/�34gwi���u1#�C���62�U�<��������w��;��	c��lң}s+���Pr� ;G�g���W
�]Kk�)���U*T�L��8�.ʽ��+L�x���o�([�yhYd�a��A����_=U*�éxd�|-�U�|I,Q�GGY2���-����0!"�wЎ�H�°Dr3�1���įТ�z<�X��5�9o#� �?�A
�C	�%´K�|%H��N�)�~�{*��Fޚ
�}(q�;V�	Ҥ>/���iw�o���Z%�J�g���Hh�?}^�U7�٠;@�����W��a']r1ۈ�;��
�^���GQ���ͻe�PS��M��3���.��P�#k�3�,f�
ɦ9�t�L���B��8��dm?V��`ե�2���ڝ� ɝz����]��� Ƀܽ��S�
����OpuǏ$A&��e"��N�k9&�8(����M��$w��D�ϻ�Sގ�EpeF���w{Dl'�m�����ν� Z�G�~N�|�m-�-L�Ya�
b�C�l^��)n�h��PZ����Νʪv j���M�˱G��xh�Zuhj�n��FH���N�q�P��`�c�6�1���U��qR���W��0��8����G_]��ͷe�����oS]9�;�����a+��.r�qR�.�'=�f~��5T���(���<�J�}�Hr}&��nm'�;7S��4�[ڧ��t����,U�K��h�/OO���;fPqTRD�wK��*�Ή�������E�:��W<�Kޱ��[���T�(Ȫ"�cm�7F�2q:�AbÃ��0���;֓X���cA���b;�+{�F#&�=H�G�-Duz���L"���؈���>;}2m'������>M������3�')�
(�����*����i>QhcL#<z7�Ert   Ƀ6��Ի��5�τ��UD�����N���X�wױ.gr1#�=}㪠�����{��v����n�k��&[�s�k]ɉ�9��.!ۇ�u7?���O琭���.�(:���StY��z;7��)�;8����cu�,�����Z?Ȅ\��e�2)y����fo��;:�����҇!�����ߪ��`'�v*�^u�������$�f�u���v!��k~t�G�>���t|�x�j�ڤ B�o�����l}*�>�;<ƪK+�?�n��������     