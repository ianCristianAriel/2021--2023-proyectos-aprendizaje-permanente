PGDMP     (                    {         
   transporte    14.6    14.6 Y    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16420 
   transporte    DATABASE     j   CREATE DATABASE transporte WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE transporte;
                postgres    false                        3079    24798    dblink 	   EXTENSION     :   CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;
    DROP EXTENSION dblink;
                   false            �           0    0    EXTENSION dblink    COMMENT     _   COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';
                        false    2                        3079    24855    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                   false            �           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                        false    3                        3079    24876    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                   false            �           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    4                       1255    24713    primer_pl()    FUNCTION     �  CREATE FUNCTION public.primer_pl() RETURNS integer
    LANGUAGE plpgsql
    AS $$

declare
rec record;
contador integer:= 0;

begin
	raise notice 'Se imprimiran los nombre de los pasajeros: ';
	for rec in select * from pasajeros loop
		raise notice 'Pasajero n°%, Nombre: %', rec.id, rec.nombre;
		contador := contador + 1;
		end loop; 
	raise notice 'Conteo es: %', contador;
	return contador;
end

$$;
 "   DROP FUNCTION public.primer_pl();
       public          postgres    false                       1255    24735    segundo_pl()    FUNCTION     C  CREATE FUNCTION public.segundo_pl() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare

rec record;
contador integer:= 0;

begin
	for rec in select * from public.pasajeros loop
		contador := contador + 1;
		end loop; 
	insert into consultas_fecha (total, fecha_consulta) values (contador, now());
	return new;
end

$$;
 #   DROP FUNCTION public.segundo_pl();
       public          postgres    false            �            1259    24630    bitacora_viajes    TABLE     �   CREATE TABLE public.bitacora_viajes (
    id integer NOT NULL,
    id_viaje integer NOT NULL,
    fecha date NOT NULL
)
PARTITION BY RANGE (fecha);
 #   DROP TABLE public.bitacora_viajes;
       public            postgres    false            �           0    0    TABLE bitacora_viajes    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.bitacora_viajes TO usuario_consultas2;
GRANT SELECT,INSERT,DELETE,TRIGGER,UPDATE ON TABLE public.bitacora_viajes TO usuario_consulta;
          public          postgres    false    223            �            1259    24629    bitacora_viajes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacora_viajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.bitacora_viajes_id_seq;
       public          postgres    false    223            �           0    0    bitacora_viajes_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.bitacora_viajes_id_seq OWNED BY public.bitacora_viajes.id;
          public          postgres    false    222            �            1259    24650    bitacora_viajes201510    TABLE     �   CREATE TABLE public.bitacora_viajes201510 (
    id integer DEFAULT nextval('public.bitacora_viajes_id_seq'::regclass) NOT NULL,
    id_viaje integer NOT NULL,
    fecha date NOT NULL
);
 )   DROP TABLE public.bitacora_viajes201510;
       public         heap    postgres    false    222    223            �           0    0    TABLE bitacora_viajes201510    ACL     e   GRANT SELECT,INSERT,DELETE,TRIGGER,UPDATE ON TABLE public.bitacora_viajes201510 TO usuario_consulta;
          public          postgres    false    225            �            1259    24646    bitacora_viajes202010    TABLE     �   CREATE TABLE public.bitacora_viajes202010 (
    id integer DEFAULT nextval('public.bitacora_viajes_id_seq'::regclass) NOT NULL,
    id_viaje integer NOT NULL,
    fecha date NOT NULL
);
 )   DROP TABLE public.bitacora_viajes202010;
       public         heap    postgres    false    222    223            �           0    0    TABLE bitacora_viajes202010    ACL     e   GRANT SELECT,INSERT,DELETE,TRIGGER,UPDATE ON TABLE public.bitacora_viajes202010 TO usuario_consulta;
          public          postgres    false    224            �            1259    24715    consultas_fecha    TABLE     �   CREATE TABLE public.consultas_fecha (
    id integer NOT NULL,
    total integer,
    fecha_consulta timestamp with time zone
);
 #   DROP TABLE public.consultas_fecha;
       public         heap    postgres    false            �           0    0    TABLE consultas_fecha    ACL     _   GRANT SELECT,INSERT,DELETE,TRIGGER,UPDATE ON TABLE public.consultas_fecha TO usuario_consulta;
          public          postgres    false    229            �            1259    24714    consultas_fecha_id_seq    SEQUENCE     �   CREATE SEQUENCE public.consultas_fecha_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.consultas_fecha_id_seq;
       public          postgres    false    229            �           0    0    consultas_fecha_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.consultas_fecha_id_seq OWNED BY public.consultas_fecha.id;
          public          postgres    false    228            �            1259    16476 
   estaciones    TABLE     �   CREATE TABLE public.estaciones (
    id integer NOT NULL,
    nombre character varying(35) NOT NULL,
    direccion character varying(35) NOT NULL
);
    DROP TABLE public.estaciones;
       public         heap    postgres    false            �           0    0    TABLE estaciones    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.estaciones TO usuario_consultas2;
GRANT SELECT,INSERT,DELETE,TRIGGER,UPDATE ON TABLE public.estaciones TO usuario_consulta;
          public          postgres    false    221            �            1259    16475    estacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.estacion_id_seq;
       public          postgres    false    221            �           0    0    estacion_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.estacion_id_seq OWNED BY public.estaciones.id;
          public          postgres    false    220            �            1259    24867    logins    TABLE     �   CREATE TABLE public.logins (
    id integer NOT NULL,
    usuario character varying(10),
    pass_aleatorio text,
    pass_md5 text
);
    DROP TABLE public.logins;
       public         heap    postgres    false            �            1259    24866    logins_id_seq    SEQUENCE     �   CREATE SEQUENCE public.logins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.logins_id_seq;
       public          postgres    false    232            �           0    0    logins_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.logins_id_seq OWNED BY public.logins.id;
          public          postgres    false    231            �            1259    16462 	   pasajeros    TABLE     �   CREATE TABLE public.pasajeros (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    direccion_residencia character varying(40) NOT NULL,
    fecha_nacimiento date NOT NULL
);
    DROP TABLE public.pasajeros;
       public         heap    postgres    false            �           0    0    TABLE pasajeros    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.pasajeros TO usuario_consultas2;
GRANT SELECT,INSERT,DELETE,TRIGGER,UPDATE ON TABLE public.pasajeros TO usuario_consulta;
          public          postgres    false    217            �            1259    16461    pasajero_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pasajero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.pasajero_id_seq;
       public          postgres    false    217            �           0    0    pasajero_id_seq    SEQUENCE OWNED BY     D   ALTER SEQUENCE public.pasajero_id_seq OWNED BY public.pasajeros.id;
          public          postgres    false    216            �            1259    16448 	   trayectos    TABLE     �   CREATE TABLE public.trayectos (
    id integer NOT NULL,
    id_tren integer NOT NULL,
    id_estacion integer NOT NULL,
    nombre character varying(30) NOT NULL
);
    DROP TABLE public.trayectos;
       public         heap    postgres    false            �           0    0    TABLE trayectos    ACL     �   GRANT SELECT,INSERT,UPDATE ON TABLE public.trayectos TO usuario_consultas2;
GRANT SELECT,INSERT,DELETE,TRIGGER,UPDATE ON TABLE public.trayectos TO usuario_consulta;
          public          postgres    false    215            �            1259    16447    trayecto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trayecto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.trayecto_id_seq;
       public          postgres    false    215            �           0    0    trayecto_id_seq    SEQUENCE OWNED BY     D   ALTER SEQUENCE public.trayecto_id_seq OWNED BY public.trayectos.id;
          public          postgres    false    214            �            1259    16469    trenes    TABLE     �   CREATE TABLE public.trenes (
    id integer NOT NULL,
    modelo character varying(35) NOT NULL,
    capacidad integer NOT NULL
);
    DROP TABLE public.trenes;
       public         heap    postgres    false            �           0    0    TABLE trenes    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.trenes TO usuario_consultas2;
GRANT SELECT,INSERT,DELETE,TRIGGER,UPDATE ON TABLE public.trenes TO usuario_consulta;
          public          postgres    false    219            �            1259    16468    tren_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tren_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tren_id_seq;
       public          postgres    false    219            �           0    0    tren_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tren_id_seq OWNED BY public.trenes.id;
          public          postgres    false    218            �            1259    24679    tren_indicado    VIEW     "  CREATE VIEW public.tren_indicado AS
 SELECT trenes.id,
    trenes.modelo,
    trenes.capacidad,
        CASE
            WHEN (((trenes.modelo)::text ~~* 'i%'::text) AND (trenes.capacidad < 50)) THEN 'Ahi es'::text
            ELSE NULL::text
        END AS indicado
   FROM public.trenes;
     DROP VIEW public.tren_indicado;
       public          postgres    false    219    219    219            �            1259    16441    viajes    TABLE     �   CREATE TABLE public.viajes (
    id integer NOT NULL,
    id_pasajero integer NOT NULL,
    id_trayecto integer NOT NULL,
    inicio date NOT NULL,
    fin date NOT NULL
);
    DROP TABLE public.viajes;
       public         heap    postgres    false            �           0    0    TABLE viajes    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.viajes TO usuario_consultas2;
