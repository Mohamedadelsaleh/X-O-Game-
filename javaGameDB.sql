PGDMP                         z            javaGame    14.1    14.1 !               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    javaGame    DATABASE     n   CREATE DATABASE "javaGame" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "javaGame";
                postgres    false            �            1259    16407    game    TABLE     �   CREATE TABLE public.game (
    gameid integer NOT NULL,
    gamedate timestamp without time zone NOT NULL,
    gamewinnerid integer,
    gamestatus boolean DEFAULT false
);
    DROP TABLE public.game;
       public         heap    postgres    false            �            1259    16406    game_gameid_seq    SEQUENCE     �   CREATE SEQUENCE public.game_gameid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.game_gameid_seq;
       public          postgres    false    212                       0    0    game_gameid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.game_gameid_seq OWNED BY public.game.gameid;
          public          postgres    false    211            �            1259    16396    player    TABLE     !  CREATE TABLE public.player (
    playerid integer NOT NULL,
    username character varying(20) NOT NULL,
    userpassword character varying(20) NOT NULL,
    email character varying(60) NOT NULL,
    isonline boolean NOT NULL,
    isingame boolean NOT NULL,
    score integer DEFAULT 0
);
    DROP TABLE public.player;
       public         heap    postgres    false            �            1259    16395    player_playerid_seq    SEQUENCE     �   CREATE SEQUENCE public.player_playerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.player_playerid_seq;
       public          postgres    false    210                       0    0    player_playerid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.player_playerid_seq OWNED BY public.player.playerid;
          public          postgres    false    209            �            1259    16418    playersession    TABLE     (  CREATE TABLE public.playersession (
    playerid integer NOT NULL,
    gameid integer NOT NULL,
    cell00 boolean,
    cell01 boolean,
    cell02 boolean,
    cell10 boolean,
    cell11 boolean,
    cell12 boolean,
    cell20 boolean,
    cell21 boolean,
    cell22 boolean,
    sign integer
);
 !   DROP TABLE public.playersession;
       public         heap    postgres    false            �            1259    16438    testm    TABLE     Z   CREATE TABLE public.testm (
    tseid integer NOT NULL,
    name character varying(20)
);
    DROP TABLE public.testm;
       public         heap    postgres    false            �            1259    16437    testm_tseid_seq    SEQUENCE     �   CREATE SEQUENCE public.testm_tseid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.testm_tseid_seq;
       public          postgres    false    215                       0    0    testm_tseid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.testm_tseid_seq OWNED BY public.testm.tseid;
          public          postgres    false    214            l           2604    16410    game gameid    DEFAULT     j   ALTER TABLE ONLY public.game ALTER COLUMN gameid SET DEFAULT nextval('public.game_gameid_seq'::regclass);
 :   ALTER TABLE public.game ALTER COLUMN gameid DROP DEFAULT;
       public          postgres    false    212    211    212            j           2604    16399    player playerid    DEFAULT     r   ALTER TABLE ONLY public.player ALTER COLUMN playerid SET DEFAULT nextval('public.player_playerid_seq'::regclass);
 >   ALTER TABLE public.player ALTER COLUMN playerid DROP DEFAULT;
       public          postgres    false    209    210    210            n           2604    16441    testm tseid    DEFAULT     j   ALTER TABLE ONLY public.testm ALTER COLUMN tseid SET DEFAULT nextval('public.testm_tseid_seq'::regclass);
 :   ALTER TABLE public.testm ALTER COLUMN tseid DROP DEFAULT;
       public          postgres    false    214    215    215                      0    16407    game 
   TABLE DATA           J   COPY public.game (gameid, gamedate, gamewinnerid, gamestatus) FROM stdin;
    public          postgres    false    212   E%       
          0    16396    player 
   TABLE DATA           d   COPY public.player (playerid, username, userpassword, email, isonline, isingame, score) FROM stdin;
    public          postgres    false    210   �%                 0    16418    playersession 
   TABLE DATA           �   COPY public.playersession (playerid, gameid, cell00, cell01, cell02, cell10, cell11, cell12, cell20, cell21, cell22, sign) FROM stdin;
    public          postgres    false    213   �%                 0    16438    testm 
   TABLE DATA           ,   COPY public.testm (tseid, name) FROM stdin;
    public          postgres    false    215   ?&                  0    0    game_gameid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.game_gameid_seq', 33, true);
          public          postgres    false    211                       0    0    player_playerid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.player_playerid_seq', 9, true);
          public          postgres    false    209                       0    0    testm_tseid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.testm_tseid_seq', 7, true);
          public          postgres    false    214            v           2606    16412    game game_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (gameid);
 8   ALTER TABLE ONLY public.game DROP CONSTRAINT game_pkey;
       public            postgres    false    212            p           2606    16405    player player_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.player DROP CONSTRAINT player_email_key;
       public            postgres    false    210            r           2606    16401    player player_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (playerid);
 <   ALTER TABLE ONLY public.player DROP CONSTRAINT player_pkey;
       public            postgres    false    210            t           2606    16403    player player_username_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_username_key UNIQUE (username);
 D   ALTER TABLE ONLY public.player DROP CONSTRAINT player_username_key;
       public            postgres    false    210            x           2606    16422     playersession playersession_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.playersession
    ADD CONSTRAINT playersession_pkey PRIMARY KEY (playerid, gameid);
 J   ALTER TABLE ONLY public.playersession DROP CONSTRAINT playersession_pkey;
       public            postgres    false    213    213            z           2606    16443    testm testm_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.testm
    ADD CONSTRAINT testm_pkey PRIMARY KEY (tseid);
 :   ALTER TABLE ONLY public.testm DROP CONSTRAINT testm_pkey;
       public            postgres    false    215            {           2606    16413    game game_gamewinnerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_gamewinnerid_fkey FOREIGN KEY (gamewinnerid) REFERENCES public.player(playerid);
 E   ALTER TABLE ONLY public.game DROP CONSTRAINT game_gamewinnerid_fkey;
       public          postgres    false    3186    212    210            }           2606    16428 '   playersession playersession_gameid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playersession
    ADD CONSTRAINT playersession_gameid_fkey FOREIGN KEY (gameid) REFERENCES public.game(gameid);
 Q   ALTER TABLE ONLY public.playersession DROP CONSTRAINT playersession_gameid_fkey;
       public          postgres    false    213    3190    212            |           2606    16423 )   playersession playersession_playerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playersession
    ADD CONSTRAINT playersession_playerid_fkey FOREIGN KEY (playerid) REFERENCES public.player(playerid);
 S   ALTER TABLE ONLY public.playersession DROP CONSTRAINT playersession_playerid_fkey;
       public          postgres    false    210    213    3186               -   x�3�4202�50�52Q00�#�?�4.#�R�x�����qqq ���      
   l   x����O�LI�R�F�&�E�i鹉�9z����i@h�e̙X�Q�����,$�%`�����y�`l���Ȅ31%5L���j�8s�3sSS`4�8Á1z\\\ aH=�         1   x�3�4�,�Lc	�c����iP�48(a�i@@��	.�=... xTA            x�3����K����� 	�     