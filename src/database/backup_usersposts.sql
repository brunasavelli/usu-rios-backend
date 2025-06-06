PGDMP      ;    
            }         
   user_posts    17.4    17.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16409 
   user_posts    DATABASE     p   CREATE DATABASE user_posts WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt-BR';
    DROP DATABASE user_posts;
                     postgres    false            �            1259    16420    posts    TABLE     g   CREATE TABLE public.posts (
    id integer NOT NULL,
    content text NOT NULL,
    user_id integer
);
    DROP TABLE public.posts;
       public         heap r       postgres    false            �            1259    16419    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public               postgres    false    220                        0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public               postgres    false    219            �            1259    16411    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    photo text
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16410    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    218                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    217            ]           2604    16423    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            \           2604    16414    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    16420    posts 
   TABLE DATA           5   COPY public.posts (id, content, user_id) FROM stdin;
    public               postgres    false    220   K       �          0    16411    users 
   TABLE DATA           7   COPY public.users (id, name, email, photo) FROM stdin;
    public               postgres    false    218   �                  0    0    posts_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.posts_id_seq', 9, true);
          public               postgres    false    219                       0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 53, true);
          public               postgres    false    217            c           2606    16427    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public                 postgres    false    220            _           2606    16418    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    218            a           2606    16416    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            d           2606    16428    posts posts_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_user_id_fkey;
       public               postgres    false    220    4705    218            �   �   x��A
�0EדS9@�R7�]�x�nb��H�����]ګ�d�������Eބ4���C�"�
S"L�e�qUBY?�j�5�E+R�i�p��N1וhN��HC�<Kj�3G���@3�Z/1S��d�fX�K@��KT��v�o�1��6�      �   �  x�mTIr�0<�^��%.���#��+���/#
�!���L�SNyDN��O��%�rbN�ư1=�Qk�KO�)y�J���U�6{�+p5�Ř��RN�2Fc�D]I�CҮB��A�AW���n]�U�3W����bO��|���V��C�s�;�]�%�<����J���S���+�xZe���ic��p�|����M�jcF�k��������#�T����N�h#�J1ׅ�j'*C 4C���*��|
�Ќ�Fg��3*3](�q��!�����p.���Oǉlf�H�Q:L�a:�$��ѽ`o}��F�sM�S��]��������-
��8^V����K��U��b�@BN-�!N�����㬤E�L��F#���7�5�Uc\��57�(�	;Lo�V��n�pI��
FAF�)S:@�1�]��:#&x������E�����~����xI+�%���z@��e�Ok��
(�^���רv��5�2Ů(�	�Q���� �w��_H�*����[�_ss�|5�����\hc�K�8
�Y�f��8���prT������B;��zr�N�����D(�8U�k��w�����^/�t�� �M�K��*�PD�0j��|@�q��N(��:�6�"@�����z 0�     