GRANT SELECT,INSERT,DELETE,TRIGGER,UPDATE ON TABLE public.viajes TO usuario_consulta;
          public          postgres    false    213            �            1259    16440    viaje_id_seq    SEQUENCE     �   CREATE SEQUENCE public.viaje_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.viaje_id_seq;
       public          postgres    false    213            �           0    0    viaje_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.viaje_id_seq OWNED BY public.viajes.id;
          public          postgres    false    212            �            1259    24683    vm_tren_indicado    MATERIALIZED VIEW     A  CREATE MATERIALIZED VIEW public.vm_tren_indicado AS
 SELECT trenes.id,
    trenes.modelo,
    trenes.capacidad,
        CASE
            WHEN (((trenes.modelo)::text ~~* 'i%'::text) AND (trenes.capacidad < 50)) THEN 'Ahi es'::text
            ELSE NULL::text
        END AS indicado
   FROM public.trenes
  WITH NO DATA;
 0   DROP MATERIALIZED VIEW public.vm_tren_indicado;
       public         heap    postgres    false    219    219    219            �           0    0    bitacora_viajes201510    TABLE ATTACH     �   ALTER TABLE ONLY public.bitacora_viajes ATTACH PARTITION public.bitacora_viajes201510 FOR VALUES FROM ('2009-01-09') TO ('2019-09-01');
          public          postgres    false    225    223            �           0    0    bitacora_viajes202010    TABLE ATTACH     �   ALTER TABLE ONLY public.bitacora_viajes ATTACH PARTITION public.bitacora_viajes202010 FOR VALUES FROM ('2020-10-09') TO ('2021-09-01');
          public          postgres    false    224    223            �           2604    24913    bitacora_viajes id    DEFAULT     x   ALTER TABLE ONLY public.bitacora_viajes ALTER COLUMN id SET DEFAULT nextval('public.bitacora_viajes_id_seq'::regclass);
 A   ALTER TABLE public.bitacora_viajes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    24914    consultas_fecha id    DEFAULT     x   ALTER TABLE ONLY public.consultas_fecha ALTER COLUMN id SET DEFAULT nextval('public.consultas_fecha_id_seq'::regclass);
 A   ALTER TABLE public.consultas_fecha ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    24915    estaciones id    DEFAULT     l   ALTER TABLE ONLY public.estaciones ALTER COLUMN id SET DEFAULT nextval('public.estacion_id_seq'::regclass);
 <   ALTER TABLE public.estaciones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    24916 	   logins id    DEFAULT     f   ALTER TABLE ONLY public.logins ALTER COLUMN id SET DEFAULT nextval('public.logins_id_seq'::regclass);
 8   ALTER TABLE public.logins ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    24917    pasajeros id    DEFAULT     k   ALTER TABLE ONLY public.pasajeros ALTER COLUMN id SET DEFAULT nextval('public.pasajero_id_seq'::regclass);
 ;   ALTER TABLE public.pasajeros ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    24918    trayectos id    DEFAULT     k   ALTER TABLE ONLY public.trayectos ALTER COLUMN id SET DEFAULT nextval('public.trayecto_id_seq'::regclass);
 ;   ALTER TABLE public.trayectos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    24919 	   trenes id    DEFAULT     d   ALTER TABLE ONLY public.trenes ALTER COLUMN id SET DEFAULT nextval('public.tren_id_seq'::regclass);
 8   ALTER TABLE public.trenes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    24920 	   viajes id    DEFAULT     e   ALTER TABLE ONLY public.viajes ALTER COLUMN id SET DEFAULT nextval('public.viaje_id_seq'::regclass);
 8   ALTER TABLE public.viajes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �          0    24650    bitacora_viajes201510 
   TABLE DATA           D   COPY public.bitacora_viajes201510 (id, id_viaje, fecha) FROM stdin;
    public          postgres    false    225   kc       �          0    24646    bitacora_viajes202010 
   TABLE DATA           D   COPY public.bitacora_viajes202010 (id, id_viaje, fecha) FROM stdin;
    public          postgres    false    224   �c       �          0    24715    consultas_fecha 
   TABLE DATA           D   COPY public.consultas_fecha (id, total, fecha_consulta) FROM stdin;
    public          postgres    false    229   �c       �          0    16476 
   estaciones 
   TABLE DATA           ;   COPY public.estaciones (id, nombre, direccion) FROM stdin;
    public          postgres    false    221   Qd       �          0    24867    logins 
   TABLE DATA           G   COPY public.logins (id, usuario, pass_aleatorio, pass_md5) FROM stdin;
    public          postgres    false    232   c|       �          0    16462 	   pasajeros 
   TABLE DATA           W   COPY public.pasajeros (id, nombre, direccion_residencia, fecha_nacimiento) FROM stdin;
    public          postgres    false    217   �|       �          0    16448 	   trayectos 
   TABLE DATA           E   COPY public.trayectos (id, id_tren, id_estacion, nombre) FROM stdin;
    public          postgres    false    215   ��       �          0    16469    trenes 
   TABLE DATA           7   COPY public.trenes (id, modelo, capacidad) FROM stdin;
    public          postgres    false    219   S�       �          0    16441    viajes 
   TABLE DATA           K   COPY public.viajes (id, id_pasajero, id_trayecto, inicio, fin) FROM stdin;
    public          postgres    false    213   ��       �           0    0    bitacora_viajes_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.bitacora_viajes_id_seq', 11, true);
          public          postgres    false    222            �           0    0    consultas_fecha_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.consultas_fecha_id_seq', 7, true);
          public          postgres    false    228            �           0    0    estacion_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.estacion_id_seq', 1001, true);
          public          postgres    false    220            �           0    0    logins_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.logins_id_seq', 1, true);
          public          postgres    false    231            �           0    0    pasajero_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.pasajero_id_seq', 1005, true);
          public          postgres    false    216            �           0    0    trayecto_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.trayecto_id_seq', 1001, true);
          public          postgres    false    214            �           0    0    tren_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.tren_id_seq', 18, true);
          public          postgres    false    218            �           0    0    viaje_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.viaje_id_seq', 1, false);
          public          postgres    false    212                       2606    24720 $   consultas_fecha consultas_fecha_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.consultas_fecha
    ADD CONSTRAINT consultas_fecha_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.consultas_fecha DROP CONSTRAINT consultas_fecha_pkey;
       public            postgres    false    229                       2606    16481    estaciones estacion_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.estaciones
    ADD CONSTRAINT estacion_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.estaciones DROP CONSTRAINT estacion_pkey;
       public            postgres    false    221            	           2606    24874    logins logins_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.logins
    ADD CONSTRAINT logins_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.logins DROP CONSTRAINT logins_pkey;
       public            postgres    false    232                       2606    16467    pasajeros pasajero_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.pasajeros
    ADD CONSTRAINT pasajero_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.pasajeros DROP CONSTRAINT pasajero_pkey;
       public            postgres    false    217            �           2606    16453    trayectos trayecto_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.trayectos
    ADD CONSTRAINT trayecto_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.trayectos DROP CONSTRAINT trayecto_pkey;
       public            postgres    false    215                       2606    16474    trenes tren_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.trenes
    ADD CONSTRAINT tren_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.trenes DROP CONSTRAINT tren_pkey;
       public            postgres    false    219            �           2606    16460    viajes viaje_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.viajes
    ADD CONSTRAINT viaje_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.viajes DROP CONSTRAINT viaje_pkey;
       public            postgres    false    213                       2620    24741    pasajeros d_trigger    TRIGGER     m   CREATE TRIGGER d_trigger AFTER DELETE ON public.pasajeros FOR EACH ROW EXECUTE FUNCTION public.segundo_pl();
 ,   DROP TRIGGER d_trigger ON public.pasajeros;
       public          postgres    false    271    217                       2620    24736    pasajeros trigger_ai    TRIGGER     n   CREATE TRIGGER trigger_ai AFTER INSERT ON public.pasajeros FOR EACH ROW EXECUTE FUNCTION public.segundo_pl();
 -   DROP TRIGGER trigger_ai ON public.pasajeros;
       public          postgres    false    271    217                       2606    24656     trayectos trayecto_estacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trayectos
    ADD CONSTRAINT trayecto_estacion_fkey FOREIGN KEY (id_estacion) REFERENCES public.estaciones(id) NOT VALID;
 J   ALTER TABLE ONLY public.trayectos DROP CONSTRAINT trayecto_estacion_fkey;
       public          postgres    false    3333    221    215                       2606    24661    trayectos trayectos_trenes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trayectos
    ADD CONSTRAINT trayectos_trenes_fkey FOREIGN KEY (id_tren) REFERENCES public.trenes(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.trayectos DROP CONSTRAINT trayectos_trenes_fkey;
       public          postgres    false    3331    215    219            
           2606    24666    viajes viajes_pasajeros_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.viajes
    ADD CONSTRAINT viajes_pasajeros_fkey FOREIGN KEY (id_pasajero) REFERENCES public.pasajeros(id) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.viajes DROP CONSTRAINT viajes_pasajeros_fkey;
       public          postgres    false    213    3329    217            �           0    24683    vm_tren_indicado    MATERIALIZED VIEW DATA     3   REFRESH MATERIALIZED VIEW public.vm_tren_indicado;
          public          postgres    false    227    3503            �      x�3�4�4204�54�5��2G���qqq f&�      �      x�3�4�4202�54�5��2E���qqq e      �   x   x�e���0�w<E�@Ѳ-i��?G��Q4�"�P@������H0�=by�h��h�QlҪ*dKD��=4n4���cFVl��Ye�k���A��D�mv�xz��T�__�Z{�(�      �      x�}��rG��ϙO�'��Ï�j-��=�{Z6�Q$JQ0� 
|��=������f%26_~�����a���������8����?\��f=���ߝn����7J�f�~���~=?�	A�v�������8��ݛo��1�����������n��T5���������t�i?��t8�����wϻ�V�0��������N7o~�=f��y���j��KoE����?�ӮNkVj��ϗ��}��u<9��_��:��������~���u�����_��Q=��C7����?s��i'>o�C�1�����վ.%�Y����������vwU��/�Mߝ��3Q�z�~�﯏Ǽ
���������+^��Y�黗;ޣ�H�Y�����[�L�(m��OǏ�l��b�~�]�TOǇ����Ǟ�Nu�~�u���=~:�>=�ɓ���u�~��n?��熗�\?MJ�9�e]�y��l��������S��sa6z�ߧ��S���l���W;à�gӟ���wcT�qx�����0�����%Uc\L0�	X)��lTEM/N�_��}jG�Y�lh��fw:��x#��f�L�:�^�9z��lyy�Ǜ�#/����V��������kggk�ܯ�	�EY���������K��'>_ek7�������{|6F�;a������ϝފ�7�E���,M�>�y�ӳ[���p�x��ޭ� ��E�(��V�t�;=]e7'��3�"�i�e�"����Dm&�Mo��Ҕ�xϧ�]�g��B��������cu@e�O��ˁ_S�=�8�é.���s��6U�qƓ����\�o'�?7i�_8�O ��鷛��o���ӺN�j Sk�~z{��*o����0��=?�cf���Q�~L��Ix��3����l;���ZPi�O/���I��w;��񁧼m��=�A�q�2�6�~�ㆳx�8���׷u�6���ȓ|���
�B�z�����߉9g�����}.���qI�l'alq���F�&��u2�����Xe4�˯__J�C��)�#���e��J�ɫqx�s)!���@ʊ��^t��O=�H<�1�3>Z���Ŝ?�B�ds�~�3!#����4@3�����v&��b�Ir�8���;_&��y����f��#���#ǣ�,��)_�.�#E�����z.Ny��1B®�E��_��#k4F���~:<�c���Zl�ʞz<w�?Wm"-�h����x�ϼ�9��7���s<�Кy?��ȑ)���r��f�[�!,��E��8O��{������x�OG��_�5��ci���Em�o�d�������a�X�ՒR����=�.��ܜ����=~��)��G�-��M{b���Z��i�w���➘�nѼ��ؓ$>p�(�a�c�+@N���Aj������\�1��J���Cg�2�xI�����"��F�J#ɢ��c�������5!=�6�f�z���Uv���������@n䐑�qm�>B���>I�$dR*.���Ȍ_^������(����^&L�4Ə�����y�/T�w�������T6�{�Tgs�i9,Ҋ`ߡ5R�n��p�����)��4��X��ͩ�y_R49�M��>���6Cp��ek�lj�����|��L\Ӏ�JF��ٳ��c�gZ���`��5+���\f���(��⪂������Oӡ3�j��?�m^E�eM�_�>f���1�}�Y	񺉛.�(H�|+_�E���㙃�A:�ڲ#Aa� W�
<��b]�O���2�=�
CAe`���Mk�����o*D����4������p	�X9dF��#���K�@Ag|�c�R�Il>�F��՚} ~9f���=���f_P�(ȍw�{����iw�4���@�0���.yw~�Wx��Ю�Bm�Pu�����}�/��7U�_��hx,���[x�P\t6q���)M�8��ٝ)�%|X�F�rSaNɪ;��?��]�#2��Ϝ��`m�����
���V5��1�q�#�p���d��C	��\`Y,B�)�)�'��+�%Uh�O�ul���lUDz��(e]J��4��y2@թ�=�B"������դc��T�����)���H\hC��o;��ub�[%�� PK)y�"�?Z=Z�
?խA�J��Gs/�Mv�����L]jG�@I�@
���C��6�5ui.�[4>7y�{ã�hL��U랷��[��qv��7�~�?��,���;�����|Q�,,ICq��?}YM䇮��H�<�?+��.�W�P���Ƌ�N�b��A�YuV"��2\Cz|�㺗�u]gtm�rqչ�6z����¾���D<��W��ímʭ!��M-�FҐ PQw���x�4�EoU�K�Q��IV�����JΛ�y�q�JL�%X�b��k V�I�)����ִ���m��d�J3#*R�����YC~��Cߚp�G�߾j�_xz1�3���0~���R\8�@���yC�a#Ajh��΄��.��dM�~箚)��k4�\��zM�ڹ�ِ&�A��R�Mj���Ǐ[Oq�ε?g��K��-����=<k�jU��Ob5>&�$"EIn{�6��6@�p�
�����(�4�	����@����v�;�49��ˊ�P(�y�RY՛)RtGR�n������y[c��@��2��C�WC�����蔺��25,�;"���Z%[b�W��p���"������}�B%5���PٴR�YGn.�*2p.�g�޼ Wr��1�C,�6?p��+������b�7���<�0�Z��;n���)��7��'��ˮ��"�Nh��F�%�l4٬�K擣9[S�<@)p��\-&�je�B�����q��_��P��[;�@��+���JQ]�����m�f1g��X<J���U��ny{���7PL���"Q�%��{u�|�X<�؁�Q�!<�,ʽ�,,�[��1����[��N�q�4P+ܵ\E+�-���mVNc�+��k�*���Z�|��ݗ��ҝT�>�ʁ���N��ݬ��+�{��[;�eF璠�:�y4K��9��v-�	�� ���8��5V��b�X�pT\0z� �ۭ���z�I������kG-g�r���xn U�1��o��1�H\`�ƶ�l��Jj�7{5���U�)� 1��SJ��61ݎ�QW�;f����L=��Қ)��a�"�*�,r���~����S�i��i Q�_֞G|嶅�g+������bm8:(��i�`e#���$�}�v�i�6��:�q���9�C�ɂ��O����QMa�'��+,�ٮ���xgoג�Z�D����s����P����.sͰ�L��b���������x�%��s�#ؠt���r H�7T�CtIj�u)�x�F��tQ�]��� F�;�<�XZ<9�b��A�Rw������b���\5I����%o�l��?��f3l���X�0Ud��u�h�1+�^���C����G�P��eE��ao��M\z�&K�����T�eMغ�4q��*�p3�ֻ�v%m�6pf-x�z�5�B���!ɫ�z�`M1���>��X�5����G�
��1�����7Ŕ/̾��)څ/�!8޶k����T.�ȇH�E�=�]Z�uO�w̡�P�_�Cll��������-��
<S�ZR�.%��>���xd��kvm!6.�����Q��A����ӷr�h�2:5�kp߽H��[����]k[�'���ޏ�sݴ]	ɼ8��\��K�,nP�Y�=83�ۨ:T���#�57+���P���
&�����uiz��Sϻu�,Ц�����V�Q�q;9����(�1�6�޾�������]a���o�>Vs#���uGJ��-����!-�/o�Nm�&��5)���:�`��5�������3�2��$P,�[�6I��+!?C��1���Ro�����Kp��i�dk�h�,~_��hk��N���8D�5���H�H;{��Ż�XP�[[so�/(l-tE �  ��j�I�"-k��>dU�G�e�<\�W"�.Z.� ��r[.^�V���j���C�ZQ���Q�Yg�=a�[g�t;]cݙd�G�݀���F���lk��T�8�gnt����γ 40_V�j�Z�{o���F�ڭ^�����a�����nk�M.��u�"��R�s�#]:k�T�-�3�2�m�MX��j���@��w��Tb�y�,�?"��,�ۍ���i�]�8�?�J�b�p��K7�HTF��A����� g@)��\�yeXR�钪Yz`������⎁&U`ݡ������3l�+!ERs��5�4~m}t)b��s�Z�B���PA<L��-�/�*����yy:��euW��h	�Ǯ���B��!?4d!�g־p&i�E�
��ur�J-�3���)��l��?���*@��\�������-K�:J!�9H����2�#u�%I
7���D��E�I�rA��E`J�"P��+u��m�R�%K����K�ԉp��R�^�6|� S'�N@L݀1u2d�F��0S7�L��:�4u2j���maS'Ӧn��:�7u2p�ĩ"�n̜�t�Fԩ`�nĝ�x�6��S'��n�:�>㧯� uD�T�AA�"�*c���6 ���NBQ�Ȣ���D�	8���NR�D�:IuC&�IP���T'`�N�R�����Tw���-��d8�	t��n˧:Pu[B�mU�aT�Ru"��6���p�n�:�Tu"��$VՍ`U'ӪN�U݀W�2��E^�K���yU?�U��W��근��yU��U�ȫ�-��%^տΫz�W�2��E^�oxU/��u^�oyU?�U��W���^Ջ���yU?�U�̫�^Ջ���xU/�^�U��W�[^�xU?�U�īz�W�^�yU?�U�+��xU/�^�U�īz�W�^Ջ����^�U�ȫ���7��xU/�^�U���z�W�#^�_�^�U��W�����yU/�~˫���7����~���-��e^�K���^�U��W���^Ջ���xU/��^�_�^�U�ȫz�W���%^տ«z�W�#^�oxU/�~˫z�W�2�d^5lx� �A�U�����D^5�x� �A�U�ī�W#^5ly�0�UÖW"�D^5�j�A�UÈW�D^5H�j���5^5H�jx��
�Ƽj�y� �A�UÐW�F�jyհ�U�ī�!�d^5H�jy� �aȫ�Wxհ�UÈW2�^5\�A�U�ī�W2�d^5�x� �A�U����Wc^5ly� �a�����j�y�0�U�ī�!�^5�j�A�U�ȫ�1�^5ȼjx� �aȫ�K^5y� �aī�K^5ȼj�A�U����WC^5ly� �A�UÖWC^5ly�(�Q�U�ī�-�Ǽj��që�!�^5nx�(�q̫F�W�^5��jx��
�^5J�j��Q�U�k�j�q˫�!�^5x�8�U�W���Q�U�W�2�E^5ʼj�q˫�-�^5nx�8�U�W��G�jy�8�U�̫F�W��^5��jy�(�Q�U�W�2�%^5ʼj�xո�U�W�^5x�8�U���F�W���jxո�U�W�#^5��jxո�U�ī��%^5nyո�U�W�#^5
�jx�(�Q�U�W��Ǽj�Q�U�W�^5xո�U�̫�-�E^5
�j�Q�Ui˫ҀW�-�J"�J#^�$^�^�^�$^�d^�d^��*��*xUxUyU�yU���UI�Ui˫ҀW��J"�J�J�J�J2�J^�^�d^�$^�F�*��*mxUyU�xU�yU�yU��$�4�UI�Uië�̫�ȫҀW��J�J�J�J2�J2�J�J"�J���
�J2�J�*�xU�xU��Ui���̫҈W�-�J#^���*xUyU�$��UI�UI�UI�UI�UI�UiȫҖW%�W%�W�K^���*	�*myU��UI�UI�Uiȫ�̫�%�J�J"�J�J�J�JC^�6�*
�-���b���g���/��      �   Z   x�3�,-.M,��7�T1TI���q�PI��u��.+57ɮJ�32��0M��475ML3K3�4O3OLM�L41JKI244J60�r�b���� 4��      �      x��|Ks������}+O�z-��d[���=wb6E&qE�@Rj���ɬ*���&��EGwQU�8'3��{��,�z�=4�ͺkG�]�ʴ��4.?��Y9zX4���v^�ux ׅ�#y�)/>�L�>��f���s׵�(�6����zz�~W���=ng���V�����ᙱ�46���,�|�����¯֣��E�O�*[hz��>��Y��n��o�e��\�~���lt���TQЯ�Oү��豞�S�}��Iz���OX¸������n��2�����
zWn�
/�J������.~��%85�/ӟh�,W�G���ٷ�]�6��5Z����1�����>��_�c������\�.<X��ft�am٥�'M;�󃭥�>�M;�����/}��ߕ���pJ��;����}�{�|I_����
rMo�*����e�]��믮���*e����S�ϊ|t��-�:��nޛټ��3�g8�'�Ϯg��v5�}����}��������C�-S��ۊ���8+��S�\��m?����J�6�Y����`�dۻ�i�����s%'�,Y�L�i�w�y��<�i������X���������gY�d��������Y.�6��1�~V�m:6[��ܝnt��OVF�>>7y�Mh1>+ǣ+�6uv������ͦ�J6�W��9�j;�3���v�8���gS�C/���={j�k����>Do�C%��o^������q#\_DyVV��M���h0��^�g��cj�\�^��;�i��~�>?��S����5}�����2�����uK3zl^�"��`��E���J�X���ѭo�&ȁ���|Ԇ��r؇��9���|�5Cl�n\q,��s}��i���k�8 �6�vHۡ���7��ao������#��N�{k��70����z��`��ͬ8���E3��^�����Vi]��V�s���x�35>�iڶ�Ff��V|�8E�[`	sX�����E�z�Y�G�m�W8}�ѯޱÏk�b"�`%��A��m��|8�h���Ʒ>�k��d��#$<��z�ާ�n�l�y:�*8��;C\����.�v�_F6W�App�D���E�6���?:�_�6�� 7~ٮ��y����,'��N���v�=�(n��J[P�U�/�7�݌�c8U��W�?�]վm���M�V�>�9�'=�G���Z�H�}��]�i>��3#N�������k8��*[["S�G��%2��t���ѝ�u�a�âC��1�5�+V��Cp�+���f�m�o�����0fn���Vd�Bm�]=�l�
u���&�g��]���r�M��{IG�����7d�o��Yo:lt�6��*"���+����;_O;8YxeΙc�1gZ�~�f��]O�MZ���������S<�tU9  �21"��_8��<͡o��%���9�AvY��`�6Pp(�Z�讆��ؔY���]�<D����x�u����"����qY�q9�> d���/�������w|��9[
^Z���(���z��w�??�#d��!��_d/{�f�g+��*�g2+sf��Ȝ�_�i[�0����sϨ�������VU��Ʈ��i�o����cM|���d9������h_��Q�E]�i�F;��ft&߻~�ּ�zim���q���K�]!І���b�	1�~ɾ��n���[���eQ(�`�O�]�W�#��=v�'���ү7����z��k�L�nl��Evٵ�.���D0�x����͊��=���?Cug��U� ��D�N@(Wa��1EY��杶�Cb��S�m�����d�z�p���J��&�]��Y;�D.�����0D���37�2���Cȭ���ȷ�Y�ݒa�,��j��D�07b ��mӯ���	(m�+��z��\1��mi���l5�baC#'/�\�X��{C�����8�����~��w�F�zs��"�qjt�����~t�U�D�G�� ��nS/��DH��Щ޾�!.�p�D.��1X0����P��/|"rm���C�*y����_�:�9���+�> ���ǣs@s߬&~�h�O�V�#�4�G�� �>`�,��P9JU����z��Ŷ�GC��=K��|\��Y��L;
�oM�����N�kLj����Oɦ/��ȭ9?��G���zM�[�p�T2M��������=�g��9~m	�'�	��纟YY�㽭���ѳ�,z��'-������S�c���-g�:�[�Ϳgu��JG���b(x����i?����h�A��y:�G��n�����IP�fD��)~�X#���heb��d�9��	�͖�iX�	8�7���󢁙 -w=H��j�T�ݚA*,��]���s"�~�\���B��GE���m��y=�.k��T�P��G����U�����6�Y�(�VÒ/�m�-)�tL�x5����f3]�Os�_Tx(�p�l�-`�C��kS�����a���eL~x��?������^_���0c�G���q�����=l�pb@��MMo��V)ٯ��!MY��*�M��;䞢�ɣ��� ��F���n�����+�� �~��d����8"�l�HX����G\7;��Б�����rC4o^�t1��k9^�`�zJ���  ��4�F X���ֳY ����g4<
��X���?��8��t��O�\��a����ױk�s�u����s�%�6��v�9��z��mӁo��=��J�!�����v��>�(��ˈ�s�;��d2k �X��j��i-/$�	�̼��9�FJF�7���l���]l��-t��t>G�>�������/���9.mP�,�+N�s���T۫�T�Ԝ� �o��q��~]/w�Z�.@G���aӯ��~��Ĕ�!��`�	��������P�ҹ*~e��w���z��2;*&)����;%�K�?$9ވ����z`<���e��U �4oe��+jp��'p�;D�vF���(ěGP(J�p�Rz�Y6�T�,��L;�8m��}�r潟� ��'��j�K�o�v�({�U�ۈ]��� �^��/~�4c5xҘ�F��w��8���qx��2��y��MK��_��IU�Ȝ;�
 l��@c���?%�&B�~˰�~}�� ��L"'�}Y��L���^�P�HH�\�B:����C�mg���K b���h�Tr����K����fA�j@�b�`���ѷ@��~>tۥ*'s�1{!��g�S����	ɺ��鲧����zz� �P	�r�u��W`�����6���9���o���.�Z����|�Nb@��;թ�͒cH�¿'���E�D�q���=���=�:��x����O�~�Lz�U�T齥Gu
�[���נ�͉�u�#7\���s*嬁.�����ܐӬk��寴���Bn%P�dII V���Gs�q^���[ zާ��M���T���/=��c^���U�_�!���?e8|��K#=���^�~z���X�/�]�H><Y�{g79�惔�-�^�=�y}�(Nr�/G�i�TO}~�����<�}\l�� ��vˆ��W?����X�}�����N15��q(�R +9���S�*�����dS(T�s��T�y����|b�����|�������f�E��S׀�j~Oʞ�m
�o~�^Ɣ�rz�DoRj�����=���!<S�&%�}����(y=�:o�׋�h��U�F\&�A�/�;��e�z= :TV�D���F_��q�}3�S��:��ĸ��6�Ǻ[�����`�E�R�V��H�Z��F�^F�c�ewkS���{�Y��_�ޱo?&��(��}Уu��WX%��H��L���xȂt�����2�x*~H�����/O= ����P�Ҏ?��=�ǎ����?�C�7U��r��	Y�����^GX���/�?GLu�_�Щ���*��=��l:��ֹ��c�"d�/+��O;X��Ǿ����\1�C
M�`�����3lN(��������v��@���݇
���W?�z���BK�#q���    ��p𐺛Q�k��R�� A
<F���Zn�v�E���R9ւ� �MM�f����"�6"hrqlcΤ���ώ�X�7��U�SE>�}V�|��&ߥ�	���zm�5dc��Yr�~\�A�(��~N��C���Zn��Z�o�1�}�W++�S�Β��P��E,����VU> 2j����l���n=og`����K}�I�� 9��Ȓi��v5��g��.O^�S`�\�j��7ߦƥK%?. y�ܵ��$l���@U�~�f��7�j�u<�~�<��E��s$�M��O�,�{�otPZ����<x�MC�3�ܼ�|ud��g�~W��J�!)��r�A�>Pu�V��u� �U��x�X�y�vK*�7�sB�� CA��RG1��U5�0�fK��@i�+�:B�;�b���W�߀z� ʒosy��O�"p������@@����`��w�����\�xZr�@�!T���4�fϩ�]��������;�ҡ��ȱ f������m�P����G58�l&FG�"n ����^�1�f"��)�`c�aǇ���e�����B��`��qL���v��[ �&��GC�6>�ג�E��G�w9=��8�#�&���@�+���2q�@�?�%�����o�V�ڪX<* �����	d�[4� YO�NP�z���!���d�n4��a�����7R<��y�3is�ω����O&$�v��a�[Gt� �@� �[2�h�:�nH�ޟ�C?N:�r������9eY&����+����/ѹ�����|r�|S��,�2�U��T&������.Z&�	���^I�Y��m29jy�Hi߈c���2 �ԪՆT�/��A	�G��+6��p5 ���{y߷�����^=�2o���'�m���\����3���{Ok����4�Ѭ��v��&r�Ҏ�#:8<�ⷺ~��s"sV�VP��/�S�����;R���\Ń��Z��~�j!��pm���-A�/ɜ����Ph�Kk�\�zy�OJU��|���H�˷z���Q
�y'5z^��}���1��V8�-�q"(���ϣ���p%_��/k@&������u�̲C�h_�f���0B{Fd���n�����O�s��n�� ](��e�$�l��4�e���[���&w>�%���~et�4߅�i����#��<�)���=�ɾX�R� n��H)�qRD�8�Կ� �����n��J�L�~����oπ
w�BI���f�faL�h���f���zN��8��R��P$��@�@�Qj���"���-i��cW�Ǎ͜��-RO��䱪f�l9N#_\ܢ��C����n�t�����?[�.������*쇊?O� �w��߻�b	jvT�~�7�nL8�2�O��<��'Q��X,�oR���͓��!�25r���B ��!�'��q�\�|�]�[�.�1����	��#v�����>���ذ*���;�3w���昜E(ML�� 3�ٻ�1&h���Iȕ���qtQ�P�Z`����S�����$��Ӿ9�Q1q� L��G�$@���i����̽��CZ?���p`//RJ�'|�&��)�p��:�_F��<mؽ�A��b�T�F@ѷH  �~���
b���s�ʮ4��o:��2��
$�{��iv�|���X�-����n��:M��U�`��%Wu���X|p�q�B-�n�!�Z�**S�'��m%a5T;oq���}	�1��c)LR]-��S=�'�
���K�� �
�C��q��D����\ik��/��$�i'�KX�����9c��v��4�
����R���	��~�ȥ2���U0�o��;���X1����G�K������_M4J���|F�9O�6�<6���о+B�?�rぇ��I���L�v?K`�rf&��['�p��4�J�k{����pc��`.D�� ��[|4ws>�-�v���8�"��%��� j1��I�M�D�C�.����Y4�5��M��K^�|[�9�3*��a4�}I����L��M5�	J`�;��~K�b�+����$�{C#هS��5�x�\��O͜�44$�a\��Wb�.:��yZ45e?خ�>���S�hA�iޭNӳc�"�ՠ���+�gRS��^_0{�r��)����{��6�1��(�S�}2�OV��R�T�e�/��/���Ww�c9j:��+ Z	/d~��I%N�P�"Ϳ}�f~n�C:�w/��} ���QyKc(~�Q�w��. �@��?���Y���� O�)s����@��7�"�=~&$r��0AUa����{G@XO�n;_V}������Wf��7��sq΢��a���[��Ǳ���B�%�T�Fjk�ž��L��,��|��[v���-�PP��x��,){���F3_F�kCG�����+%���`%Wa� �ߺ1A䧟-S��RA�k~%�,�1Ԉ�݌`���E��{@�P^�#|	��v�}_�5<-k��.t�����m*�5�nh��T�Â�(�Qa�NҬ�Ks��$K��/�K���u��i
���_�a �s/��@X��!�}�"�*#O��~��~9�ykz%�q�֮�~���sq~"�����oJ� %TzJ���I��a.�i����%���"?[�|	����1���Rw���X��(<*�9�Ix.֖�����]�}�I^��|̵C����s�[�������4y�[�P�V����~��YE�in��o���uQ'�mC˿�����I;�ِL�!QhžD���'�����)����"�tI]�풲�Q���T�KӬ�E"*y(�4�NSX����O�7�>��2�X ������U���8�8,\������z6Pe�=͇�}�gt��l +�߇R	-�|G�T���X�P�u�z��JM4��O��]�
�A�؂��3����V��C1,�����#���7;aD�v_�B,1��0��-�A0�p�+T��aA�	EC<����HȷE�#"xpאWՓ	�G��U?%�|�w��{�K��y�+a����N3��G�~k~%���`uW�|�pɴ�ǜ����3��v>㦳�+jp�ԝ
�)')����IUG����t�����l������S�=L � E�wn��n��c��� &������6�X7TZ(���?�����h�=�05J�Hc��񰫇�:BI����Q��׍O���pǛ�rx�-��m{?�!6'bg�c�f 6��:̢�Y��X	"�_^!�S# �o&>^&rv��c�wt�[}JF���QD�<�YP�{�6@�b_4�S�ƠiB	g�Y�������ۿӅ��ƯŲ>}v����ױ�=�E�cL�ðO��A."�L=��׎g����;�����+n�et�pI��a+S�I B!��3����W��i�)�a�:���P�ӧ���a�>^�}��~�]�nf�t1�+n%��{��_�E���R�8��7`�4�i �-��ڨ�0���߲�56y��bG�x���C���x.�ly���n���Ϳ}��=��Z��Τ+yxe[u4�N���&�#��A8�[�8@#W��k�,%U�y���0���.�&�ݼJ�ۄ�j�:d�Ͼ�'j�8R�iaMC���.����5䟳�+�v���D�����MT���t���u �C	2�m��+P��LV�VpK`f7P���&���{���4��ۃ��*+�ێ��W�z��|�E�y�s��Ty�*|v>���y ��3��'���`~M�e"�E�Ap���;F��r��@�����l6��Upm�S��$�EިW;L��0Qg#r����D��l�i��P�e�2?u��i-��wC(��΋*P�K��\:�Α�R4�[T%�j�<0��]5�TAY��k��{���11݁��7�v|����R1�Wt�;L��-�M]�ԯH��1�4Y��n8�_ޭS`JStӾGLz��*ƌ��� �  -{7��S3gS���l��P G|F����:��|�%�c�Rx���\���D���u}���¼��&�2�:!w7NR�K*��S�m)5yL��9O��T+��|,�j]!��@Kw��V��=s��V ���X�i<���)"F������f5e�n9;��(i����v��UK���m��+H4�}�m7Tvz�ۃ�ebZ��2��^Tχ����m�65ƀ'��?��e�(F� &}@��6����ժ��ʥa�����nCm��䳁c��A����{�nL�ZV�41��m�P���l_C��}���U(��h�.��Ю�D�LИ��B7�UO->.���-��
��+Rbؿ�-A����8޽�J�3��}?\\*�K��vU�K��c|�������q�:d��ڡ��>�B�0���`T��B�4O���O�p�$���2P�/t��vKe�a��y�N����[����s��h�nT�e2�8��Ȣ*EcT����4S}(��L���wk���l�/�Qǂ�ixJӄ��n�J6/��`��pL����4UO��~3L[&��T!�>�w��gCzK��è��Ô"<b~X܉�EBq��Kߔ@z�ӈ�	W%�#4����9��o�¼������4�P����lIK>H#��J(0 0�'M���P�u*]�(ï�P��|��k��㒍��
����j�oRT����q_�y8+G�������@"��r��|U���Q�t좣OK%�"��5�S+MS���T(�3űzI�0R�r#�fK�u#K�Ca����r��x[��?���`�0.�T�5M����6�E��S�KiQ�
S��Hx��f`��HMސ?���yxw���O�3f�^*	J �y3�.����C�@�/�9ա"[�����S�o#� btM�h*�T���o~��Gl��,��8�TC�����;�E����8Ɩ*�[����������/�;mh��� ��U�	#��y�U�b��v�L�6�&�u�
���.�Ұ������R��<�ɬ�S� J��1�A)�ߦ�	�r��u?�W<�+�X��eh��܍�]	l4]��Ƀ��xnwX<����t����a��h4�J����Nv��{ �}��nl��Ay��[7�.{����E�"O�D��Xӹ6;�)X�l2��H��n�!���A��8��R���b��2�a´��A)v�q�b@-�/[7���QF1˅�c|7�.��� W���ש*$�g�,����n�6�<S�(��lE�M�� ��P�uy���;M�:�X��BB��<ޤ���{�#ݠzI?��SL
�˚�W,	p0Юm*TrDTc"����n�u��0�^2.D�ej,P/S��D�~��_z@��}�;O=���ԘF���F`��4Fj	���DM�I��oI��1s?�^܋�xN"��߹��B��j>� ��`^J,���:kJ(��dJkJ"���ZkJ&��djkJ$���zkJ(����kJ*��D�kJ(��d�kJ ��d�kJ,��D�kJ ����kJ$��$�kJ"����kJ&���
lJ"��N�`S6%VaS26%�aS2!6%WbS�H�)�����)��L�M��&d�(�� �&�d;A��U6�,�X�M��ٔL�M	�ٔ\�M��ٔ@�M	�ٔP�M�"ЦD
mJ*ѦN�hS'��)�J��ʴ)�N�������IRmJ�զ�bmJ�֦�rmJ�צD�mJ�ئĒmJ�٦D�mJ�ڦ$�mJ�ۦD�mJ�ܦ��mJ�ݦd�mJ�ަN�oSR�6-�o�2�6-�o�2�6-�o��6-�o�b�6-�oӧ�i�~����?�i�~��i�~���i�~���i�~����S�۴L�M�Y�M�۴D�M��ߦe�mZ�ߦO�o�2�6-�o�r�6-�o�R�6-�o�'�i�~���i�~�>E�M��۴T�M��۴H�M��ߦe�mZ�ߦE�mZ�ߦe�mZ�ߦ%�mZ�ߦ��mZ�ߦO�o�b�6-�o�2�6}�~���i�~��i�~���i�~���i�~���i�~���������۴X�MK���)�mZ�ߦ%�mZ�ߦ%�mZ�ߦ��mZ�ߦ��ߦ��mZ�ߦ��ߦe�mZ�ߦO�o�R�6-�o�"�6-�o��6-�o��6-�oӧ��~���~�9M��H�یP����ی\����یL����یH����یT���یT�͜��f�mF��fD�mF��fN�o3B�6s�~���~���~���~���~��귙��یL�͈�یP����یL���یL����ی@����یT�͈�یH���یD���یX�͜��fD�mF��fd�mF��f��mF��fD�mF��f��mF��f���f$�mF��fd�mF��f���fd�mF��fd�mF��fN�o3�6�g�6#�o3"�6#�o3'��~�귙S���	�mF��f��mF��f$�mF��f$�mF��fd�mF��fN�o32�6#�o3"�6#�o32�6#�o3B�6#�o��6+�o�B�6{�~���Y�~���Y�~����?�Y�~���Y�~���Y�~�=A�͊�۬\��J�۬P�͞��f��mV��fE�mV��f��mV��fO�o��6+�o�"�6+�o�b�6+�o�'�Y�~���S�۬D��J�۬H����۬X��J�۬P��J�۬T��
�۬P�͞��f���f��m��6+�o��6�g�6+�o�"�6+�o��6�'�6+�o��6{�~���Y�~���Y�~���Y�~���Y�~��Y�~���?��S�۬T��J�۬P�͊�۬@����۬H��
�۬X�͞��fO�o��6+�o�R�6+�o�2�6+�o�r�6+�o�R�6+�o�2�6+�os�6'�osb�6'�osB�6'�os�6'�os2�6w�~��9�~��9�~���9�~�뷹?뷹�ۜD��	�ۜP��	�ۜL�͝���������mN���D�mN���D�mN����mN�������D�m��6'�os"�6'�osB�6'�os�6'�os"�6'�os2�6'�osB�6'�os"�6'�os�6'�os2�6'�osR�6'�os�6'�os"�6w�~���9�~���9�~��9�~��鷹�ۜH������	�mN���D�mN���D�mN����m��6'�os�6'�osB�6'�osb�6'�os�6'�os'�9�~��9�~��9�~���9�~��9�~�;A�-K��L��{��y�te��?͜���?@<�g��{����;��������W#;      �      x�m�]�Yz߯Y��wN �`�W]��Hu�ԣnI�An�Y�"�Udu��Z�p�d� �l<�1�ca��������O���9Ԍ�5vg�9��s�����s*$y2����k'�U�.����m]�<$i48m����u�D��8_��jӮfA:��A4W�ټo����hp�M���W�{�h0������׵n-qT�Q:xڻ�lү�r�d����WÇ����M/����5��M{��.�4vw��/��bx�_�����h&� ��Nܭ�����A�wE��Eߵ��ڴ�i;|Q�7U&��g�ࢯ's�&�Ai9��u��l�ᓾ꺪k�0$Q2��|��/݄?V��e�UjI��%f���*�e�
������H��t�[�V��'�[�A��$~�N�~=��D� ��g��[����\/l����x������g�D��E#IE�;sc��H*Ijs�TK�ԺK3JtY>|��vM�qz+��D�|{W]�G�M��']?�}|�X��}�R?$�<<���F���m�Z{>�R��D�-�ƴ�/�I�@�MJ-�(NZ4<X�i�R�X�M�pp�����4� Nl%Sp�i5|Y�Ի�����@�h$�Ϛ�[�Z�tT���j�qC��|���I<��v-ˍ�A�i��jSo�/ݻw����B,����n�hR2Z"�nZ�U��A�h��bp�Ϫ.H�*�֞K@jS�%X�..ez�I��2�z<��6�ȍ�i���^2-��Bꑒ򶟻�ɼ��@�M���|�Mݪ�聅p����ו�h�k����7�U����[Tb��bM��I�� �FI�#�蹛Ⱥz鋬>�CY�=םR3)��_/n\����bl�e5�/4��LG�U-�>�vUwA�2[����5��S��G�&DR�U[5�W�X	��q.yj꯺j�׿)/N���g�{�0��#N��y� CӴ���]��ᓮ]K!�b�?ŁL��`��Ñ���16}��s]�{���d�$]�]�)��f�2��F����f�=?ֲם���ǺٰmR)E__�MS�q��k�O\�T�`*)���y�A�v�ɷrܒ�(�pͬ�j9�<2�IM.�-�G{�8�CJ�n�hf�Z�ޑj$�Ey�;n啴�<�bM�����T.ph;�G2�K7�j�N��2�P�j�ڡ\��>��ZH�Aa�L�|��6�o:���Lw߶��\#Z�� �|�n:7��@�4���l�2���^�e�^MW˿����v�
�s=%����W�~h�����y/	d�ҾD7��M톯�q�*�D����y�	�b�GR�$m#�u�%��'7����r�!�/-9���kbm���LB+�6��T�$�&��Ź��Y=�O�Fr�)	��������*(3�ֺ�����
��^I��n3��?,��k:Z�Y���h�w�N[�\V8��F�����kEґyM�Bk��N�L5�c��C��9��&zhl�k�D��xdఒ�&�ϻz�)sAbJ<vW���D��ڭ3�E��[�Hʄ�o��ǀ��rZ�����k
��,�}�6���>��q�����ݢ'00�Z#8t�+�/���z�O�h�e���nR#9��k�/���b>�<�����v��{M+��uh�˺�T+-J� �#H\lډ�q�Ԡ��0�nU=jܣ�2��wܡ��S��q۬�>\s��������inM�t�j6|&6�w���^��d�Oyu'�"&�� ����]�5��Bm�=6m�7FdRG�~������%�(�Pig/�e/����?r��U��+.��%P9�X�zR�3�z{Sm�u�A!J�|֯�R&gDb9�������k%[9R�]��������_R���&]�!䛛��L�����W
J�s8�ؠN4x��nAt��KK��w���DoC^���3+�w�����O��]#���Åv{,(��E�x�y��>�O����~���@��K<�j����<�̈́V�K6�J����kW�-��9n��v��ҏ*:�ʆ�{ϑ_�_ 6������}�����7�` 	A���[l����/"�v�0!1��eEw�����o]5�&|m��T�?/�~�׫������`���<J����뿮��1䮳���o)<���}��IB�T����ji��Ɵ$<L�?T\�ɑ,��_�,u���i�*!���WwǦ[��a�)�j6d�������������e���v}�κ�o�вu9��@$��z%��hs�1&��Y����☯��lBj��ͺ�_�/`��E��̇���4�d�V��Uj��ګV��]y8�:�ʼ��H���}'����D����Q5�%�H�Dnn�  `@�KKp[a<1 �X�ϵL��ɤ6u����W���!�W�w��E�oHiJC$��멛<:�}��dSO�XL�ּ���>9�C�5G4�m��yd�B�uTLF�܃�8%�sҡ��O}V�⋖� ��L�US΁���x�.y����i�?v�[�)| KR77�h\���Zt
%!����W�=N��F�J/*E�F�,ˋ3%�Ak�:�)I�h�DK]Y�ĺ�Xjs�+��:|q԰���7�z4�����Pqg�%h�<���_��`�T��D�9�㻶'�<PuЊ�ܠ�B'=���*4a^eCc�qų�k7XF��D����j|��~�*(���j������n���+Ұ�'���hٞv(`IX3|�n��֫j��W$�ZY'6����rqi���Z�����F>i�]{ �k������3��9���Ȁx��ڪH �h��ѵs��u@�K M��q괞�Fqƒ+g.��\�]@�It�G4� �w�$��Rj!��#]y��1�nwwh42��ۛ��P����������CP=�Q�Q�!���! �t��(��r-������]hHk,��6Ռ�^$�<��`���ԯ4`���3#�R���_��h��B���<aۭyMipMK:���m* E�85�U�\�ż�`h(D~h܃F��ّ�]�PM��˕FQil���=�'!,�<|\+G�����0�`fԌ����G�I��ǧ̶
�x���y;Y�
�g��DOc3��j:|D���`�Cɣ�n�+T����?s���)T�g�.�~�k%�&RBy�gn����r��N�~�}��`��r�шd�d��H�,��dD�f�Ź�����
}���,���>qJ�+�aV��?AICC�%c ]�����eD�N����1݂�Ha&�+���O!��n���KlQ1��HrJke5	��H�]�٥ҫ9��g2,i�8s�$8`p���ZRS��j�i�(�k�U����_
�WL��{I�i�v��OM�|��4��r�
��g�T`�]C--�F�W�]�ES��Р��*�n�G�v�s�¡�3���}��Kq��C�zOߑZ (y�C�OMWs�&1���W�4 ��ғ�ov�3Zf���r����DV+�=�n����U���pPf��H6SH�E+Ⱥ޴?�3�+�cr�O���<�b7���ÜTU��M-* ϝ������dH������F��Z�V�ՑQ��w߮7
9�����iSn�MҮp��sKAA��	O9P�k�֦)��[��&��=�^i�V+t�
�D3����#Ac�Y���jC� d��t|��o`鶦��i���o�X�h𘓹�q�u�{�����ʱR[V3�6�B�c�u�n�"�v�5���^o���6��?O����?z�9�T� �$+�BH
$�Wp�1�q=��Z�Ŕ����>�5�q;<��;�x����-"u"���u����@���[��m��N ��N	yHm4��(1���ߞ$.G���}��O���H*{!k���t�XO8��+-�T��9����\PD����s����Ϋi�O�Vj8e�eJ\�XX��!�ꤩ�cK��ѕ�we!�O�n��5�L����8h|��L��H:��~���7��+��d�r�<"6��p"�ծ1�����������h�    Nw�-�d��3�?�����P)9��]jVP�ï���I�,l�_��|=�[����� ��1C���N�I��!�:��Ga��Kw���N~2�"����2eM1 N��j:r �|���Gu!-�Y��"��@�e��Ë�F[`d3�X���h�Xù�o����1�iIS#q��<C��t��Y�2C/��N|Qo�ؼ-��+��	h��@
���GF�K~��(�@�&�����QR�:��!6gT���=^V}S���d�Ř9��l��W<NR���em��h
��TP�[��r�e���jո1�5 ��y����5#�%MhƱ3$�q*��,�$S���P-W�&Q�P�����z�
�z-|�py��(�U'�ׇ��Q�yf@Q�,7���Q
	����6(IOG�ĝ����f!�=�=X����(�F}�.����i�a=rK��IU�܀E�D���V���4���l�h6�������)3��G�GO�n�Ϊո]�D�vV�ޤ�� 	�Yņ'��$�;q�<�]U��i���R\o�PYjfu�~��NZݝ�C�GBj�� ���
v�]=�V�λ��Z�d����P/O�y��9y��z�p^/�/�Z����ʶ+)̔Ϗ���쳮!��D��	� ��?��d\L,��vT"H�,�?pҹ+�M���J��B��
@澌{]���*�����^�Ķ��t�3�k�ܣ�}'ど�!2���0�1i������[n�5������H�E�<��?���L��N��vSK�<!9?�U��|x"�$�%���t���Qe��B�����P�B�ڇ�v=|����`!���+`U﹞�~�M�3���h��p��ب)���c.��rwa(��>�f�aJ�c���/��A%(�m��w�h���]{-0X�^j:�/��2�$
���F���]��i�Ro�9&�����z�ݷ����բ��n�����܍)�t6�»n2e��9�(=w-��\�Ć<�{&;�T\}ˮ���ڪrIt�a���)�"�/عV�"�����c�>D�S��/��a��!f0ΕCM�T� ���5���Z���44 B���R����
�6*J �>w	�HZ����g�ß)��A^���7��
�8Tx���,�܀�V2��lj^������l�n6��ң�9�7�6U�3��(�?ï�v�V�@�����j}ZY���ùd�n�VC��]��RH�k��-%�ȶ9�Z����ۛ����	a#�+�iB�S�1<��uI�9�Z/��<pUOccK_y^-�]}��V��>��Y`�d�ʔ�[_,���F�J�j�z�`���x���{�b���ɴ��'0��R��G���Ȥ�;.��A���P�<-�	o�qqcjDU���w$��r+%�r�w��b�=1hx\������	��ײ�y�-���!�B��5���K"ۀ��mHB����\�z�3'�d!�N�5���Jwm7�T�'��X�Ws/��ll��#)�Llƫ����x�pd����fW�����=_+�QD`���f�������.�Ih��5�8��
�J�zc_ı��󂒴RJ,���O�U�(ѐGV�D���z���TfuWu���{@w%��I�&���Ǝ�mr�����i~!n~%��ѰQ��C�N�s+�qXC�
BX�a1
}}���<��ݒ_XK�q0�1�c�FPďi�3����Oc�^�O�}�[v�e���'�кF�ԕ�*<h7X �*���Y^S���p B�`2�}"�۱�8�6!!Ry^���0��*/}5���hRM$��4�v��R���v-򭶣���S����~�-��׻_Y�|��̎JG��g���<���@mmx���4�e����v+�H�;��7�f�U~A����XS�,���9&�0d	�˙����zluZ��ռz�a�����N�7 �D��oA��lx����^��R�#���5-<��D �z�/��(�`���z#O�YRȍ<��m�������w� �M{�j���+���&�O����7O䐔Lyȋ,�Q�����K�5�gnܺ��$�8g:S�QPr��3�y��b%�:��VX�B�"�f���@tNմ��Qt�d�r=vO��2���q<͑|_#�u�DJ�+�ѷܵ��ѣ������ �*w$��MK��j��"�9�_��؃�ar<r���i��h�����\ ٷwa4��z�ݶ6��%t�V���� dR��r�&���D�J�A#�t5����bSQ��4Z�Y;�:�A*�S���-�UN���-5ݯ��f��(� �_�mt�l��hj� T�^Lz*�g�Gz��Lh`�S��b施C�t��J45Xx'�<f��	�V�'����ш�瀰[<Tj�������l��u+�"���1O�5�5�P^�M�]�[�S7�/֑A���qm
�"��jE�������U��ݦP�O��B�ÿ�0�S��6�Vvii�q<�g�;���	}r����+�M�Шo0�c�)_���9WFFtb���6�r]u�~��	��^o�]Eڏ��>5��ja
� _cj����3S6������z���)���q�u��)�u0�C�M;|]S/L#�� ���M�J.>�{�w1�q���[_WU�"���z_�Kc�]�OV[7�W4�Ty�eҢ�u5}����[?$?�O�����`��x��4���A����V�Qj��r��Y�ӟ����j(G��:7֯��ഀ�M�40JF.�,�bM9�0�2;��B)&�!BE5��u���|�W�������%��C���La=k4��D,�:9���B�m��o6�,U?�pY$@��S��̷d��i���Źq�T楑tV�B%���K���I����(Z{,�\�G�l���0�>k�|�tY!��6Q�$�l�r�^J�AU��\�����Zܙk-�H�����d_���!���E]]k�;R�i��ѓi���V���(����}��))H)?_W���pGd��������J��4�U��yۯ�?�1��J�=M%Po��R����
�0� Z�K����Zdf-۬�捕�}?�p��H��(���M���F>
�HS�h>���K�~�N��z�������)-�����Z(BS�W�ȩLDb^O������Lsk����)�K)eH7�d˻S'��
�AWkZz�uʗ<4��Y
� �a,Ws^hMģ�Cȉ�-l�^+�*��q���r�U�W-�����sx����,��۪��H��&��>�Mi� �k��8��1��Ӎ~�|�g⛭��#�F~Q�/j�0������L��Lj�%_Q����� ���C)-��>��QR�
<5(��7�:F���mgl{��+�0~��?��(�"k}hx���I�?���TÃ��|/d����r+�סBX˾�u��T���Ld��g�Єcʠ'�`�H���W7tMòZ�bA�cz�4y}Jx���G�4�S�~�9�5���]*u���EU:�.�JG���T�V\��fT5�Ͷ�up�*���|-��K�a���:�6ý���cGϲ���|�Z�c�����M������bn�ᱥ��S>��z�R��B_�Ă/��r&k'��-"��7��F2Co�[gʮ���k�*�gX��~�ȷ���JA���"�`D�^(7����'�bA��C�
��yw�Q7S�C��݂A�Gfm�ez��`���n���lq�����v*��ƀ�V����/�ʊ`E��H&p,L�`sND��b��zz�2�/�ޡC7m����t�?����[
�̖.!*m)�
r+%.iֆy�~�Ĳ�חm�^o���aП������E��.C�,4���x��Q��Y�fB��:����{�E#�f3���ŕ���t�%#��@֣��B��4Hj��гZЬ�0�.�&|�\Vڐd�B�tW��6��b��O+e��#��"�.ӟ0H|���sE�y{W	�j<7�Kz�Ӗi�'�ʃ    Mcln�'y�q[�,�m���施��ԥ�{jcIo��}?�y⦲=o&�<QX�}�80�Yzf��՚����n^�z怩���4���ԩ-�����
I��Ǝ\�h}�;H���R_8�忘��o�s����eIP�Ϛ��,�.��ٱ5���5�uʗw��
Y�UP�^���Y��3�02��L<�w����e�+�@C�DR���.$|�l�2�9�$7J��9e�Y�+ݤ���YۮV}�iؗ6���7ʏ��_��NT򶪺�X9��Cc��b7�����ܤ+Ҡ�M�ZFN�뵠.�'���*����چR3��.p.�X�(�ē��`��
+C�M?TX!^��@�ղ��7`A�T��	p>f��c=��FB�Y�%���lC?	p���%?5�X�T�%F����Y�wh������d���A?���ϖY��a�%�����2T鲫�ջ�Svl
IU:�1��.�f�?R�;O(5��D�a�0�d_5�t���ֵ�Y��B�uV���ȫ@��8�꺆GΨ��9�=K�`����}ٮ������4�>�᯦QY�O��?)m�1��%hӣz����ҟf<��g���ܐFa����8f��1h��濮(��V�$x��q5�@��H�Z.􏇧��b��X��m��6G�������w�0��3�'����g4�h�1W��)H}s+�z�~�63_3��0�־�{ai�����u�s�W���M��r�z������;�Vr���9���-����q>���U����J�Րo���R��5��aN`���N�$�c+i�����|��"��<��b��L��lR& ΁�����l�E� ������,����7�n�5��G4{��A3���Ғ�0NF�t��~]���?�|�	ќ���)#w��D�>�WܖZ=N�4����������nF#<��bc;@���)���A�WmMO9E��s�˺�r^#ȁ%p�r^��19��ScO����
R�����~B�$�L$��(iʍg�m�G�nD0�  ��'���V�E3<S��X����l�܃���)5�n=%5�*���
"w��o� �C"�u��v��xm4dr�����E?��x<Gt�g��ѷ�� ���w��?�;aNh��iXSf���bm�9�<�;
=��]����paUO�5ݳm�<��uH�G��6k?��jA���ѫ'ո���svW����l��&��h䑫���2"-�V���c�/]�n{N=BQ.�׸N�<�Pj A�X��}��*:�k8@s�
��h��N��f�����y1z�Ɛ���g��rY���>m�1w۩T��sXՐ�y��7�A���/&5[�I��1�uB�&~�#O[�j���٧DY�B��ړO�r�b�$���O(�i07�62��{tr��u�}�6(�
?r�9��3+���'�]g �C�u��!�$�q6[����v��4S�#��WՖ�.'K/�ٳ���7[T\	y\��I�iO� wNɤ��K��f�g�e��g�Q5V��}oJ�����r;I4�b,�qF����}�p���>��9o��g���Bñ��o����:^�n�ؚ~W{��B�N�{�US>4/|��4��zYI#��2%ْM.��rN��=��Ƈ�iƫ��/͚�iޙ8�9��2��[����
g�`��@#�D�$�t��T 4o0Խ�z���<�
ep��ර�`j��>�<'/��$�cr��J������NC�5����t�͖V>���a~�_��kxq YR�z��򃱮�F%�����Q�33�k�aV������M�-?�v���,��k���
RF#�o�����JoAz�	b�.~^/hL��,(�DVT8��/F��M����>�)E��8y������l���Qp�p��7����fSτ�����i��T��2d_�S��%�E��RTX�@�ؓAE���t���H�"��1��Sw�V��N��c���V�kX�d�}�ă��n������ݖ�L��W�u�P#!�����S����<B�G����8���`�����3�y�0Zp�lOz)Ϥ���0 �X��֯}�.�}������ȭH�򥁾��^,�+^W��o$�O����Hr+��j-���}��]�щ~�	���������=�A& �Uf׷�
ʇ��m5�S�>�oY���yXH����u~�o��a虲r�+⼱��"��|l�]�7ֆL5���L�m|��U=�]� zE�v�J*5�c�����"�����z�ņbKa�e�S��W�9|"��&�h�����i<�7��#e�jACdMa�tM
�)�9�6�-����-,�o�?��EJO�F�?�nPО ���x�a���G���K���>�NA�^T�Fk�M����ci��c��M���QHV�gO��^l�
U����Hn!�����������].�s��J��ǐ��,F^t�ڡ����¼���\9x[����#�R�˩��|)���K�E�[j�4����+��ur�˶�BSH駮����e1|*c��d`l��no&R�̻bX�c�q�����,��+��}�`i����gƁ�v�Oe��JH�=�l�!-��ilh{^Oe��ox�hK�M�#`CR$:ܮ7�v�������z��V���w���J��գ���~�o>�r��]\��X���`�;�ؾ��@QO�w��1h-�L-�pa�6��,9��E
��Ef�C�Uv��¸V��'��K1m����*�Rc!py���)X�����k�̵o�>��;;�^h<�EH��r)#Y���������Y���k�#�9���N&R���3���>Oj����(��D@O�'k#�5Ye��G��q9� �a�u�����)T��[��+����90ݯ{yW�T��Q=w��%Ψ�����{w�r�L
��iݴ��4�Ɖ	A�fA�R�X�iCFBkYN��hN���M�0�R����:47��}#As_l���TO-9��ä�qQ[k�4p���vT�_��x]���(ǃ�#;
	�t^o6k|�\��q���l�j�(i�����nj��3zc�4�?�"�����p�lF��k4�4�#������ed�Q���	>T��c����FA��TC���%��V�ɾўf�N2�k�?��T�]�	�����e�$���}ئ}��:�S�����}%	�ZYǯ�'�6�.�D���|U\1g���;}ߞ��|͚�|%fz9��.�7)��j,�������jY�*>�X�s�{����6F�^�Z��X�6x����{T+`�9�l��߰��7H���xS5R$��P0	��J;ہ2�9;�1��/�c���k-�F���9R�&N����%�	�p)>۲�7�o��Ж���A!@��4�o��S��uO�p┣�%T�����t��v <�޼��6�'��d��ݠ��>�c�Va���J��>BN�
�Ė,$����_sپ.�G~B�e�1(`�<��-�R�7]Ϸ~��F�oa����c���֢R�A�c@���,K;��_�@h�az���/��|�'���=��~;<�{�P�Ė!�P>�ᨶ��YF����BsO�)
��C��\L����?��+S�=(��]����\�}��V�X�����񱢚���hqڥ.����[�%أ�4/���{iGDh���r�U�9�2�]�`�Ū���6(Z_��ȼo�K�u�>�k*%�9�]�ǫ��3��r�H���+MP��N�V����[U?~R��\X���T�?1q���W<���o�l�{���a�&���vJ�o�m|�
z]�֪A�-\pm�e�?��ri�=�Pj��P\���i�F�w�.����m�"�'w�!��x��[8�c7�!�V����U;�Pŏ�(��q��M�������_/�}���Z#��T,�����JC�%�p����/#k�S�(5?I�Ҳr⇟QW)b(�Y�tYx��>�����(��u��ŕJ�*WldХ[�����9�4ϥ �   ��B;��9����K�n�[�Jc4?���,}���l��˰nk�Ҿg���,]G	�t�M�]���8O� S.K�y8��>S�k�>�W����*��A������6�7Dj�=T���z{�6w�m��O� ���!��      �      x�m�Kw۸�F�ЯШg�%ăCǱ���{S��˷VO��ՑE���~}� ))�(�x���PaV��ҔEYL�٬2�F�Ҝ^��3��Xsq�oc��2W�u���&μ7o׋vc�8�f�ҭ���jzQ�LYN��h��jk�0��C��6����)�Im���b�lM]2��/����y覥��z��9��V�r�j�g��KK��u/�zz��V���s�2��̰�����4��2�E�l�ƇI�̼2��`��v�n�V�D�	�Y=솯#�Hf�Z4z�͗f�i���vڭ��h�m�����b�8���֦����Wi����9�C�y˚����2��t��x0���f՘XLJo.��dz��6��T��ُ�u��L���&e4��m�6���bܽ��lªo���z��)���|���k����\t�o�O�>���Xk��v+S�27�����\����:������3�Nl0��i5����em>ͧ�p�jf���,@?�T�^�҆UlX�ܬ;ͩ����TŤ���9kC5�����:�A���Ǐ�&�mA����9�ܷ���k�ドq���vǔQ2W�5���fۥf�4�ժ�3�w��[�6��su��7��$���^s\5q�ܬw7o�~�N��u��eTD��wd���e'=�n��jVِ/�����k�4���v��l��O<z��o^Zi�g[��Δn�9��O�Fc{m�/%�o���h�������������6��6	36Lr��E&����qJs�*S�j���bd���$T���,X#�
h����7,V�U�IYY<���$Dsw]�,R_5��\�lZ�`��܀c�$���w�K,L}�R
�I��ě�o*Dح��ٙ���״�@S�[`��-�.�I������`c��u�!M�[7���I��>���M�k���o+��y%�-�5�iy�%Ai�g��c�2�:�!���E4�!�KIvRc���V�վɊ���Bma~��bV�E��ښ����+������	]w���=�ΰ���h��S���������iVӃDoHWahs�d
f�����g�� x�wj�ַЕ֕>:�Q�ڞ,%J-
��YM��p��_�tu�lY���:i�H�{D�������4
�<�F�����g��dE�NM�9Cr�U>�`"���@���Ԭ�~,�XuR���V`�Pz�D�6���	��4��F-,�h�N~���o�y�l2��F�W���i�׋�NRE��]���wQSX���[?�1<��3/����uqo"M,䞞�U��y�A�VON�����՗۴nx�H�^��W��Iks�HD� %Mqw�u!��S	�M�5�V���u���T�o����l��G�A?��9G�����;7���[y�����B@Ļ������I��{/����-f��{��+���$��B��d� ��9$�{�a$P��c���^�z\����]p�E��sS1�{�lxFP���*=Y~�gY����
�{�{^x=�c�n�A+���RP�{�9w��K��^�ޫf	M�V�5���}.�����dW���!`p�1���|C��'k�� �Էx�n���!�9���.�g 9���#�,�ld���C�B3�����a��򙠨Lߌ����z���.`}��9��c�����!���A�*~B�fR��;�h��o�v��� m)gGQ)�Rn���^;%!����	2%�~��H*����;SB��ߋo�9�dN����8�M�w<*NF��Gp�i���o�d\)�z����j���m���v�,�у;RhRjt��v���x&�Z޿ၧ��;�^Y$Ǳ^d2�`��� �����r ]�:�v���*�v�s���DV	�O�2�>��H@��v��n�qP�ROu*�,!���� ��A����(�0����/���=�J=9<�`^jŋ)4�&(�x P�b�gwi� :Gk�z	��O@�, �	��^�T��,֋��ZBf�Z��St��.8�EVai��K�<zm �>�4��j^#�eZ�ȣ�!��uG�*q+]ޒ~Q���p�J	�oH.��z��0-�i�n�u�D�����u^�e$4��fAe���6YI�"a�L�~���Y��'�)�j+��"٥'�µw�4�w��	2+�I��#Q W��Qx�8�������e����!��1qi	��T|�AoVi��F������|��n��اaȈ`}�l��j�%�3D�b	����ٴobu�_e���)�U�69esߥm��'�|N����n��a	��; �_��Rz�����|AOq N�0^���@��<�������D��CN�:��6��%�f�	/�:� ��M��I�\������;+�t�|��s�(���8O))��w���ga��L�� Z4��ۛ_k�:�XE�)�|�AZ }�۟);�W�?��m�V����l6��p+���~�֪�7[���1Au����������C��Q�zv�>�TN���e����[�3��N����9c�y��>Y2�>*)kY0�����qh��`��`e� ��͗Ų���,�ΌQ��T�A(1=o�%,�=ь��f�f�%���x"�c��
T-�>Ynϩ4`^_z7=��H��/�Zys�������vB ��.T���!5z+Q��}Y(�a5���Vx�O6/B/V`�j,�Tz��I���{,�=��xU���S�jK��4����]oTu@~ ;WS�[y��i.%a�Mr�����EXh����T����F��h0���j�X=�M������b�`�h��+'I���E�o�, �H��e�'9����2	_�^6t:�&y���w��R�_+�"7�e�k�n�7�QIM�un�,L���ɆjXG�f�Tِ*�^,��]r��?:�lH#��8zW����S�&j(��ݷ�U�V�*��e�X��zD����I�=���MHV=O���+r�]az����s�F��
_�8N&$�I��|k�ld! yT)&`>�~w�p��^��l���>��I*���m]!k�T�X<<��#�~�Y��{�'��
$+���R�JXn_� 'n���x�X���GmX��G|
8������rV=�Jay��;y���yaP,�ڂ�[�	��cyLEf+0����s�'��Q��cq���2�b�M�纯� �M¼��(��+��{)�Ue.�2g�<���B���RFY��I*�(Ð�i�y��*�0�$�s��Fi����<��$S�VA�TlTR���'U������)J�1�f��v����+	A�c�#R�d���N^ە2��o:�_q�Bg�h��tރ�Tm����t�yfJp9������Ŧ+��ٌT����©V�A_�~�1�)�T�T��+T��;�:U�/?�Hc�sG�e�0�(&UX�k+'_A����Bv�Z����H�~�O�k���l��
"'��T�xr�]��r;AV��UM�絣�ԑ��Z�{��~�波�
(�Oy�(���(�S;�|��کA9$[�v�|z�� *�]:��ח�o% ��:U5��h��*�~�C�EF��C(��f)HT��
cB���Ri�� &�/��5 ����ԕ2PA_]��i��ާ%dľ<'#��83�(mz�-���{R*�|�.��t8��Q�$0�����5�Y+a����&&W�_�Q[�a4y�;�8� NO*�dn�J�D�l�W�m�S��p�0c�S�V����k�����L_����!9 77�i����m�Iz�
�ݝ�B�N(�����aMQ9�R_�1��t@�r>�?�|^�ݺ�)_��Qh���!9�L��vy�T�t�"�o_SMҩ�1l�S9�}HU�jSj����:p�LKDN��#�>������;���sԌ}���'��bpgU���P�\N�+�p$}m���+	ƄG
�w��t����aV��s�B9{����և1��t";��.�q�ⱘ�~,߮��=8FTx|��P�_�-Ku�?:��j��2}}ړ̩��� h  ��Y���Ʃ�q]%]U��-5�D���8�x/�8�Fߟ6M;�C���G��9�5)چ�<�"�T�a-�1��%krt��CQ
t����-���Ձ�+o��j�:��F�{���<�a$�3�N|�R�f�lO�� 6��� V���1%"[��G*�K�F�?uH���ѡ�Rv�����X�gÑ��
2�����<r��e�<����y�>I6��rn�lfΰ,�x>��9�܋�p�E���r-q����ȾD+��Cp(}Ց`���H�:'���O�%+�c>(����:����h���r�?���8٭S��g*�;:\�/�����Γ5f��K����(��ǃ�tB��{�|���R�?���4DF���2�xvoy*�a&W�'�S��*�bd����ϗ7��W�b(C�$�M���੣:�]$���a���{�>��2Ux�w�_�U��HIa�I|��U�#{9���pPd�V|��H�����ҝ��ӷE�6~�����1<�&M�0�-�ʘ�	�����~����z�y�+z�}�s�7�,�	ކᨁu��S	v{ؽ/��t9c��=Љ�S�~�g��c:-`���U
P<���jK`6�N�� {h_�u�ZJ,�,&�h�`u`�-A>,H��[�uH}*8}���`ϻ�8DS��!
�3��
�r�Q�S��#<�V�_��؟A27wp�p��g���^F��y�^ "�uZ��ju���}-����v��V���MP��m����v��R��G(��P�-}F��ѧ��	�>��e�x:#̕�E�=�~���~{bE���Y�SL}���@�"�T�f>���� ���q��v]ݸZ��*����T�v��{k�������u�n��P����dV�4����L�.���dT�� e�˟������se��$E�Ǣ=S����`������D���������L
f������ ���c��2_�B� ?%F'�	P�wcz��!)X��O���p .U����� �s��VE/�4���
X��"�y�. YU�Δ%�s�f&͓*g����Ɠ�Tq�G�n+���>�����/o�Z�]�ʔ�u�!�.�lVD�I�v����VW��SK?$����B�R͢�y{a�� ��6�ѡt�P{Z���|6ǲ�ti�� �R1��窌����,(�f;�>�t�61�a��G�m�f�h��1ǘd+�	�x8���`���HU�R��r��u���_FS���Y��x8B�~X��E� ��tjT�j��8O;��V9}�z��@0��B�\��.��K��F���$��}�� �vJ8:E���s]a�T
�u4{p%�V�j�n�0������?����h]���辊%�	�<�Er�������5���}�KDj�/�V?R� ���K���y�T`+a�����r��!��#��zl�чg�!������2��O���nA��h�v5VG�nV�벚���\c~�e�g$V�=�tV���%.^��1$���&5ѣW*�l��r��e��%!"ޠ ��>F �cW�nƜ�H�pY7�I��l�i�}N��>�gu�<�>J:E�}�N�}�ēr訷�х![�U���hq �Ӕ�{�N� g��2Ȍb�o�y}����v���R0܏Eu�i�x6��CoE���i�r̦����:�v�d^���j�4+SS]Z���R��dE�K{��G�.����ě5?R��A���K�tE����]$��� GJs9������{h�Z��~���D�oF��#�~t��^�����-]<��:x_<�R�=B�ܪN"@J�ܪ��$b�jĢ���51]��":���8��W~ǩM84G�����|���zL�5��CW�����D���||MQb���E�T[�/�8��X,�����<��TT�zN���=t��*X���4��u�?������G>����e�o�xɋ��t� � o�hEP��ԧ[E�]o���8�!Ѽ�\��$Yc^A,.1�����'LW;�j�d$��3\p����C���w"B�?_��`��@@z�D��yL�<1ʱ,V)������?�"x�v8�)t��:-��_2$���>�qѧN���K��,�t�F��Q���k�*��r���n�bk�D��}>��.�ԲH~wI����{��ni��;r��.CTqRT�䯝n8�&��kDA_úr���q�=d���oHpm��5�N�e��k]�H�%I$�Sφ��Tf���X���Z񔆦ۛt^#$x(�����_S��W-`�7Ǫ��G@�O�H �WCj0ծRe��������tݨ�����u:�f =���u��z����J{|`����g�~s�(�L�N�~�ֹ�`~��O1G�A7����Z���O���/皺3�.yd��@���
�u�D���MFҿQ/�h� {�!�C��u��R�_*�-I���Ǎ���ǵR�W�����s�o(�B���;(z�O��}.�&��(��l�����P���*���7?/��ӁO�~�k�/��jd�<�����E�\��'RQ�|��5/����S�+�su����.��Ir�e��59�Z�Ng7!�VqCrP��*�]G@�7��W�x.�rT �7k����~��#x�s��C��������k�ܥ;��+�rO�N�ݟ̕L,��'�=��ҵ,6չٳ˛�Eo���� +0>�iW@yN��Dм�����G�!p��������3AK��W���������u�!�O��k����_j�g��]]��i*�W	�k�ܧ.��lU�w9����*���U�+b��E�j7��m��>��Fw����Q�����~�?�=�L��!�\      �      x�u]I��0<[�	q'�2��d�tyQ]fI$�5�8}R�Բ>���_���{�x�+F�ԑ�ww����c��W����rڿ���q���U?e�O�W|KS��'����W��}�����?���?i��ċ���m`w�+~O��'ގ7�x{�G��Z�����Os�x�+჊d�ć�_�W��V�5����N�$�%����(}@��yƹ���4�T�x\�^����N�R�'s��Un�����{��w��8��y�~B�cN�	OYw<w���������5��9�$�[�*w���f��M+��.>�����lع���x���ڟ��8�h�Tzl*�f�p���ʕ�<���5�x@
F���k�*g�7�� ]�gίK��​B�Z�+B�����Ik���-��]^����=7�S�J��)>O5ސ�R�U�|�}�"� *�"K{Ai��7\R��n�#�Ȉ��:�	uS	�P�hp�⬌��%g���2B:�XP/�1�C��l�g����ɽ��c��tU����cRF��Pi�r~���}Y��)�|@��v�UA|XRh�$Ja]�?NzA�rA�rK�ې~H4utB}iÓ�y�qUJ4��9��c7 U#��8e�'�˸�S��Ǿ[+T���9���'�b�*����`�V>2S��`�;]�2�Gn�j����\��?�]��*Uo�ת�hY�CQ%�H���r����� Џt^����A�Ս���}Zl����J������N�Aā],a��� ��B�C�Bv��|NA"}+F�j�<�+(�����r�����x�f�A�)�YxL�i�[��-`�f7�b;xHlh��rlL�ם�A�n"���.��JXy3�pp�)r9�蔁��=�V
+V3�
Bu���x���4y@?� V���(�Ce�^��G\o��!a�謈��������D�7c�(�D��;/jR���-0c�!��Vr*�TZX�$W��IY��4���
]�\�r+���[�K<��Iפ@��A�We�Q�NO�k��xmp
w�'qS����@E��.RV��!��MU�'��s���ԯ��g�zX��	���W���PZ��i�p�dN�c�����W�_��x-R/�����/���6�.N��'�vѱ�:J�՛&%��&��T��	�TN`s��Cׂ&q��A���v�x=��v�>��j��#�2Y�^��O����+�z�u�.F�0�8��]�j?w�}҆�B�P4��X.��Mя@p����ql�q٪�}�"V	�^�RŃG����ݯ}����E�j���+���,�X�u�l1C<uz��jUB��Ǯ<~+?BG�C_Tca�4d�9�)����5r�)F3�ث���%�䄞e�qV>ڒ�S�2Ǐ\Q�l�m�{��Y�P[�n�ьB��UJ{�=دy|
W�~�-�*���r�)b�{�C�R�W?F��j[�Ǧz��M�o�GUs�<��:_$�Wl(�� 'Cm�0:w<�Bm:{�i����O>����n��A/�q�C�1p~�#��Dw(hF�h����8|�9K+��E�yƢ�W�s�&&�|�:E�o�15S����u� [����Q�ߖ��� �9�����b<�����C��Y옌s��l���c�Q��y�1�h�WC�oS�W�c�dr����`��t�iv��%�<(UXE�/�Q-�M�#ء1�`�uԝ�q����Sh�'ƈ�V�p���lP���(75���TK�b��	r�&�:c��:�x�
��la��?\z5�,��a�g�3!�����1��X7㸆��S*M|�J8)h@#+���5ɜ�[���4�S���^�)�SEr,?ƋZd�� ����
W�(4܌�D�S����LI5�9l���Q���`�*���?�q����g�4�E$k9��0��0��K�h#�a�,9$��HRX"�J_G/�H%��|�䌈��0%�\�����c���~$$"�Lj>�h�i�F���Q
f�r�c��H[j�V�C��Q�&6B�*>a�盡qR�]�V�d�?+����n�� 
��%ޖ�6��	�<��&�SҦ�&��2Xm�t���{y��Ĥ�Ԉf��8��cf�3�\�Ř�MP�m{m��e�3`)92��O�VZ,o�]ѝL�por�q�7��r��7A�������z����o��E�A���Z�_j��KL4i����DT�y{��7�j���a`ɋݛ�x�%D��n�gX�!���+쭭�:��]�ȍ(5����ŋ����N�v�mg8CTĲDF��0�w��9,v�� qlȯDLۅ^��f��LPk�G&3ˁ��84t�P?|Z11�����K`�k�x�ޤ�Z/B>t���` 7�y��SEO
r�M��y�V�V�b�)�KD ���2Q�U�:x��e�RDU���S�7�8cp��u� r+�be��9b���X�~`��r̅&�(�V�O.H�y��tJ��a���-�.���=�w�	1
���J/=y�\�uK��Ÿ�1�$
��A	��aŤ�ʉ�ҟ(�R#�˓~<N\�J`!X2�v�Dl@�P�0	x_5[�3	�d񐹂�;.d(v��pZ�pߓ�,��<A3%<��&8�:v���۹v	1�ix��x�7�X��?�"�'	
�#}�8d=&m�c՟�
Z0╪�%>N�@���~�`��bf���$N��jl���7���*�Kv�hnX;� \;ŏ���;�5{�=4wc��J,;��G�����*!�4���a4���P�0�PE�A׷���O�;��[�CI�nI�ܵ=�cÊ�*T�d,�p*�Y"���S���+�w�˒:��wҗ�w�r�QP��;�Ҭ.0V�!p��"�$9!��Q��h9
H�H}ݎ`�Br*O(-�;՜2��gG\0�hC��ǩ_.�� �O
?���.�A'~���*V,�V��r�SH����p\ 8�H��Y���cf�C������1zxt����2*M�eI��	Lu��7k-��ʕd�B|��ܩR�;D*�����pL��P��=)���@��w�u35�uoQ��'��Ek$��q�h4�V��>qN&��H{>�����(Zq5�cx{��D�P��L�ܩ�@��j��x��NW�L�ʢo�b$�S脆�ԋf����_K�Q������b9WT�1����qX��J�-soԓzt�-3(VQ .>bx6i�� sT��L�� �h���ƀq������dFz�bW#�du��`����`}`�ڒK���P2�(/r��Q��H��ꐦ��z=%� �"�&t������|�0ɼ��:}��\�'SXPI�+ć�L^SW�\�5+����`��c��{Ȫ¯�u�bScs�<0y���Tm�Y�Bhq��,��n�������1�XZ{&�k�3l�K�|꓅8�ne���r����Ҫ�Bڹ �����aPR�WEɹ1��74�q��'�'_z29,�\Rt鲀�����
�^��-��
�c�3� �.��+������b�!��w�9�*�D�r�[lx��}�R�����b7)�0D������.T�30lM���uP(�#�k|�)}R��|�3�D�R	��̊m��Xe�����K�M\9U�W?�<����� b3.R���H�/I��-Rf��VW^���LZ������0U,]x�d��%;b)�x�$�E��Ƚ�Z��%^�u���:�*pʭv�2O�0�dx���O����n�`t+������Ǒ=����D���)�Z	&e���إ�ry�%�	�4+�)�-T�D4��^�e�,ې���tZel��وk)m�^�l@#U���K���(Q>dz$�(,��WW�B��p�ڪ�.�0����xnGq*�	W��yڥ1QàS�_qW���\VD�Y��ct�DI����HMp��V;��ۖۡ�PJ��0m�e������[�=	{!I���R����y��ݮ:��    �=T��)�
�t�L�'��-��HMY��ݩx���5 ��2b�T�a�oS`�3����иGeX�M9���hT^�6���J������+��j=-��5|d��������@N��-����G�U$�1��u֟�ڵR�K���"y�o�Ҕ�-qsY���޶�\��X�m%�@D�0��l�z���I��.����>���P��>�M)NdeV�3y7J�*`Z��<��!<ZH4.o�z)����u�&j����	��cIK�C{��N�5�ҟ!�5�bR�5��Z�J3��^e	' �.��f=/��A�KW�d�������g4z�Rv�2���U����I<aխsʡ�fm=�2VU/q���$(���-�F����er\Zv[�w)�%x�����Y#��|<��5R�u�Yڊjl@��b-*V�-��|��,)�N�{�7����MJLDM.I.�LB��_���y��J������2�R���x����4O(�x6��f�O6�<.�6�[�b�l��,���j��sJ�-�B���Bb��F�}����R�b+�J�Y�zj�Ż�H��o��O$�C9m%��*��G\�U��'W27�_�e(�]n[|U��2Ȫ����J��+}�*G��>$e��7uI�Kǰ��Vnpշ��D��՞|˲�a��\/1����D�� 8k�ҺB�%A#p)p�j�x�\ᭊ^��Pjq���E`�~�,�'�{�H���Q������O�l��tz���H�'[�X����IS��V�U�э��.�2X�(}Aw�?�0F�V2*q�0$�*�9�.�]4�Q-��e�B1K�^�Ĳ��*������Β�CQn�B�(K�R�Ͼ��w�N�:�d�ht��E�^pc�f����IDuM��+4b-|uxKSކ>CLh��U�
�T�1�m	<1�� s8K�S��p<�=e
����K�G,�Ժ�7UvT�c�������,�L�S��ܧf�j�"ڣ�K0�䒲P񉸠X�YUDW�Z����b�-Ou18a��t����v����"�@p�O�K����t0�4Z�z:�����J��$�x&���M�N�u5V�()5�V��'qWEڐ�"�(㠔�¶t��7�6(���Q֠7��5ʢ���*X�-��J��v ����f��������𧵪��z��XK��y[	��(O�Sm���.O�wB4R�+����-,(����� n�[�;�-@Z��,'X���B�h�{�u�QEҸ��S,�`|���uVT߲X{�U��j̒ҟ?F��"Y�@U��+X�F�Ga���s�fP��C�I�3=��-H��d�kr/�wxD���WObAy��$m	I�X1�F�a�u#�0��L�(�i�7/��t�v���HDЗ�����֭�d�M�8
�[v�YL־{���:�Ƅ���|r�+&����&	��Xr�(�c�u��*���\�]��#ph�:%�=qb\:�or�L��^��܊�t1V98IApZGU�K���tu��b6��.ؾT�M;G����+��oTkv"��[�$]�C��V��CRqZ�fs����ҭ�VG�Jkھ~ "<*��)q�X%~O|D��7��u+Ҙ �˫��(=i�,�Pe���@�>F[��I�>��pO"!(L˝�H�Z?,O��#�u������j���pi�%\Q,Ӑ�TV��O+1iQ"rv���T'�)���SN.jDt��c��VA��43��7Կ��A�!Tƥ�'�N�]�F-��샧�D���q'aD�wtq~�����Cd���8i�f�h`�_	�F���>�q���x���B�]+��G�z��+&��,�A�y�.��hW� ;8�Mש��|n���:�L�i �--�&Z�8�x*ebk������N���Mq5F<|���j/?V<��R�sL�h��(����b\3�ӳ,��J�6���G�N�5�*��k�����97UlM�`E��E����k���k�D˳�w5�埳fw��VL
�|;������%�p����y�'x��k���@:��JRA�P���?��S�o�ڬ��[�[�Ċd��T���U�cY��̈�z(|^�T�J9�ٌ�lD�v9N��9��M�PE�EL��TmϒJ�d�Q��"�tȠ�ArA�����XVS��)��zs.�m�pi����{Ɗd#���N�;�7�$�йXQiKң��/�QM���c��+��2�����N{>"�R���`Xb��|N[c��M��ƕ����Np��`Uq�$�58�`i�y��|�Ό���sN�z1�?������=��f/a9�ӈ�]v^}�N��H=�ؕ�޲��$R��[�O|[z�|FV@F"��:v�[�#Y�WX;��ZR����zv�c��Ө�b��]̪%���`~�1��좴q��K�wEWW���OFO��[�gO
6qK�	���+�:��Q	��6$Vp��w�������a���P砖/�u>�{s�{ɮ�J��;|��e�����!W4k��5Be��]t+Ƒ�7A{I��e�*�\8T������LR,�0�Zu͝�j�&ieցK��k||ŖP)B�ܩlyA6'2lk�~�)Z�K�@��K&�$f�g4+q>f�	����fJ��F��Sګ�&.�(���`%XFF��
Fߟ�)�C�1��*�(Zf�3b�K�U����&���W}�@�N|9qUk��n8x�Nw�C�f����3���^�?K�S?f=���&��臁���\^+�7�8�T��+�������3��
dP���pCh����#��YnX?Z�,�������>=W4�%T/rZ�R��cOw���F*:�VLgq�?D��t['Z%�6iC�+M �cNG7��޲��v�}D67#��l�p��x��տ����;w����6B#X�G(���\Ҩ���H�J������D����kX/@��X�6�u���T����m�;9~�U؄�n(�GD�9b㎑\�v��Q����c�"&�I��o�(��8N¢4�LK:Rľ
K��T��%WI��v�-�%�竈��}�ܨ7�mWY��m�����d�$�|�-�eE���m,�8~4%���1,(,����c�:�>
=�|G�QJb֥��ҽ�O�]�1�ϰ�OU�G��Ƥ�S��b;\��r)�9� G�v�q鏪	�Ÿ}���r&�#����.�\�ĊbPq�U4�[±��u��۶�?�,��[�i��i#Fk�~��S��5�Ăi.�1�6�7a���'���;,���"���D�������� RG�;�x�ޤ��V,]2oI0<)H�XQ=��@
�}��[�_�e��'K��N4]�V�?b��u`�FI��eTA!��x�'��������ϒ�7f � ؜
��9(j�*D���bmp?���C\i>�z_�L���N�}�_Zj���-���R1���A=V�i�b:��$����i\�l:I ����G'A�Q�zsEb���Wh�g+\��㑹��U�X� �.!Y���KBq��i����)�[���qgi�`�d������D��6I{M8.�!;���H�\������˰Q�ü�FO�6u_�?��zJ�y�I��S����1�CiM�ň+	��O�m������X`��}�m5�����h�˨:*?�����8G
�c�aM�9�24~4x�dԹ$r��U\C�5����`|4�/��LG%͠��]����y̓�:g%�����6�z���'b$��:T��>����:���<)�����$�5�b���� F���jL*����d�x����F���_J֕$�����xNy0��i�R����ފ��y~�m׎�pJ����=`�z�\|��zG�:���ư�e�� iO�š�0,��\g�y�}�Ġ��1�3�??&��Ȁ� h�c�6���f �7Yg����[��W�4�0gwI��u�)ާd�`��y�ˡ��Sm�}%��8�s>��uh��9��R�I+558cj�M��yY���/�p|j߷�t� �  @���##F �{L���Y�qR>cX�R�Y �1��ŗ����O�Ζ`
<)�2�Q8p��W.��n� ��S�����iSܰ$���Qcq��ho�N>Zln��6�1��I���-H�N�l�[4x��9\<q�[��ޚ����d���y�Gڲ�5m�nyF�9Sf��%�I��0��nN�1�Eo�Z�'�ޞ��{@I�qO	aU�oIXa�Ǟ�'G��[L3o��Csj�2>�F�x<Ǔ��N�?m����I3�1A>�}�1�1qXRe�ɦ�F��ܪ��	��R���9�+�vս��[��5�yd�f�2�Z#��0�+��l�pN��?����/�׳|�>H�$�!�gr`�H��N�'�Z�� 2MwB#c��{h��r��N�EXQ�W%�ѸW�7Ku�)�C���֓N|���/�{���b��B�#ìӯK@M���}o�A�zP�*q�lE�M�K#!ռP]����+�-��.�p��~���%�y
�&��8[���퓅o����{�Ч�yo��+���_*#>�1�g2�)�؎���
�u��0n��!\g>�qE���=�������x�Cb��Ѐ�i��-sw�)�$�˩ _��n�#�֣t�p}f]j��^@gB�sbp
�k'y"����+�>�Km����� �J�,���W���,Jn&ʜB��#In�uq�k!Ӓa��=_�$��x䆈��R�$JG�fLU
��?�g�{+�����	����E�m���t?��I����ƽw#f|����"��eLƯ
�B��ꔕ?�EK���}D����4X���^DR���"�ڗxw�Y{�0u~c�9�[,���\2.�{/YԚ�/�t2,2GPƇ�o�g�ҜFD�E���`U҈�J)��=MZ+��|�o,�I��mÛ�S�?x��k��L#4�:��O�������$��&mҒp�h�k����F��몊�A��o.�V1u�{���Ƒ����`E��u�+c�&��V�QA<K��~����o�R��'f��g��	GetĪ�A�����i0��e�ƕXe�;_�G�״o�Y�p�@�/k���t���h�� �4:�����w��I=�3t��7�I���;�BG���s�W6/�:��a`t�����.�y!m�=F��^�[#t��ŭ�ײ�mD��TR��H@��N�w��+����i����B�!iݒ ��3�Bj��2�_L�*(E?��pOS{	Bawnc<m2��>,��8�7I��yVl������>���ˠ<E1ğR�����~�S�m�⨼4y	��wx�]�I�$n���hX��~X`5�;O'	�R\�	���w�����o �̰�\�l�{���#ͱ��A�]t)2p�Y�o&`����.^@'3��6!���*p��_v/f�ǥ�`��hF�{?zD��ۥ���gi���գ=��:ю\�Q��8��%?z�Y�V�/+�NGi���ߢ�����v�p�e�}��(��x�_=r��~�Ro&��$����W5&He�h���߭]Z|�0%\�۾���Ԙ�p��\+�W���n�NAV�$���A9��Ҵ�ڂ��۲A�E&jIb~�b�C�H���o���
{���`����I�i�$��6��,K�'���Q�o�($�U=u�R@�v��n#U�F��֤�g}����\������h=f;��ϭ=�����/B�~���Ӟ�B�����Y�j�ޮ��m����/8g�.V��:��w©o�Vĩ?��� ȒS����1NʠRDE^q�ݿ�Ej��i�8��.���&}|\l`�8%֒�-����s���l�Y�S����9�I�|�Ԗ�7���QA��>Z��E^6I��	&U�2������cPW���s<�K�C
ʀ�Ghδx�b�$�F��%���;�W[�t���y6���XU����@M],]x��M���@C�nsل2qCD��J9���*q��"�w~{��A���j��W6G>����dq yb�*;V4��S5 m���mx�|1�)�f�Ծ���Q�R�X<�[�����8�^��G6�+�yC���Q����7�D�ѓR��]�=���y�Ps�C��͋-E��5ĭ����f�Мf�����b)�v���E��B����7}$�-b0�;Io��?�Dq;�������o"s     