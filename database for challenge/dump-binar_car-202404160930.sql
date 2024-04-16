PGDMP           	            |         	   binar_car    16.2    16.2 "               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24747 	   binar_car    DATABASE     �   CREATE DATABASE binar_car WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE binar_car;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            ]           1247    24857    enum_members_role    TYPE     ^   CREATE TYPE public.enum_members_role AS ENUM (
    'member',
    'admin',
    'superAdmin'
);
 $   DROP TYPE public.enum_members_role;
       public          postgres    false    4            W           1247    24836    enum_users_role    TYPE     Z   CREATE TYPE public.enum_users_role AS ENUM (
    'user',
    'admin',
    'superAdmin'
);
 "   DROP TYPE public.enum_users_role;
       public          postgres    false    4            �            1259    24748    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         heap    postgres    false    4            �            1259    24793    cars    TABLE     m  CREATE TABLE public.cars (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    image text,
    detail_id integer NOT NULL,
    "rentPerDay" integer NOT NULL,
    size character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.cars;
       public         heap    postgres    false    4            �            1259    24792    cars_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cars_id_seq;
       public          postgres    false    219    4                       0    0    cars_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;
          public          postgres    false    218            �            1259    24786    details    TABLE     �   CREATE TABLE public.details (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.details;
       public         heap    postgres    false    4            �            1259    24785    details_id_seq    SEQUENCE     �   CREATE SEQUENCE public.details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.details_id_seq;
       public          postgres    false    4    217                       0    0    details_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.details_id_seq OWNED BY public.details.id;
          public          postgres    false    216            �            1259    24846    members    TABLE     �  CREATE TABLE public.members (
    id integer NOT NULL,
    email character varying(255),
    password text,
    name character varying(255),
    photo text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    role public.enum_members_role DEFAULT 'member'::public.enum_members_role NOT NULL
);
    DROP TABLE public.members;
       public         heap    postgres    false    861    4    861            �            1259    24845    members_id_seq    SEQUENCE     �   CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.members_id_seq;
       public          postgres    false    221    4                       0    0    members_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;
          public          postgres    false    220            e           2604    24796    cars id    DEFAULT     b   ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);
 6   ALTER TABLE public.cars ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            d           2604    24789 
   details id    DEFAULT     h   ALTER TABLE ONLY public.details ALTER COLUMN id SET DEFAULT nextval('public.details_id_seq'::regclass);
 9   ALTER TABLE public.details ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            f           2604    24849 
   members id    DEFAULT     h   ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);
 9   ALTER TABLE public.members ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221                      0    24748    SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          postgres    false    215   %                 0    24793    cars 
   TABLE DATA           u   COPY public.cars (id, name, image, detail_id, "rentPerDay", size, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    219   �%                 0    24786    details 
   TABLE DATA           R   COPY public.details (id, type, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          postgres    false    217   V(                 0    24846    members 
   TABLE DATA           p   COPY public.members (id, email, password, name, photo, "createdAt", "updatedAt", "deletedAt", role) FROM stdin;
    public          postgres    false    221   �(                  0    0    cars_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cars_id_seq', 10, true);
          public          postgres    false    218                       0    0    details_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.details_id_seq', 5, true);
          public          postgres    false    216                       0    0    members_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.members_id_seq', 5, true);
          public          postgres    false    220            i           2606    24752     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            postgres    false    215            m           2606    24800    cars cars_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public            postgres    false    219            k           2606    24791    details details_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.details DROP CONSTRAINT details_pkey;
       public            postgres    false    217            o           2606    24855    members members_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.members DROP CONSTRAINT members_email_key;
       public            postgres    false    221            q           2606    24853    members members_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.members DROP CONSTRAINT members_pkey;
       public            postgres    false    221            r           2606    24801    cars cars_detail_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_detail_id_fkey FOREIGN KEY (detail_id) REFERENCES public.details(id);
 B   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_detail_id_fkey;
       public          postgres    false    4715    217    219               q   x�U��
� D��K�����?���
���,
Z�93� ���NQ�"�̕�l�P/I��Ԡ}���R�6�gZ2pf?�O$�.�_���O	�w���޸=�f��xS-�8z�3�         �  x����n�H���Sp�J�Uէ�!�	���,6�h<O�匽�N��pBH%�����Cs�˸6/�v\��[ʪ�4��x��Y�y�����s~-ݸ��ҝ��s�
�1Y��g��k21Z�"�$�1Ԓ�Tߏ�`-W���45��<kzFn�z�=X����O�o?q�?�[<�����`;�P�Z�	z�s�=��f2���z_�x���F����k�\���m>�[lӼ�S|��92��=焜b�� ��4f��Ryc7�{��\o��8���Ҷ��(47t۬����v��Cn_�-._
�Mj��!�C�ʚ��l�3o���`�ˮ�/ �F�p*���Uڸk l�㶞�q}��ik'��>��c� W�����X,E�*c�]���7{.	|�E��>�#	Bo����	|���%D��Ư�����X9x˃�$F[�@Vڑc'Q�3x�?� �܁�ޢ��FO��?��e���8/��)��#AvQ�%I�aЉ�ˮ����C������H=�����e>d���uL-A��� gR�`�&�d`K-1���=�?�_A��:E��A7r����e�������%�k��"�GY�e �hU����pG�����;����z���')�"�4�1��	� r��B`��,�`�����o��Ҙgp��V�6���;�o����_[ o         �   x�u��
�0���S�.i��-��N�L�Q���v(H�Bn��}q�o��`Ij�B��ʬ�ŭ0d�U!eO��~k��]�{Tl@��̩,o��fו�T���$Y�<���g�VN��t��o�ޜ�8��1N��+�J��5e�@)҃��	�B�         i  x����n�0�����n4��Y
��V�;v�@H�h��'E�^4��;�HG���7����;Y��[Ŗ�n+7H�@p��N(?�ȝ�Qp�g�*ړ^��E7Lql�/�l����?@���%ֹ��Xٮf۹�Y~��u����Zn��1�Z�meh�}�R��@�	���@	�Q`́a�c� ���CE����
����?�!R��r��	��E���l�ɫ�"�2��Kt;F�`>t�vw�zύF�g+�R�/�<���9��)\��9�e�>������ٔB�9�
�ƁZs0* ���5~Z#�b_����Ro���ߧ}�|�٥Iz�a�w\����6���q��獁����u/��i�!b�dgݮ#�[�B5Y^i��N�ҊT
�J(�����@8�^�Jp�kB>F���>3y�l���W�奊z�,����xO�]�m-%��	��ĺ�vd�љ�֌���n���ߺ��3R�S�!�\8��Hl���iƭ,��k�B�/���m�y�"
��o<��ބ޷��������������N��t��\&�E�T��6 �����ئ
��O�L��ZC�sǧ�<0���a��Ė���S��`U��?Z�{     