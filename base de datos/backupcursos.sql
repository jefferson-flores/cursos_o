PGDMP  
    	                |            Cursos    16.3    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            !           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            "           1262    37077    Cursos    DATABASE     {   CREATE DATABASE "Cursos" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "Cursos";
                postgres    false            �            1259    38604 	   audiences    TABLE     �   CREATE TABLE public.audiences (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.audiences;
       public         heap    postgres    false            �            1259    38603    audiences_id_seq    SEQUENCE     y   CREATE SEQUENCE public.audiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.audiences_id_seq;
       public          postgres    false    248            #           0    0    audiences_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.audiences_id_seq OWNED BY public.audiences.id;
          public          postgres    false    247            �            1259    38428    cache    TABLE     �   CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache;
       public         heap    postgres    false            �            1259    38435    cache_locks    TABLE     �   CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache_locks;
       public         heap    postgres    false            �            1259    38485 
   categories    TABLE     �   CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    38484    categories_id_seq    SEQUENCE     z   CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    232            $           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    231                       1259    38694    comments    TABLE     (  CREATE TABLE public.comments (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    commentable_id bigint NOT NULL,
    commentable_type bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.comments;
       public         heap    postgres    false                       1259    38693    comments_id_seq    SEQUENCE     x   CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          postgres    false    262            %           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
          public          postgres    false    261            �            1259    38530    course_user    TABLE     �   CREATE TABLE public.course_user (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.course_user;
       public         heap    postgres    false            �            1259    38529    course_user_id_seq    SEQUENCE     {   CREATE SEQUENCE public.course_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.course_user_id_seq;
       public          postgres    false    238            &           0    0    course_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.course_user_id_seq OWNED BY public.course_user.id;
          public          postgres    false    237            �            1259    38499    courses    TABLE     �  CREATE TABLE public.courses (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    subtitle character varying(255) NOT NULL,
    description text NOT NULL,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    slug character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    level_id bigint,
    category_id bigint,
    price_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT courses_status_check CHECK (((status)::text = ANY ((ARRAY['1'::character varying, '2'::character varying, '3'::character varying])::text[])))
);
    DROP TABLE public.courses;
       public         heap    postgres    false            �            1259    38498    courses_id_seq    SEQUENCE     w   CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.courses_id_seq;
       public          postgres    false    236            '           0    0    courses_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;
          public          postgres    false    235                        1259    38654    descriptions    TABLE     �   CREATE TABLE public.descriptions (
    id bigint NOT NULL,
    name text NOT NULL,
    lesson_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE public.descriptions;
       public         heap    postgres    false            �            1259    38653    descriptions_id_seq    SEQUENCE     |   CREATE SEQUENCE public.descriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.descriptions_id_seq;
       public          postgres    false    256            (           0    0    descriptions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.descriptions_id_seq OWNED BY public.descriptions.id;
          public          postgres    false    255            �            1259    38460    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false            �            1259    38459    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    227            )           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    226            �            1259    38592    goals    TABLE     �   CREATE TABLE public.goals (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.goals;
       public         heap    postgres    false            �            1259    38591    goals_id_seq    SEQUENCE     u   CREATE SEQUENCE public.goals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.goals_id_seq;
       public          postgres    false    246            *           0    0    goals_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.goals_id_seq OWNED BY public.goals.id;
          public          postgres    false    245            
           1259    38719    images    TABLE       CREATE TABLE public.images (
    id bigint NOT NULL,
    url character varying(255) NOT NULL,
    imageable_id bigint NOT NULL,
    imageable_type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.images;
       public         heap    postgres    false            	           1259    38718    images_id_seq    SEQUENCE     v   CREATE SEQUENCE public.images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.images_id_seq;
       public          postgres    false    266            +           0    0    images_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;
          public          postgres    false    265            �            1259    38452    job_batches    TABLE     d  CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);
    DROP TABLE public.job_batches;
       public         heap    postgres    false            �            1259    38443    jobs    TABLE     �   CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);
    DROP TABLE public.jobs;
       public         heap    postgres    false            �            1259    38442    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          postgres    false    224            ,           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          postgres    false    223                       1259    38668    lesson_user    TABLE     �   CREATE TABLE public.lesson_user (
    id bigint NOT NULL,
    lesson_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.lesson_user;
       public         heap    postgres    false                       1259    38667    lesson_user_id_seq    SEQUENCE     {   CREATE SEQUENCE public.lesson_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.lesson_user_id_seq;
       public          postgres    false    258            -           0    0    lesson_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.lesson_user_id_seq OWNED BY public.lesson_user.id;
          public          postgres    false    257            �            1259    38635    lessons    TABLE     M  CREATE TABLE public.lessons (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    iframe character varying(255) NOT NULL,
    platform_id bigint,
    section_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.lessons;
       public         heap    postgres    false            �            1259    38634    lessons_id_seq    SEQUENCE     w   CREATE SEQUENCE public.lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.lessons_id_seq;
       public          postgres    false    254            .           0    0    lessons_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;
          public          postgres    false    253            �            1259    38478    levels    TABLE     �   CREATE TABLE public.levels (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.levels;
       public         heap    postgres    false            �            1259    38477    levels_id_seq    SEQUENCE     v   CREATE SEQUENCE public.levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.levels_id_seq;
       public          postgres    false    230            /           0    0    levels_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.levels_id_seq OWNED BY public.levels.id;
          public          postgres    false    229            �            1259    37565 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    37564    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    216            0           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    215                       1259    38749    model_has_permissions    TABLE     �   CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);
 )   DROP TABLE public.model_has_permissions;
       public         heap    postgres    false                       1259    38760    model_has_roles    TABLE     �   CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);
 #   DROP TABLE public.model_has_roles;
       public         heap    postgres    false                       1259    38787    observations    TABLE     �   CREATE TABLE public.observations (
    id bigint NOT NULL,
    body text NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE public.observations;
       public         heap    postgres    false                       1259    38786    observations_id_seq    SEQUENCE     |   CREATE SEQUENCE public.observations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.observations_id_seq;
       public          postgres    false    275            1           0    0    observations_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.observations_id_seq OWNED BY public.observations.id;
          public          postgres    false    274            �            1259    38412    password_reset_tokens    TABLE     �   CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap    postgres    false            �            1259    38471    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 #   DROP TABLE public.password_resets;
       public         heap    postgres    false                       1259    38728    permissions    TABLE     �   CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.permissions;
       public         heap    postgres    false                       1259    38727    permissions_id_seq    SEQUENCE     {   CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          postgres    false    268            2           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    267                       1259    38801    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.personal_access_tokens;
       public         heap    postgres    false                       1259    38800    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    277            3           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    276            �            1259    38628 	   platforms    TABLE     �   CREATE TABLE public.platforms (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.platforms;
       public         heap    postgres    false            �            1259    38627    platforms_id_seq    SEQUENCE     y   CREATE SEQUENCE public.platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.platforms_id_seq;
       public          postgres    false    252            4           0    0    platforms_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.platforms_id_seq OWNED BY public.platforms.id;
          public          postgres    false    251            �            1259    38492    prices    TABLE     �   CREATE TABLE public.prices (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    value double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.prices;
       public         heap    postgres    false            �            1259    38491    prices_id_seq    SEQUENCE     v   CREATE SEQUENCE public.prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.prices_id_seq;
       public          postgres    false    234            5           0    0    prices_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.prices_id_seq OWNED BY public.prices.id;
          public          postgres    false    233            �            1259    38566    profiles    TABLE     |  CREATE TABLE public.profiles (
    id bigint NOT NULL,
    title character varying(255),
    biography text,
    website character varying(255),
    facebook character varying(255),
    linkedin character varying(255),
    youtube character varying(255),
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.profiles;
       public         heap    postgres    false            �            1259    38565    profiles_id_seq    SEQUENCE     x   CREATE SEQUENCE public.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.profiles_id_seq;
       public          postgres    false    242            6           0    0    profiles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;
          public          postgres    false    241                       1259    38706 	   reactions    TABLE     �  CREATE TABLE public.reactions (
    id bigint NOT NULL,
    value character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    reactionable_id bigint NOT NULL,
    reactionable_type bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT reactions_value_check CHECK (((value)::text = ANY ((ARRAY['1'::character varying, '2'::character varying])::text[])))
);
    DROP TABLE public.reactions;
       public         heap    postgres    false                       1259    38705    reactions_id_seq    SEQUENCE     y   CREATE SEQUENCE public.reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.reactions_id_seq;
       public          postgres    false    264            7           0    0    reactions_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.reactions_id_seq OWNED BY public.reactions.id;
          public          postgres    false    263            �            1259    38580    requirements    TABLE     �   CREATE TABLE public.requirements (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE public.requirements;
       public         heap    postgres    false            �            1259    38579    requirements_id_seq    SEQUENCE     |   CREATE SEQUENCE public.requirements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.requirements_id_seq;
       public          postgres    false    244            8           0    0    requirements_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.requirements_id_seq OWNED BY public.requirements.id;
          public          postgres    false    243                       1259    38685 	   resources    TABLE       CREATE TABLE public.resources (
    id bigint NOT NULL,
    url character varying(255) NOT NULL,
    resourceable_id bigint NOT NULL,
    resourceable_type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.resources;
       public         heap    postgres    false                       1259    38684    resources_id_seq    SEQUENCE     y   CREATE SEQUENCE public.resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.resources_id_seq;
       public          postgres    false    260            9           0    0    resources_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.resources_id_seq OWNED BY public.resources.id;
          public          postgres    false    259            �            1259    38547    reviews    TABLE     
  CREATE TABLE public.reviews (
    id bigint NOT NULL,
    comment text NOT NULL,
    rating integer NOT NULL,
    user_id bigint NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    38546    reviews_id_seq    SEQUENCE     w   CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reviews_id_seq;
       public          postgres    false    240            :           0    0    reviews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;
          public          postgres    false    239                       1259    38771    role_has_permissions    TABLE     m   CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);
 (   DROP TABLE public.role_has_permissions;
       public         heap    postgres    false                       1259    38739    roles    TABLE     �   CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false                       1259    38738    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    270            ;           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    269            �            1259    38616    sections    TABLE     �   CREATE TABLE public.sections (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.sections;
       public         heap    postgres    false            �            1259    38615    sections_id_seq    SEQUENCE     x   CREATE SEQUENCE public.sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sections_id_seq;
       public          postgres    false    250            <           0    0    sections_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;
          public          postgres    false    249            �            1259    38419    sessions    TABLE     �   CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);
    DROP TABLE public.sessions;
       public         heap    postgres    false            �            1259    38402    users    TABLE       CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    current_team_id bigint,
    profile_photo_path character varying(2048),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    two_factor_secret text,
    two_factor_recovery_codes text
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    38401    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    218            =           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    217            �           2604    38607    audiences id    DEFAULT     l   ALTER TABLE ONLY public.audiences ALTER COLUMN id SET DEFAULT nextval('public.audiences_id_seq'::regclass);
 ;   ALTER TABLE public.audiences ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247    248            �           2604    38488    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    38697    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    261    262            �           2604    38533    course_user id    DEFAULT     p   ALTER TABLE ONLY public.course_user ALTER COLUMN id SET DEFAULT nextval('public.course_user_id_seq'::regclass);
 =   ALTER TABLE public.course_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237    238            �           2604    38502 
   courses id    DEFAULT     h   ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);
 9   ALTER TABLE public.courses ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    38657    descriptions id    DEFAULT     r   ALTER TABLE ONLY public.descriptions ALTER COLUMN id SET DEFAULT nextval('public.descriptions_id_seq'::regclass);
 >   ALTER TABLE public.descriptions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    256    256            �           2604    38463    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    38595    goals id    DEFAULT     d   ALTER TABLE ONLY public.goals ALTER COLUMN id SET DEFAULT nextval('public.goals_id_seq'::regclass);
 7   ALTER TABLE public.goals ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246            �           2604    38722 	   images id    DEFAULT     f   ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    266    266            �           2604    38446    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    38671    lesson_user id    DEFAULT     p   ALTER TABLE ONLY public.lesson_user ALTER COLUMN id SET DEFAULT nextval('public.lesson_user_id_seq'::regclass);
 =   ALTER TABLE public.lesson_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257    258            �           2604    38638 
   lessons id    DEFAULT     h   ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);
 9   ALTER TABLE public.lessons ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253    254            �           2604    38481 	   levels id    DEFAULT     f   ALTER TABLE ONLY public.levels ALTER COLUMN id SET DEFAULT nextval('public.levels_id_seq'::regclass);
 8   ALTER TABLE public.levels ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    37568    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    38790    observations id    DEFAULT     r   ALTER TABLE ONLY public.observations ALTER COLUMN id SET DEFAULT nextval('public.observations_id_seq'::regclass);
 >   ALTER TABLE public.observations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    275    274    275            �           2604    38731    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    267    268            �           2604    38804    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    277    276    277            �           2604    38631    platforms id    DEFAULT     l   ALTER TABLE ONLY public.platforms ALTER COLUMN id SET DEFAULT nextval('public.platforms_id_seq'::regclass);
 ;   ALTER TABLE public.platforms ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251    252            �           2604    38495 	   prices id    DEFAULT     f   ALTER TABLE ONLY public.prices ALTER COLUMN id SET DEFAULT nextval('public.prices_id_seq'::regclass);
 8   ALTER TABLE public.prices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    38569    profiles id    DEFAULT     j   ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);
 :   ALTER TABLE public.profiles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242            �           2604    38709    reactions id    DEFAULT     l   ALTER TABLE ONLY public.reactions ALTER COLUMN id SET DEFAULT nextval('public.reactions_id_seq'::regclass);
 ;   ALTER TABLE public.reactions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    264    264            �           2604    38583    requirements id    DEFAULT     r   ALTER TABLE ONLY public.requirements ALTER COLUMN id SET DEFAULT nextval('public.requirements_id_seq'::regclass);
 >   ALTER TABLE public.requirements ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243    244            �           2604    38688    resources id    DEFAULT     l   ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.resources_id_seq'::regclass);
 ;   ALTER TABLE public.resources ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    260    260            �           2604    38550 
   reviews id    DEFAULT     h   ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);
 9   ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240            �           2604    38742    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    270    269    270            �           2604    38619    sections id    DEFAULT     j   ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);
 :   ALTER TABLE public.sections ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250            �           2604    38405    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    38604 	   audiences 
   TABLE DATA           P   COPY public.audiences (id, name, course_id, created_at, updated_at) FROM stdin;
    public          postgres    false    248   �5      �          0    38428    cache 
   TABLE DATA           7   COPY public.cache (key, value, expiration) FROM stdin;
    public          postgres    false    221   �A      �          0    38435    cache_locks 
   TABLE DATA           =   COPY public.cache_locks (key, owner, expiration) FROM stdin;
    public          postgres    false    222   �C      �          0    38485 
   categories 
   TABLE DATA           F   COPY public.categories (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    232   �C                0    38694    comments 
   TABLE DATA           o   COPY public.comments (id, name, user_id, commentable_id, commentable_type, created_at, updated_at) FROM stdin;
    public          postgres    false    262   D      �          0    38530    course_user 
   TABLE DATA           U   COPY public.course_user (id, user_id, course_id, created_at, updated_at) FROM stdin;
    public          postgres    false    238   #D      �          0    38499    courses 
   TABLE DATA           �   COPY public.courses (id, title, subtitle, description, status, slug, user_id, level_id, category_id, price_id, created_at, updated_at) FROM stdin;
    public          postgres    false    236   E                0    38654    descriptions 
   TABLE DATA           S   COPY public.descriptions (id, name, lesson_id, created_at, updated_at) FROM stdin;
    public          postgres    false    256   n      �          0    38460    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    227   �      �          0    38592    goals 
   TABLE DATA           L   COPY public.goals (id, name, course_id, created_at, updated_at) FROM stdin;
    public          postgres    false    246   <�                0    38719    images 
   TABLE DATA           _   COPY public.images (id, url, imageable_id, imageable_type, created_at, updated_at) FROM stdin;
    public          postgres    false    266         �          0    38452    job_batches 
   TABLE DATA           �   COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
    public          postgres    false    225   �      �          0    38443    jobs 
   TABLE DATA           c   COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
    public          postgres    false    224   �      	          0    38668    lesson_user 
   TABLE DATA           U   COPY public.lesson_user (id, lesson_id, user_id, created_at, updated_at) FROM stdin;
    public          postgres    false    258   �                0    38635    lessons 
   TABLE DATA           i   COPY public.lessons (id, name, url, iframe, platform_id, section_id, created_at, updated_at) FROM stdin;
    public          postgres    false    254   �      �          0    38478    levels 
   TABLE DATA           B   COPY public.levels (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    230   F�      �          0    37565 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    216   ��                0    38749    model_has_permissions 
   TABLE DATA           T   COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
    public          postgres    false    271   `�                0    38760    model_has_roles 
   TABLE DATA           H   COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
    public          postgres    false    272   ��                0    38787    observations 
   TABLE DATA           S   COPY public.observations (id, body, course_id, created_at, updated_at) FROM stdin;
    public          postgres    false    275   ̥      �          0    38412    password_reset_tokens 
   TABLE DATA           I   COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
    public          postgres    false    219   �      �          0    38471    password_resets 
   TABLE DATA           C   COPY public.password_resets (email, token, created_at) FROM stdin;
    public          postgres    false    228   �                0    38728    permissions 
   TABLE DATA           S   COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
    public          postgres    false    268   #�                0    38801    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
    public          postgres    false    277   ʦ                0    38628 	   platforms 
   TABLE DATA           E   COPY public.platforms (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    252   8�      �          0    38492    prices 
   TABLE DATA           I   COPY public.prices (id, name, value, created_at, updated_at) FROM stdin;
    public          postgres    false    234   ~�      �          0    38566    profiles 
   TABLE DATA              COPY public.profiles (id, title, biography, website, facebook, linkedin, youtube, user_id, created_at, updated_at) FROM stdin;
    public          postgres    false    242   �                0    38706 	   reactions 
   TABLE DATA           s   COPY public.reactions (id, value, user_id, reactionable_id, reactionable_type, created_at, updated_at) FROM stdin;
    public          postgres    false    264   �      �          0    38580    requirements 
   TABLE DATA           S   COPY public.requirements (id, name, course_id, created_at, updated_at) FROM stdin;
    public          postgres    false    244   "�                0    38685 	   resources 
   TABLE DATA           h   COPY public.resources (id, url, resourceable_id, resourceable_type, created_at, updated_at) FROM stdin;
    public          postgres    false    260   �      �          0    38547    reviews 
   TABLE DATA           b   COPY public.reviews (id, comment, rating, user_id, course_id, created_at, updated_at) FROM stdin;
    public          postgres    false    240   9�                0    38771    role_has_permissions 
   TABLE DATA           F   COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
    public          postgres    false    273   �?                0    38739    roles 
   TABLE DATA           M   COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
    public          postgres    false    270   �?                0    38616    sections 
   TABLE DATA           O   COPY public.sections (id, name, course_id, created_at, updated_at) FROM stdin;
    public          postgres    false    250   (@      �          0    38419    sessions 
   TABLE DATA           _   COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
    public          postgres    false    220   `      �          0    38402    users 
   TABLE DATA           �   COPY public.users (id, name, email, email_verified_at, password, remember_token, current_team_id, profile_photo_path, created_at, updated_at, two_factor_secret, two_factor_recovery_codes) FROM stdin;
    public          postgres    false    218   �a      >           0    0    audiences_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.audiences_id_seq', 400, true);
          public          postgres    false    247            ?           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 3, true);
          public          postgres    false    231            @           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 1, false);
          public          postgres    false    261            A           0    0    course_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.course_user_id_seq', 45, true);
          public          postgres    false    237            B           0    0    courses_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.courses_id_seq', 127, true);
          public          postgres    false    235            C           0    0    descriptions_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.descriptions_id_seq', 1600, true);
          public          postgres    false    255            D           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    226            E           0    0    goals_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.goals_id_seq', 400, true);
          public          postgres    false    245            F           0    0    images_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.images_id_seq', 100, true);
          public          postgres    false    265            G           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          postgres    false    223            H           0    0    lesson_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.lesson_user_id_seq', 57, true);
          public          postgres    false    257            I           0    0    lessons_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.lessons_id_seq', 1600, true);
          public          postgres    false    253            J           0    0    levels_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.levels_id_seq', 3, true);
          public          postgres    false    229            K           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 81, true);
          public          postgres    false    215            L           0    0    observations_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.observations_id_seq', 1, false);
          public          postgres    false    274            M           0    0    permissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.permissions_id_seq', 11, true);
          public          postgres    false    267            N           0    0    personal_access_tokens_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 104, true);
          public          postgres    false    276            O           0    0    platforms_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.platforms_id_seq', 2, true);
          public          postgres    false    251            P           0    0    prices_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.prices_id_seq', 4, true);
          public          postgres    false    233            Q           0    0    profiles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.profiles_id_seq', 1, false);
          public          postgres    false    241            R           0    0    reactions_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.reactions_id_seq', 1, false);
          public          postgres    false    263            S           0    0    requirements_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.requirements_id_seq', 400, true);
          public          postgres    false    243            T           0    0    resources_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.resources_id_seq', 1, false);
          public          postgres    false    259            U           0    0    reviews_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.reviews_id_seq', 500, true);
          public          postgres    false    239            V           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 2, true);
          public          postgres    false    269            W           0    0    sections_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.sections_id_seq', 400, true);
          public          postgres    false    249            X           0    0    users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.users_id_seq', 109, true);
          public          postgres    false    217                       2606    38609    audiences audiences_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.audiences
    ADD CONSTRAINT audiences_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.audiences DROP CONSTRAINT audiences_pkey;
       public            postgres    false    248            �           2606    38441    cache_locks cache_locks_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 F   ALTER TABLE ONLY public.cache_locks DROP CONSTRAINT cache_locks_pkey;
       public            postgres    false    222            �           2606    38434    cache cache_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);
 :   ALTER TABLE ONLY public.cache DROP CONSTRAINT cache_pkey;
       public            postgres    false    221            �           2606    38490    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    232                       2606    38699    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    262                       2606    38535    course_user course_user_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.course_user
    ADD CONSTRAINT course_user_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.course_user DROP CONSTRAINT course_user_pkey;
       public            postgres    false    238                        2606    38508    courses courses_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
       public            postgres    false    236                       2606    38661    descriptions descriptions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.descriptions DROP CONSTRAINT descriptions_pkey;
       public            postgres    false    256            �           2606    38468    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    227            �           2606    38470 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    227            
           2606    38597    goals goals_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.goals DROP CONSTRAINT goals_pkey;
       public            postgres    false    246                       2606    38726    images images_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public            postgres    false    266            �           2606    38458    job_batches job_batches_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.job_batches DROP CONSTRAINT job_batches_pkey;
       public            postgres    false    225            �           2606    38450    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    224                       2606    38673    lesson_user lesson_user_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.lesson_user
    ADD CONSTRAINT lesson_user_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.lesson_user DROP CONSTRAINT lesson_user_pkey;
       public            postgres    false    258                       2606    38642    lessons lessons_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.lessons DROP CONSTRAINT lessons_pkey;
       public            postgres    false    254            �           2606    38483    levels levels_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.levels DROP CONSTRAINT levels_pkey;
       public            postgres    false    230            �           2606    37570    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    216            )           2606    38759 0   model_has_permissions model_has_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);
 Z   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_pkey;
       public            postgres    false    271    271    271            ,           2606    38770 $   model_has_roles model_has_roles_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);
 N   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_pkey;
       public            postgres    false    272    272    272            0           2606    38794    observations observations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.observations
    ADD CONSTRAINT observations_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.observations DROP CONSTRAINT observations_pkey;
       public            postgres    false    275            �           2606    38418 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    219                        2606    38737 .   permissions permissions_name_guard_name_unique 
   CONSTRAINT     u   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);
 X   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_name_guard_name_unique;
       public            postgres    false    268    268            "           2606    38735    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    268            2           2606    38808 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            postgres    false    277            4           2606    38811 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            postgres    false    277                       2606    38633    platforms platforms_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.platforms DROP CONSTRAINT platforms_pkey;
       public            postgres    false    252            �           2606    38497    prices prices_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.prices DROP CONSTRAINT prices_pkey;
       public            postgres    false    234                       2606    38573    profiles profiles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_pkey;
       public            postgres    false    242                       2606    38712    reactions reactions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.reactions
    ADD CONSTRAINT reactions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_pkey;
       public            postgres    false    264                       2606    38585    requirements requirements_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.requirements DROP CONSTRAINT requirements_pkey;
       public            postgres    false    244                       2606    38692    resources resources_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_pkey;
       public            postgres    false    260                       2606    38554    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    240            .           2606    38785 .   role_has_permissions role_has_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);
 X   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_pkey;
       public            postgres    false    273    273            $           2606    38748 "   roles roles_name_guard_name_unique 
   CONSTRAINT     i   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);
 L   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_name_guard_name_unique;
       public            postgres    false    270    270            &           2606    38746    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    270                       2606    38621    sections sections_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
       public            postgres    false    250            �           2606    38425    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            postgres    false    220            �           2606    38411    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    218            �           2606    38409    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218            �           1259    38451    jobs_queue_index    INDEX     B   CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            postgres    false    224            '           1259    38752 /   model_has_permissions_model_id_model_type_index    INDEX     �   CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);
 C   DROP INDEX public.model_has_permissions_model_id_model_type_index;
       public            postgres    false    271    271            *           1259    38763 )   model_has_roles_model_id_model_type_index    INDEX     u   CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);
 =   DROP INDEX public.model_has_roles_model_id_model_type_index;
       public            postgres    false    272    272            �           1259    38476    password_resets_email_index    INDEX     X   CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);
 /   DROP INDEX public.password_resets_email_index;
       public            postgres    false    228            5           1259    38809 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    277    277            �           1259    38427    sessions_last_activity_index    INDEX     Z   CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            postgres    false    220            �           1259    38426    sessions_user_id_index    INDEX     N   CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);
 *   DROP INDEX public.sessions_user_id_index;
       public            postgres    false    220            A           2606    38610 %   audiences audiences_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.audiences
    ADD CONSTRAINT audiences_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.audiences DROP CONSTRAINT audiences_course_id_foreign;
       public          postgres    false    4864    236    248            H           2606    38700 !   comments comments_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_foreign;
       public          postgres    false    218    4836    262            :           2606    38541 )   course_user course_user_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_user
    ADD CONSTRAINT course_user_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.course_user DROP CONSTRAINT course_user_course_id_foreign;
       public          postgres    false    238    236    4864            ;           2606    38536 '   course_user course_user_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_user
    ADD CONSTRAINT course_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.course_user DROP CONSTRAINT course_user_user_id_foreign;
       public          postgres    false    4836    218    238            6           2606    38519 #   courses courses_category_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_category_id_foreign;
       public          postgres    false    4860    236    232            7           2606    38514     courses courses_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_level_id_foreign FOREIGN KEY (level_id) REFERENCES public.levels(id) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_level_id_foreign;
       public          postgres    false    236    230    4858            8           2606    38524     courses courses_price_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_price_id_foreign FOREIGN KEY (price_id) REFERENCES public.prices(id) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_price_id_foreign;
       public          postgres    false    236    4862    234            9           2606    38509    courses courses_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_user_id_foreign;
       public          postgres    false    218    236    4836            E           2606    38662 +   descriptions descriptions_lesson_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_lesson_id_foreign FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.descriptions DROP CONSTRAINT descriptions_lesson_id_foreign;
       public          postgres    false    256    4882    254            @           2606    38598    goals goals_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.goals DROP CONSTRAINT goals_course_id_foreign;
       public          postgres    false    246    236    4864            F           2606    38674 )   lesson_user lesson_user_lesson_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.lesson_user
    ADD CONSTRAINT lesson_user_lesson_id_foreign FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.lesson_user DROP CONSTRAINT lesson_user_lesson_id_foreign;
       public          postgres    false    254    4882    258            G           2606    38679 '   lesson_user lesson_user_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.lesson_user
    ADD CONSTRAINT lesson_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.lesson_user DROP CONSTRAINT lesson_user_user_id_foreign;
       public          postgres    false    4836    218    258            C           2606    38643 #   lessons lessons_platform_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_platform_id_foreign FOREIGN KEY (platform_id) REFERENCES public.platforms(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.lessons DROP CONSTRAINT lessons_platform_id_foreign;
       public          postgres    false    4880    254    252            D           2606    38648 "   lessons lessons_section_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_section_id_foreign FOREIGN KEY (section_id) REFERENCES public.sections(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.lessons DROP CONSTRAINT lessons_section_id_foreign;
       public          postgres    false    254    4878    250            J           2606    38753 A   model_has_permissions model_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 k   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_permission_id_foreign;
       public          postgres    false    4898    268    271            K           2606    38764 /   model_has_roles model_has_roles_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_role_id_foreign;
       public          postgres    false    4902    270    272            N           2606    38795 +   observations observations_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.observations
    ADD CONSTRAINT observations_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.observations DROP CONSTRAINT observations_course_id_foreign;
       public          postgres    false    275    236    4864            >           2606    38574 !   profiles profiles_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_user_id_foreign;
       public          postgres    false    4836    218    242            I           2606    38713 #   reactions reactions_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.reactions
    ADD CONSTRAINT reactions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_user_id_foreign;
       public          postgres    false    218    4836    264            ?           2606    38586 +   requirements requirements_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.requirements DROP CONSTRAINT requirements_course_id_foreign;
       public          postgres    false    236    4864    244            <           2606    38560 !   reviews reviews_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_course_id_foreign;
       public          postgres    false    4864    236    240            =           2606    38555    reviews reviews_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_user_id_foreign;
       public          postgres    false    4836    240    218            L           2606    38774 ?   role_has_permissions role_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_permission_id_foreign;
       public          postgres    false    273    4898    268            M           2606    38779 9   role_has_permissions role_has_permissions_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_role_id_foreign;
       public          postgres    false    273    270    4902            B           2606    38622 #   sections sections_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_course_id_foreign;
       public          postgres    false    250    236    4864            �   �  x���K��8��b���@$��cs��W�F/�3S��Nꯈ3J�F�|kN����4k\����ùټF�k�:g�r��7�}��`�ǲ/ׂ<d��\����w}nɺh�2��&J�z��.��Fs���e:h��>��|7^_r}K�������t/?�!-�$g����8!�7ӞG�D�-�[��j�u6��tǐ�_�?�����}Ѓn��A���\gGs(��� ٜ/g ��__�V6�@Zs�~.��D}}hL��;�̙!�v�u>�;B3= ����L�^u����Вu.��|�^n%���'D���|$� ٔ+m36.7e��_/@���ӝ����֙�(Fa1Y_�MY烙�w��6@�](���d�}a�f{}�o�:?nG3�;B��Z`���\�*Gc����@���ĤB�ml��
A����!b }E�[}۸�S�<e]�u� �L��a�jVg�ʢ��j�e��?=ٷ�F0ǿ��`�!����U;�d���A�x	�#D�SӸ�bK֑o�n;����.�� �8��uQiE�uQ��R f ���|�v{/g~' L9�,���Y�EZ���	���M�� )h(l��յ�A�I�u�7��� @D����a��-X��R���!g�v1���ƖB��Fe��?pZ &�˕��$Sο)�dM��t�]�6'˺4���L��� �^v1�Xs��WN�Vj2�NoO�u�U@����2 b��Ev;�l˺1�i�ηsk L�]O���eE�l�45/�%̲.�ՑFv"�  �c�� k��&sɲ.12!A�"J�H+H) ��\cci�Ȳ.��0��e)ϼgک��Dپ'���������v5<�ڒ�V����w ѫ[9�����M�2�t��"15��d$~8�_�?�l��i?�e��Ow�8�8L�{AG+e/�N��k�7��ׯ�g��`C�?򙞄�$�J��a������:����܉�ւ0�V�+�vA�,ˈp�T�6N�[d������үS�$|U:�2"��X'�A0mr�8¿1�߅S�^�����u����Yv��@���eU���q�Q,#,�����E�h��\�����A,����E�;�Y���Qr�B�'��CޒDc�|�P�$6�K��f�#\�XA"2��5�R%iԬ����
�#J�gb� ��P�,�W���]W�Ͳ�=	ak�1�L4����4^鏑������q�!P�_���;m�����dq��!$o~#�^��a_�(�:ǆS5�S��yS���ѭ2���Z�Fv��.�����ˈ\�^�^� ���qI�ޡj떡1��q�k,1V2>��ٯ[�AY��(����P�7<�����jB-��Hk�^�֒�����4��EIa!�د�o*!T�A�ܨ�����8�y��BB�`�y_��nXc0�C��(����9���!=Dn����la�R���dqHr�#a��!nն�����w�SF-���L`�@�v.�*�q@����H�b2���^+��Iaa`6��4/s]� ��^�#ZC�C��!�Ȉp��D���BLM�CȰ�W�oN7�xLdƷ���df�*yuRpoD�5ZR+�6*�"���AD]ᤆ!~5ߪ I7�Md�F;֎6��Ai���-5ݤt��7�/��P���6m"��QM���J߰��99����?DҪ8�k��x�C�f�74�C�b%��TS�2n���k�Qe?� ��s��v��|�U���T'F8Q0�%]64^YoQ��!1���i�8⁠��ID�8��JA�@D^�^l��5�<���uЭ�"#�U� b|ͶB�&���,ӵ�?F樓rО�Ȉ�f!]v�0*���0�y��CP~��D�߂v�Eֹ�ߘ)�l �v�a�7��}9�R�.h'_d�m��I�""����A�&~ˁ�X��A�9���q�l����#!X�� ��e���$2"�����><���/�7*>4�� z'�`B��t�_�=tO��:����C k��ۍ&�`�[�2�灡�˫b���4rB�30��515��sjIY��1B�lz��y��h\˧#!jR� 6�X	g�c�_0�v|CHQ!d�ꥤy�FDFd4��3�.U;�!d�m>��̙����s�a�����4S�Y@d�T!�]�0o��y�I���^j��R=/V=A��C�H���IY��9���y�Dd3/ˌ0��(K><)h���N;�8.2�\���4��A�9�2�t�1�.k��l�Y�Z�k]))�tg��:o�w%�x���6I��k�7��.�DA�}�ńP�?yT�ly�K�3������"#l�&:�Yu¸��,qvS@�O;��g���(����A���&�h��n��-�WS�2�⻾	q���~Q�v>��|5��w�:�[r#�dY�}/B�+��0�{B����:�j��F��2"�f�n��ф��fpݨ��X����_]R�����A#���+���:��4����D��j�6G��w���������AkRbF	9 $ׅTf�~o��{ϊ����y�kΜu���B���:�}O���D>�I6"�4��V��)��������7� d�G���	�^�2��9���n�y��!$|�!t��0�۔�M��,2��� �YQ��q!h=hf��{^w)����'�7z=�=����� �N�� �Ƿ�����%DF`XϤC�P[�!&>;� *����o�MW���a(���@L�Ȑ!�X5B�mVnܥ�TDF��� �8w�O9|�j�6�T/2B#�À��ه ����B��e�?�N<����>SѬQ0�I�?�x9㚕��ˍ�hEӆ�b�	4��5I���T6�����cz16��FL��A��������      �   �  x����j�0���S?@ПeK9���������[A�f���#o+j���!h�d�Oi$���*m�cF��6�ӈ����89��+/qKǌ �Y-q%.ԧʓ�N��Q���\�La��m'ڎk��M�&�|�?���������/.�|��߯�2�n�$�oQ6�V[�b�Q���D������@B���z�v�2�d�{T��ʾ	il��$!��g�޼D�Ҵ�Ňa߂S�Ό!�1SY�qz*���K����� xt�&)4���7�~���R�rt�a�w~����&� ��ʪ��{8��xQ$tS�y�F�'��̗������8\nKpW���
ܕ`Q4�x�_F��
�|��#�/ݑ��?��ɰ6ǎ\����x=/Թ�~}o�K������z�m��q��p�0M�J1%��~�����5��      �      x������ � �      �   P   x�3�tI-N,*����W(OM�4202�54�52R0��2��21�&�e��Y�zx#i��9��Ӌs�3o�#Io� �=)�            x������ � �      �   �   x�M��� D�P�
���V���X�a��ry��C�HY����U-��E����[��I�ȁ��FYv������F�=w��E�s�������}������v*#	JҲR��
)�R�h%m���WCg'AG�B��)���,E<�(�<8c��7���'@�gc$�5X�<J�����ɚ����{{�hb���y�aQ�vj�?�s      �      x��}�r�V��5�x�DR�%�i���&N&���@$� [$d�]�mγ���_�.���rjf4E�X�zu�������c?�m���]�enǞ~����L���}x���v��C�o�n��Ǻ�z���_�Bo��SC���>�ױ��yZԟ�]ݵ�8�z;<�n'��Ӆ�����L�4�~_����nQ�k���qK>tO]e���q�w������_R���.��b,�~�S]V�jEo[]�.��E�Z���wW7�.�O��fU��X";��z�l�n�N}ݎOݡ��Euw_��z������V��7��L���v�{%�T?uۺ}��ֶ������W��F��8�;w����ؒا��5�W�O���#�<�����/-�x��ʮn�ŖŽ�۾����-cYu�l��r_n�Id)^�Z����~��ں��J��O�����ҩB��y�}�=�<i�Т��
x?�z<�-�������rG�'���e&����o�fI��/$�i���ݱNOu��w����g�U4�
V���U4�
��終���5c=<M�P�x�'�̤���Ԯe���'�(~����[�6k��bqJ�ot�a_�a��{����'�D��f~|"�����a8�?�A���?v�trg�0��T���7�e����n�G��C����ɠ�#�,�FމuEgkl �&��!�5$*W_�76�N��7�L�a`}�7��rv��Y|2���~K��S/�ݵr�f��mlҞ_a��H�߻һ�F�'э��Hy���/���� iZ[�!�8莳��,[����E�8H|\��HB��Ǚw�f��J�m|�|������r_.)�����SͶ���#�����ĭ��\���݁#�Ta�������}H���L�x-�t>(x7��E���n�`_y�-��h�Y�H�Ǝ�Kײ>ޓ�$���Ȋ��'cA�CvQ�Ґva)�U�Kih)$���-�w�������ر�����3o�D'�d�5������HǛ��H�ݒj�~��`�,e߳t�>i%�ڢ���'׫*����xU�D|UV�F��|S�C����Q�`��Vu_!����ϛ��-PE�BPE^Ȣ��s*�ć!������Y}I40�*Aq%' �[���ف�x����O7�V�t��n9�l�x�<,��6,*�U��������t�ZB@�n���g��m��0��%D}I7�d��RU�D�xi��+Ûq��,#��4���k�;�k��Cj8�l���N���Eޭ~��ܚ\Կv�:�P�l`[�J����p��~�k���t�M,��&�C�np��g���E����,]74��/��]�l�Y��{w�`���w�SK������v?���f@�+�n?Ӊi�?����@~��8��ֵ�m)Y�m�v�{RI��y��%�/o6LE�Lu����N�I�r<�y�w��L	�%O���,�F�)Z4����,�0:�%�gx��լ5=���mQ�[v� Z�T?�$���-���Ŷk����TזTc=PPc�f=
��n\��B�7���RX����T���m��3���ϼ}،.C;�.�ݧtD��-j��#�n�R�Ya(P��zP4�`=﷤���G<(ja���7�
WgX�����b׳��|ݦ�8ԅ<:2�^C*P����	���.X��~HO��J�Ha�G�=�P�ҢA7YwH�� l�mHez�bV( �F�����µ�r������cq����R	�&�+���
��v]V�X���cP����!2L���A�3�c�����O�ir �Bm5�
K���zH��}?�+�8l0�\��Z��m���������,����z?�4�~����2�"�u*"V�o�۲Ys�E���J�W˶Ȏ���3��c�a�`�-ſ��g8b��K.�`���!X�"Mj���`�v�0�ו�6R�9Ew��cN;�yLAZ�@�5�ׂ`�ζ�q�)���Z�͈z�bH*Nu�W�'�48������IM��|���/������ʨNNI �{
�d#�d�x�S��t�y��Ci	�O����I�B��A����`�W�p|�`
Ep2�"�bYf �d�����5�0�s����K#�p/ד�$l�Hj^������W��̘L�
�ũ�c�4�R��y�RJ�S�P��ө�p\�8��g0([�NF�b+����/g��hgy[Ẕ��D�J�a��~���jF[?8jBoVB�88����%���c���5�	"���<0��	nvd/��X�`��̡iup.e����P�Cb��?%я�qRYb��>}u��;~ %I���(���R%eo�@�,F���������N���ߪd��vcb�f�q��1��6�K���	���bWgŏ����Yw^�]Yz�N�#�$ж��X�D#�)lh�� .�&���#P}y;��}8��r��:��~�d��YS����5�9��X!�Cx����9�C g�\E���3�<UH�4dk�bPJ��9���Řf��rmw�*�}$�@ȃO"s*Z
�"F�n"�r�o`����b��Et��g�6X>�y�Y��O}Έ��n�����ck�,�aE�j�n78��� W}�Ns4���l��_<�k�4��CbK�>��M��X�"���������6Xq��4't�D/�_5��T�$��0�"1x�8��5���{ʰTP��壡���ZHN�Yq��r�XjI{�ў�����Y �/+�3+Ǫ� V�k������&a��6?�`^Uw����F"Jޕ)i�9 ��S����r����!�~2qc�~�)QAḆ�)x�8��~ȓPף葤�qL����4�:�{�W�!��
���f��'ڀlrJZ+d3z�G��9۝;d	Itw�z"W��o'Z}4��T<����\má�����-�))`�Ә�aE����h��E���vVK��X���"xr7�5����/�+�K&.�56�Sيr�Wcj�(-P���8a5��I0�\3�n,���u�ml���w�A�a*�]��YCf���D6a��L/߁2��@暍�,*�.��,�qA梌����c�BQ�@4��;\���A�㠹z�D:w�;�fr#4�
�!2��N�!�^·d�2�|@$>]��DV���5��"��	�<���D �ϲ�����_Cv�Uf�m�10K$����X���Q��3*[.�����f�m���0��'ϧ�)3Z*�&�y�����a ����%
$3�p�� z=A1�q�4zAg�P�I�T6	�8��Ҭ*T�_4�MŁ@�ܚ��>�P�I�sؿT������I��ptbqa%#|v?!$��k�~��o$i�Y>����(A1����^�w��_�*���mc���G
&jQ�dY��[��ɫһw��h�!���\��.�B�Y��r�0��7ۗ��}d�E��ܮ�c�N]�j�2/�ʏe#�RWو��l�Aɠ3Tm]�p�T�(�\�D# /9��8w����l�K {�)0�(}��-�1����19��~�}�to�e)ڭ�o�d �U�&<-�������Ȝ�e����� ���THD�����}�2Z�<T�e4���Y���(�MN*���ؼ
��cP�d6M�yW��+��тP�
I%7P��%`�jS9��͞:��%��y�#a�	��?J�r���,���I��Z��ʴB���>����Ю(F���*3S@���U�?s,�x��O?�0�v�n.���\��G���x���uJ�G-�#��O	.Ht^�h}]�g�qT�ҍ[�U��E��$��k�AD�OQLG��U��4��l���6��&�K?�3�ם�$�I��vđQ��OlR����3#{sn�����)�� ���Ǥ2r���Q��H�2�^)���[~MʝԊ)��HE�'"'Yڍg�?|��Y�/.wT���z�SJ	�	�F3PI�`O�� f�i��Dj�W]_*�2�B0    �{�d�L
T��ݧ�����ެo��284�|Es����q�b%��G,�/0w���h�cO_.���I�"�{��sU��~�+��S�������m%i�N\u����E���ߣ�W��S�����"�8�^:a��dR�1|�J���\�d%�(���%�4���N���X��C:�3t>%��)h!���$�U��/?�.gD ���jy�	(��0ͤ�h�TG��i��yQ��No�i��y�V'���K)�|�(z$X0��E�Qa}�Vƕ���/�J���K<��v3��ތ�w\1\y��kfL��hR�D�u��X.)F�*f5T�-/�ZI/��4��5xu�� '# ڂ�.	�#L�l��lI��J@$�'fl�*��_��;��(�8��_���5qY:I�Z��5+�i���������C���I�=�T��d�5�86D�����媊�k�M3�	NO����+E��`o%`y������ؤX�5J�k8'���̜�om�!���b5VG�T�ϑaim,���)�#��G`�\U?̇�k��i�����v�?�v��x��z˲} S�o�m��M�`��c71V�?��7�:���~ӣ ���_2
�U�>GP��:w�Mk߷,H�U���/��.��]�|������:��%��$�MD%�Y:��^��d$�%$�?Y*�Ƴ�A)��R�T���.�@�r�r��p�$�S���R
{"G��2n��B�cHU8$��Td��i��>𷥐3%���j�	l��N�k�1�J� �G%��nJ���6*'���5'���}�(
V��ܰ;dŃGv�07��;�L^T��3��]DjQ�n|>r�R����U�����|�O����1��7���W՝�H�h,���Q�-�(`@�j�����TS�E���w���Qe��wmGF-��$�G�gzL;����b�x��je��L��4���9Crש*�	@�Z�q�ȸ��Yn�ˏ�')�L"�+��q>
��柽F�y��F���jsc�l�$'�Y�'�>7{Z͚��̌��#3��IB�>��X�����VwZ1�?H��Vdu�="�+���6d;�K�O���D!Θ:���'GzI�ح�U#^p\�ouc��ͩ�-3���h���������̺��ܗ�_�M�Rw��D���X����<��]��y�Wwϋ����>%
����-�)�X|��@�R�k�����I:��j��4+���I+f�"�"����֛'O!���Ԗ��#5a:�
�����@���^m����$�h+-�@ h�\��P�^��|��xy(�i�^]H�$�ÚM4x7��g�r�N�^� O]��j�bl���t*��z�սA5��ĳ�΀�x:/R�)�:�O]���Ւ���096�g1���aM��I��0Tn�s��7�Z�b~3�st�i��>�:�
��(�^3ƭd��zUm��Y[_#��`�����Z�i�+Z!��J�;��Ę=�����K�-��u�t�d"~�.����iś���.Dh�TN��:�!�-E;��x�>�Q3�mrp�����5zk)ꐖ	���Y���
�qX�Z��zaF%B5q�Iv;,u��6�	�_���-�F�هY���a�;�A�J�=��� 
6
��-kJN9[��wBf'�����`�Re�S�d�?{m���(K�RA�R��Ĺ���=�9��ٌ�"{�"I�KV':�;>��ʰ��!t:��2�޼j�E�,�1P�/2H'���P؁�ae�2�z-����\]!���"o�}��5�I��Y7b�F�������ʭ
�nkp3�/ׯK�#��������l|��:)�I��>�����H"��bm�`s��%�3M�����F�d~-�d���0���'B?%u*1�e�Ź%���)6	�\�cB��E2w��^�kKt���x%�d{��Y�{f����g���s�yĿ�Ҧ��D"̵�(��������2����֨$! Uu4I�S�`S�f���M4���p�������� HmP$���}�=�E�UD��#nN��Atc�	䙅���
���S^CM�K�z�u]R�M�@D+O��ZQ��-�N� �]}R��iٰ+�"2�ˡe�Y�-8���WO��$�#���J�к�V6^C��0����T���eNK��^�sv%e���r�f���R�"EyGnA]2e�(�T��꨷_��Y�g�	c�5���Ԇ����.�튐Tn=2�(
bВ����[�i֬Z�y?�u����������s}�LGg�Vߥ�U��L� ua#�PrҴ3E+�Ю襶�@����)4��iv���u��b�Q�W�*:�֕DXN����-�;CBK)��R[Fa�}� 5���(�x<7u�ˊ�MZ�'G¸l�k��ƪ�����CK+=�ӘAB�Em�:���"���i�]�l�s�>�����(W�l����w��Suc�"R�>g����p�a3�Z��mc���]r?x�鐄�:Dbʆ�t�}!�4�8��k���$^�Z����#��.�h�RhZP<]�N�����B7��[��:�����<���	U{D=:�C��ɹ�pk�G��E�A$sN��ryY�9<��n�o���@���[7T=�����o����Fް*THJ����U\�x��ru))C�Q>����=��T�=÷�a��9�h�YS��|�oO�������zhe�dL���(
�z)�>=xg&f�ĀK%�Ē[���3��(��yPo'��5���臬0Z9��*��&?y�k����M�m��&H�W��r�	Gƺ�G̅Lվ<���xUI4 �(�x�8G�t�t�WJ+�6��N����C�58�V��t�����]��=�*�S�ks�Q����F*'Q����~�Gm�1�w��SbI�7DJa�'O����N�{�<�a�+����6�)�$;k���Gvw(Ǡh�f`�h�\���@�ٻ�H�L��7,4�/6;D3j��R�,�1sJ�Q�B���(ZU�[�ZVƁ�KJ׺\��9��RѲ�g��\QI���"@��������'󮒒4�V,�E!�s1�#U*�(h����\p����gh��.���AG�[�k1[���:R���k�Յ^�U�� �ه\;G��Sش3��i*]0hE�놤�0_�Ud�^B�����ARDnt�)����o����RL#])c��*��225Y桘��gg��|���zm�� ,5b��T>��������`����*Uq�̏�G������Z=��	Ƴ�"Rq4*�.�<���E���j�O�R�2���\���o���{�}� ��.)j��\��������q���I6e^��.,�T��������>>N��.�Y��>������`��8_Rp�*�3��^jdu����/�A��sn�Sm������ge��y.fI�Ŵ̏�@c�*�z���{�x������չ3<)Vsv.��:�[b�2Ik_kO��-����� i�e��-[!���^0�����=
�wW�u���<�ƠKٜ������ ���Mf��ko|��^��K���j9�`�6w	Y�U>'l���ʬ���;W�OG��NG�h�A9�HGxH���Ia��j��Q<�u)X]����1�`�J}�O��It�!�v�A�6�
��s�rO:���^U���d�\]��H��Aʎ��C͍J2ǬpL��ʴoѱ|BB:l��	����{�l��'�r�*Ʃ��?nJhw>W�'�������!/����p'�c�����r
}Z�x�4},�`�`�0�A�T�K�e�*�tsG���t�x7̷Q'��������@P%��H��Y��@߆ÈQΗ��zq�"���Vѱ����xx#�ut*zF$�*B1�/buc��|�Г�ɼ�, @k���t;�m&Z,A�@B=c��f.�y�/�nB��sw�6�����|������񝑊#]\/[4M��X-Z����¥�	�<��LV<�5�,�0�����U�e���q̌��ib�}��rz��y�Ú}/E����{"��	��%2��Dޥ�� ]	  �P���dT�x��<�gi��+�us!d��5���<.�Ci�?A暔+�����Ѩ����[,���au
�bd�����IzL�)�3��R�w4(���<�|����f������eB�#�ЖV��8���}A�h4��R���;^�1#��!�璱�-ы�Jc$c@�̨&��kB\�z���7+�GuD�᳣��2��c�i������@7CJ��m�rhPL�H��	O��?fOH	�����3V@9�a,g�eA?=+Q;��ެ��8����+�
A��M�ZN�>�-�.��'���T�@�*7�H'X��+��O>��|J��^W��.'���a.	/G��3uY���EK�l,�v+m�A�<JޏǨ�Y@�@�^�s�E�]�b�����R����
�X���L��jm�{$I�����j��bvݩ
��
'�� E�ɑ��y�	�n%�,XѬ����+i�͒�S���j�of!��!����.Ft[E28��@j�-Խ�ٝ8���=��8-,F����u,��}�O�����V�-Z�\�L�Ω;G\�����Z���W$&W�/�(ɦ��uO�î��W��{�8//G�Yfp}�����kon��;u�
e���'�6�b�DI<�i��$�����%BkT"�����cȹ��}EJ�Ʋ!ͧV?�}��Y�E�9�s
�n|2�=��	�=ђ�8�֬��w��6�^�1�s�09u�x-���d��G:ڡ(���{������0�&��K2wS&�eN��|/��&W��q�'�tZ��ZtD|ѢQL���iSmG���*b��	�]�wg���Z�j%B�}h_���j+k�~<�r�>��ΔY
�$ċI�gh�ͳ@E���`8c�d�������,R�< ժ$qe.C��h����K�l�6qx���~��L,���c鸯�s_��h���e��J;�p�6���X� �X^/�ۋ<`8?�03f�i�?��-E67���r,�X�&�k�b�l<0�'ɥGx�d�q�k�H��^�$F��]��R=
��Jef�����%�,����'J̧�6�=��'��r1$*h�0-1i3���~�A���!{��7�8�:	���Ջp0��,l'\P��<��i�y��P�<��Ⱥ��5���T7�2;��anj�묧:���կGw�+�vK2��LFo���S����/ҷ6}�#�6�m\<�'܆�uX��2`���Ԑs�YD�[�Rڡ�d���6S<�Y2�:k�˩�y��ȬF�xf���)�>�Q0���2� �����>D�\~h�Ù�/a�t�S~�ۈ��=��2Kq���ʻ�ڰ^=��k��R�e�����s�DgK���������`�/^ȵ�0���^�Anh%-���9�bS�����&�������[}Ãv |c~*��P%��1��Zt@�2�4���q���H�ȝ��NnI%�L)���ҡEj��=U{!��8g����R���l�U=�hL����(%'(͙p9~�&s���VN
�hS?��Y���L�Ű�<3,e�����p���յ{lq�P�޷�^u^�~{]>�L�+��H{��-i*G�i{z@t�yִ'��ct�>yhZ()�4�$W'���e�\TV����ـ����Эm��l������GH�"�Ƥ��دg�oߢw�K�\7������Y��?{��=C{̝tgg�=jӲ������o�x��X��]�E���}��B��?�ךQ�� ��5!l�NI���8���!<���~�����~"+�)�a[N.��L[ҀȟI�T��t���m
<�9��9?�n=&Ӳ��UєbӤ}�̸��j���&e)Y?$gd�:U�=fmUI~|S����?������u+�鷙��{�J�<����Sz6f�#���_+��Ay�qͤq���\�̈�g��1)+�������h��$��[>��B�a�Jo�4)\�h�-�1L�%�ui���9ك�?� �pOC?�<��~�[�,iTx�r���P|ܺ��6�x�p�1�y��^4�w��4�DZ|V�%kiJ7����I����o<��^��~��թ�����s��Foޭ��^��_��o~]���V�wW�S���_��o�j�n���kt�W��������5ڴ��n��CǏ��ߟ�f��N�F�z�7�e}q�ny�������,���__�q9������ʍ^���>����zR�ǡ�|�U?p���@�SǗ�7�j\�� xq�7K��ߺC���.�m��K~�p=z���_����cMb]�z�.z����j��t������x�De�?,/nO^��{y{�7�g��͛���,            x���ݒ#G�%|M=E����u�����lZ�ozf�Y��i�U&������:<��0��R�d��4�_��o��/�/������z__~>5������9�����,�y����~jOÿ���y�����������S�n����=��������������y������ǇϷ�����|{<��|]�_��z�}Y��e��}�������z��Խ�dϟ����'~����׷��˧����c�F�ˇ����
���������w�����Կ��p�����������������e3�y��}�+�G?�x�������z�߷��J����ڞ�ϧ�ݸ�������_�/ϯ������n����m�]_��/�������?n�V/�R�O�a}l����u��TD+ZX�%~X�[�}}\��c�5��z��X���>-�6МO���������ۣxl�����m���c��,����n�h��w[hN�$@]����g�����
6��;dӞ��������Y�l0�m�l���z�|Kwp�����t�2�_��w��q������5�G߼��`4��x�g6��;���ÿ.��/�}s��#�OtKX����N���z}�O�2������y���&/�?�����������jOx|�7k���f<��=�/�O�6����v��.�=���~Gl�ӿG�������e�!~~�
��/��g���g?5��}��Z?�\?o��~Y���fK�Ɇ�>\{9�������<�	�k���y�)�I�=�~�M�`��.���;��g�J�b3k�u�W�Ӝ~����6�������j�8��k�+����oo�o7ٰN���a[s��u��֯ϗ�e;S�4\o;<�}u�������������P��<�7�~�ߜ><h\�p��~�7��v"�{�gvW72����w���
*�� ��s�:�t�m[d���&��{}�$WI ���������EnO`ۙ��3��l�p[0�lX���v9����u�@��Mx��N�چ�~W�����܂�틣Oo�iMw����v]s�n^c+���}�kO\�#	�f��p�^o�-<n��i���wذ��]]w�5�n>߾o����q��W����?�C?y��J;R{���|m���=A q�|ݎ��Y����+�
NW���W�i�0�¯�haiu_�a������P���O���vN>��~���l�S��|����R�����ƽ�������,��f�L��`JnqŇ-��s���n��j������'�k[>+���x/[@��ǥ����X���j�f��]N�������^�� xzC�x��E�2z�"G�B���m'�YCiO�_��n�6Eq[h~�o�R���cD�i�?]���|�f�;���ç/�ƾ-K�L��0�Uy��6���h��Ѳ}���6��G�c�z�[�|P�6�����Z؛���g��~��G���g����n��/�y���;h?��m���;�g����o�s�Uo����~>��a[Ǵ�./�-�!~Ǉ�~W�8J�]]�Yv|��N������k~�x����!_��(�ы��+�����O)\8% �|��+��\����rx��lq˶�����W#/ks��!u��:����HB��G,�_x�?��m����'7P��j@�|�o�{��}��m��X��(W3�,�#��}�p�+tlψ���j��jV��J\.[�s[���Æ�Pp��ms�ׯ?�ޅ��&��m�/�a.8R~
S01=Lt����1�����Df_N��@�M
s��(���d|�7�=�;�����L�v�\����
Q��~��m���HK�	���-��WX�+-LSL~i|�g���������n�ȸ`xO�dH��(D��cO�ڕ�\�B� z��%?��s���o�p�$!��/�ϛ'���':��c����ԥ��o���LF&3�Q�F�c�mk�&�mV2]yv�����6���>�+��.�[�h�*xmkټ�<��Y�D�A��K���0�Zp�
������ ��Q��~>M�!n7I��ӭ&�r�cr�C�&a\���z��i�Կ����pW��UF�n��r�\��_�2�K�g�7C���O��;;� Ro���.e+oS���������č6Ui ���M�w�i䇔't.�Sn�|�NS�(��&RvW%�W�O��'�|�WN�M�_RJ�=g��/Z�f	�����!���~ם��߯[<�0�d35ш_H�ש��z�#�g�R���KU.|�:����3���Ť�{-ޗ��mg�\��Rh9t?ͭ�Z�V���n�C�
�!>a����}�5�|�x0YBi�/b�����>n�܆sŸ,�8�D/�����A�_d���>h�/P���c�����5�1�f�<;�=nH��!M���c<��ƨ�5<�9��&	-tzlΞ�x��7й��5��>dr����>�<'-X��+nY1����oiìR۱Q&�3�V��i)8i�Nc7�,P�#��0���si���tŰ�
�$�����7�H�C�5���\�d	kgy�?.�v4g�_7E�����vf��7Mr^da��E_rcK�������na���ܜ췜�}p%T#���n�L�ߩ�� 3�����d۞?����K?�i��]��w)��5��Lz)�m��2�����rR��"���f��/�Fo��� E�|
Ƹ�M�*z��| ������,��!�g�)�Y�Od(4�[`A\�ʊ�4�_���d��f��ֶUʤ��<YH��l � ��j�p��X�_�-d��+���9�!���!�-��p t�#�r���`�b*�k�x y�1�3`ۡ  ?�$X��x?��g�V�W�^�r���~�l��*�z����0�f;�_�3N�ܲ��
�����ܠ�;���JJ�m���p�S/�
���K���̦=��N�����v0\��N��%aM�Js��}5]���o��	�-|��>��􅟜��g��&�~����0���t�1X*�_��H~����$����4MS��t��T�=��n�G� Wr����k�6��A�n�4�5�i�\�F>��+�+��p���gU��3�8t��<#׍�}Xnw6�nڒo�l4@2AC�047[�Z�jݴ%O��h9. #�O^��j4m��j���oH��m�T8�A {��Z�Q%dD�����\���v�2(f~����yM{�����wJ�}B7�ձ00�<�<L+��?�����#�[#���Z���7���,	� �0Vހ�&]�`��öKv׆�g�ri��x��j	,]�����W�<�Y~j:���#��GΔ�O�a�s�+8v�LC�[��_�@�1�R ����K��A9+�I,�Y��*f���� wt�x�F�̈-xt�?�M
+|��I$Ю��U���?Zz�%[΀
O? .8q��֕�nW�G�(P���V�&*Pg����W�оnQ�wL27]�S����W�?(C ��+Ղ�i'Ђ�UA%1�]9����֟O�����(@���d=��O��{�kr���N��ĝ��>$��@)c�����NW�ڶW㦉�^��3����צ?�Q=�-�|��%Q� �7�1։�d�H��1u��'*m��y�O�J��Rwx|���ޮ4�_Bb���fU{ؓ[_x���u<2� �ϫZ���xJ�y}ص		��p���/��/V�]������ˬ�ge]HJH�v_�G>ާ)\��"p�X�nqkֈMl��a�P��*|O2aCb�>)
~[E�`�O�
 ��F�o�p����V��_1��<%�ӭA7In�
�[���W���H��9�f8��(�L"0iɼ�T؂�?�����&��m�ДDlv��e@қ<��;0y��)�ǎJQ�p�9��%��5��4/�n�=���`�����c�ps��Ɔ�c�x'_�b|�t����b+��@&��/}�K[�X� #��w	򙸤@�kƂ�U{*gn�!P5 ��X�*��*�5�h8�1��    mc��&GzwR��E +�Xl�&
�eH8�HJ=]_,��.V�`�5�@����
.V�\N�AR��ӇGZ5ng Xp��tNEb�x)���+t���
�p�#]��(�������\P�7�HJ� SP��Lo�p`:�uSw��/��ÂkDܿ�L�n�$)�S����cy>{x��N^�������kM#�G����LGp�]_�A�x�4a��"���?��^��� C�+C��uo�ܕso�R��V9F���
>X�� ��6�h�k��5��)sBg��~\9�[1d����UC�M�ɔ�E���i|؇ ���U�y�D�}����90H�����+ �'���>e[�$�\Ī���Ų=|�Q��Roؕ ���UT�ܘ�En��� V��*�7�v�)B�$5�P`���U�^�W��� �S��T���|�1g����5���(�/MS�|�%煺*�^	�/�\0�n�Ʉ4C� ��4�g]Χh6O\|L���� ���sIQ��/<)��P�?9����l���d�[h��
 <��K:?g�������!5�Ze��ʥ��z"pQ�'L ������+��w�r��P��{^��g >*k+���Z-��Ǝ����yj`-�vP��¸"���<�& ����A^��J��5z�M`b!j����虦��%`�ӊ弨��T��g*`؋����"������6��lW>|�TaB�J�H����&����%��d�o=�& �wXZ71�}fҧ5�5���p+���0p��3�?`�E6��R� E��MVxP�׼����� {��d�R�s����N���&{
����y:�*�z�Q=�c�RJ\]~����:��5�����e��S�g�N=�3�Z�o��������9�g?�͙�0(���C�e��	�2�+]�s��t�Oم�3w|8u��~��|�Ȃ�V!�uŉ$Q�|�Z$ ܴ�hʎiA�U$SMI�V�=��-f⠤�����2�i-��A�*�*VG#8��6�� 
�ִ+!��D� ~��C��gE�H���l� �*&��owꍹ�n�>��|5�[v*�*��0�?0�9��9�0Q��������Yu�Hԣ�g��x�O`���	�LN���щ�	RY�\��Dw�O�$e1��$����O��6�+�)h�P\�9�l=)( Ϻ3M'<��T��D��g���6ȑb3��v��KZW�"Bu��HZ^�):R��2\�ji��u�g�D\�?����[���gV�{�za�5)���<�:hw��AOg٧]�$�����[h}�%��������W:xn̛|�W�[�>�r��hGg��	�;���z�U���~�>�((�@Y(ZWf<nJ�Q�bz�[�
����84��W����l#��Kf���S�ۘ�R��+7}'�0]��S�ԉ��&�$7μ1U���L�z*Q`&�|�H/�d����'��̢����Pv��ɚd)��b��q�os`��&ПYÍ�.�i����)�I��3���f�����>S{;������ڵ�Y�����$�Z_������f!B���G}��=C)��SP�5�]�V�Q˪�ĥ�Ġ|X�������@Z�_
`��rw�ܔᅚ]WKj␒B�YK���d�RQ��zLZOI
�f޿��ȧo���=�����NK�Ƕ�mI;�8��"Lz8�禓aee
u[���+Ex�� E"M��a���m��m"^�=x&R �A�F�/W�����/
��:��I�H�e�3:�� ��}�3܁��%��,�oT�E(�w5� ?��PҰ��hn\�S�"�<��HHG���z�ӾC�Zt�	K���9Q�%�eIOUgn=K��X:Q��;�4
��Hj��PL4c��'0ֶ�ҡ?D�K`fgS+<��x�TZ�Ґ���+]�Q�i�D�Q+���8�ӊ�K��_����h�g9�ܰ�@M��(���: l�������=�da���g�b�6a�[cJq�ָg<�+RɍE	d���m`�Z�E-�8��������f�yN��%0>�V.�Z����"-��ez=�)0e�5Ȥ@f�x�j��h�O�P����pD�126�Pu�霓��CDy��|Zώ
���o�c��k��rz�������G%6�U��N9u�h��76	�� x�,�C����ߨ�t�T[J�4�7��\p�*6r.����$���ޤ��T �*����M�8+�v�%��ӎE�
�ɘ�4�n��0BZ�'GF笽Oc��dp1{�|�
��T�3��&����ZJ�)U71�P�@#I�5b8x�d� �Ѽ�
?���4w����E�
z�5�Y�Y�D��"�?:��Hv� di eP4��ѭ'F��>��`�DJ���0q�c�	��è;�G�-�Sz�p�yd)]�M��-tx�T�=��NڜXfy�]m���و�S��M��������>Nv�� p�Ko���]�z9�X*�w��3�$w�YQ�fE�5���D�֓�Ė��"4��t1a}�����@�%�n��w�T��|.�C�g�xRUC=�7��m&��XbJU���^(a��)�*�s���g�j&厞�q��#zr�1;�J,�*�d��I�����0�m�D����|��XQ��Wjn[bFU1� ��G��OO�/זxP��|�[n�&eI��8�q|���ݙEt1jIW����ݳ;��-�7�s3�+��P����¯)���<CE�+q���h��Q��:�5�ԕ84UP�-�a��LNI� H*u���~,�lC��Ş��DqBX�w��HD��~��&Ih�u����y~���1�<e) ZL���-{&�����]hBK��Ju3�F�
5,Uw�#�n�{��0&2Z��!���u�� �:$充���s^I`�t��<�)�ށF�pUp�<L���� ���
��xR�p���er���:��Ց��g@��)�t=�"01�	
��ml�Wm&e�S����\�?\��;�h
��R��|� (b��{*S ��Ry�)�&~V���K�9Lu;�_��p����¦��TJ��{W�IN�ah���<sS���gӦ�Q�N���:h��L�b���h���/�A)��4>�4$U�B՝�>&3�z�) �D���BR���12��U覘_��2�y&T`r���B]J�S�D>��pu��Oؽ�Y��=�Ob_f�eؒY��y�� -�ut�/3	8]ĳyD�:�p
��B��Q""Q�A6i��%��s;_����0.V2**�$�(LF`@�|��u�yN����H+���^2����L� �������Ed2@pϮK�����e�oU�!�\v������1�Bv�
Ƶb%����C2�W�S���@-ם�-�c����bvӡ<f�K�D-�v�Qk�+���1=E��X�&�nÝ�:Ob�����Uą�\:�	/Pi��!EBȓv�xT�����O�h"2kZ�}�"�o�hI���ew �XI��L��`�7L,���^��*TG3)?k�R�xO1
P�L-g�FL��V�*�dmM�6��]��%��w�S�����ʛe�R�;��/׏&�v�_XT��*�<��(I��g���e�k
� ߫y\�_N�����!�4��T�:�2��gHA�Ӕ��<y�8�y^Q �d�/�)k�t���ޠ�����ظ�,��y��iO�J�r���L7�ҦP>��������m����G���|�8"��X����C���)���yO��E�KO<
�G�j3�U�2�<�( �h��/令}�tg ��5ԙڢS���(~ݝG�� �#��`��5����dB�cm�<è=�){�����(�!ä֒�@Av�&��g,��B��u�4ӱ����\�V��w��I�^_T���d�'F:R�$�\o�R&�wv�o��Y��9�\o3M�ԧ�y�Q�?�u���K���FA��x�#�2�bC�]q5�k����<)��O��𜶡�kFn�<�(���pzق��# >�    ��bve$�йR�T���L��@�����M���T��g�H9�I�<0
��Y��P����L��6�Lp���� �5y���;�&[��T@1��ӑ;ݮ��/������y��'*�zR��-c|�厚ҙ�^��*�`���) :?*I��J;a�����Ԙ�}���t���U(��2W�Z�p���I�"� +�p���Ӗ+3S�$\��@W+O��|� u��A�$"�qt��TG�q����]���� ���^� �E��3�Ϲ"��Y���γ��$�����VJu <�sw�����(�Wٚ (��G��$�+Y^�r۲�p�y8�F��L&<K�R �=)�-r�g�Ȭ�U\^rJ��L���M�f�W��ʬ0A��$�3	�h"�Y����4�Dx��F�
Y����}�ML�J�ƞ�T�]�����=nx���5<��Y	����ᮎA��N�&!
���KVs��`�P�t[v�t��Vn<K��3S�d��,��� c8�oͰI�r�lI��J���J�YI��1�$���d���w9��0"�<���ؿ<�J���������a�d��� a��Ta����'���g��T����|>��e�ؔ���)Υ�#4(�����˓O"މKK�|ĳ��	K�b������g��6;-�.�p����h�!MH���{��H_$F�[��R\@�C{�i
����^y�˕1 ��u ���$�>��v��������ߨ��k�f�%�4��T:�=�)��̵o�e�a�ئo^Z 6�6�`�uN�۹FX��pg�=�)���l4i��5y��41���=zOz��l�����-�oH�� 5����0�:�ӭ{�o
�[R�=�·��lP��0V�3r+��������@C�n�,/�{�R�=ؔy���^�Q���x� �sH������ȭƶg7Ő��������S�XUj�$�}�>�9cz̔�dz���fx�w�6������@.�Z�&��uV��B؟�RXq�=��n���*���ǻ*w�m���`6��1�6���X����R�,=Y�����&�|1���s���E/.�kMץ�MkHd�/
��	���܆&����5�!�,)��2�67>?(1�{R`C�r���o���{�' ���X� ���3�X:�P�=)��M�<��U��ص]�{[<�]N��Pҝx$�؝�i��PI��ph6'�r���{�Q���^~���Ja�9�G���=�(�`5�Q��Hm`�'x���Kk
���S)&k�,��ʹY뱆º�T���6��^��4�F���[z�C
�:�6�X�u�޳����1�YD�>�'g�<�(���ؙ���H\�"Lz��ʌc^����=/) �93��&�\��
Y����^��	뎓]�A���a ������9C��=�( �̋˗��ئ��)�:{O@
�tD �sv�S	�}�^{�|��I�<#�][�$�g.�4�Ro`�'���@o�� �S���g-�#�4��κy�{��&���_`Mޡ��⣦�����3�3́�������{BR �cw�rZ��.Y:~����H��Yo<����C6�	���+"�Oif"Ndt��7�KC�>��i�ʅ\NHx�Q �ќ`y���(=�I�f��0�]^�������|(���M�v����S��1�C�d�1v�!�q,K�9G��)�s��R* _��*<��`gӮ�S��Z�-�l�&sf\v�6辀��&)�iFu3#������r��u�����=�( o����6̛3���D� �%�O&j�dۭ�~�^8v*s!!#"��)���޳��g�z�~K�ȩaF5��I�
�{NQ�>�w1=>WIrjͷ�4���)�g�(*�憳=� $:�1{�C��Dv'�~�˩�<���=�(�=cj����g�Jr׽��[ե�Q��+��z��q�iHuC xD0,.�U�iZ.��-��}�7���O� *��Ai���=��X�\���uf���c��3�ԎD�����i�.�^pA����zO4
h)�b<#�B$}&��T����䁕���1��L*��� ���2��hJ���=M�1M�p���9C$ho/�뺹Sܡ�\�D�C<u�q�r��RO��E�i�<��@(����Q__��if%P"4�@��9�4
�5��w�ټ�6�q2��&j�'���~�Yiy�̷�$e}T�JI���G��N�� �#&eB��\R� ��V0���1����d�ԋ9@}f�=���VQQ�^?TSBÓ����I����N�o*83]�u���6~4���֞C /\���=T0����S��p˙$�D	/K�b����YD4�1��=�(�����Ų�M)���C�w�Pi[�54�'l*������v#}1)��z�P�2@F��5�T��� cTt�;R>Sbe�ݙi�
`O��5�r�2B�-<���诀�n��>�U��D�IEZ�

�A�����r?j��>U�ጵF�&v��5e��O6xRO��du0�n#3�9�R-K�\�j���IdJ�\�Kt �1��t �e����e�)���b��)6�{n;��XG�Զ��S{#b��.4�&]\��2�N�l�ğ��H�_xL��`�f
H�dr*�m��Dl݌>&�%��;wf��@�p4��^�wK�l��".2x2P`n9��N;1��_M�F?��>���oi�z&�-��W��� �t��G����e��� ��Zt������l��;%�O��e;gO
>A��x8�	}d٫˩I>3e=�n�>�w?�>E�aȞ�'���A�'��.
�E/���.vu/CIsGk�w�v����k6jP���a��z�~����TK6R �c\7>+�$S$��?�"J`�X���0�h���6E� ��\ O��ik�����<��՞O��|�~�l3�4��x�ӫ��iG�5��S��.*}!�嶃 ��|��x:�:���Ց��L��/L%i�<� r�����Sv&0�������ف�g�x:xS�`t��l�a�B�r=��!������@�`�:�?Oa
 ��o�	O��ڎ��6H��u���S����`t�Ø{�D� o�A }x��u��ʤ$����Аtz��A"���Ə�X���4t�rN�	 ��H�����������w�B�)&Wt�u NB��i�G�V�B�v�v�b?xNS`������$�!~�JX�,��PG
�/vD���O�y] �n�u���n0���4
�%�����U�հ�U��)ݨ�K���b >���d��7M_@��,�ī�#�h
LωRƌ��\ʱ����D-8k�<�)��hR��t�^>Qm{���:VƬ�|�Gjدۋ�;��´s�T��K:"..e���,�(8�k;���ޞI聽�ܧ�x�6��XF�EF��gj�M�KɊ�ڈ�GO~
����Bw�����1�s�*����l32&��BFO�M:�	�OI�sIة�|�������}d���P����De����P��E
�+�͊���\SԢ�΃'L��g.�_U_U���d�M<=�j�ͬgPf���0�SU턩���S�ܖ���e�*�gMHH����9�^���B�ܝ�S�Bʋ�#d+q1⹃'O��j*s!g�}q�%sۛ���KX�i
�>��|�0��<L,�gK}f�����0�@O�
�g�aQ�g�]�̀�*�p���L��d���'��8����کe"mx�cU�8����
�<�4�tts���	W�%�퇏n�Z�-���ܷ��NK�.�NݴY�ft3[�EOS���B �S�P;x�V`��חTdL�'�*<�*V�S���J~�}�\<	+ ���3�6�
���C�%���XaJV&�)O�_E�I�g�ד�;��K���><q���u���V����`�h6xbU g4�S��;K�ơ����T�����0�fe�\aR����U���Fm�/�8c2�|    �8�'U6l�6و����=�n	&���QIb��!{*�z��x'�� ���Xz��S��S��C�[�gV&�)/�6�_q�Fb<i<�*��uZoH{AO�WR��%{w����ބ�50gI�0$O^�4��W�Gu��m�3o���fh�)80o�����e,�4�S�����c�F��9筛��<_�(/I��ir�ǵ���=�*@ȅ���HϮ
pZ�sW��=����<�E�u�Y[K���5�n�湦�yT���g��W������D�ȉ�z�~~g�>��<�*���̋
�>�F%z����� yʪ����p}��؏���<s����X?MO$c^>�x�U �rji���n�����:�ra��c'u�%�t9�Y;%���c��R���t������f�-O�3�4=g>+.V�OdnO�
Lt\a}f���=|�Ǫ��끤����s�m�X�d���`��t��Tm�r��ܾ�C��3��/}v[	1��,��Q�<+��O�2�İvhg�6L�#y.V��$|YO��:d2�*�JNW�4��k'�᳃N'8�"{��[�=�+��=?&���ZJk�%����}�a�R����)Z~�s$i�E1�0��u��� ���Ê��W#a�=+��������)=�* Il�3M��1wǎ�> M�Z��e�,�렡�
��-�ٖ��Vv���w���@��U�]���ӨdQ��=�X}�u��2�짱9��Rѯo�K�꿪����RvC���b�;���DK�U*�r�a��$���79�����F��{�A��J��� ��l�{+�-����2o�����W��ơ+�v=a)@I��`$�`�t�����/�f��GO<
��T֡��Ȯ_`� ́�S�����iJ�d�a5z�Q�=g=8�GS3MR��C��� UFk���/�m]�>�9
�0H&7=v�z�Q�F�x�I��>�'$fS��v�����Ejʉ�tWa��4r`�
#r���"G����~G�
PQ?�$�i���w{~����%�m�m�A뇊s\;�������m[��D����\����t8w�b�m����)<"��R�p��/y�D��ĒʍmA�k`��k�ݙ��Y�Å��\ń��9G�)
PD"\"������}��ª�B�rE�'�)m��k�ġ R��N �,�;z�P ֧���sa�#N��z
FO
�V&�~�j�)c�'��l���1�H�^t׀�L��=A(00�l�Ϳ�q�d��p3������%Q�E�}9e�GO�	�APX�4��4n���:b���R�^y��G/Q���عԮ��jњ�H�j�sA� ~���J�KMD�"4=�F��-������U�t�,�$F�\?�$��=�'��9N��'O�=�'������ebTq���ʌa���-�������N�s�YQ�P߫BM��Mq ��>�pH3�G��3Z�g��Y� W)2�)/�~M)-0P��5K��O �T^�\ {5�u�nyO�ƀeB�340�d�M`Y{zN�����%^��� �J^XCj�IS�̲yj<�<3'��-���|y'V�RF��	Hk˓�SB҆;D��5�a���Df��C��{�#��)8�h+�7����(;/�p�QrĚ�ɌW�ӊKO���ZX�^�����w�L|7�r���|̬����jg�f,%�I���Ls�^q�QԀ�3��E�O;�S�t���d+ɮ��v�D�	��7��r��؅��GϿ	���C�C�������5Rw���Lj^k�ʷ��7;�QFx���MJ�����f��4{���P$�	�J��sl��܀�z?_��3zM�5��E#��_������qe^\�p��v;�p�q!q�DU���~��Q=��n��e��M��$"��.��?z�M`�Qu,J�d�N�Uӹ�]ݳl#�0=�)�����Tܘ9?z�M`�Ä�Q,���c�k揥�k؂��;i+LCJ� S3���(D�,X-�g����p��N�v�c0/��6�H#޶��ف�eN���)�o��t�w,/���l67Xq���
7�~ӀȄ���`u��65zrM`e9���1	0u��d��4u�����z���˚���3�6��f��jK�H�f�2rD�\^Hbh�T� �=�#M��
a>-t Wp�*\������w�"R��0q�e瞯`2vz�������M���
jF:�v�﫹�["0W�<''�1r��f4�C�l=mrI��*���<O<�Q_��˕~�$l0zfN�=g������DW=' \���}}�^$?��{B���W��g?�˙������%>�js�Hy�sq;��W;}kM �@�(R7Uz4�}���X���L�%�pX��,K&�ڠCOo)&C�Y9j��`<�3i�����H�ѓsK��W��M�͢*���TN�oh�Q�F��	,�<*�S���r�v�q�G9����$]Y����3�<�'���]����2%UZ�FO�	@V���0�e7-��znOz:�U�_�.�0�p�B>M�� 7�%N���TP {}��;�t�\��bJ��O������<t�3<����,H+͑(&�d�&O�	��*��U�k���T��
Z"��h?��./$�
n������h��A�F�Ov8Ƀ[-'O�	��!ߤ�C�LԽL�-�L��@��ї�����K��Zb��>���ᦸ�#Q��+�ʘR��o�A7�L�-��ޢV���>�J��x�'%�U��K&O�	�Z�,��S��$�G�_��<�'0ҥ� �=����f�C�=(0aF����(Qˋ�QFZ�'��j�v_p �~،��,����1��ʗ4������$�1�x�ݥK/�N�,`��7Ý��Ö�u���B�"�#3A��6���l/����.ٞaP�٘K��+�0V�<�(�nR˙ʠ���p�G=�~�ۋh
1�z�1-�+y��s�Sxl����ʇ�<)(��O��q51qq.[n��@<$^�Y�0o��9������tX��x�gCe�:2��+���%��E����������ι`�Np�i��ѿ��䫺��E����
��Ru��T��e������O�	`����zsGQu�v>�M��}�d� ��Tq��.�L��ӓg���.+���S�)`�t.L�'@����r$�`�0��&O
,ff��w�i�1%�u��`��v���1\('���yC��꩚9��X���<gh�XZ��y����ꠊ��SGJ�h��I��<�(0��I���-���-�$J��3yjQ�R�y��H���-�/"��U<B=�(��h{M�>�+<�(�lw�$Mmq�����ӈP� LW	h���Xp�*Z.��a����5a�M�K���V̀ �idM3V�\�:�qc�<� {�b�
�>H4�7��#}������R�a6��Ȇ�R��Х'O-
l0��&�����a��p\�U`�z���PIo�l�:�@�#Nf�ж�a��<� ����֋ʵ�[�e�\zx;s|oh������v1%s,�N�Q��]��H1C��J�I�ɳ��B�%�l3�s�h��
'��G ב/c���}�d��3Ɏ<��pK�Հ ���=��{��ɳ�<ȬJԤ�Tuǻ��(�b��,�1�T)c#�$
����&�}��0?���ګ�pʘ��
�M���(4������$�r;@a*�-�yN7%\v��Y���e��.X� 1Ο�v� ��{�G�i�[2�4Q!���;&O�	 �@&�Pf!�^���i?���A���h���2���(c��ϓ𷐭̞�?	z=A(0eB�b�O�%��s�c�IO�6�Z4mI顇�T�#�-8ei�����|�Mf��Z�]�r�J�u�fz�1c�<��VC�l�lϩ��yAhk�ⳑRܗg6�}Փ��1R&�e =3(�3��l#L�I.C�(�n���f�qK�F�/�{E�,��jq<�������6O
�&��    ]��G�?%�K�
Iy�/V�0���|�7�bL�	����RIv:	{�5������3�	^%'�f%�]O8n���`7��hR�ܱ�:O�'��P�1ûuL�(0y�O��|0ek�e�0uX@��s�'��*��[f��T<?=�'���^��kBT�t�T�#{�k6���6##�^D!�v��j*�s�ڱx"`:G��b:��>��fdt4�|���<J���1w"�ѹ��{�c'�Yv�^�B��iT��<pv�X"S8��ØT����:*N
bs����MbI���c�D���X9cg/��%��Z�@{�R��#�?����)c��W&�^R��ܯ�&B�S���N�l<�R��Fo�Mٙ�0��#��h_�Rl'��&��O��Ϯ5"R�孅�YG�'G���,�q.\m���2�g���w��|659x(�UI�{�g��5;�M��O��4xںl�3;�M�|t�نٲ�TbK��p�q��&���e'�hzn�SZ�2NgǾ�L�,@���б�os͎m!����7$2����n��L�]>�8��mv<���t��2'r�\�r�vv�u�o�3k���~v�L8�L,foƇ�f���q�\�(�6g�ރ�1�5��BJ�LԞ�&BnxK����R3;~M��~R��'j�ƚ�_;rMd��U�]aҶ> �_kzۮ(I9Xt.���t��6��+^#�!A�����#`DF�1�"���9��������S$�ShĄ�b��1�g6�XI��mǠ��
WE3Br�[��N��5�=���}�N{>�G���Ѱ�G�{&�kX��[sf��no�o6;�L��%�'��+�|
���?�@vp�2�r��i��c�Dp|k�34K-Q�&�<��7��X7�H#!�da�p���D���Q���+�G��M�ц%�ӻ����JΘSó#�D6�jjՙ��v������D�����\.2f*���]2�ݳc�V�s��Y;�����"����N3+���y�� ?��Ĝ�x	M��,L��;�L��e�B�C�P� <;� �鸡��3������w3��
�E�e&�5�bZ
Z(�c���& ~�ak�v&��c �T*#;Mm�/bU�IoG�w+�@۵c�Dp3Ma�ZҒ�%ע��u���#�D�W�1"c�{���qc��76�a��:�{f4Y��͎�7�Y�W�&�/9�����9 ��d:��Ld�U��$���K���'�n�+~���֌tң��m)%�u�����H5��J���jv���g"�A�#t��R~��'�,fǨ���F�M3���<�(m�P�O�����D�'8�L7g�b���(�n��U?b>�9����!�)N�l��3���>\ڒ��y��G�/����ytt�0����+���H�70����pG��L�tw��������t���7���H�S�(^c���s��,ͮ�췯�uEpݵ⫶�>��͎~5�.R�N�g'Y��b�z�����^�<r���h�4�+I.h�ȱv"�9�,�}�w+�'�%=�/x�L�X͎��.¨���4���ʮ/t���ٱv�v.�PqJ(y�xvd��A�|��)^�k��@d�:nK%��i�$�T�X7Z�C�>�#2�� �Vy����5g���{��!b��-AV���DȃM=�(��V@+8Xi��mD�%��ӎ(�7�>����������N���nEa�F����ͪء�"�.�\��);;�Nde�5(iwrZ�,�%�(��L���]������%+��s"���&S`����`�zÑ��5��1;�Nd�=�뛥�<�&�����%��Ύ�Y�`%Qee}�d~�N8�N�׫��.�I�cש��̎�YJ�?��V8��gp�`Ž^�T@fG�,��=������&�r�sv�ݒ_�y��ږo���f�5^hDAƅ��o�;�01�3��yk'�k�l�̱z+3�W�![k�!����Dh]�T]0��yi��WT�gd��.��LUF�*�y'�
��r���ʶH�@��=(m�`��͎��Һ�H���u�Aff��|�����HS�x$yb�� 8�Aܤt��O��'ϬƔ����	��59�(�Ou%Y̞��.<C�����f�I:u��;.��N:6�2S�ߐ=K'@n�%��=mc�J�� �WZڤ'�vi��x̆ԏ4{�N��+\nO��p7vX��<���z-�M?3���4fO�	@dd��#Dr�p����=�!TK�SKubH��)<�d�i�ԟI����*�Q�g�t��h���e��Q��SeAx�N��pTG�,��޳14���T�3zb>v}]��?�*Ts�d��P�t�Q���o����?�>Z���%7���y�O��R�ʴ��V��A�SiY����X1�ܗ�:��s�}t���s� �O�
"�S�/���8�C�����'S ��� FGr�f���@�gH�f�ܟ x�T�vr!=�J1�e��8��~?^@r��X�m���Vq�&���	B��%ce���NY�
�#�p`h��Ԕ�f���a��{Q�ް#'}��FET�l鵈�5-�Th1�%��;]�d=��mh�4m?{�x��_<w��R����������r^�	�:K}� ;禓.����y&)�����?W��<'Ѵ{"��\+����==��)������m5}�Up読پ�(����0� ��V�n/d�dp%?~�!4N���k��9��S�m¤qO5
����T=���/���rE%�=
��'�@���!e���;����w$N�����	p�� �Ƕ��<rՕm�b��3��A8�$-���	m�.�)I:�R�MU��u����N$��;�^v��N���ྏ��x�Q`#I�H>U2J��t{�	�#۰�i%�iĸ#�b6d���/���~Z�3;>.	���4gNꥂ��YI��&�ۢm-ԉ��"f�#�`�Ԥ�B�#ST��"����mOM
�;I"2/z32>���''�=���e~Z$	C6�� ٷxfR`x�;9��T-ɓI��#�43)9����o��OB
@��c��>�jv;Jm��^
n[�2cs �yЕ���$mF���3��E�s&e%ZUDR^<	��ן��T2�.숮$8DW3I�6��I�A#yG�}���\��S��<��פ�LGޫ���r��Gx���k�Ǆ����4���W���BL�{�+˴Bh��S��	�H2-���G�GI��m���҄6�W��E@v� O��XK������07�|0��505k��5ׁPy���#俼)�'���9q��Hx8�4i���Q�^f,��@7�5��/����yac���x�Fԫ�`9G�X/��CT@��Y�ɯ٤����}����xDQ�Tf0��� �/tW}w.��q�gx*�s��T�m���F!�Z<�(0�y��Dc��ȔK�1{�UL3='m�zd��VS�]<�(����V� 0�nf�).�ߥW~�,�����nE���.u�a !�H�Q���_v=����/��Q(��u���w-b���� R�����1婝� \p�*p�-�n��̬�իaOZ����{"�q�'������G��QSSb��gL�Z<�(���l�;�����6�l3�����铡`���r��L�g��U�Df��"���OyMe�d�����'`���,~���7PO4
@��U�=�/�Q��4�Nɞԁ�bB�'
`���}���|gdbT�H=y(��#@b7d����A
^/u��('j���ܟ td��#.�3����Ō�3�o�r�n��o\�Bf��:sk��A��8ğmVf�L�8_y�3iS��x�P`b���td㐀�s��P8�K^�]�.P�X<+(�kp���4O-��~VlM\�t���ٕ�O��\Ґ5v
.X�cn��B���"��r����R������	�2Ͱ��.O��X ]��*�p�E�(M����y
Q 7���ּ|���I��� �3�+    ��I��3^¾?�йL�r�̢ |��1���m� �x^Q � �KGJ_��LJS���q��G�Q,�l��� ��j�HA`�֝������3���aZ:���:U=�( ��@ʪ�Z��ܡ�+��6�^)A�]45٘�:DZ[<�(0��P#�IӦm,5�̶��-�E���!a_�K�3���5@>JU,�dؚ��S�i����@t;"����2����Uq�L�:���s~\QD�IEU��|>� �I��3J8��TQz���A��T=�1(mx��o������oI"i}��^T\P�5��/�g��vU�~e�l�]�,Ni�}�?o���}/�_�P_�2������/�ˇ�Q~s���1��λ��x�;�*�j�3蓜����/˜�W3�^ijo���Rq9��;P8��
5߀�LiK��Y�Q�!أ&Q�&q�o����ߔ��C��4��Y��gb�|s����An�=$���;̊���态V��.vtB�2��=�������3"~�	Zr0�{`�D9`�ߎ0�n�	GQ�/y4�-�T������k~J�Q.4����W�Qp纍1k�~ᭁT���������0��٦I?����v�P��L�J'�XwO[QғK��'�����Y,�k���~��LҹJ��NU�Z��~ o��j~"J�����|�Zi�O�_�l.PtN�u�6O*��vZ�fV�ɹ�I��s�"@Gg�~m|��3�连f V��+�"���;��g(�1�� {����u�t�l:��Ktb�S`{���z4*����T��8 7��F�r�5�+
<�(�] {�4�l�֞��YE�v���!E\mJE,Ջ��ȩ���x�]�)��l����	�N�L;�/�;�b�P`��-t�ó2�y_�����7ML��ǚɖ	5 �� ����L�3wc��(��*B��lU�U�A��Tv��{�_<�:1���KX�)�&]��~ {6��5]79���,~z��� _�\�������������_�4H=:����F�8*�\_�#2������헓��#)�IuÛ4��� �tϓt∜��� L��w�;����9``0M<Љ9AW�<�'B3â����F��ZO�����L�~�I>���3WX1�P��w!e���#�����ܟ���1�ZY��n����g�= �!����=-y���6�߱��^�s�8��p ����^�t(���^�@����!�s#�G�5�N:lg֩�|CFG�g��>�;u��f/�z�w ��.�ŕ'���r���<�����0��q�V 3-�"v�L B.9Ky��������P88E�"P|<��f*T$'�s�='�ܮw�}��f}��{LC����kҀE��Z[�7�-�bɥ�������;����+$Ǡ������ BZk.٪�"x���?����������Ͷ������V����򂰠e>!IEc�o���ɍ�	g 	��4��6)�K��?;`cF*��/�
Q�;灨����ȶJU��ώ��t.�}����C�oi�'����Q�9Hm����wz�h�O��k�Ƨۚ��� t�	���fF3g�=�g��S5�3 �u��	���u$*|���I���<��d�Tt���ݖ��m�3y"S�x3�X3P�������W�3������Y�:���+T�Br�������4}����س!�z�Nۨz�f�2�a��my
O��fzϩXh8�:�����X�X�^� ��k�OO؉�| �E��V;� �@7�a|�L����,��>�����Je\��5S#��7��E#G�pƼ����P��4%w�̝{N�΄Čr��2#��h�{�,/�mF�]ӿdo�ਥ\�o��9QpͶq��E��=�'2Р2(�ߙ��)�DS�;�g�D��r�v:�wM�ɝȓ|"l���w�$�?p6����d�2�B�\�	X�]�/���D"&aV�^_�[O��&�]D�6)H����9@���g�Mn�A% �[��D{�����0J�b,5��� _H^�� ����v�۫���-4糩���̋ThA�cMX0S����Ɠ�"[��H�6jD:��͹M1��]�|����DfZ�����X00k����p|�9��j�����EW@ܪx_dO�A��A��"��f3䱪ڔ2祪@7�H��� Ws�Z�%��ؓ���b��
�Vr�*�̴
�Y��g�J�e4O��l,�OF���>bU�S���iL��6�����o��S�c�-B�7�@[Z$3��i2͙��8#�X�D<`�=���m:�����V�]���fsS�B�P��O�!�-���� 5WC`!I�C���?� ��(O�u;���/@�8���a���b)\73q�ԡ�I����{"�Y�z����뤡*�>f��G�#Z:��"���o��4� �AC���֞��Ȫ�  yfO���6$U���7Fk�Sz����Y�
Y��iS\�@x�i<y�R�Cv-h��%�����S���Y��Y�.�s�!�ߗНup
��t����L���Yz�Nd��:����ʏiCk�##k�=�,�I����Le�B!O��,*�j�&P!�"�:�p�s��m �M��.�g�D�tu��Z��Y8���\II}pi�߅v��G��N{G�B�m���a���G����x�6�2|�S wb;;����ݕ�KO��@G��7�g2 F�c��r�B�J��M{�,�Fp���i��3f�!{�	���x?��- �q�l`U��_?���a`�A�
��<�ۇ3�h���UC�Y&�Sߡ>�TХ�F.
5�+�7ܘ����gj!l��밭��'>,ՠ��e�j���j��[6$�΃3sRY�D�)��aE�	�x�b�!��b�q��N����Ч~MRûk<�(2&}�7�N�Bs���7+ҳ�"��4�(�u�z���*sR�x�ӏ"�)�H0�YSJ���7�X�t�q�uĳ{&P�]0ڂ9�pa�� w8�*i��&=�5���uM)Sʉ�@�Gz�ލ#4̘�t�G8��C���rF� �w�wĹ��.�I�:�9]΍&��7����D�f�Hf2�݄���C��^�����sy���$�r���)�aA=r���e9�Kⱴ�w�L�h��N윛a��Ω?��e7e�b�T���;`d9�J�t���Qck�{�t� }<g
^w�[I���q(��O~�,4ڂCe�"��'�����ͧh��u�趚�&Z7��*�g�ˢ���d��tHz�S���&����,|#5Mbz�S�>P��n���"#$�l�ύ�<EFCI�<��4R��1_�񪌡Ɠ�"Óp|�P�ɥZ�٥�����@E�f����qQ�G�#�<.�?PG�(�\e�'��ȳ��#;o�>���l31a�)�7��E�4��]��_��"K�;�\�7�8�$��s�"����=�����|ӌ�g>E�������o��%��Ƴ�"�^'}r��J/�!_�]?� �����?%֕�L��no"4�q �&�M�*l+�"���N��Y2��^M�s��B7Ȅ� s�P~��v�o�XC��x�Tdc!b�ʎk،���*��,M�fJ\3T*ɉ���N�(O�����:+�T��W�mi�m<�*�Ѳ$�S��0o("���:�8$uF.h.i��.���"[=��>����)<��s:� ���e7b��H��D,���gPM���	jp�^�$/�u_A��?%�D��&�;���	�T�����:��R ��m��{0��� �x�Tdf�l�E����������}v�Uֳ�"�&�K�Vw\˖	�u�DN:o��l�&hYQ��ȋo<D�'F|岮�HE�]�?�j:t�?�f��Ǡ��3�"��2���]$'�q�r�9!��J>\55X��5)���-�t�>��3�"##�X��8�3���R�$����-�9xm� ��C���ϙ��}ɴS    z"T�FG\����k���
ߴ�؞���2���kW�KƇڀ[�r�����>����5Fs���s����v?;xi�VJW�u���v��ѻ-tMG�<���������l��p�-x��.Ɂ���I�'���\p��#�i�pk��k�<#�����f�ӯp�čQxx��++VүOz�w�w�P��f�����¢�U�Pa����O��S�D|e}-�瘾��~֦kl�ԫ�	yR��	��B��)4�Jfz8�s '.�U�ͻ��	sY���5�������P7�`�{67U�)�'�B�G6��M*R�M���wnf��A��Uz'���~,y��m���di�7�����-_��D�����o|�BS%������͋��O�KC��G�H�%������ts��Q�K[�`�<��=q�2�R�k�Q��dKR���\���${06']��d!�3�w����W-�Hq3#�(��%�ok�3�F��0y��K��e��`:��P��07E��˫����Uf�����Y��+����aQ�L;!��R��,���3y}1�t�<,]�X5�������L!�i���uEv�Tfm�7Yx�-�lw�NI�l�r4Ӣ*D��mE�3+���O���u�=���%�o�8An�rKC��y�/;ۏ ��L�>?��]�	\��햭���;Z)�Ӻ���*W�zFWd!�\ڹ�:.0c@q��y]��a[��y
/O�����V��3m�k�ʨ�O�6���"����nD����F9��|���j��H���h�\��*�����鞤u\C�$.t�Z2�OU��n/5:V�F���U+��{xgcӹ��/c?��E��8d5^R4V� ��+C��4���s�"L�`K1�aa���?�l�F��b�ͪ����*"[�8!E�֓?"+yuYG���T�j=�+B�q�)vN455��xy�
�i�3g�x.
��R�p��\��[�`4�δ��S�G�3[O�M���S�/��qb��(~�zFW�=�Ϸ=g�����mE���q)T�k�~�C���rrZO�>�N������J#,��=ӥi=�+m���$�M72��' =uOڊ����0H�;�������o�9]����_�$4��f�T�W�(Q�i����T�>R�Ҳ){Ҧ�z�W�?���a��0��i��Sp�#3�E����]"6�k�1U}�rH>'�ֳ�"��7K;x���.;n���B#����,'��8g�6~����M���#�D�6Q�=Q[O��e���_���]#E��"�����p���\ְ��N�mG�C�Ӽ"�n/�7fؠhRep�+W��#<�Z��R��"�n���#><��o:]�h��ʓ�����s����p��+�8���{�΄����$;l�S��.�{�6	�Ԉ|{ǟq���"��6P�uA��_O���Y[����bߣWC�VJ�#�B)4V��1 ]��$��18ƶ
�+Q��xt�F�������"�ݫn��"�7���*Fat�}{��\�|��y�+�$*I���΁=/	m|�n��,���w��m��U�N�S�k	��\t�ނ����FEH����iK)$�%bX{���QN���S��n�������f�_�����N��l> ����n��ų����
�/x�̃���i��p ?�%X�am=������z `0��%X)$Z��J6��7uv�ཌྷ3�o�z&ߦ�Z��!	��n<[�j�%�W�7DN�܄�A�2]�-q����� �o�?�C%K�:��*b���w��8���{iM�d�
V78����`#�zC)HC.�#�D�Ϭ$L|M�Y�2�w�k��3�)]Q"��R�RN4A!�)NZ���\J������7�3}���/�N�����n��SƆ*,���D�tz�HV7Ԧ y����fVd����^0��9��%��`G\z�O�����e��������J<�����~����!ː=�����8�2�	���0 =m�+ϭ�
9����N<%�_g���z������������I���KC"�s�yQ�#�v��,)fj��L7G�I���d����|ֱ5���3"��7��t�M!7F}�(��Q�c���g6+
�9'�쵤�D�3$:_�@Bb`V�B_ȭ��@�	#�����/��TvW������9eʩ�Iw>��������ư��c�=|7W���CG�D/k�$���ӽ"�)ur��.��/�Iip)��+�U����n�\
����p�����JY��i��'{H?H��a��\������\�s;�VN��]E�X�x����I�I\b�`�3_�併�:cQh�F�iVu�g�,j��CCܝ���#*֌���&��$�ʢP��t�b��1��
S�(Ip[����UE�WEG���F���A;Ϩ���I�I_����N צ�#�f$����H��t�r;�RS�%W���T��<�*��~A�`�$�(LH�Z,�l�X���^b\ẖ|��"���l���R?N�W��,��{h�T�����L"C0��E?>d�(�#��:i
C�z�$��"uJ�R{l329�݉��')��#��N����TS*�Ğ���vd�^#K�w��`�*4u��ۅ�,���F�S�+KϮf�D�K�KaL̂cb��L���a����i��Z6w'����M��WB�g-�ὧ��29ҭ��t�N5�B؅���݉����
�Tp�:P�`�0��-�f0ꩉ쉶
^^�%��o`�}�W~3��<=+2��ڟ���z5i�ځ���yzV,�Oވa���+�#Z�s�h�V�L�,��"���Ф���P�9Z��E�Q����L�B����Ϝ\�}�y��zV�ژY��rı^��iV&����\�w�6��n�U`G7��𩕕u:Ϥ�{^p�E��������L�O�G�����Ko�|M����g �� p�Ʌ�,�5���Y��]C����yUdv�&I~KK9�c�*Q����"~ͦP��).�����f:�)�i�Β�Qܬ	a�Y���e&.u�v�Tej�z�Ud����R�S؆�yNU�&�xz��V�O��#<���1I�i&o�y�T�s��T0����ěX��y�hEk/�[c�;z�P�n�U��S�"ȑ 3B6_P�|`z&�{y�Td���HE�vYJ�<G*1=C�&J�=�Ҏ���2xM�����\���8��#n7b[���%����)O^�*rA��L1�N!:y<�i�Xz>�ZM=ᓐ{����9~ʞ�!w��x�~Hȫi}B܂��q{y�>1���'+��ҳ�"�!�D	2�i��T�v<����7�7�6ˌ/E�|�')E�SF;�����EQXau�����f`=x4B���$�F`e��t۱�%�@KBm(%�	I�k��&Ӧ ݓ�"���lZ�����AY
�Q�l��H�@S�񁚓�Ph�CN]J^ʈ!�l=&�#�9��T@Mc�(�BW�G����bV�]5�pd�#9��PMJ�(庫8p�>���i:��,�z2׼sd# �/M������.P�V�H;@Ҕ�~t�mZX�L&�:M?����؟B��B���U��Y��2�5�w^�$z�I�������������z��4o�P@Jh4�H3ϻ3��Ab�&nu���!vz|*k�E�����x��+��G����H�m�4�q�}pG������v$uI$�`�V^Wa��di��#�V&�&�"4�g�,s�E�;GD
������e�9V����΋���O��S��,Bd����(�]�Z~���d`�k�s���9�Qh�9��Oi��"�7�VTf�%�q3p��D6�;71eC�6_�5M�E!xg[uE�,���dt���f�#8**�����O+cY<r~��l�Nɻ�v;��^��o���^T�۫fFi>�������st�t:��YU�M�R�Pb���˅"�89�Rhw6Bи�
̳α�B���q�������J�}N_�B;BR`�?c;��ӑ��H���;ZR��(��D�T�� m  4F�G!dK2��Ґ<�z�2
� <��q3�N�>��I۽�F��=��KHE�����ﳊQ��Y������]�/���!��m{��a|	�<�_��(�2���!e�I%� �z�c���Q�/�^�F���$���S\��2*���7�IΫw�"��£k�u;s���� y�����zy_:���$	~m��_K/f�b_��:<
Ь�"x>H�w�����<�{I�G*�JC�T���;��a�0�Cַ8��f��{�e
m0qBr*�P��QRF��)�1��s����|��*���V�*I�%�)�f�r�L!�L��?Mn/k����n&Z��)4�pˑr�-���)�mϖ����r�1�N��wT��Z����O��)��2���JD.�w��Ц韣K��<�)�2ZR�E�u?O�w��O��Q9k舓��ِ6 �YO�q��|t\�����H����oh��ǈ ��`�)띝�*�����-珑��X��D�9���~/�4��12�p՛���.k�s��uX|y�N�UJ���@��W.q�٧��oK��rr��P��b�U)��H�5��ERƩaw�����	����(Z��|�Q��q�㖀�ÝT|���;c�(� �y����ww^����&�&��igF�T�i����c��������޷��wv3��i	yɰ�ޑ�B�S��?y���,sN�w���?�*~.=%q���wL�3�mĽ�цB���w%AY|�^��
��Z����v{�(j[?~�ڴdt�a�p�/�����Zp>��QNu�im*�K7G���(�ѫ3K�RXQHċ���;�Qhg;A���Ǉg��j{�#�p#�z��н��Nf�|�Rmh�9id`��2*g�w%~p����Hu�>J߻�G5 .�>�a�f�WO�҉$�t�;�Pdk�	]��R�G۠/�49(Fr�#�0+*%Qp�U{G
M�7����{a���6�
��Ԗ�B���H�{Um�������̋lb}�B!�`�ܨذ~QI9�g|�	E�G\r5rӵx��ӴJC��u(�1���Y6�7C��Q�Ö<{G.� K��/`�F���,��D�i{�o���[�q!��#_2�K�CJ�${XE������8H�[۵o�Dɥ���ZhN�4Rp�4�l�ۛ�ػ��%��Zd���|NR#{K�:-8w�á�Y���=�/%�DxP!Z*�x�2?p�^){GG
A�\e�Ӵ"�|z�D?�[ ��휖�aHD�)�l�f�	c1�x�8�L|��a��[��z�y�����E)�i����,����c�]����#�:�O0s��������HJ!j�i����y�^��3A)�W�C�Ȅͽ8���J�GX
-vL�0�8�&ex~TCt��G_P��:J)��K.LY.߉�ym�;p%S�g��$��4��VE�#	�c
m��&�����/E��:S�<Q�:u�ˊ�KG�s�á�O�R���e#����^�G��p��� ��Н��}LTߨ�4�]?�ON��4��'\�\(OkSy"̳�"+[D��#^��gE��?(�LEqB��D�#�7�V��n�x��8��ŏ������p��s���E����Em�Iq�Y�ǟ�5�C:^��˹|�)J�D����E�&bq�y����`&�IR#;�,���J�������RX��H����}�5����������E�"�$*
<)2�`2,Ml�s_k��N��h����60�Ky*iA��o�A:.d��
E?^}��Y���1{���W���`f�1",u�I�"�>O��Ǭ��C/^��ԡvJ%/�@+�2�z��ܠx�{��J����#.Q38���M�kzO	�#�QċUFr�L�(�_�HU�<O(2ڜ�inlҔKy�u3rE��F�ҞT���9!Ř��^�����+e QԎ�/�SgV�U��pk��	v���)D��A��l����>zy����`�
�V�3j�	E)U��X<�(�zy����7jꉛ1O$�,̔Ms2t+L�#���2A/�J�c���7>"��<x�P�ܜ1k�� �Ф�FV�<g(�npb-f�,�Ut5R�.wu_C�NY6�T��g@I�.�:�_��:�*,�G�>�aZ7T%�(r���Lo����x>�3k���w�ɡ�q(yoݜ����Ŏ��Й�2X��y�Qd`�+"�q��~NL.�ȓ����S�"�?���UsÌ�<�(���ʤ�R���U&�$�V�}?�|���^r����I.�z�A<x�R�ߞS�<~�A�/�@���ku}t(�R�tyA��j7��a���m��O�@��Z��:(��_�w0q?�u���4{����DL�����*�/&#�ݓ�"ԁ�S������KT��<?)�u�*"�3���B�&E�����կ"	�OB�`f�d��v��)(>T�c�$���B�&��~r��ӑd�Kǥ�\ʞEԌ> �=X�d�T��H�m[�
�|�䉴'���3�"�6E�%E��|��j��r.s�|��Rg���E?�fm��JIw�,��Akb���Z"-nOJ� �J���I��>1� ��A��\wcKyd��"(��l����ٚx�e�@J]1i(������ 1���A�>��M~X�Zpٺ9��l��M�<s)@�����!��餡��5��q	�����P<�(l��犙7�A�|�<�(��o�DVؚy}x;A�֡��/�5�i�"<��4h��eW���*W�IS+Y+8e��h�ʘ`�#x���2�gE���lf�1S�O"Bh�O��s�(2t��Wd�7�ڔ��'E�|Ԛ���U��`���x�꥖�tѼa:y�1�iJ��5��T+�����+?\&<M)2��#�|n;��	�Dg<�)2�q�qO�k3%�Urj�t�$��c�g`'�����N�a^��W�b�oI"]ؽ�g*Ex#+�r$zc>���*D/�r}BF%�L��u/<)��.L��k��܌$��$�x����1�C@��e��ah��U��Ys�k�Fb2ixlP�<4x�Rd�J��nU63ޗPI�d��
�\7�D���(%!p�u��<H*��tW5y!e�f]u����=a)�-
��q)�)[�s'����S�"3�"�FZc����ʚO�.��ـF��}�z��W�<�)����0��t)�K\��3�"d �e�X��3QD{����M��%+��p}��|�]�ĥP�<�i3Pz��&��R�YE�L�[�(H�Oz��4��f��rҊ�-�f!�}��gAE[�Lʌ��X9���S����]�n�0��)��R���%H=dh3���|�I^3�D�E�x�=� c���oEE͍䱞bh�EW��3n�����l�*�Ǉ�#�0��PXLۋ�o�O1nfW�*u^?j��)�<T�%}�dJ��cֺ�?����S5(���a���ċ�޺�KK`�ŧ�LN/#Y���t=���1�b�jɖJ�z�Q�s�Q���z��8�%��2H3��d����N�(S1���Y�yv�I�t���R1�4]�~�Ȟ���"���Lf.�W��� ln)܋t^���*��gG��[C8I�`��o�C��%(��X<k�me��=i�eM��-��!I�'��U���ŋb�j�Y�����TB�>�^���Wy?��,vGM�f�S=x�H6���I�ԅ��R��^Cq�L�0�C�h#��_>li�&%{�3Jk����K�%I����w�ԶE���'ؐ,U�%��~GgH���$�� �LBK"0C9�Z�r��z���ГW�*���r��<�;�eQ�­z��!�9&!`�H�<�b:߱�!��aAd8[�T��>�?�:m�      �      x������ � �      �      x��]Ɏ�F�>SO�����u�{0��q�}�/,��	���H5���X3#����m��� ���GdY|�����y����8��Ӳ?O��:/������:����:߮���(��P5�(���}9��G�kkmW�}̯��<^���i�N �_��y��:/�|�� ������t=�����v�_o��|�O����j�_�������ۼ�u�N�i}���7�,����X��~\ާ�uD ��Dj��+��|�����4?�ݫg���0l����<���8��u���x��3��~|[��|��x��g���o���ݮ����q��Y }i��k]oo#~<e�c�~�}��|�=�¿�����di�g%�����Hl�{�Oq�O��:��갵�+tN���m��y;��\��,>�����r�ߑ�nK8t�sK�&.�
v�~��rn��B����`��^oˊ���ё���O�&��:;,��+��?�+�$p���v'ތ�`C�L�~~{�mrPiy���^�(�5���u&xW|��z\a������<���_�+�	!`����	~�w8�.Z}��������l�O���h��i6�CS��#�G�p/���	E������t?�$AI��6��8��H����~ږiq���YE�N�
���>N��0�V�j�H���iz���u��p\�A%�q���2l���.l7�_[着�-b(��t�QP��SV��'
����r����D{�?]xM��y��Ϗ�|�_���`Wg��}9�ȶ�ǿ�z�m&q?󇢷�[^�W���������x�i����7��.������(��g�����q������c�>!����}a�י�Ͳ�z[G�7..BC�ی�����H����|(�m��͵]}(�MH`�%R�$=��,~$�B�|!qE&�t��i@n�Lh8�If-.���Y����`\��B�0���R��"Pۣ-���F�d�:_O i�@e?�@��ڮn��jP�P.�W�0�\Xp��?�$�M�a���,!�&����8��c����ID�O{\y�9���?��8��CXo���c��>��||�A����:N�!���{1ۆ�JO}ZQ[9�4��#���'A�e��,>_q���hy`~_���Ll�e��jW]�5�f�4�l�'>Ժ�M�I,��3�{�jnS|$�#��UԈ�����Ade�>$*<@���T]�ڮ�_��Im����Fد���x�x��Xr`|�����ΰG ��p�P�ᮁ&�G�h�6��̱��
N�>���s(��|�5�C�����@v6��� π���k��`E}08ء�Ӝ��T�V�2B5b ]��:.��gj�o�U?�ˬOn�&�S����u�NrQE���"�|ŝ1S����r�l��vmS��R�2ld��$u*Qj[����G da��J�����@�P2L$�a�G���\�~�|C�^V��t3���D���6��nkm��F����o�e�28�0(�P8��\^0�:�@���D�Y���ŨlU4I�bm�8�����Y�~%�lpmס>���jl~<����%�ч���I�C��D��5v"���n�]A��6�L�d��>��݊k)��[C7:OiX�<�2s�ʗ&3lpm�u��p�$��<�H!��(��A
��Gb,3J����'<�,Q�x d���HL���|�
��E,���gw�0H*�HŧE9���s���)_��µ](�'�u{T$���i�%�L�"���!�3�Ŗ�8�RI���j�Q���gQ[ġ�Mr�T_��Q�Fl+�F2D�
l��vCG�ͮo�:1���z�@(8QZ5J�KrH} ]�:�(碞6�8�>�>�o��s��${�U����!�����)A��DaR�j���@b��Q�%FP9�׎������;1��]Ď`�AJ�3�A��tx��RZ�C�� � :o6��(W:���|���\��=�%9X!"�|&�h���8��'
L���G� �F�j���V!�(����Bތ�D��	|�YպI����K~�(U/Uf�����!לL �(��6>ؾ��؜A�'�(Pج��	��M���G��@h��z��P�d�|�K��'����K� �(õ�p`P���zPV)�m>�l9��r?��#�b�F�& p��WW8��$�b���]oh��� %�P� �#�v���S[����^d���g�mS`�/>�#CXԀ1��PA����M�q\�C�#�!f��(4<೛�L,��(�`��r��vñ����
)����N>;8X�A���%���hT���B�C��0gܸ�������4�a�+;.в���B��c	�}��̽�0�ր*�Q��(�fD�'dMIS�����f�AjpwG�XykT;��-� A�l|Wޮ��ѥ:��d2�	 �Hw@N���$=�B9��p�±֖dτ�b|f�D����^"��� ��ԢX(��D����$㩼����5U��/�s�k��<�K���R��_��`���2���%׼LAh�Q+j�&�"'lU|�����A�9}s�ՠzb~��k�S2�f��{����e�vu:o�>�j�M�yg'x+։|Z���Ii �Ȳ�FW������䎻pzut'2 ���H�"O�5/uvpЎ��W�ap����I�8�k]�C�/�k��ų����"y0���0�� �ƈ���� õ�� 3S��K�\�
k3�5W��0���.� .����%�p�
'l��6�M�N��7���6�)��?�Ѹ�����aN�ՙ�l�j]u�;�.����y�r��ppL���{�BK�J~D!kNigVn.lPnT��P�Y�}��N��f�����[�`">Qwԙk�>խ�ڮ�#k<f��������؋��\K��A�'����%��B��2��OoR��`�9��p�/~N��)�`<��G�R�%D�Iu/yv� \KdH�D�f$�c
�9qN���M�	I�ϷeL�x�{Qu�"ӑ�g�o4%�QJ�eM�.*�i��vpj���]��@ 󚺗<T�k@�H�uNJ5���ߋ��1R`:C(I�cStb���d0Y��G��O!>�W.?���\�%�/T�U?�x�*ǏйR�6}G�^�|�n��R��©���J�_�O'XCa�W46X�M�)��-��3���\��F��������H�ᒙmyu��o��r�Ǩa17�Mu��(U�R�6 n�����NH.��f�r#��Br�� ��f�ʸ�ve{�)�P��6�����������tv�1��}D�'�­0rnL��9J8��<&cJ���C��n^�C�gZ�;u�~�/�l�q���0`����m*��7�A8��Z�N󃫻]��r�3�+m2Ǻ�\ �%kV�6V;�rK�*�_�)�c�Ǎ�\���s)��?���ZoӬ�8�ɥĀ 3A�mi�I3�1}{���G�;��:��"���\C�TjI{bY[}Aa��763�)F�U �5|ȁt
q{&d��Srͦ�
(A����Q㔋,֏���m�z}^k>��]Iĝ����9F�y����|\J[�Կ!�`�މ�=V�$�iM�Y���Hi5�1����1�N��z(�(�*��2��o����C�8Ϋ�`�o|�i�� Y5�ru����nl��^&+���f���ӏIV1��\sa��D�8i�!��M:��4lT��h��E�M.pARKd�b�;	�#��|�[L{��u�K���4�Hix���G��T2,�tɒ��V>T��Æ�HA�"5j"�Չ2������9{a�rGb|NB��L�.L���U���.<��M��%��t�dg
M;���:/h�2jXK
#��M�#m�)>�D�B�%G�XVx(a�#�)��U,�E濒vɜ�a�#� ��N���O�Rɮ����/2�A�;�r�`BX(�����.���<����J΢�5]\� �  s��ɬ�a�1�1�w�[����x�l��F\�
�,��&��ލ�D�j<���%��6��F�r�^��a�C�Q��M����$t�0�������s�z�7�N�2S�q�/�?N�����S��[P�NО�+퐖���
�����B���t��\��P=jF,����g�(��������u6��B�{,���YL��	�Z�g�-,!c�H4�\DK�=�&��v<�i(�8�_�j��2Oy�P ��t��k�8M�FK�MB.b�m �``q)����Uw.2!>�qy��P'͜��l�G�mb��|B���g/~9�� v��P]�E����� \�=JD�����J�x�?��#�Q|�C��кL�~eqҒvs���%.A��MA�E�I�,7ڲhmW�,�`��,IbܒC�,�-��ѩ|�2�6j��%���>�VGp���D�S��iOF$a��
�Ȣ���ꭎƋ��&'N����kiØ�����P;q}о	YY	�fa��&�x��R�@������B�˙b�5 <�2�+Wv@�X�i|A��'�ԃ[����Lq��E|Rpk%��1�AQ���H��-c،ū�C�xq`+��5#&�x�*��)�邧JW�4
���vt�5q��uN1ڭn��V�9����_���-ٌ���Y��A�5d��ue��>	N̞�>���Ac�a�;��\�<iNBZ�ɦ7�����s���ޔ-MK'.[v�c@����,Ik�
���׸�<��Ybm?x����\�e�Nq�H�N\�z( �¯l-�1�X��Әc4��O��'�:5�3�-�v���������Z׀`ÓW�,��"}'NKQ���X#im9n��$c�������{�~b��"��m���7Ң�$W��V�5�>�h/��K��uʂ)/���r���Kt<��3�C!i�nb�����I�(q��g��|�6:�mTk��<�&��Dk@��'���B�9����4���蕎����T���<�Q�se��㫌�i.2t���"b4z��S�2G��#���u�<%Ʀ���^u�F?�>&�~#6�]�dۊk�������L�P��1�!�:��g����2e��MZ�U��N���QM���@��R ���-�t�W48�Et�bw6((W ����c�A3���5S]��<�Ik�N1�iq�W[���=n�J�4��z&���g[�
#�p�0z�dS� �*�Ǫ�.�ڼ�� �����1�>���pz�A��X������.Q�,-$� ��	����5�{i�<�e�)�C�w���ML�0�I��.s�ڼ�րJŝR���_ۇp�0���Q\O�S�Q0�JI��P);�567�}�fuB��6N��vv���k�Eb4���%ے���\]�U�,�GƘԶ���:��C�8��c��ݜ.�������esl��Dw�2����T Q���?�*�|�����UȌ,2�&d-L�hZd�ﴇ�N�C����GW�R ���u����׿j���}����*ƫ2�(�`�zw{�u\��itN�CKi�u:E��i��I�-���D��*��X���7E�F
褥^�L)���E����^��ZwTu�y��G��>3E��_����G�zJ,,Ya�P����Q��ăv��eܑ���P�6l�����$��չ�(ԩΤ�l�n�c�*���N������bQ���P��ϫ�����k�^ZƟ�ЛD�JA���N�e!dZ�����n�:�[c&#���>�κ|�-�����N�I�����מ��L�M�̙:7�[�_�:�N��.G���?5&�L��쫙�`��$ް��ƚ�'x�';����6ܐ�ܐ�`�P銶[�w�P���!��"d�Qq�5�r�������+Bg���t��_���G��"_���]�L���=O�OLm��S�@��'f���x��&��*j���g� ��z�E��޷Q�j�#*�#V�NL��w���j�X��3`���7r8=�p�#7�$�1��5,�e%�3vA�ƺl#Ėw��I��䋜Rn�w�����
3�N-�>����lD �fe�^��+�`��-�(Һ�ڈ+�N`��j��X���ֹ?�$����cj�\���H�.�9'%A�k��̧��#Q5�K1(�R��'3�>����/a �9d���	f��4p��Z`�=K�
�B��m��]��?��e3�4~���Bf��l:Z��%�`Eg�7Y$-b���\�r�R�#�O����%��\��"X��"�)v�O����Cm\�wh�P���^��_�f7� 5�D �<�8]�ښ�q��,���#mm��Y����Fg,��H]r�פ��
QX')s�^D�L�u�qC>e=6���X1e��Q
�[*�<)�������Ai6R�#X�(��-�AE#��Dti���"P�
�˴R�LBf;�q�����_�
I\*�&?�`(��y�2ՅZsQ�.���?��)~|l��`v�>9�T�Fm�`���a_ى�5���4퀓{e����CU��29i��yGMe∨〉4\��#M]$�����Lh�K�̍GqaZ�sD$������$$2�a#/�k��>H�����A[���yO�:�I@f�qA�o��qi�@*��	ozLe`�\�Co�ђ�%P'�+���u��V�Dk��Y$�	�a#[�k@��1����ךq	\�mr�]��e._����=洂��"�Y��c0������x&� ��{[�>��7�sR��}c���6Z�cȂ.rnԒ�_2�4��8)��eU5�ysm�Ty��C��{�1��X��хVjb@c R�s��M��y�ۖWtt�w��g�����˅DE�Ӻu1Rbɘ�;�7N��f���X�� 1lk:��[c�L7�����[�����.���S���D��N�^�����$r�E����v�#_@�S���a0�O5S'�.�#(�~�0�y�&����w���o�/Fb�d��H,����U)i�
�l�(U�8�Ab�4;PR�����T|��25uI��&{Z}��� @��0��������D_�e�~0��L��"r;˖x��2V I�.�5�$�ɮ��z���	7��(~��]�I��c��֮�(�1��|�d�brȎS���B�5@;�`sNd��[�B�B��ڸƪ3�F�$}p�G��,����[�ҫc��r�\D��/�[S2$��"�, g(U�J�5@��J����J�Ǫ��E�	�'m����P�����"��!��Wy��M�ɇr��}�*�&A{v�YMkT
��g?�)Z���bx�GM&C\��E'ݞʿ��_l\~�pْ��1�ƚGrm���`��y�G��aO��TF��q��]�dК��9�{ua����QsQ�P!M����d�yZ�p�s�.���^��N2@{v��7��*i��Z�����$6�؄s"���b1r�N��.��"�@p��xP_��Q!=��B��$��ŗw��|_vQ�Uǝ��yv�  ׼5iޞ���h���v����	?�/ǳ	�{���CR�IUtV�Ű�4��cx7�@n:T�J~9�� �����VԭD���>ơަ��^���i��)j
ƃK���4�ט�J����������,L���sp2txk�#60�鐴t:{��tӭ����B�yΆd�5�t�Bi��!�(i��I2E"�/�)��K��O|�oR��p؞c�Cf��ye��j�%���
1O��V�)j�4��B�m��A��1���P�(�a.
��v�9g�ɴߜ �v����-���d���+ �qfZ�M�(>R�ߺ����4�:݁G�^'fp�o���2�3�Ջ�3r�b|�;��rMv�1�c@A	=�YO|�q��,fA͔J�^���Xα��Gax���<�;6)�4���T���L.��߇�n���i�         �  x���A�-�@�ϫ���6��Z=��
*�(��_�(*/E_���	�-����?�?���������?>?��Gm��������~��Ŀ��b�ώ>��(�\�1O�`�nǀ�@d��?���p�@�@b�a� >��w�н\h�@��ˑ��ϔ����|��y�9������P��t� =�:���c�ݔ��*��P�p���~1��[�a]�/~��k�5�oV�b�'����<��I��	�0���ಏ��T�3U�$N��,�r	��H<��/��$���O�x�1�EK�\�N�L>���i\E�
���V�|r�	�
�=	&kz�M&0N֠�|�%.8Y�&k��L��cM��}��`�x�*\�T��L1�c�d�p1�b��Y��@.��$a�Y�H�C�R�M��&�.8ه&�p�x��C�}�I��N�Mf�>r� �\��|Rk'���\>z�@���zϧɾzɖ�N��ɾ���o�T��dVx�R�.a2+�̢WX>�b&���,z���0գ`��ޚ�/an�LF�[{�� LF���K_�dD0!/\��b&#��٬���jM0e{|����d;�ތ�H��3c���y��Ţ�8�
&#z�eW��Ɉ`2B{i�1��2����b@�d2B7�^h2�LF苖:r1��2�OI��������[�^WΒ���2��$���L֤MCx1��2Y�6K���L֐ɚ�i/�XH�ˎ{���c$�QTSAb�'�dVڴ�����II/4YC&kޏu_x��-����n0���X���c<Y�k��e�x꾔�;��D�WF��J����Uf�Y~s�x�5l����t0���bMF���>��5l�����=��j[��a��a��c��Nɥ�gv$�Ns��5b�X��Kc���^˃OְŚ>l9�2Y#&kh��d�FL��zG1�d����u�d�5b2���j0��1A�f5�d�����89�|1f2����` �xH=|�COT�r�|�E����ZL��f�y��c���#˙bv�p��ܞjmب�+�~��^O���Lֈ�~�Ś�A|�iޓ��S	[�Zu�{�Yc�y4��C/f]�cV�}��%yN�\���DL�|��d�l^'�u�}\k��%V<cZ?���3��f�_g2T6Z]�dh4*�d\�N�F��q�\�c(�PC��S��)V������b�ޓ`�8n*�� NG�������A|,����G��}`���?RlD�
�}B4Y�Co&
�DM�χ�|��t��bԞ<�gej�
��u&��z)4���W֣�V�CrJ��k)HnG9[���g4�_aɨ��N�QM���f��@���C�/)�A��K���} U����K�p1Щ����~�\&�b���j24m���@'C�dh�T���N5TM����g0��>5ٗ�۞�@��R-f�Sǎ�>f���!��HZ-z���m��<�/����b���vt��j��zޗf0H�5�b�������L#׺6�Ɉd1�[�!�A��H#0��=�A��H#�0���i2"Y����c'#�ň>l���cD�T�&=kߢK����Ԣq\Q���A2Y֫�� M��dDXۉ� =FdmY2��(&Q�'��;�E�v���dM��(���fM�ln���_���\�      �      x������ � �      �      x������ � �      	   �   x�M���0C��0�MI�,�	���	�';��0x~�|����G��b���r�D���r�A��|��%f��7Gd��Z�<��R�Ug��P^FP.�r1�b��rU�؆��w]����(g����3Q[��,�Y2��-ai��,ٷ5nx��$��V�ĝ�:��1W���i���g�            x��ْǑ6z|�6�kT��c~�f-�ej;DH�����f]+�(�۟�-³st�s�6"	0X>ώ�p��yx(���]yk�ʦ��ӡ���ϧ���V����/m{i���/�s����z�����{����g�����ԟ�屺�W}h���O���Ow_���/�_�����t�\������׿�������_��suпޟ�ں}������|�9���?�Cu�����S]�t�����z���S��ʗ�����r��^���X�����op�����ۿԗ�sy=��_׺����:���si�ß�ա.����������R��߷�s}�3��Ϸ��f�����?������ŬX�y>�sQ��woV�����~(��Ky���|��oM{���ޕ�������]���K ��]���q~�]ڲ������2<|��ߎ�a�{�ܚ}}�ۻxb@�w�j_5M�~�5����*<E\_��'�'���r���Z�7c~�Վ���w�����)�����T��Z�����>�/���&xo�[~��A���ؔ��:���sU�e<p��K�}kxΛ�Ϸ�JG�?G>�#�|��~j��>��|���S[���S���.<U�E�_�ہQ�swX7�玠���/qw���oj����������:Z��w�a>���{�Z]�՗x���z��߮�Ĺ{~)�[G��y��j�&�A���P=G��x�Tד�<��.�?oЋJ8��ؽ�eleZ��4�p�?�-_D��xŷf<V�ez(;�'�H�59�cx/��exw~�oA�/�G�NuS���~�����z�h��*����2�p_�c<$�����'1������p��p)=�?�)�8S�P���M�G�O7��V//e|����u�s�x����t���_�z�f����6����ʷS�Q��}U����]�$= �w'����cN�x�º�;t�3����c�4���r�.��K���ܴ4��W�m�P�2��y�KS`�揹�<8�c����"|*�[�[�o���ԡ5�v��B.��$�O0m��mG��^�s]�2�aI�
�!j�{��]UîI
S���Nm|�:���h�tw>�t���R�+*<�~�|���������
�r�w��t� wE��tY�#��ju��߄�y�x���/�+'�q4�T|�V�<P�
â ��)B�;�[K{���o�� �*_�����su��儼/�VT�;�2aYR��1�{C�Q��4q�����t6���6	>��A7 }��&OܞRٙC:�@x�sEߡ�^*8���u�/Y� �xg������F��S>қ��/�Q�P-fC���X�o~�a���\z��l�i�6Я��o��"w��>J�<�.��w�\,�_3�aF�`y�2�N��>����M�	��U���4 �E_�}���l��";�v����%���3�z�А=~��e9:�x��=�� ��|�c��%�˨n �r�Y00s��Qͼҹ�h[�=�e�Tt�/��/񏳏�N��=鐙g�5��!M��'/A��v��J\����n�ow<�o��N�K�/~�� �O1#[�_�05���Sa�g�n8/L�Lg�s�H�S����B�Q��uGt�|�k*�g��_��(�=-�8�����23P��{v��Pބ'��C�Ȍ�$�iYe���m���OsM�߆w8B�nl	���z��"��s� #���0��ԥw��8��]�7��w�b��j۾���'�jG��yx|y�m}��^�i�.����y4q�-p/����zX~�<F,�g�-�y��[ ����t���%K_�=��<�rO�5��2��%�+��Tl���d�
<�e�O:�rcY�5X��4��P�Ԡ+�G*4\q�-�^�_�O��|�ޥB��5~�F��A��8Y��M���&_;SĥH��L�>��}��bs�<�0St*�λ��?c��F���p�ךv��X[��6�١��z>Ѐꮌb��sl�|,;��>k�"<��H�x١%�3��|֗<&H/��%4�4+��ߋ�s��d�;ȗ�do�k�J�油��p:������M��ZR���(@|���F��`�¬��rbY������@�V�]���F@o`w��XČ�{�k�/�b�BZ
g�X��U�
4��.<>�~ձxhx���wlO�ٟ��nS�=xH�F��̀�\����a�0��n#���l˃�7 ���cm�u�;���o��f_S�R]�XT����E�H.��F����1��j�%���|_���];�v�����f����hU|�t�-�^�G��r��42���t'U����K4��X`W����C�{�cY�x
�!6����7γI^tSʸ9n��;l�ʩ�A�[WZ༝��e�`���L*el��B �r�-p��{��Eތ��(3>��#�����)/�h�
���j�ö�;��N�@vL�5Mt�����ԉ��/R2:H{$�<_�q��[ �Lٵ�1��e�^���ɑ�@z�K����qpG�x=����w�zӭߒ*��ߗվ*,���s/�E6��L�!���_Ћ�A� y�#Bp�����vz��;�:�����P_�f��c��O�|�Ax!�����d��l��y���D�&���⥰(�<<�����r�Zk�(�O܋pb��m<9�zF�)܋�6��i��ؖ3eVn���(��1�����u㽃b���ñ��z~��2�T�YPFrn��@�����Bk��)/��1S֑�@����H�?�S��Z�ҧ���'
�O�7�����g?��WXU�"qjQLE#Z�A���g���?�h�����S�#Y�#8���w��+�5���$O� !�_�>Ǒ���)�3�M;�Q����Er0P3zy�*6?��*^Ii	}��o��"i����#(|�y�Ů%��b��LF��*-;�@�oK�Rء����)�hQ���j��(^��l����O���!�:�
?�R�\QԤ�C�
��CN��d#�cH�����P� ��.�=^�l
���w�P��&@�'�)���J�'��~?���E�qH��ٳ9�p��'�g��L�Ӽ�H?�ɽ&u(¯��Vsߎ٫c��q���I�XJ��Y�c<��n �!ܷc\���6漺p�M ^��A&�|Z	�4�U���mv�<�?�)>ԙ,�=@:)�W:��&E؄�H *��P%��BzAcOG{����@{K����{��8˽�Ï�ݩ�sq�M�߅�9��}�l�j�WLe*�('Z�\���� �u'���2�ފ����߀{�o�]��5G>2�=(��!b�t6B���>����Ӂ6z����ĞI�ĥωV��� ��Hel����0w��7�.����	�4���<
��t��p	�F�9����l1<K$�.;�2�<yc�x�y��p�
)��9���g�)��|GA�̞�[�[�My4�[���d}������BĢ�'R�,��O�k\�0����^D�S�H�&���J ��[ס��S��@���Fx��:;���Y�[\4-3r[�N`<�a�x	Jh����˗z��z�Ч�6H��/Ѥ���I���).M= �|��
��д�?�i�Λ�	΍��R��B[���@N��/��H�F���$�|%"kE��~�Y�]��¤;�J��>��X �f��3��Q��/��/1����o�Az�t��Co����m��[��R��i��'�d"�c��i��QD�>F�f�m�R@{��p�����%��Q>"<S�}jY��M��+���)��䴿�Di��K-�J���j�Vc@�5�HZ�b5��h��O�H��u�M`ބw���q
xt�yK�'�|��5_ �Of����[�b޲"C9Jqa<T��]�T�]W���R�������X�}u����bz��x����pcR/Z��֔��ț ?'�4��ehՊb� Fs�m��Ԗ������+�e��ȍ-l_�^&�h    ��XԯT�j��>��C�b�c��4Z�e��.U>ωpzk� �/��9�&���U�v�+b���u@�H��T���|6f����<>s2&.p�N��՗�?�r���)F���s+ߙ����k���`�2�4k���jьQ0F�`���U�B�g<����k�G}npIuJ7/�Q�/	�J�X��)||!����R�#<���|l9�;X�x��-`J m:����� cȴ>��&�X��_�3�	{M�ѕ�K☛`��Pu|���ӯ:?��UG����
E=�@<����I?�� �#�ar�,w�V"��|9����r_�t�$��	��>-]{K��39�9�&Xoç��޶J�;C#D2?�m��]+��$([69q|G�P��ộeO6����R�F�og	�\�����ē�P�M*:ՓQ`�6�z#���e��8�&�/������ O.���K�l�k�e�(��p��i'+R5>D�)�.Ҋc��co��
=�0I�B��W ��G�E���o�?�;%�G.=�Kh������r6�C�^��Q�T`��W�j1�����&���.�0y>\˪�X��BFy��e�;:��稙a;��e�3¼��{�܊<D��x��J :�� �щ�߁�l�"���%��!�'sYk��#�$
�>(8�Y��сĝ0�p��Q��V��UwM9�Qu*��	�+2V':�\w�5���ke	}I��S��P�@8�&(o�ǅ�>��r������*KN �P���8�&����^+rK�P��%]�҇f���q��u�s��a7C��b�@T_��%�n5�ޛe�e9�&��Ï4[��Z2�5��9�/ة�w��6�o�pU����Ex�v��|kE�� ��ܓh�bZ�Ӻ��~��Pib����9��ݸDѪ �p�������A4YN2�zM�:d�V*gQe�r뒲����5B�>J^�(��1�W=a���p��B$�3!B���GD��?�Л@�K~]'be��*�F){L�� �b6?�Z�t�$wt�O����t�6^�Z���+�P�����$�=-��E�TV��_�u�.�g�t��6�z~%3�l���Ҽ���	�K�d�ME�`��C+��54�� �CT��=G{��s�ux��Yy�����,\vƲ%��]���v}������%Z~@�.%�"�a~"���/��r��ė%P���X�`���7�l'*�';ȣ ���7��>�����h�5�);��4��6{��3GmiS����E��w��[N��y��17�|�S���D
r��K
e����S��G�_±R�ЪF�J�����b9�h���
��ܤMą#Z�])�8�Ɨ��m��:����`09,_��m�&�e�f<E�G�����N7���|�̷�<E���6ʃ���	�;��W*J�ܵ�:���,�y�x��8f�6'X����_%)�}�ӹ8ά(�/D�Ͳ�_ݝ�q�lY�i\S��DZ�&"����5��m��p�#sY��s��,�Bvؗ��̒|�"ܩ���9�x��"�a~�! �@��Bd���sg�M��Ss��(��5��0_DS[�8�&�n��$<���H�~ac�|E�s�	�[�7Ӫ"/�8�&����0�{��,Y�R�p���DY�蠏���j�����Ox��q�y��^w6�{��sq���O��aqws��%�����y,x���&w>������K�z��G�",@��9���7w��4�j�Q��h��`��F
��sϯ1�}�|�J{S��s:g0+��6�{>V�[�-O"�R���e�?_��m�ݢ��*�#%Db�F2������SXȳF��D��MZ�����~/^����0���d��2�uZ��0�x9���SD��p��0��!7�|N�hu�H�j5�2裏�c?�����z��"�Ejo
b �S/�O~�W�xY�������I��T֬�U�����}~��2�{y"�!���ʫ�'���-��N��g0���K�K0Z�5�h	�ၖШ�B�<E��C��a���"�n���|niD)�^#ķ��@+"LQm����5�w'���f���F���$Ht:��K0Z���X	V��Dy����R���6Az�N@i��4��Z���2r��˿%��
�g�$f�g�Za���f鍩+��Gy@�5����¿|�s;؟�+]�$7���!7��M,xJ�9�{�'8[!��:1�� �/ndf����9ֳ��w�f�{���/V�Y{�LX�F�'�c��T�ǈ��	�Ԑ����\+�x�. �����50q�~���[��p���>��3/�I�$J߷�E \�8@�ǿ�߁���y�Bp�~Kf:i�1"v��%�
JlX��U ⊻?_�)��R�����J�^�qtb���^��]�g��;}˨+PEk�j��7�?JG�|�T�k1Z���h-���x\�R�e���f o�{J��֋�mց6z~Lj���s��çtH�	�;hb���P�Ou{�I�$O/��Q��\c�of����9�5�=�ݿu�M��C����cs]�e�s����u8���,�'�;�",�Ͻ��F��>>��sUoX����^��*�:��GV�XP�b��2g����[�,Jr�M�^��7��ktlM��0Q4�%#;�4������3u#�7�&�	�,1H���k^�F�}{=^����r��t�<��%k�iׇ�R�8r�M0߅G�,�rs�S�̀Ү�ă( �b���kbQ��Ի�;��@�2u�*ـ<�//7u�����+�h� \��K8|��*��f<�m}�:��a>b�]�y*�x��'e��2�?'�4��A	�N�L]ӽ�7B}�p�ҵH�#�*�Ŕ`�Ӂ����xYF�2 -�:�(�i�Ţ�:��:��x�ʮw�	�P����p$�L��78�&�o��9h�FC%�a��1>Ɂ7~Ǟ��3�y�iU�"v�GAP�eU��?����o,�M��Bٵ�/Sj���y�[��x���C�x{i�tފ�R��_�ܧ����yķ)��lK��I`ŝb�H���c��ك6�K0^�A�GJ�����p��/x��2�B�&8����r?�j��/-��<�|�z#͏���c��I�FZ��j��!���&��,���lu�H(��j�a���¼�tiWG>�Q6{�UQ���\
��LgJ_�X ���(?�"G�<���'z(A�yڎ�	�sh\�F����j�ZTf�s�&�����] ��ɗ
���ZԦ
7�������/��K\II��љ�	�+✞�LP���Fy}-�� �	�{ڰ�ͬ����"�k�#��l?�
/>�u�m�9�#�� ���#��k�U�7�KN��w/5-Ŷ�&��׋-2�_���}��Iv�-��vd�igyJ���C�6۸���D)zB��R�g�	�شMb5���Y�j��{�*��\>ˋ��Q��Ex�d�|��E�܎�/���Y��%����V�`��!1��֧}��#<�pO>6�0�EU�z�R#ٲ;�&h���G1|oԵ�?�BJ;S|�"u,��G-� �����Q�H<�)�;����`�\��W��	�ēlՃ�'a���b�o�=������o��������|<f�.��o9L���M)E���,�J�:�SgNu
9u�M���<�8�WNC�&�=@�f�[u�g߂��иOzr�P��tu�MP_�w8�EEu<<��Y����A{I��2�e�u�mJ��p�)�+��� �t��&���1- <���
�|M"�p�]K|�
0��/��J��	��Ɩ�t�~GJ�V��~O_-nn[�mx���J�V��<"3]�Ya��o|������F�Y���]d'q�q^̲�cl"u�@N�Cv_@>Ft��37���i��x��]��r95��9���b�"<�4��Dx宝�j}Giz�揽���K'J�ԣݦs��
��Fο��|�aSy���Qw�����]�}��H�    �4��Hm`�p�r$�4=�/Ԥ��N�S)�3���EX\/�b��geCrfr�')l9�>3�rf�JA�ٳ� @��&��z9�݋V
���M���5�{���r!d��p`�Q�^����=�b� �����WJ6@/�{�s��o-���;r�M�^���U���~'�2/��9�9�&�ӕ3��q3]XX8ƣH�F1^�4?�uf(8S��=���h��9E����P_�f_�y^���������ro�`���M���]�� KXC�nڎ�����Y��(�2�1�W��^�^+	��{G�*�x��=��{l��2����
�&���� ������R&�Pzʉ�������ܫ`R���N���QD4|��V1�Y|	�-�
n�cx`2�}��+�|'����X�	����	.�FO�,�x>.�7p�7�W:cJ%��b�ܰ1��t9�ch�Y�ho�{�)�x�Ĵ�6��9H9*�kY5�Ǹ�`�xcI{b��RK3�y�[ྞ�'�x�R�W� 6t��s�l������J�&H��x��=��Ż ����Fr��m������ơc��=�a�	�ț �+E����\t)(}��d+'� �е*�*|��!霁��I���R9�T� �(���Q�ױ����M!Q%ݗ:���Kui����0��&ܷɶ��:��
�
eL��W
�4�anэ�q7�}�F��>�^d ��c���r�S�Q�6ˁ��r��b3�<��qL��E}�;�紳��ĪMY�~��,\ۊ�+՜�_�v(/�?P��u��>�@��R��Q��Y���;.ns���I�9h�}�o��*ܣ(��Yќ��51T'�7�(7�}���:�V*r�)i�/�:Xn8�&Xo�@G�9��E�8ɛ���FO���*�Va@�5Z�m�1OUx��t/hj��.],u{.��dׁnݰ�co.��C��%�t6&�7jy���[�=%�	q�1<����l�Bn��� m�=
�lk�B䷖�?�N�;6�EQ����m��B�a8���u_]�oTkޮ�E��$C.��k�NCy�X_�Y¾]�Y�c`H��u�#�cs�؏b?��Zl�W��:�JoPd�f��H�����*�蛠/�E��̭O�Fe�}Y�풃o�6�O����H	R�-KH�9�&����:
Sଘ����h������1�w��	Zy�	��je��#�z��l�&5��*�*�4�5d�dz��Qoy>I^]���J�[�i����1���#_�֤������؏b?@J�~���4-v�/��/�T�CyIQS�����a��Ĥ&����x�W-q'�����q1����c�
�1�r@F5%�嶅��/�Κ���ͤ'{}�8�c`�g��Q�s`i���
�*����z��*��tpӆO-'x�����sI�ͶY�DKA� �^߶|�u�m��+�Y�].�ذ�\�T���-/�x	zp/"�C���6á}���Y�\��-y���E�G04�;�\;��H�#�����7[�e�/ �*,Ae�&��)�2Fy5S���e���^�cdrG��rƝ�<τ��q��A��h�C��rOŝ;���n�2.Dxp��z8q�8%9T�"�C���kT2JU�@��ֻ�W'<DΤ�{�N�?08���ti��g��D�nE��&�����wV~{l
�rt#�	���W����c+��S�(��g�dv��ʋ��%��(5i�~�s\�`�k
�m�e�0����x��w~ث�7��%�WTV��6�e�XV_�����6��=���j�ķU�R�ؕ`�%t��q|;���thϞ�>�o�C�a�+-@^�P;�	�5�%�Ê޴1��i2}����A7������}�m\�$�}�Ȗ�]�?�+`S�y��{��$x��I�����N"I�p���tĸ ��E|�
;�ߘk�f;�6�/1Ő�]��e#I��i�M���}�kW��J�Ɛ���J/֤��B8�����gȯ9뀵�i�����E��=|�k���h�O�[R8�N�쭄�ˤQ�G`���#��%��ZX�$��"i2�Od��=��x!BVlT���4���8|�&�~jV�yx��ؠa%jX:��!��(�
��b7���xwu�m_�yc�ْD,'8��H��b�7��|�^�v�N#E"�WB��&3�W�M2���&�#���a��cn��:<�Q'�|O�9� ۀ�	�"��%ru=��{`��Ta0oQ�$�3bM�E�ҩ|��?�;����`�:�^�+��,�|ma��rF��ڣS%�x�ג�-�y�E%�'�U�)�;'37������`a�؏c?�žwB嬏}��0���H KQ�5~����H�S�L��$׎ZM��i���X���l��7��P�iZ���΋1^�V�h1���&{����;�68o��|'JK�!4.�N����`�4p��#�z��~]�� �qwS�w�פ�SLܤ��vU�����_���2 +�����j>�-���Q1����8��<��jg#����һ���
�x���:9�X���5L\@�A�08��jq�U���"V����"�n���>���k�%o6�|c��V��4 mMa_�/R#�W������A$�X`��ļ���ԭ���,�'�vHo��%�s9�닷�S��F֑3i/��z�+I�3h��@��[υ�0�6m���@� ��A�����:.���B�c�n���MVp���q���h�xK
���Df����Exf����N&g�O;��uԗ��=1! �״�/�yO�������%T 'E+Cz z+`0{��r� ����͢W�,`��$�7(J� �M��is��ԙR�u���&<��qD�~rXW�x�Wʮ��۠����o��=�0��L�� ��@M;Q&ƻ��!��{�)�{��q�7H�mu�#�t{CbE�������z��,�Ng?č�.�c�6-�6Ǥ��&j���ExL 9���3����tO�5�2����;E�r�2�аW���˰
�P$d�\�ʆ�Θ��>tfد���.�г��{�t�`o8�.�Z�&� !F����.]e�J��س#��K1Z��'�(�6<$::ԣ��i������� bZ�x�]��+����H�Fbh�_q�:�U�D^�
���缘x����s�h��9��`��^�7ˁ��r�.�����?׭p�?g3��'�|x	lJ�����WI�h`A��Ǌ�K�_`��:����[DC�W�"�hi\שX��]0:�zO�5���G%���&��%�䩍�[�!�a#� 3*X|�k��6<�yl^>�TKX��K�ɀ����r�S��F��t\Y�4���wғ��i�Ƌ���sk^}��c�uI,��u[B>;W5vAבM�� ��;3�
�"�J6�*�����w�p%Gf觬�z����OFiT/>}�D�'�@_|t�- �L�s�)�+4C�/K����t��hI��+��ڛ["F��^�k*�Q�g�oV$Ya�	o�[|��A"՝��M
D��E/BO�|��*���[�?Cj.5�:>JK�����:�6ȫ�4?P�M���1��n�j6��5��4ܙ�x?_L��F��ie�#��5��<^�d^H@�����z��&��`������bh��"G�A ���P��餆p/�#̸h݁���6u��&8�6��x�����Sw�z���(�kl�\=�����X���C䦫~�Dv�"�x[�e'p�.�N�5Ey���E�\,wL<��2�&��8ڃ��=��#ZV!�Fq �*%c]'eX�?�������|�Wu�p�(��zl�P��4�n�2���?w�m@_d�Q���#K���u�yO��z����"�K����ͬt5��d]�����G$x���I"�`ۀ��nku�|���^�Q�A}��I-5���dli�̣	�=�������wx����mu4:v+��K`SȀy�.�`1��R�^g    t�Y�0�7Ӫ��D7F�C������"xq#li����.�F�'�@�@q#��'�i��,G?e��V+P=GZ@�l:+��BG�+QWԈ�",-��s��>�B~��^�H�����db��>�{O�5��:<|����x�g7{ `.�����ˤ>����`S�M�I5�Tz��Æ9�=��f�o1ӡ>�����\@4&Ø�[�%�+����h�~�O��}��!�ӄ���c��V�vu��;"�A5�n)�Qo\�y0���y��3w��+㨼�7��N#��:kN��&�:ZISK/�M1���W�������i;r}
��Jl�ex i��ٚz�%E�/����M�0_�����;M���H�֌p�mP_�_Z4ȍ�������h��:��t�m�߄'x�+�����Zz�����ӅM��%]�H7�u����;��`�dm$�*����n� ��Z�i&~�&yx��xl*�٧�$ř�B�`�_`>��]�+��
#�[^=9����)�:�H�:�n�d�s#��៙/�5�f��G̕u�m@_i�t�XN�JO��|KbV�XU��_��xEzʱ����&|+��j�q��\�9���By�����ꝛQ2Jz���^��l�{���'������[�C�������fxi6���1���'� �=����Loȑ.1<�ƾ�Ᾰ�v�m���$7;�F�h�_�xS���ޥ����7��sw�",���PY |��U�`O�&k�<~5;�i�=��D9�����|�Y6��U����
��� ODbR㼐{ի�4�ZC��@*��Nwx���v�������YMv�o���<��Dqe��f�_�����o`����&�G�_�Ѵ���'�;LS�w�R�_k:;@o^��^ϲ�I�aCг���g�����sP�1ҲӔ���3)�/������e�������C�3���� �V.6��n�=o�5*o y��Sп�<���d�2���4Ʌ&� }PԦ�P�[ը �b
�?"��D�/�v8�y��))��l<F�GV0��1� i^���(fxo�#l����*D�1��Ce�9�6�o��yr���҂u�^��#������v;�ʔ��� eۑG~��4��f�@���G#��Rty}���f߫`S�yx"�_j�+mܬ�����2ME�*�U��=S�S)��s�m�_�wH�$�-���l4��T��7�8�J�Q��e�H��D9Y�j2�z>��eZ[��!�\�j�:|��E��aL�X�A�s�7$�Lk% ���žsOd�y���g�mx<ܕ�ȁ��SEP��m��0��CW ����� ��&�d��QB�:�6x�U$��aؒ�k���o
���s��s�PTVH�>�ecl�I��/�#�*:xl��w|G��%���[��409�.�w��õ2�A{�i��T�Mt}�4 �|��uf�u�{���4���p-�n��h��d�(ܕ�5�bey�;:�6�oI�x��(������
���P�R5	��ġ��>�{O�5��N�M1ZL���&�ޯ�W/�M�t� ������
׎'1`��s+�����3���h}�Ao��n��L_���*vzd_����_�����^ߡ��*b�դ�T�~H������ qGWyo�����Ss�dM$VJ��H1����kax�L!bk�O�Y��(�ow�m���Ԧ=ge#���P���qs�e�꫞l�-��������d:�n�.��d�x�`�*��I�O!M�^�f�����@kѳ���*�	�U�D~?&nK���o���:��a�Z4V��ƿ�|����u�W���6B{A�$�5��c�ӨcT�΃J��M-R�*)yS���໢�g�8�-��q�{��	���^p��:'>K4�xþ.z��2ԇ�v8o���|�V�n8�ڲy�����RnG�6�H�#�^m��zoD���|���HZ+��s���P�%u�Q�A}�a�߂�T�J�֚:X�Q�A��g=��ʃ�ָ���Exnh���� �?��=vOi5�2<�1�V��f��cK���A|n�:���@��cm��Z�� ��Pǧ��P) �h��	oY�M�d�y���I�{��	��p���]%J��A���+��a��ڒb����M/f:1��Ӻ��B���{��T�a??1c;�`�y2
%)��	'���&�/¯h�,�SH?������dE�����2��@���|�c�N&>�m�Uޫ��	�����������a	���2muB�m�O��}����J�sm��^��U,�:|oh8��^)CJ8�i����G	Vu�w��n��~�:�K$G�Ϟ�6��$/j��6��S\@~/8�6���'8�!;�|����=Ͼ鞜k�Ō�D�aD�g%^��F����s��-���y�;Z_$���Z�22C�`+���Kl</1;'�����/�2�}��1.�-ա@Â�t��8�=���K���3�^�����H��=��ᬆ�y���5?�e?χfvЯ� Ƌ�@�T��W��x`�i�����p�4;0���u�B}�SvM�����"�.Y��R��|Ho
�.|(�I�t^������s�����	�K^�&c���=�lbU_Ӏة�V���'��ƍ�:�}���_���\]��N|Fߡ�~`Rܭ�m��?󃟏zz傌���uY����V�Z靏QE�J9N<L��H�)/u��Cn�2mA���s�u�9���£�X��Xû�R4(i�]��=���d���ݪK�G��;�Л��&�k�J���=kط�d���
�����+؁Co��Ff��$�nQ`dw�S��]���N���:�̊�IZ��a��m+���)U���'��@>�hO
<n$J��������@_���)�ю�&V����`��Rh���Tz�Ʒ����"�d�	�cr�,�4�d���|��8ԓ<�1��x�t8����Le�7�ZJ��t��Oe��9���5Oޫ1^���F?�>���¹���ɞy�(������ qб��~~�N�I����G���,<�A=��d�cWR�!<��i^���"vYy´v�ǡ��B_���+�ie-�Re�J�<*���`S�Ex'�yb�AW�x���|�n�R��	K .K4jG:�	O�E����1P�b�aS�._�8��Q�aK*�s�%u�漇��W��O|�;Wלiw������zy����c�� 6�f��ʐ�d��c�\\s�w��-a�o]ݤ�ɯw7�S����X6���WӤ �2)cVF7���|����s+�cx�(����o��UUdbO��@���	c����(OS�6 f���w`�1���ZE|��k�C����i��*<������h.З��L�#��(��o>�&)��䭁��R��w)$�dR5z�yl��Q.o���r_����/u�׽F����?
�f@.6
�6�x>�8�c8ސa��~MRm���6�7Rð�d�_{Kn��vk���������E�>��4�~�g/�{G�k�}Il%_�~��(���Tdr��&�|�/`U����� ���\u��"�7ƛ���FV�a:ҮK��+�����N@a��p�u�m0�x�taJF0��:���=Ɛ�����? �_�V��WU�З�m��ͪ���	Sl�Y�Y�I���lJZ�9�6�o�j��)0�B&��L'0���L�:��=���*�y"��%��l:������7��P>�a���^��}ꃟ�f��Q�W�=g|g~�vEݥ3���.�Cr�哜�0��u^�5���m6;WQ��[�E��r�P�Ay�'�D9�)�2�s��Q�A�.J���,��Tu�m�ǫkbDjZt{��5�k
H�����XJ�"&�#m�4x��:^���9�q��v�n����.B5؆�Qk^}Ez���0��&
�bI�Nʱ��~<�A��Q�1�R:�0of���^��1߭>w�l1K~I �4m�� ��� �    г���L��F�'92�K,s|�i���A�Z�:�}Ow���@��z�V*RU�_�n�
�1L�6�aB�M��Lj�����0^��Ll7������#�E��IL`L餥��m�!�	�IpW�t����.�n�R�їCo�6|����`�^�<���>���R�B�Z"����+IR}��=��$b��g(yF$i�����
?��@>s-&�&�P��͌cn�y� ��s�+Rp>o�3�p�����̣�6Ӡ�"І����'��{�������ނ���ܫlW�-6���Eף��L޳�-Q�ѽ�,R?�ώ��.��vL����3���x��w�b�ӎM�b���e�/ۺ�_EƄD
��lt������j��i3�S�cQ�`��*2"�|�gS���hn)�S�c����%weM oq�(�j�gL�ݓ���ېb�.¯Ջ����t���c��/����_^l��H�rv�m�^�T,�����<Ch��K�R���,�K�'y��k�5�hKDıc��}m�7�'e/�0eW�v�mPކO��g;$r�Iߥ�f����`�C��a��"v��O�8�ү1����<'\�Q�}='���j�)��A?��Wa`�\���S�Ƽ��,����sc-1^��/�����,�����Q��8+!�4	'	ρ�z��8�GǮ�q��)�A%���kl!웃��׎E��oG��M�|�]6L����^X}3�1�|`���8,f�mޫ)=>ޚs{�2�Rǒ��^�j�ū��$^MS�e�q���y3J��O:B�},k�]8�6����꘮�"��F�7nă��3S��PG�/��W:ߑ�O���r�mp^@�XY{�z��C����R��ν-�p�;i��E�FW�$[��ޱ��z�ZQQ^�_�iߞ��c�	�Z�0�fM��v�췪R,����� ���o����mHqck�8��5�$�4�\s�&�s�wd}�|�qPK/�O;��X�ư^�$�Iv-��u�b*����T7;���A��*p=o���n����"��!�Co}!�P |�w:�6�ƻf�!"�1�=U�8Z`ڑ{&L!> �Z�=����B����[5;ǕsfOȒ���W�귪�*�Ri3�z��M��j��Er
]���:|�;��B-�����S���b�(�5d���{t�m��"��~�ŧ5�|	�e���o�Cl�zO�� S�t��X�s\KrX�rB��hY�Ni�W^�b&�!��Ngg�O�?��6�� �,@�,�~���Ex]!3�;��,���Q{�����~z��z��q�m`^��*�E񍚴�v�����X�@��K!D%�܈��:���D}�h�c�`��Z��{ujy���@��p��X�x�{ʅ�,\�b٢�#�PӲӰZA��Ω-�X��V�����������8n����z�:s!^o(&����)�5Τ�c2�B)�!^D)�1�����ȑ�8�D����E�,�;���)\�NQh�{��ʮQ����Ӑ�%_�EO�R-�^^�}<�%����ܬ��آT��t7�̭;Q��K��cn��:<���|�����
�Mx/���
�$i��h�l��U�g���Q���V�&�J���:$%�;r�C��r���W�:����9�6��u��P/��%�n��'��q�m`�x��R� ��8���Q���b1jIL�I#�2X�WT�u�d��
��:���{���43�)|Ź:x���r����U�T�B���-#�C�˜jhj�7���x��:����g�TX�,�a��˒�[�R�o8/G4|���5��h�J�@
Vw�]�*l�'����~&Y�%z*��1��|���e��|���P }}o��~��f8"`�r&9���^'Cn�<�x�G<1΀�j|�ɑ�A��r_����:
֕E�+���^�������'��_t1"*S;�q�_����_��s#Sƶ����H���u�!諔Tt�XR�@�nM��Td�:�6�9]���^����e�2�/ٙ��k�KbS��0Th�Jw&�z��O_�^�ɦ�߆��"�֯Kv��!�(&�q>�M[���z	H�t �nN����6��G�c���%�ߡ�ٷ}���*V6�D����s��ݞ��|쯵���Y��
�E؋�3.3� ٟ��M�z���&m���z���g$�g��C:K���~�Յ�v:0C��N禽RD�)?�3�c�����G�]	>�́\G�{��Ҳ)��id�l������Z�<��Q��P����)�[�|���|2l����d�]3k	;�6X�� F`�d�CbJG}��l�	��3F���`,�0��.u°�5��`��Q�5��W��&M{��I�g��w�_3ԋ��b��G�f�.�[�&�:�+�uD�k�xs����1�&�^��)Q�,��h�ת��˥���)��ӗ6d�
�=���B�%Ot���T��H�u:³�������d}�䐷n�L|��q�{k���b�T�-Oy��W#ddc�q��y~i_K2f��1G�@:/��
��m���ܪ�Ɍ,Oc���)�<<&�u��S([�#���8��`S��{�K�"��௲��m�"|�e?��⿁�Q��q����8�6�/Ï4��`�_3}Ne�*��4t��i��z=_q��7��I�&�_C�c����[��z̀)��]Ӧ0_��o�w�}�����4W�t^K�B�#�.�ǖz�s�*�y瞴k��,<�蜤�0�E�h�abl��m����N�upt�Ȼ��#m�tP��ufb�=�,�E���`�Lb{ҁ���u���ob>�W(�.@�9����j}�c��*�˙iJhH�[|�p�7�����k�c���FS�\t<\��M�UH�Е i����w�=&���F�j�y�K���ݑ�l�����H��Z�Q ᨛ����
g��Zb�{;b��\T��V"s8���*6O�t�	�DT�������.���/h�W��V�EQ��ta�=�tcɎ���#(8Jܱ��U�H�ɵF=�$����:��^��͡�
�oy�@>B�O�)��Vø���.�{;����[<���K��6��.6x�uq�\t�&/���y���@���[����j��w��H��M>�+M��S���O."J8�oG��,9����v����(r�O���cp�m_�GG^�2�Ja�l$��l���K1^���h)��.������5>�q�W*���H(�2}q5�9��p�<ͣv嗝f�xu����f؄���#+��r>Q|%B�J8�����F��b :w��A^U�����Q�A}�2���D#8����i+N=�� �N}�lu����������~y�*N�G���̻F��F�����z�����'�D8E������RI31/α��z~�k��&+贔�玣m��2R�Ԟ�؉�~�G}������.��ZvO�g��]f0ߗy �6^�
l���.No��3zKb�[��m�B]k��.�?)1�����a��8�R�1�7 �<��,�����=*O᳂{ު3-���:�ݝ�́��=)�����cE�u��T�J���|��9$�v�FG}�A�GP_�����1�c[ZTd%#xY'9�6����(�_��;�<zn�!�k\q�R>'�&�dv5�%֛���沷�'����小�^��Faߒsy�C�V⌒rvG��]���P��
��͙Lq���=E�����*u��m�蹶2�㔙xg�;���Z/�xz��M?B>�e(0K��7�IJ�=��S�'��
=h#���v�>7ܜW<ͅ��#o��r� *���Qz~�q���Vp��'����C��K��G��x���tM��8$�����E\���
�_~�*:��W*�[��B���<gW�m�5>�@in�m;3�x�b�2ƣ�����䞀k��ݤ�0T�Z}�� @��C��J~qިXa?�D�|65�-�c��Fc�I�    W��8��e\g�B_o��l��q�{��	���L{�oKZgm���`�b��
'$zf�^���Y��)�;v%��Ɂ��D�!���%�QԢ/�.K���f'!��A�2�m�?J�D�L�D�=h�t�I�{�-���J��i?/�8=q�-`��c�%Pߝf����U�"t���:g�'�i�L��y�B���8�=��^����8����x�WvD�����8׍�ɫC:�)�כt3����Hj��!�Ԋ3Nǩt�m�QQV�vm�'�J�0bGy� k�5l���Ӽb���x
�u6�	���o��T5vL�M���۴޿�BjvU����~�/�}<08G�$ER�\&RM8����tX���g�S�����7?3�����6�7i�����_�F0-�}��#�D�f����Axx�F�oBh�p����@;t�4�/{g�,��Ԧcs�&��l��
.7H��"g��T���֍���H��K2$�z����@�=�3�5���Q��r��$ދ�y�-����WW|�����[25t��%�;<�Qf����cN���NT���`^����9"�mIbc9�6#O6R�D�@0w��Q�ɦ&P.8�&�����y)��x��y�"����[:�6�/ï�y3)-�����(v����N��d.�Z�J�v�()��8�=���k���]��$��"�0F�%�ei�9�ԑh9=6�������t}<��UE)׮�1{'��p\'�k�Yb�|�g�O�> ��Ї�~�-��6�&aڊ ���:����<?��)3Eh���=�!�����Gv�%�ډx���S�o/�x|`���it�Aw�9Q��+.�ʑ��p�i��f�
n1�5� ��M��9�Y�6�X���<��,���N��Cm�&|�hg����Gy��T�\�e�T��v��)�4T��o!L��t�|!�`�t�"}go�.|����-��r�'�[}�xv�"��{ר�NEO�&�H�'C�uw��%��p��H(�i��=����)��T�Ѓ�f������˶N���7�a��g�[��+x�dz��G����Y-���1܍��듻�Xb�W
����Ӛ
����I��z��j�f�#��g�ux�>E�F�{E>�/�b�#m*� 6@�!���s��_���݆w�R��O�{�p�c���m�.��%E,��9���M�փ�c����8OIr)o��p�e!P����m��<<���pʒ�&��a/�M!��ȼ�l�H���� v ˖;�]5d�|����h�o��'ؚ(�t��GMI�A?~����?x~)ㅿ%C3W%����<��Ӿr�ls��p��Hh;�wY����E[���V���� �_�d��X�b�쉷&�&9��:B-Y5]+m���,Ƚ6������Jr�:T�5���W�\�e��zoM{Χ9�]�A�,�`�E�W��-^�����n�����w3�Q���k�����P�'���Ó�J��m�"<�h��F�Ÿ�P��s��ex��/�2��1"N"�z�|%?����K`S��k�a=��-���-�r9����`���ϯ�<�<{t�m ހ/��P�`�*�y���[���]�&]�+�yMG8�>x�w��z��s�ڷ�S0�4`�0of�A����������x�)|�I�"�1r�;���*l��l &N7$�9����o����z�E��g��=�������1����(�(O���}��G��>�pj����*-ߒ��D���qoZ���P�̈́E�}ryv6�$�=���M��>�ho��*�.I�B��
%�ya4��bn
'`�ٕ�lF�P ���-;��
�n9����ǸI��9�0ۃo����f>:���uȡ��'՚�>ݎ��,���������o�y�F;np�y;�w�v(iD�4L��,�b,a
�t�Rv̨����ʺ��Jz�W��+S�s�8��<m>}�9	���k�5L�h5���0p�^�<��3��9-5�6uذ  �`.�eI�1x8�6`_W8r�&�G����)�:*<�/dL�6!^	�J��m��ѷ6�����9�A���߆�<:�n>��O��:������y��RW'
�S=�J��y#;�6��Ӡügt���ձ>�G'��H�#�,���q>����c�M��G��)Ɯ�ui�J6n�n�5�Sل�L�����A�y���y�Ǖ,�s.�d�M�����"ڡ�#�D�u�Gq^�	Gq��C��],� ^���<��;�t�P-�:F��+�Cn�|6��{�G�Į[˷�D�ß ����y�H����7�tie��=� �c`��HZDȡH%�"u���� '8w��H��㲔2������gJ��t�����l��
�R��E_(��r�8�j�q��:���r�O�aG �����T�G��2f7t�z��zqw�M�z#�ᩛ#���i.�8��[�3ӑ� d���,�x]e�!N/��~@�5�Y�~>��mQ�[�L��U�'�5��y#���.DB��EP�1�v��Ni�u_]�oQw�DP��RC�D``1�KZH������G{@�5��f.i�܉��掷�+vr�x����ޗ�b�W:9��5���Y�w�.oE1�j�U7��&<�X�K)�I�������Q�`�
�W`@6^�m� V����*P�d���t�5�"��aT����$�I�����GB���:;؋Y�&2^�E �it���$/��E�~�Ly�H ���|�R�V����a���c�
��r���^k$%�G��]�u���E�V��XS���P��[R0e�O�k�᷂	&�� )z�SRT�܄y#�W�qk%������`�7��k>l�H�(1~�O�d���M���Mx˩�����|�%�!�[��
څ�_)�A�9���`���Iؗ����}�:	rO�5�b>�V�9>եN)�fl�?e�:��{�6����R��.-��>����9�q�:����K��U��z#�1&>�ȯv3�I`{r�)`��#��ʎJF�B:���k`T�h&�5�eP��:aNu���^����E$�>h���=���ې֛Nˈ-yw��>��{��M�_���=����k�%��c��j	߯�
�w�!�soV�]����ն���|d*0���� g�Z�-�r�Ɛ {�,�6V��sWkc���A$z�|5��T�lH�Y���a��`�=���ͼ��ϠE�)'+�pO�������d������J�YF1H�a��ϱ6�z>���$KwR�<�;��)f@���
y��V__5�0�����=�vO]6��W���J'�V�C���x�;�Fxo��掴iZ�a��䕉oH���6j�.��ɖ�бw�����MޣM ����e��L�Ff� �Wbx4��0�.O3��E�,~w���.��$�q�@����g� 6�Z�e0*���]9Vś��s����ǻ'"�����h�D�#ff�?�Vh���n1���.�w���'1��Z��e0*�:<��G|�񼡜��!OWT���(��K~��|��~�,|o�u �%~בU���L�F��o4�I�� |i.���G��F=_�Co�n�x0pШ[�s�-���6�hGi uP��8�C��Q���x����)v�#G�qvK��F>^2/Ƒ6B�t��g!���3�!�
�1,\y�Ύ���6`(��gL����"��Ƌ�NE��"�6o���;(X8�Fhop�ܷHC��� >���Ѧ#o��6��}3�/� ����
3� )6���:�a�=6�T�����z9�d�/�}�����Fk������Ц�٧�db%xDv)�Bz$�a5��cД�b$]eG��]�gVtH*���ċ����p��p^��8�:�H�sr�"/0�ı�~ �b`�]��f��My$��5����+B��)J�^��Cu��kX-!��vmh�K&'eX�    �	O!C��d���i�7
�q����M��Ӓ3��(y������-�(a]	��1�7� �����)�^T�\ 6k��^�ynv���;�tF�tj�pg�Kk�ڽ�{�W��'E�n���Q��co���CJ�f�|�C���}�f_	���>ekrb��m��C��|2`���Å=�Q=�#��ۉC?���lz����)u�l�P����Mlrj$�Q��%N�(%&��2fxo�rEk����gQ�W[0
s����A��$�aJ�;�\����c}��xj��2B�����'"����t�(��L}X`�<|����m;�-�<cGⒿ=�/�{h�E}J �Y�Gx�#13��V�I���������� �cx/iꎧ	�N35����i'�^����k/�Q!VBk�*Jl��i2S�`CJ�v썰_�{fa�L���p�o'/0lw<�Ӷ��3gS;���Kr���6�{���8�[�I�s0>q�GС+�D\�����ڢo���(̧t��0��fD���'���RZm7��6�P'M*r��%��Y�j@NM_,��
�W`@f6^��9(�46���3,�^����S<v|��w��R;�F�/ý�w��0�����.S�8�#o��
�@�X� *{6t� B���M�?�'[�[��{��{CM3Z����17�|����+nk[�p�|���`>I��2���%�9�FH��s��qȕ�Ui���=�|,?Y�A�G*0��L�<O��y�bw�_��bڕ`-OÐJ@�D�#R��Z�^tҮذD21xX��~#�<5�:�����L�=�,�{	��k������,3xWDU>މU|H�VwV��8�F����8���� w=�qH�^���o:��B���k|�Ư���s�G��h�ơ߲�F�`�(�2%T?iK�O��*���}t��Sݱ���b��;�����J�z�`
��n�<�-��m��n�6oO��w����3$�g��� ���n����4;?��Y�U4G|~�7�rmO�3u��#��G7�&�rߙ�d M�N을����{����u8^R�xd�&��'�T�ht.�S�y:�-�[e-'�2���t�<q�utO:�2�v˾��.�{"�	��p/'	D��9B�x/�,P�����9�7ܒR ��%5�xG`m�j؋0��Q
lkx�B�$������7��X���*t��ȖeJ��D�&�;����H�S؃>��t�,# "җR�Eڶ�K`T�Ux+c��V1���B>��EB���e=�KN�9��ϰ=-[7��}CG���$-f��qLA鮿����b�7ˁղ Ё�Ώ�=��$�>�ђ9H�B�x��;�]�K�kx��=��]��V�6I�*f�t��{��Q�ٰĨ s�?eceio��G�0�AT�D�w����IǦ�/�q�XH5J��ܬ${���D���jod���er#�1Eަ�,E��0����r)��������16�|~�I�����z��4�=�����tnZ���E6�>r��{:�½I����#+��hsv$X�9�V�o�&R0
�`�������z�b��.�������� 7��gU�c����(l�"+6���'�H��E��yB\��������V'���E�5�y��3�C� =f�x!�
�@)�أV-�ɼ���=����j`��Z ���	�GZ��(,y�'N��ȍ
/�)1��`T��)�����A�FB>̙X��k|��i�A�	�dZ�QФ3��s<S�f�g8ٓ�2Z�]OD6U�[�%{&b��.�,&+�w|�'I*��T<б���-�����@���,��� �up��%�_H�l�_���.�l4��C��G@L6�~�q���T{���|�y��^�0�}Qj��$�D�����K���_g�K��h��2�����.�~���}����8���q����)�i�R^�_�mߔ��S���zCNg%��d�'Q��+5o�]��[h�)��Uޫ��E���;�!�E��q�`%�x���7��� >�of9�-��� I/���k�<�C�ϥ^���� &��@�,���wԍP/8�-�7�(9=���Ҧ�r�Os+�G{֏=�>iM��_ ���I��8��8�a��~�hcj���������z���9��r/������L�tKMc���	o��0Yw5/����#����7���t+���s6WF=�vO6��ea$�8Ѓp_�ʲG��*�fWkP��2�y+��*�7qF�oI3��ը��^�^	�J��_2L��t%��|�8�wO���
�.u2d����`�j�kа�Q7B}�a�J�G>b���+��]��+`T�%�?(����C�I�G�29�D\୻e%V�#��69;���\�o��S�E`{�S��^�JFڼ���h����a�p����5�w����)��Nq���7U��g�[`�l0�-��lNt�����<��=����o�*{����Y����=��R)�1)y�7�x�] -C(^*��6x�w����V��1�;�oa>���K�p���-�ϬEj�����`���(,L1�T����p/�Q�ញ�x��]58$%IM�Qh�j�l�C�-L�y�.w�ѷ�1���
l�f>��OH���%b�̽�-q�eR����U��W���ż���[h[�ʖ�ǌ`A� F���m��-�+��&f���q�{r�͛b ��.�S���c���8�b�8���q�8]*��q6�y���{oe����O$5�2�ͳ�|e��d���.��2��Fh_^E�ɏ9�����`S����3KJ_A�Lі�]2l�߄�S2<Jp�ת�p%!NW�e�>1����P�9��
�]���o~�ͭ�ח��2��ǐ�Y�ҩh�Fk�M [牮�2���FG��y�Q������r�ʆs4�������!_���W-�����P�A���ɉ7�.HYlpi�Yx�:�e��8��Z�상�b�	Nxf#�W(��s���M�#���}�fUX����(35C\H��5�zC�\n�'�;�N�<@�/��_�[J�-�i�[�{�܇~Ǵ;_SX!��F�$)�:�ș�c���ۀ��H�P/L9Õ�+u�i��AI�82��\�M964F������b�q�lq��H��>�ZE��(��Ex�Q0znȐA�F�yCx����L�_���eG1���N����h��RiS*�=���̾⃞޷J��Ā�k�k<��JQw��p���D`%���F磅��_	��^��l1a��u0�C^i\Y�.w\O]3C~���ix ���dL�u��A������w��H�����/�.��é�&��9�N5,Ҁ��?�V��{f���h�S�	M͒?F��r	�ma�-6�_O̭.�Np6�r�o�> �*?ԗ$ju�b�؊��3O�w���+�NJV�U�<����#pچ�뎢��"�P�2r��AK�7���)��r�10�O��~H6�C5����ȸ �z�V.XHx�2�a[z�N�P���{z3l�����9=Y7�JL |1^�:�F�ϳlC|zU� �#�Wn�|�\N�����V� C�C��KW&�?Za�@3�t3z5w��C�o�>�Bo�bf�1���ɋ1�+jM�!���S�4���V/R���`H"6Z��//0R��hg��vLn�nYe�{�.����c�d%s�ٲWM�qg���3Xė*u4в�//.�0� �D�kT�J8q�u������r���g�� ϓF�v���g|<�e#����l���_�H:�n�w��n��IzG8�3%�� f@/»t�/�S|K��h�ɓ`,���^�U�) ������ݦ����4%��~�ֽFeX��"_>����L6z��|�$F%Y��-3(5Y���q�����@�����e}�&T����R�qз:����hR�$S$��=Xb�C#�d�Qb�í�80G�����iȂ�h�\�<�c���?2[P)�ޙn=��    (��A�lX��6T�K�B�d|5D�50��"<A'(��&�3���K����*��|�4_O������5� _��уd�K��:�&�����`ˁ����u�G3��Z*C$���cm���6�/Z5٘C�Vt�i��6��̻��RS�L���׸[c>"��:�E�� ��<��y��(tķ%m�c���z�<YoѭО��HVp��'v_���KVx���Z�U-�Pդ.u��0^��YJ���E��3� Eh�e|jCi�[D�)��;�Fh����G�|���Bi��mb�F�X�P�bW�8�������<Lٸ*��;%s��+<Z֑K	�¼ ��I/�6<��.H4b$��ӏ&��ڻ���rIziMS��ށ�z;��A�ԉ����-�`���]�O�7(<ݗ������z��w�˷�0 �Z(V!�N;�.hSc�B��՝���8sH��c��3U9��
�e����#���N=��3E@vt䍐_�'L�bח��ue R�#=�� �cH�*g��h�j1 �ߚV(o�e��E����4�b[8K�Y1�}&R4u*�Ј�D�޺W����
U`�Q��n�w��N������G�U4��n~N�������>0�<xkʬ�y�D��6K�̅xL#=:���݅��,C�n��"��w���/�	�G���Y�!��V�uɳ�q��d&_�5X2ՈշV�N�j�gϕTI����	���#k�"v)9cĳw�f��:�B�%ǊOxl��G�V�@����}Ѯ��zw��x�@���8�D`�7��p�p�J ;��N��/��ޅjU��c7Y]+b'�7������'80���-��< ��yH��ϱQ���8ݍ��{�6*|�����������, �Rm�7dºn�"�����7 ݉J�t���^�'��$�[��S�7�Y�ƫLZ���EMѼJ�Hd����^/�x)zꮩR���d�
�:�� ֑~�i�c�7ᱥ�V�#��=O�-	/����[�}}&�!kNn�e��.��|G�p>�I�����SyM�;��{X7�/ ����s:%38�FX���|���]�ن�>��q7½�OJD[� ����h�0Fw����N�c�4���gWi^�!�G�'�ڽ���\� ��Ƅ�u�=��A<Ot����-�)�wl9肷�0��K���>��T�.dL��yt�#�e�U؀̂���lv�G^�T]S�E��ƛe���t� ���9��ol���#)�p��nQov1ӳCz���%S�"��/�1�!�s�z�pì����RrQ �c?�}O�5�}AF���G3��C�!P��/�.#��yb������l��2<�_x�g��0�6BxES¨��kZa�����`�ȝS`��g��y52�g�D�ZRD��ẈR��{�Cn9(B�.�,.P$ŏ�����#�w��*8�;�$nlfAA��8ܽU��M�~>�pǫR
9����;4q���xQ���<зEf��¿"2��^$-4�ăn�;��6V(���vN�DM9�0�<.��@�T<��F%X��SN��\�q�, {�y���	���_&�żNR: �,���t~F������DM�*�/[�9�����+�9�񆫺���w�4i^F���a����$����**�����XܶƱކ�)޺ h�k�Ի�+�5d�ljls���TG��%M�aM���~%�CvAnp(���c�F嘇���7�'�Ʒ�x���ّ���~�A�Ǡ/d�)�:��C�=ƈ/`�ܙ,���^�:0Nо�~�5/M��ײ%ı2�3�e��Hv���P�¡��8��kIɃ\5	wO2�{���^�G6�Gp����p�l�xq�h��fj�h����l���IgՋts�h+r�䇹q�!��pO&u)'����;ɒIG}��Xl��,��QB�Y$%�'�tAr荠��Q3�]�֧�.����/��!^��K���	�L���vk�x/2��Rk~���j }+������N�?���c[>vp��w��{>�l!p��(���ٓ����k�DN��b������s#�7�X���P��TuM�Ks�~�]��_h���߆��J�p���#f��.<�O����
�G���L7(U���C���x����^��c��^�0�xJ�t�T�d���j���w.;nW^��BO���M��<FX�X�W������r4M
z���UU�/����_VF�E�N�Z�U�g+G7Z]��Y�ќ[�|��{�I���Hٜ��1T�!:$w"^J�C�^3.o��c}3YOS�o�s𣿎3v:�����z��l������h`v��;�p-�x,��	�VsdX�Hۻ��I��N�wb;��冁~';^L���%�Dk�x�a�0���4�o�$�����"��[�_�F������;!_r�Z-��}�F3d,Нc���N�W։$ͥB�� (��^���w&��9�@Z�`Ҋ��S,��B������gp�>�iNu{h�F�W��𥻋�`V�u;���c������.P`�Ğn�<�ɓ8�ӊ����c�a���
h�i-y�Z!#����s��}��g�q���F.��_b̓��z n'�{ʨ��*	�~�^�l�[�/�
�J�2��gvZ�����Fs�{���̗�Τ]uJo�� 2\W�䍟��k���_���#&��ZȖ$M����/h��g��.���-�N���(Ù�`���7�ء�}��:|bkX,���X�i�a���ms���i��F��N1��G�G�N���}0��ct������ދ.�28-�.|�z�\nmIq�iт�G|����9D�� 9a.�yηS�9���؛�(M��:m<��я�2|d���yI/!KG;���Dy�."PuQʑ��]�u���Ҷ�'7L�9�I0�nB����U�5z��wl��BIw���b����z`)L��ȋ����
���x�(֨$��ܦ �D|�;�L��E��\:`�vd��/�����^j��_��_y�T5\Gg��Ǿ^'���]L�K���C��}WRG�����zю��&�
'K'��b������.p�����PǾ�x�O��މ^�b5}~��ư������ͮ�*�39��ܘM��eg�<f�Q�N��������LI<��D�L�Sf����/>ĜOb���њ��l�w���y�j`�㝫Mcb��j -�k��a���hr�r�Ε�;�
bBU��j8��6|l�!>&<VyX;��n����Ϩ:���lPv�L�ԗ�x�W('�
��Y�#lW#��զ�\t���A&�7��e	�V	�����kw~��?Kb���q9�}����Y��m��K@�~Ed�G�<@�*KV�Oc�f�upZ�"|6|/��Q:j5�*�䑼�*�[��,�R{!��!�ezYW���V��`�5�
7��Y�7�.F�JGU���mp��½J�=��
!�z���1l����6��y�l�Z7.OК:�އ���ZF\�DM�+���M��}��юO&�=�D#��S�C�]� �N+�TIj���K�k{9�Rc�(�)ث���B�,T3��d�S�w�_��[z]7e�bj��Ύ@�)O/�8��.�d=b���3��b���$�`����?��[�-O�3�o~����Քõ��D{�%K)ŗ^/i`�2_�v�M!H�q�a������뮜��_j�9�������W@a3��E���SmLg�_�2cy��N̗��-��+����V^ �	�J�)ye��?�"O�E\�c���/�(N�R��*�Ln��@�5ճ�ί9�e��.���d^m�˾w	�We��˭�"�2o����&����S�'�T�$�G{�_^�/�؞e�t�k�4�X��5��ask ]2�g�Qn�=KC{)�<H���sh�d#ӕJ��;���c4��r���4z�kE�����l��/�{u�C��N��"�3|G�E���|a����vE?#������8@��v��=9��HJ:�J�#*�\)�fk��X�gĳd���� _  i�@�M}�d�5����LC��A&	5�-����I��o��D��<�!�>�4��xs�L�c��5�R�,�N������Y��:}�$N+Aۉ����<�2�WR���#͓x�fH�����/5�;�g@-v�X�N��=��c���� b#�>�_��$�iV�_��c6^N�e(;Q.�zW�!YCč?B{����]J'���ܑ�^���N��r��r�c�N�J3�h
�k8�܉�E�Q�ߚ�밃��mwّHNYH�Sf��W&�O#x�Vo�y��3B���ԋ���@k��X�R���yV����5�D^�7��2K)Jz��!���/%�.�1� ]&�b��w�7ԛ����k��w���ѣ���:��U���ޏ�P�E(�Xu���ۿ��QO�:����c�T��X���: �~>�O��`��Y��(
��i�^s�7�s��Tz`̒/o� �rG��:^^y���w�b z^�?�ѝ.���ß��N˱y�5��go�*>:��;C~d�5I~� Uts��۷)�X̧ꪎ����%[��(��2�M�ju'�
4k��lW���|�Ru!r�o�kJ�ӯ��z�f_����q�o)��p���P_n>���@�<.������v?>I�㥓��`8��gU�=n�x���,f��po�{s �bK��c��~�hc`�ľ8���RZ�^���$�eh<i|d|'��p6Ǣn�V����|��'=��1�����Q��{�7��ٜ��Jf��tTN�J~����b⋒�D�J/xir!��g�h+��<D��.û�/�{�F��F��!���O��J�Eo&��(c�	oL��.�9�~��G�9�#^nQ�Kt�S���{���cc� #M��l���$�5ة��I_[{�4��9 ���zJ��6ֵT�g�q��4灯�x���g�}��/z#�P��2��w���hmu��N�W|N��7��^��+S��$,0�����b�]�!�:#E���4�Q�S�Kb>�66�z�ۀ��u�����t�v$~���\eOs���F��7�M���P��~�� �f��j�Yt���������P��)\���ǹ�����v/��[s=i䐄�x�XhI���_t,�6&z�t�f��/���	(2�?K���%��b�"N�?�/����{ҿ5O,���E��-H&�� �Ğ������hD1�A�3�ĝ��J���[!�@yx�dq���+b��`���)��y|�>�0��Ч�|]�H�k�m��ņ����ǚu�*��#zUL�_�pZ��լ�3�k�d˗
�L��G�����В�ќ�D��<'O���������Ww?�/�3[�Μ����N�{ܳ���B(���5ԝ��;��h<3��?�+b�9��9W
ɋnP��:����4��4���4�Rc�{:89wK7Z!� 7u)t_�X�UX��$2�����7mU?��9G�ϵb@܉���1z���$ʺsd)8����w���{樴��%]��W���{��n��5�{���2��?�Ve�X,&>�^���J�E1��\�SD>��ơ�.9�c|V`�����c�E��,�6��/y���Lb��ͩ��di^ ?M~D�_�Ŋ-�_�;�4��7�I%#���w�_�ɋ�[{f��Y�K�!k:�|'�e�t8T����k�K g����j�ڋy���c˱jtz����qvM��l#�7�iN�]Ja�ډ�6|��md�ю#ҥW �Dz��u�j<��J�_�H�˚�w����R$1k���8�*�rQ�i�#6�I��B3���H@��_���d8�{AOO�b��)��^��Us<�FC�������P�Wul�����l`55
��"o��� U�^���y%�Oi6���Gd����� �WPz��?�y���$Ǯ��X�� �)=���&F4ʐ�� oT��*w�FʾNyf��i�W`��c_*,���m{�b��Gld��CH� �p�/z�������c�W'?���9��U����lCa��!����*{̓�Aw���ҬN�9h{�^�T���Re�t�����+����~3�#����@YH1�(�u癿������"|��I~�1<�no�J�v�]��w�F�\5�p�z���򂏻�u�5�	� �_:�IDR�b'��QixŞ]��{��2l�`���ԑz|UR�N��1
6���M��<N��^�w���T?�Yj͞=�����^>�}<���z�S�y��Ul��z>q~�e.���1җ���@�|���l�H=k<����X��]|��d��L��>ՙ2���b���Ks��S-�O����G����n�Y#C�Ƌ��8U�����@$g��&Fn���)�����?k6�JSyM*��eϲ0`w¾�'��]��!#���;7���@���J�G�j�Wb'�y��H����}��a:4��2�[N5�%U(�q&�Y���S��
c�ډ�2|!�\�|IprvI�����#��i�+�;����$�<)��zB�fy��X�繪���/�R���$h=<���P�%�c������X�?��]H_s/�ޜ�}���-l���&bj	K� �Y�f����r��KW��D�6�^dϷnp�v"�K�i�"c�8sf'�{�P�f!���1��sf`s���H�֔ɳ]؄W��݉�ja)I����aw�����z�}�,�j�C�?�t�M��m�,��T)tZy�h ��_pv@��d��w�P�uMS.9�%��$4�>�nU@�<����J^�v2E@�����t�$�K�	��X�ĝ�B��r���H�j>�W-.�^췜i�}�-�!���L3�{��5�{�8�%^�45�O�|3����[����(���_�w�O[����"��%A ~�3���O�����V�i%����z�������ۜ�;f�b�g?�y���_��
��|v\'�E�B�'�!�$�3�h�MF=䌉��j�*�� �ڮ��(7Xu�V?�kK)Ie�d��v�p*۔p���>���o�����o�(hf7��i
`&p佥oOz��j��^�d��wy��5ϝ����oL/�{�Ƽ�'�,�Z��ͺ�)rc簏"���_��6�/�5�4E��w*�ԗD]�ek�Q��p�9��iλh�m�'�wl&nԋ�c}�Ouw<s�I(&(OS8��(�2�q��|QiWbt�u�6f|���v�:8��:uM�H�����t��z�T���D~�=���m|*e��ɺf�m�K�,6�Tw�k�b��hgD�f�W�\�as����J4�2�:��?��<�	w�uؓٚ���	�K�P�$!^���`�X�͚"��z���S�� �����/�"O�      �   N   x�3���,K�QH:��839�����D��@��H����������T_f^IjQnjJ&�Z��Z��S������ J�)h      �   �  x�e�ے� @���逸������ԭ�`'�_Ȯ#���x$$acNB����C°��2����1�I���Aʝ���t?H�ɿ��N @{��#���!�gL�O�qe1=����0�~}F	���-�=X�������3>pf�$TTJ�S�+^c���p�k%MG����;s�R�nY�́}uH�iy�����	�,�%��H�S��2ͼ���T�R��mJ���y��V�`���1�I�Q�*�ha'���9q�)o�a���LbW`%�Z��z�ia4sX��h;rn2�D�u�������h�M��5��$ȗy*�<�⾙
����ZО,�G.����p�!���Rƚ�JMK��*�$�%� �]��2�\R�����#V �)�	L����}����f�,��1�>e2���C����|����         #   x�3�t,(����Ԝb+�8��Ӑ+F��� ��	.         )   x�3�t,(����OI�)��	-N-�4�2"^���+F��� f�J            x������ � �      �      x������ � �      �      x������ � �         �   x��ѱ
�0���}�J.&�v����%mDI���+����փ���?�c�65KI9f���T�E�*�`?�n���M(��g�-���@^��1Еn<m����l���&Wew��R�
�a��rd�#��3U[���\l�ʅ��Y��B<w��            x���Ɏ�9n��������Bj��<�}�On�^lx���1���"BU�@��SL��-�B�o������_�6����?����~�����{��_�X���o1D�^��=�=��(n,�4��K���k:ma�%s�T�\1����������-� ��/N~w���͇�����e���
�m����SZ>�{���yuu�ƞ�ڊ>���(����fL�n��u	|��B�����e~�i��m�;�н���բ��f��M?5������ܪu���.}v�<uc��@c��(�>��^AO����r1$T�s�������1�+����ǩ3V�RkUW�:�1T���j��r�z}��]\�f]�j�kF_��UB�I}�Ϙ��y�\���Z,$��|K)1�V�ݓ>�i=�]�O��Y��J��$"J+:M��;=U-5�Dr�BY����1��{��Wa��s���|���%� kSJi�ĉ�2�&ciC|�y�DzN�:�ȏD������?�]�=�p����C�%���b�ޗZ��ۻ�]U�^��j��I�S�iX��������߹�Qݒ����s�Zv�ssI��k�,�G�n���L)���M��a��6.`7�V�Kk7]Ņ-�I�tB�iҡ���z���q�Z���;��M�i�zV�k��2 ->�i�>Ƚ�g��h��ؔ��@H�K�aH�i����-���U�U�YҮ+slÕ�A��C����G����&T��]Bp>'G=J�U`����.�P_}�V��!p��P��Bwi�:{�A��u��\9ϴf���Uo�o�Nk��o�"5y�TiEp�h��Kp�8���E��z�D�! �ƦoNk��.�Z�i]Ig_ch�=/���4��YkE��t ��L��v}M�Y\���7���v��,D��ܡp2�I��r��5�Rr��ǣQJ���(Qa�E-�VY��+�\=�]�=����󃶤B��s�P��v�.](!�C�!Q{��Q֤�ۯ����i��Gz��Hj�##����8;Z"�4��ڤ!�j�[�9��Q"��*_ޡNk�OCP�x7z>x�,�%�Aa5m)����6"fm�O��W��N��O�1�A�i���y��4*Ĉ�A&��!�QRE��Б��/��{1�LS,�ȅ_ą�z���.D�G5�ᙉJ�TA�~��]��В��άRc>?��;����o��0�}Z��=N`A�+c�����%R=λ�c�,�.��Pr�K�Y睊h���y�.�$���	�L\����K�GۙV�{� {���rh3�14��L�R6����GG��WM�:5�G��х���S��XP�(�b,���D �O��G͔�	ڂT�c����7Q����yPB�[��38�F�7	��g`���������	��)�t�Tm�5�����)��v��	캴��5J]���d�Cٺ�,v�r������4f�}pܱCb�9��O'+νj�1��^�=կ	�x�wc-�bNsu�`�A9bR�bTЕ���1];a��F"������ԝ�^�}�e��woQ-�f��(�Œo�<��pu�ιt
�����-YQNkWx�5���h]��Hk��������*���x�R��� _�y���²{ �ϭW<�s��O��~�f���9���9��
����j� +���T.�t�� �1ԏe<C8m����J��p4���8�&�W#٫����x���U/g��59f�'ݓ�s�m�ǉ���+��o,`L�+O�!e��>դR"�}l,B�'l<P� <���
��D��c����kW<[�ǳF��r�<>�P~��������0u�=�t�JT(���]�G�%9��8k���f��i�%G�t�i&ARcS����>H���A\��$w!��V��1`uz���KMzNb�(0�?���%G�y���|����f��������ER���y��c�r%���~����G��B�6;l����)3k�8~}?�PZHW��4���.1�ʺ8�F���hW���IF�?��-�1��^�^a���>`fUh$C1~A)æ	߳t_���`�4�>��R{�Vk��̾/�i�_)˂��0L��1��U�����'��r��)[J�h�4B[�!Ԁ�7�~����@[/y��IMU8Ը�L�P���)��{�r�. �p��5c�QHԋ��@ý�_�C�s�����Nb��H�G������K�B��UR\k����R��r^��_=J�;�@1ȏU������t��U�(j�3Aь�<M���cSX���ԽO��g0c���w/G�����i����Ę��o:	��^�G�r�g�!d�����@6�M��{3��ʟ��^�^�i�	P��t�Ӌ�"s=���������t��	B��ט��>>]���5*�_����G��q�e�B��M猽d�ș�i����M�E��(:i;M)��<� ��n����W,�T���+A|��QoF�uljs�����A��[��#�O�] �Z�7�<��ђ�=����s�����Gvz�Nj��@��\��R�e�	a8ä��LB\�M�4t�掠s��s8������W~���.1���B&��v@s®b�@N���L�P�m���4��@9e�9�{�z��\���=����ëf��"�q���K[�dJC��j
�KnY���9T���B���i�_���q^�]�4\OىO���>�;��`�G���`����w̯����'4���|�z�z�cC=�؄�O���b�6����^���͢/qՄɈ-�Q� z+/u�v���~,��֫����R��i�Q;���¡L��a�?
�Bp��2g�k�z��(�l��}R��v��y� ~����ső�8�f��B�zoW@���	%0���%���^����M��Ӗ�����K��U֩$ȳ����6lʻf�t�u�߂	nZz�$�rG�]�1P�r8m��م<�����+7kI��s�D��뮂�\ڬ��x�j�Bm������m�}��^��:C���AQ�6< ;��ז��3GF��'�ߊW%�{E�k�,���^|?��o��觭W:J��V�]Qx����6J���E�y�6+ֽ����[�1���������Ų3���U��n���^�+��� ���fr�ŭH��Z}۴ON/%����ւ��2ki�ݹ����u��ڕ���� {Lrt�H��-�7&�Y��X)yG�[̾W�md[�ENkW~?~�Ƞ��1apsC�A<8 (f��gp)ƌn+��m���ֶkL���� [D��7����+���<z�k�Q���8����1-�e������!ot�Ð���_7u4ۡ�#~b>m��W���z�k��Vr��=��$C��S�N��C'$zx�ΰZ}�F���0�x�r�z�{?��X��pû�eVp=:$[S�dW��� F���=ixF��<�����a���J���P�,o4ƢRsD}��i!�5Y:�9˘�EJ��ku�Yg��E��/�(Ǩ��/;9m��{V��h�ql�\���CED��(��z�wΰJ]*V
'�X���K�H �{:m���@=���=�QA��M���#�3fã��FRhu�����&N���}}=m��{��3^-�#v��IӜA�>�1�6�p���yK��8z��}�9fTl���Q����Wz�L2�=U <M��ћ�J�^{� *6�G�T�S\^^�mS��"|4S���v�/�+-�8 �`.���t�9�J�����[��������������}1�b�f~t?�[���$}F]������2-�`ȇ|�j��׆E��7�ٱHh��*�t�SOkW9_=���4G�8�bO�M�Nh��$ӣ��_.Z�I۹Ⴉێ�@˟#���8�֮�m�*-��Q)��⿤Z$�z5�v�C�Xk���T=��0~� ,�WV4�.��W��C�
ˉ������3��e�Y��Ф�n�a�[�*4����r�dk�_v�z����n�\V�0&��B��!�/;�� Y  e����L�lj������Y�'an�z�z��7>�.�n��<��m��L���-vDdO4�	;΄�����@��~s����������|h���,ߺ�n{+���:d{�f:<��ݑ�+v���cF�����Z��*�pL�@;d���vi�"3yTĚ�h�nJ��;{䁄s3ؠ&������w�\��W��K��<��靌�V{���H�������+��:�B�b)A�xzf����3d��v��]��N���n�7��!�:�fG�:7�\d�)iJ����(�툁��(~��<l��{rλ��2G��5wس5�����h�6^��R&1�F�G�yA�E��/$��c9@z�b<l��j0*� �ҶU��ՀD�ѳ�Fƪa[Q��)�M]z�f�h��N7�Š���a������#�Z��h�!Qd�0Z��O\��mpުvq�e��0�����bP9�]�=�H^�Л�d�����n�4����hp����fG����OY�
L��]z4ٕ���֫�ma}�7��q�1���p�j�֌R���Ͳ�Ƌ���Uw�{�-�@a��W���+���W}/�콭r���(5HޠZ3u���4==]���'��o������YԔ�J�-ۭ���^�(m�r:+����f����1s�R2}s�Qnr�ܢ |0��"n�o�: PL�$��֫����Ǝ܀�/<��h��y�LH�fbY�"�}��:��y��:�u*�h�a��i����>��m��g���FeO{������D��l�픯�	n��L`�SOe�Rv/��|��u��Wyom�}7�a��D`U��jZ]h�i�E��Z���-��3t��;�X�5�CGݕnȧ��}��mK	���,žX�P�*��A�G�g��{GZ�:�u���Դ�tz�ǔ�}!�5�X�PO[/;跅�-Li���m�6�)8m{1��m�ѓ=�W{��H+V�%�/�ޏD��"�Xv���H�"�҄ ao��vN3��%ʮ)������Œ�<��Ys��Ս�: �G �>��!�hM���	��vϥվVISy��`?viϥ��tf���ң_ݮ������7P���������������         6   x�3��/-)MJ�4202�54�52R0��2��21�&�e�����O��=... �D3      �   Z   x�3�L/J,�,�4�4202�54�52R0��2��21�&�e�ih�gi������Y���`�	!�cNT�4!"D�`�i�a�%I&��qqq ��2�      �      x������ � �            x������ � �      �      x��][��Ƒ~�@Tĝ8oJ�TTe����Ӿ�����C�U���י�w��D�_����)��O�2N��|�/��z��G�Ӽ��~Z���r�P�Eu������Uվ^�#��5����z����.���u������׼L��T��.����L�iy���?��O@ ��}z���z�����=$���>�;�����r{��X�no��e|x [�����<^����|��q	P|�vz{�����	�5�����@u����>՚��r��v��==/�����������Ⱦ��������|�_��v�{���紟�;�?����||}�8Û|'�q�����Oߧ�	Wx��)���3��o3,��6�9]�3~�|�e���s��5�+�?nW��48%_�
3�6��ڸʏ���h��緷b�jL�����+\@ G��;��kH�z�K�Xp�ͧ��x</�9"�хY_���xВ�:�Ϸ���Ŝ�E���ή���Ɯ�����h��{� l$�!'h[�t���U[��	�n��m|���2����+>ѴN|�c�	������n�\����r�m^���ow`�|
�O��\���lܖ�ڕ����L2]<�����]xC��t�]D~S���\��o���e�O���ܖ��!���.6l�Ͳη������V�*��p"���7�0�'���{p�|�C����-i�]UO��c��eЛ2�Z���^���%x6���F�Mva6 L��Ԁ�_hq9�@aF>�+�����̀%������ƍ9O�3$�F�ŭ/����U]�e~�aI��L� l��BW�]Ձ+��ìM*i��;h��z������F�t��)/r0I.F��4?㵹�֎��}~�f<9�왗�j� �D'e��ͱ]} ق�	E^*X�>��xti܈2���ʥ�B���M��L��s�\�U�遚�}�3��ā��c��5�����O� T������T������M���4#RA?�>"ʻ2$\��A��J)�'.�����6�0�xa鼳�[ݮ�ո����7����No�}�\����՛c����� _'�Qx���i#V�T`��>:C�+B^Ij�B�b�
'Z;dPW<z��@�G�fE_@�{ZȚ2Z�yz�C��>��v��Dh1�c�~�}�r]���h�9^*�ul���P�2	Z���	l]|���#j����)�l�Y�I ��7`���h�F�6b�����2�
���6��9eĀ���T��خAɊ��eų|~��u!
��,pO�\<�r���C;�Ǐ�g���w���m��u?T��c%����{���2 �����v��[�S"��%�K�q��`މS9�Ѭ�� � �e��]pq�D0����,�N#�[e�O���E����^�w�mr]�"���0k]�=����h�p@e�l��vm#:<sA���핸�[��X�͇܊��>����@u�g���S�olѩNUm&�1���I�;rG�A�%6��l�T��خ�,�.��x⤜x`d�W��`��t�t��l[�[!�ia�Eث��q���Q+aMI8Z�2.h�Ö����xC�-"�>�c��*��h��S0�,f�Ԛ5]��(+'6ݕ7�0�m��F��t�3���^	�rN����@�]@�����u/ *W������z1����
��6�Y���xׂ>��]T�;kݖڇ>BC��t="Aǰ>1 ����l*_�L!±]��@�pӈ� (�������� ��i�>��b�D,��8eArF�郮��WQ�yEj��gL����o�P��G`��BK���&r ��-j7dG���F���������|��~�J:R,�׋�T�4�(t�Ч٢5&��cTͽ3�ј/l��Y������CQeW�z9d��v=[�z��F4q�hcH�̇=�d���� �)������h��4�0��X� åB:3G� -8��*��K.?plwd�=OV,��MO^-s�ט�MdY���6��Q���I�}��[�#Ҫ����ɟ$�+���_T��U�T���c�c'�Aظ�cF>����9��l�v�1��3�Z|��Z�x�}�-�(W�k������ʋ69�h0h�1���A�M��g��n�@&ۘ����169T�~�2᪢Z0�G�p�!Wů�!ފK�a&>y�hJ�w�.#�o%c�Ն��c��)����~�G=�>��:�L�L��HR"b�i��-�G�+~��Q���c� ��e������uW^p1���d������s}�v�Q���5SA��i����?���lu��yfz�|��0��<8=�f��<q�m���$مlueE~.V fl���1@�ȁ�ڴ1D�z)�QZ�/�T� �h��L��c6�F�\� 1i���"Z(�X�rE��~�ށ��N�m��l8�Xb�/1����-z`w�ϧ�8��E�zl��"S����[WՔZ"�2&��'���'�]���JO�I��|(���(��t'ّ�ĕ��|�efU���8�+K�2�1\�r�=�#<�e�+�Ks�% ���"'ZU�$�wtU3�j��!Q-p��3g���-�K��.��NJ�خ_��WG����Q�'}Ⱥ��e�\�.��o��'q����B���ژӬ�<�����TdG��/��΅$
��;�x�Q�H�?8'�y(�y��K�c@���Vr�s�l��D��u���L˰]$��������4@�-�yAΆxmtV�P�ȧќ؋ ���L`7/Mv�pP+P1_YA
ni]Q��Ew��3��`Ƹqqɫ2QThS|R1I����|m���Do�����ڱ*�8�@O`�D��:���*]W� ��fX� �����G-g\�0kίqR�ECU`I���1��r�<-�z }��b�� ,\5ܒ7D2k�]e��خ�"��&�������9�K��V�6E��u�\��٪"NRpS�KH/	6'@��4o�['�Z�5��(1�l�hW�Yc�K�J�c �T��H����Ӱ�N̶���2�$-fJ����D����|&4��1�g#泈��I�\S��y�*��A\�4�:�̺��̓c@��4�}�͢�d�'�P��^u�fA���7��#�Dbà��N	ɣ����D�Y�����p)�dh&o�ܑn�4=�|3�q`W1u������3e�
K�5W*	\Uy=Xm:���Z&G��&�8h�v��1�*��9	�����>}�#e��.�^7u&�F�>Ɛ��B�$�i솙��LP���c��=����	�z�+����~B��U��o�	[�L��;n�� ��T/�Mz]�BA�Jo���[�0��ǗC�o8��%�J����V娮����"{G��G*�QZfSbf�Ȉ�(� �m�fJ3�����Lâc42S��e1�t�H�1@?Z/6�>�\'�7����l��Y$��-��*m��9�>B�A�!�O�Л9���\F�&��$�
�PBn�D9��hc�<r>v���S�U��0���`qd�Ѩv��1(�y���|.�}w63*��w�R���h���!�"ײL�8���1�Z-�d��d���ɔz*1iO"T!<�#yN�^O&G�^%c�<�A��_�#�l��d�G�E:8qɪ�$'$JS�G����ۍ���e�j]�a�8�$渀M*m<�$r�jhɎz(��S��qd�����.b�D}8�k�O�)��"y���H�F�-�J��!4E���J��D�K�(��-�w&CE����3�Ed��o�Ԕ�����O` �fnI���9p��_�B
����>J��������!E�"���W؅ICs-�l�Ln�x���,�X�� 4�r�|��C0�Nh���J5�`��or�W"9�QU�̦6ruq��c��b��-�'$�H����[�?��H]�MH�
E
Q�l���~iT4�rF��t[�U�c��"�Ni��M�r@)3Ԇ�"# �  J�4�&�wL�nC}21	x�AIZ"Ր�y�t���B��!9��G�J��R3ۘH\ω�,!Dc��'�A�ң� ����Li6,�,�� 9��˘A�'�Up��	Ppl1KP�9p�«��Sv�D������i���E��9�D�(��^�p��ɬ�uյ��&TB���d)�nc'�4K�m� *þ��҅�qur��@��~�{4?�H�Y�͇�]߇�Kn�c�'�Ӟ�'��-U��>F/�-omI����&V:��(U��U�b��3'�Ĳ�oZ��Z��ˡ�4KR*�<�Ac ^�j~��ԏg��,]B0�C�
��j��uUM����M�N��*����u��h�A#�Y�SX��D����8��5Oc@������HT�]^t��;�{4!F�&
>��Ϣ��K5T�FF����\Nɋ^�� �N&k�Tn�|�خ*��n)�@ⓨ�<.0�x�Ѵ��.�
9�����=E��F�%�P�Mc�êd䛭Ix=5��W \�Ч1 �-M�.F�U�A'h[�`lAU��t��&��z�;��Hu6�?ψ��PU�wNB&����C���Z�[���̻ ����1�r&�-ԝ��Z��懺Ї��Ma�(FS<H7D0�8I=|h1���]�"�洼�#�$��e�^��1@��orp'�@1��	71n�$4��$C()����tN���ϧ�����]�Dmi�Le��
M�#��.B�!ak��� 5H�����0��>i�5�.�*�s�8����*;A��Cl:������qLa�$q��/��Z��MLc��>�
]Xq筵� q�8�K��$��A�	̕W.�
�/IE��l�D�l@b;��8�u��FGpD�Fj�׍��Ʀ�� �����\I�rgN����O�e���di�m��YU\���7�'���]�Z��g��1M-Qۏ%�a=!%�*:�NJ��=7 �)����!>ns�֮F]	��5��.��u�*�����.3v��o����|��!�5ͤ��u�������0���!@JL�I������J��Fi��D#�K0c���&k��}�H*�Z�;	i�vl���T�p���r��"��������xu���_�B.4�~a�K���43�>�V��j3kLP��]���yHc��=h������Mo�d�B-Ii�ޟ$E��4q3��\!���"�l��hu�;��Ȑ��p�����2���nA��I�3G�J&s�C�G���P�ɦ��$�Қ\#��]��{���'p�J�H��2�ԂJsli��e�Q���<�sIR���s�܊C�!ہ�V<�"&}� �>��1�<�M$�ƅUr��G�I`Һ'�6C��Y@m^�Oc@��y��hv��q�B�ֽ8iց]��Fj�c�n�vB4L�&�)�������Ã�F������-���<j7dsK���FIv���̵h����z)OJ�@���[i��c�L����I�tO(~�Qˠ�Ig]ȦT��oZ�;L�)�m���vUоdc��Nؼ�$�o��e�_M��e�Zh=��v{p[��8 O�AA�c`LS��R\ʐi�TS�^�J]�6M����쬺�� =m��&4��pl殫�n*�XK�e�8���R)6��h����u2r;U�E�R��C�7���^I1EqE�^i=�gZ) m�l����r��_b�y"���ꐋX��2pv�:�`K�l�񀝱V����5JVͥ��K�dK�XJhqie���3�� ���ޘ�$&��ǵ��4=_'q
L��m�_�I��;u�v1��X���C����mm�D��Pf�u�CG�ñ���*��$���Zjm�"���ZTͯU�v�dy�&��1�tL�1h���\%� =��:�\�H���I�i�+�F��Z�	�n�����p4mZ/3�ȯ#4A��l��yGGn�i@�A;�=�PQ�^2O��j�\���"Q�	-��[��i-`f���H���2�-cz$�f!>4<?��}wR"G�z:ؽ�D踐#mT`Sb##5�\?�"ӛ�x��l��}4}f��A���"Ñ[A�5i]�]	��mh0j,�Em�~>��Sbh��A6D��Z�s�Ǎ�t��W����-У�L�� 4�YD�9g�\��u�1 U%ns��ה��R������-��i��M�_}nÁ�X-���.y�`[~��[�Βr����R5 ҥ=��j��4F�:u����ӄ������6�r��z��ӤH�v��B����3ĂNzK�{�HO[-�42���[��خ�>B,%�Xф�ϪЧ�s�I �&�?q=}nLTD*?�2lrѠ�(�g��26�Mř��ow��T"���T�H9b(�P�ߘ�-�YR����H#s���?t+��t�m�f��D5:'-�'/�.r���V�.sc����.eb%x��C^���q�Qe44 �⓺nX@���Q#sVmG.c/�fj����E#7��ӅU/@H�1�?~zf��/y�#�?�0m�g\���Q<�m��0�Zʜȳ-�1Fd�����K��!�JN�q�h�����sͥ����lH5"�k8�ܒ7%����]
�N�ȍ����k3O-$'Pn��&w���T���7�\�pǬ6��Q{B���޹.ly�H��գ�.zMy�e߮8f��F �vu�pum�
�uA�,���Su\��nq�����g�t��.	&��=��u�Móxc��s6+8ȍ��sͦ:"ba��X�xh��$�8ʬCY��y�f����$i%<M-��h��y��P�����ƞe�\4��4$�
G٘�Ȯ�F�]D�l_��ꁉs�ym<��!�Y!�n�D&�9kNۛ�"�$YRu�gK���	yx⸱�y��@�Q7,Y��;�5�%�'�a�-�]dj�L u��8v\s����gg�K�	��:g�F�J:��_��l���tXm;,��pA��TbW#>�y�8�E>z���}�bj����1Ca��N\�@P�w�}�F��9��v!�Zt�خnF����DL�;��t�����J�r%�a,�������C���V"S>�U��U�^��M�� ��6�ַ�� �)>�B9:S-�qᵜl�dq�*mam��\Vf����F�6�{���ݵR��G�ǈ�����ӷ|���/Y{QBGcisX^]Bn4�_�����f�W=���C$d�wE&��xHt�@�������Y=���P�I&I�}h&�Q�!��H�p%Q�ˋ�����"}��zvѨI�rJ�@\�(���Ͽ�al[���ω�-��?��S!�hXR��Ԉ� ����ID ��>���f(�$Rk��RbQ�i*���{�M�c���E�H!%2�Rzvb7��NO�:�,��7�m���$B��U��]�����D�I�g��M��E�1G&̥��'����Peuƅ^�b��m
'�z�YX�P��$I�tH����jme����*i���}S8ys^�iT��^O��N�!Z�Nr����(]��j��p�}��(.��r�C����4TU	��ˆ��0�P�I(ӓc��7���]��˶� rR���}���avW�f��>���0�-6��X%W����������Y�.�~��T-o\�@e���i�{5K��})B*bs�&�}�-nm�:�&�.�v]�%!���/�n���,��p���ƀXǭgY=����iV�����1*��Zb���E{���C�<��y�nޮ_���7>� Cy�2m�Γ]hlW�b���4�3l�*	=�֖uQ*��|�y*��"�N�
���X�D���r��3�z��k���X	��Z#�6ډ��YlPe�T"�޸Z-�22�ST��M|B�L�si?j�<��.!��Ei����*)�_B���
����s۬�E��M�U(-ymI��}(ʬ|��xk�ƀԑ�,L��d42_�ëU�O�-f����Ⱦ9Z�np!�C��6��t�1�NԮ�B��a����\��            x������ � �      �      x���َI�,|�z�z��(�E�N_wF@o����s�I@EJEfC�����/��N`�n�T�Ȍ����|��c���a:����/_�����0�Ǘ�o��?�=�����凇�_���A�����O忷��������m������z����{�\~C�ux-��6�|�����k��������������t��|��ҡ�|���=�����po�w�^��~��n׭���z�V��g�~X��o�O�>{�����/��/���������{���n����0F��C���t�ϷQ���>	�ϩ�������4�/�
_�a�m�S:O/幽�Е?>6�zӽ�2�_�ԇs��Y~�u��p�e��P~�6����a*���b���Y�K�����4|)�6����Z��,7?�az��z-�`��o���K�y��M�Z�Ķ�����>��K�R��?_��Χ�tȉ���O9#�˹���_���/?����Z^����.����H��a<��m���a�;���TV�Z�c��:�����#�t~�|)���+���G�W�S���/�&>�d#������rQ��z���i�:^?���������"��s*Oq|�uO��./�QVP�dK.eu�H���|-7�?w��R����}.���ϫ����I�Cy��8��m�el��z�����go��'����V�Ч/��sS�1�e��~�:p]�����jB���p��b��r��8t�1�ٌ����A�M�Zyf���Z�꿇W9��b��D�ݔ���m�TMr���x�;����q�mZ���=�A���&���4q��/�jm8�]�N�������)��z��W�/ȵ�:0��?lֽz�ޕ��Tns����3��5*;��yV��l��/OX��v����S>�)|}��=�<�c�3_������=M�D�;��2�	+W
��\�/_{������t��Z�_P���Ŷ_��?�-�pϟ�>?�Ǫ�S;�����r|�x��ٛպ�x��/��������,�?������s��sv�r���b?�kG�lSo<��~�hߒ�����mGY��~ײ��_�р���]�!�&�?���_�b�se��q���^�`4İbvaf�|h@�]{�r��+/�`_�Ǥ��m	��-���%�78�Gٓʗ�O'��EN����C�J��?U��?�r"/�$��(o��Բ�]�|eT����5�)��I���`��Ő^��-�/+,���|�.�N�5�5X�[�?��l��ģ��� w�~L���������3��������KWgV�i��[��W�<��b�8�����g������Vʧw>{�*9���SY���$OL]�l��K��|��[���+S�0$�wYnD��N��)+/q��[�ܒ�B��#����_8H���a{(_y�K�jٸ� ��Y8��N���ŘJ� �Ǜ���|�a���N�{9��ꇐPqד���ȭ��O�������!�
	�ҋ�U,�� <��>]��m8L8F��D�"1�����G�8A�֖G]>.�j�����v�/��|�\��v\�ߑ���BS.[;�.7����^�ž7�W5!ޖ�Y(aZ^aq����X�7�kJ����O�'���-��X�D/�Ơ4�)Б7�I�Yrϒ���Z�g���7�u��>�*0M����i�U�/w��i���� �K���*1���髏+֪��X�=��G#��f���n$rA$��{L��Wd�e���� Nd�ٷ�ר����'���.�w-k�vϖ!k*��Ύ�<��{�&֯� ��o�+����>��e�w������i���TR���Gb[��<=MN,�����@�r8F�������y��5�/6x�+h�ś���q�ԋ��ȧL�}qd�<�4}�XI���ku�{zN��3���Z�����2����U�_ne�H]�7��g�ir�b]��� L`,�����O*�1D�_��S�w���Y�Fy�	{0�`f.��;O9�ǖm��w��q�\���d��4Ylc��=w��p��Je�0^��P1ߨ.�]+�vض����I�L@��|���w��/@w	�al��I��@<���8�0�y��b)�la߰��#_XN�{�ˆYz�,��� &l0j�����[���v��۪� �P9dO��E�<���>/�)���~���ԇ{�x��WV��g7�^K\2Y�[���?wR����f�!u$��_��?+�l���d�zC�����w��O�E9�����e���Y|Q�	`{U�C�_\��qq%H�-�����B���8�q����v��"�em[ֻ���=�+��� k�;d����@��B>��֓A:)�8Xa�����f� "=�M$x�q8^��6x��S�D��0q��rЇ(	��L~�����i9�qw[Z=J�ʇ=L�O��Wݰ��M)����=�K�_�����0/9(�P��2�Ƿ�뷫����l��_n���OX0��0�<6D8ǨP���x�� v��q�:�����?0L�M�q�f��
r+^��;�wV����͓ٛ:F�q>x����$�o�Q�Ψ��#g��>D�S����Y3�uA�r�A�$�-�:h��{(��z){����k�sA�$�$��A�+�0�k<3:(�a9��]��+ov���=�*T�H�Z��=�,���6����1t�]��;$�{��3��G�c��ok�ؽ����^%3�h���$,�K��Yl�x��{�Z� 9b17-�y�*��K~	�`��Y��C_#�)H�Ɗ`󏆠�?����b�F۹e�E9^c�uw���{�;�)!�{�h9�si��&��_/כV4F�����\=����SˤR���V� � h�m�-�ڔm]oVh/)�+�"�Ϙ3���DZ���㸑`�v�F��ۧ��mx�䣲��_91�Ê�Z�D��Bه�o�u?[8ao$G�$i)�᡹nm�!�B_G��m37�������-��wR��3�z�y��~L���F8�t1�u.����U���|�z1 �*����r��\I|�ح�;X�������w����%�V����=X���5Ue8~�K�$;�s�y�:�ѹ-�����j2�[�o�vp�~A��5���TRo����p6��g%=<�rY��	M*x��F��
�H����^�U�նM;MA+��x�bP�P����j=R�)�^SO����FE�-E��ó{��
���7?�(=�DQNT:w��C�1;�����q�+4��t7%i�ͪ{N��jb�SN�)���+x�$0s8p��� ]��#=���f�5S|Ɯ.���u��r'�;;�<�٭#7!�D��k��2Q*�7=Y�O]�̕�coZ6���p�-��<�K�e�V��h&��S�Wyh��F��@C/LJ�ڕ��j>Sɀ�9�q�(=ӫ`y�f��^�ۦ�o;TY*���<'�[U������=�%��{��i[ۮ�#1=����?��+'�ܠՌg8�V�=+n�X��EK []���N ��XR�����n؞�^�̾���
!r$�j�&��$��8��L�2Z�\+��U�Z$�3,�>{�{����i�oT���*�R�8�"qڐ�'x:������X"͎X�~<�_i�������~���bͩ�I�����k��r�[�NL�,M20�1&��-�?JH)��Y�[ǀ
QS��-`�B1���H�
�Ō�%��в�����)�=!��4�E���*�mv����Ȫ�S���_kp�Q��G#j4%)_m�������~�by`�)�ᣆR�J)J}#���w� \8q��H�`�s���Gf8<��w|�f��M�ڐb%_!CňG�kv��$�?�9��]#�5��a�t�M�#>�#�疭m��5���J��ى�W��k� $T���4m�f�/j���	�LK�ն	���U����pX7��e�S��<���'�F�|����;9��=F֖�e��}���";,�R�VI�Ռ��߆3Pk��w9��Z [�;h�|�f�    ��y�`:�zR�=�|�|Te�Ԫ;0��{\���g�"��5]hn-�������E��Xc���N
�����V�oE��cز�c����ks��)��k���S��SH�ŔpCM�Ji^��%A{�,�]GRw~��;}�͡�|�J$F��#OW�ªB�?�^ۂ���2m�&���)y���0���H���R[6Y<<�;"�8��p��{�R����W�)� �~qp�� �Sf(����g�����yZw��7 �B5p$�נ�A�{�������,Gr@�^��kB����lPl�{���-r��>Vls�&7d&���yrË�A1��!s{N�C�P�[4j�zM$ ���thZ�{W##`#��5����]fH.��@�����<�V������%���;$E�A}�Ӷ�]g��#kH�~��A�w�y�N[�REӿ�$?�~7���P�)JEJFj$d-s�ۃbm��Ne���)fB�^�EyU�"����@��o�8�4��>��Z/+ԫ�뻟�yz�> �xM�?�5`zn2��#+�~FtE��+[��KN���tm)��9�rзx��vp�Ϥt[֪�x��b�W�="�'"�J'��TSލ���d>��+aq��Drbm1���m��9P5�XS��ڬ�S�6ĔF�k�_�Vj�ux�|]d�^���4��F��4�#j�u���[�͠b���E��8������K�Y��W�jسT�ah���k��R�ⲟ���w��b�fE*��1�vpm��C����q�	�z��m��go%���r���&&�F�|1b��y.�G�x�����wܠ�Eo:�,�l��	����a�<D�Y�]��t��� mkق0�Ý��J^	���~��Z|�N]��Y|�l0��'��J�At�(�F���Ԅ6�N�mT%��)d�gjL�	��y�����i��x2�ғt�ry����/�@� �B����b��� ��:�ώ�'HȈ/z^'���۩X�X4� �kDn��<@C���U����}�����潫��R��se�p7N�TR:)6-�(|�����`�^��U�Oݽ���I�[��ċ-�=:���l��2r��N�j#�/�q��K�%'Goa`¤/L|�C�\����?��v�r|Ö�H��o����*-Dm8�O���>Z�<��2*���-k0�ξi᫪si��l�n�/�N�a���}��=}��J��o�N�:J��d���e/���q����wq��p��tKQ �X���:��:Y����vݴ�Mb���x�_ A��j<F|L��KD�hz;ޭ�L�`�nA�K	�����7�l�y�}
�y����D�{����5�b1N3���Z<�j��tB��eջ��:��;��(����i쬙Z��� ���"A���<k)�����x�.��q��'"q�u�����j�uc�i���2��z[�;�m�=����n�}s|2�\�z���W��y�E�H=�&R�� iQ]]Eh ؗ�iZ�7A� J��x���4�R2��ڈ�I�XYW�$���?�>Т���D#�	"7Ǧ]���1*�"d�k��zG��f+�W������٦FCs�S����4�簂�t�t�G-�Zv+�R�.pG�y<�E�sP����*��ͯ܃���_��	n�Q�� S��"��,Í�D=����ӊpT1X�}"�1�_tjK��0H뷏�M>+;Xw�
�Ϻ��E�-���X̠jV�+"�<|u��=���^q�̌��If��myV��u��7�{U��7#������S�T%3�{�p����b�Oڬ��zs�W�7=P�F�m[�z��w��/�l�=`���g�S���O�>�����r�]X/X9K���ϡ'���#9��yW�t�	T��j~���"���f�������iCeQ��M�Z�
4F.�'m�
#�3� ���d�v?W)_b�F�Q��k�x�4o�Q�����덲c�5f�&֓pj��$�q��`��f��6Ϧ�մ�wyIǳP��I=���[���*�Պn��B���fX�����D��E���ާX�@� ү��A*�6������ܞcr�6�J�v��6:�#���?W�.їٗLr�k|Ɍx�ۉ[��Z�+^��ˌN�{��B�l���4��n4���F�	j��uO��p ��/�-��?+k_w�'.���`+�(eY�7����^Di�	屜* �vY��A�j4nm�AN!ZxukJ|JR|(���+��*���	�㢴&��2b�{�ض�m�L�/���C��N���Nd��w&�Ɨ%C�ZV3��ʔĎ^i|;�3CoL��T*��s��͊[H��b��8�5�SL������L�͢M+�w��ZB�z�ZW<	K� Gy�L��z��껱NW�[�|k��Z;�Na�uJ}n��E�/���?u�s��}2>�E���S4��`��2G"�Y;��1�)���lLЎ����64/R*�S��-�;h���2��c���C�}�CE��2a�Y�i?W�՚z��Դ,� %ё{ų����u��xr�DSma��כ�Œ�ޓ�cF��Ζm����h��Fá�m)�s���!aꕺ�-Y9ju>ɗ�ҦT��a��U��S��(�b\��)�/�il��g@��.du4ZX���bK�\>+{[#�mS������9��7�/ʿ�[���UB�Uw0��3���ڲ�M��	{��
�+.?����
�P%�r���Ʒ!
���OS���]�f���!�s7Uݘ,����oA�Q#�jJH�Ϊ!���M,A����d�1�Hpi�&P�>R5%¢>{���J��&��ܱ�hâ��jrԾ���x�mgd��4�bD��4���4��eZ��`��U��'\�P����{�'	g[�YY�p۞������9���kwV�oѓ��	�v�-9%�;(�|V����:M R�eb9p:��L��n`�L!/���|��v_f%�TVz�_
UhݶM�-&0r�U�S�-˝V;���-	G�⃨d��Ӥ|IA!�0Y��m��\L�A�
ƛ��ִ׋JI�w�֢Y��F���)���^�9כ�.Zo޵��x�ޣ�x�R��6L���+�z��gq|��H�X���:�X<�:����]�1���^E�k�E�\}��V(���b�W�w�w(�/�*���{��}�]�j�#�h���t��I�oE�q1��M%`KOoD)'Eߒ���1F�̄�M�G�̜5�4�j������5)���5��M���c~�����%lyl���1 y[>�ʍ�F7ك����"@A$y74�45�w�p�B���C(<ڴ������,oB�V����@rJ_)ۅ�����z)B3��׾Wѝ!]K<#hԜ�|	�V��i���|F�:}����{��͠���,za�䳲�'+��)��gG�,��>3�=�9��,fUZVv�&�|�Hu������MCfS�<<m�A�ÆLp�F��R��bƐ�	j.�7 
ߴ��H���e>�A|{�k[E�b<��IK!X�g����j��ahߣ]�K4t:���t�1ۯ��X��߽+�<#�eEE'���!��9��{>H�I�v��߮2g$e�_�v�DXYͧ/8b�X����A�#u$���z.���t�[J�@���4*������G�?g��y��A"%�jc�##)Rp3ћ�G�|���aQ1��y�-A�3gݶ���z"�i]�+:�i�Z�Y%�!��X��%��ʶ�rۻ;���&���x��\�v���!��j���T��V��*xG�;vG=��g}%p���y&d�)�ޖm���VN����*��,]���>\k瞲�����
z�̇����
��`U��#���z�-{��ZYO>���ߞ�����4���5��,�;vK����{&k}(�P��TM�s�4O�T)�տd�6�t�>$�VS'�F����aն��E:�S
���<��g��E��9�<���CUJ�����*ت�m[�ћ���X��ɑb    �+�`��S��wT���������5H��'�|�<Xv&H�����شגw��i����21���~��joL���S�_���������՛U�o}��^�#$��<�o�A�Q(�o��m�.��`���n��h��>��x�e�X�یN��K� �o7��E>++^w��6�V6�XIc�C�g"yM@������}U<G�;k6ѷP�Y7ӠصmD	a}��(�ŷ����c�L�x�ڟ�{�e.��vpc��b�6-\@s�ҧ����(�g�P6������G+M� 3�4ImZ�{O��:;1��؂��2��.�<�������p�вCBc�B���$����)=�#�d3<O��LH I�V�c��`vMŬڪ��IkPK���T�:���_����L��l��8�-�b�P�ϫ�����ϲ��aye�,��~��M��ĝ]c𛦙r���V���[^�Z��l�P�<`W]+�U9�Z���p�\��]̡W\�1mi2�t������x�gz�^�_����1�w�H���5���c5����E�N�q`S�ˍjY�^Z���,��t;K�|DN8Y4C��1�U�#Ò|Ɠq�p�Hv��Զ�����_犹(%׍0��Px)}%�?A��'Q]��k��`�lg#:����u�p*hT\j-k�Ȭ}LK�J���f�M�+�$�Z؊C%�j<;(�Rd���/�B'R�=�lےt�i�sF��0](�1B��dP�N���Nc�=�<��8+�<����c�~�, {�I�g>f�O�K��gQ2��dW�:�x�q�=�Tߙ͂,���z�j��/wǎ\gJ[�S}�����@a��CL�z�~��+cx�lUyciթ�N���k�L'��5N���|j�uh��zڋ�j� ͐T/`�H`��e������f�>������O��=�dyEW*g���b�}�Ӻ�,ZJ�U���''�S�K5Qw6����(A���1��i���W�i-�L���?��;��Ir,�
�[�i�&��x"؟"4S������:�Ƕ��2���|����	�F���}Mf����Ғ���Δ�x�5Բ������VM�yz잽�d�������L�;X$��ib�)1i��zl[Պ�S
�4-+�A�`�y�\q�ρBi�e��эDs���ɴI<�`���.u�峲�5�&� �o��q��d�~����W�[���Z�(Bg)��s�]*��H�tl۞��:����×��`Q�����,�3�L<�$+�*�m!�U_���ԜP8s���ڪCۦ���C�d�ZT�7�dU�ɾ�k?��q�߱� ɭ���q��q۶�]���*BX�����W��N ����=X��W;�g�J>v��R˦ig{�JA�K �f�\E��>I��uf�ßn���E+�s����m�df�-����^�OO+�wft��]-n�W�M�%:T�%M��9\
#{bG��P�F���S��]�r���S�C�`�o��Y�%ߟ��N/�
�ՄT���N�ʈnk��׻G�a�Z�"p�$c�����9����tw�x+�¦G%��:�i�>jt���Τ��D���(3���	�1�֙�2��� �!E�#��/��j����%)��3uxD�Y̎![���Jo���k���+�6L>}ODl)�m\��aT�p��8�ѸY���<�\�����>0Y�׷��6������P|�٣������R=}<�t���}2���*��$���R�5r2u��K	O��R^oSʮ,m�����c"(Z���'�*e��������)3��c.дY��I�.�NN<w�n���S���|-n�iN�pBCz��Bc���y�G��x���c���UZM�!KP��S�rD��|C��&'z���};�4f��8A� 6���O��TG�,Ba+ܵlg�/t���)6��̈Ӂ�qV�u)�T�!���t&�	:��H5�_��P?U��j�<�Λ���v��䳲���#���d:҈T�W2�
�/��1�Iq�����h�"e'R��L�N"k޴��@�#�T�I�a���"��a�����7eLhY��Q��9_R����^<vAf2P2CS1��
��s:��i���΋��rU�/��.��N�B�߇j�T����1��}�P�.��J{�
a�ݲY��g�e�#�zq�����J[r��~!
�Q;���
@�7Jq�GV_.r�U�ge�kD�6ְH�P�GG)��|8��{�i	���J������Jg?�l����Y��B���������p�^�c�ɡmJP���\|T����#�hA�K�3z1�/L�m9�)�������d7ԋZ1����1۴����c����mH��U{f�4�F"+xl[F�8HG�Bd8�'�y�w���Z��$f��1�	����#�Xc��R�J�3��+���;�}\���lt����}�܏�����)�5?�e`T��5�� �腦b=�jͳ!!���s12�^-�z�M�ʎ]�|�0]�S<�dI����z"d�Wɚ�ת��qD����*Y����5��%w4�m���G܄��㗻T�ƹ�~JVː��|b&��h�Ov�K� �9?�t�V`�'�m�c�~����s5M}�Sy�f�T-K��`�n��C>�	��B��`-���ΰ��,{���"�k�3ַ��0��>�{0�GiA�f�P�4}&��1��	�]NtEE#�N�����RP�[5��K����-���ޝ�a�R�z�oY��Z�F�FY?��B��_�YZt��m2����;w8XǾiB:�'�)᫞\�%��M('�c�/�_:'t��=W�/P��8w[��n�'�Vh���0��N�_�<�Ɛ��J������Rs�)�Y���g�4�\�4L���:	S̖�⬾��,=t�uJo����l��^��6��C�ɷ��,AtK�N��ǭ��1�w�J+�g��H�k��k�Α��l���޼�� �����|cq�l@%����B�u��>�����j�h$�Hݣe���j��xD���Hn2�X��ޥ�-��'�(U���	%����q6��N?�8LI�eMV��\�e5Y@���$�]k2b+7u��ğ��Q4�M�c1jS-s�?H��X�����ם���^����Cӯ�V)Vښ�>U��yi�0]���R��#8�EgM�6Ѧ�j�֐.!)��ڈ��@�@��h5�S��=�}���f#�������d�l�S��1T�o-W�.�pA���J�n��TU1�~���z\���g�Yo���H������c����R�"e��\�c�F�|Xe]#MMC�%��!�7�n�l�mGg�	������<���H�AZ�*0H�r�E/�RK��GG%'!6�����n�i�辳�,j ί��&��pk��VBV##��a1i:��?�E��vw'��ɹ3���i4(b�_��e4L��@(�i�9\�&]S��c-�\#Q�7�Ƕe*�7��IMB�#'"f��A�(��'P�S�B�޶I4ǹ�;Y�<.�d�����Vn���|�^*���UѲ�
�;h�O�j��b�+�L�b5�ּ��Æ3�]�Ӿ�`��-�)1h&�L]ҕVo�o�٪{�xv^�����&��^�������B���oE (�%�x�3WU>+K]w��LTf�rؓ��h���H��N}�U%!^Mu�>� `��� � cݶ���"�6u����"z�ӟ{���;�. W���J
�ewE�y�˞�a�6���mSCNZ�}a-,�%;Q����Ot�d(�+ucYMM��M6M�������y�HDC��>�Ϊ�l�k�L3�=�t�GE|F�K�sS&.�4QKIW�wh��-�g�^�Z��{�ղ��*��"�ha��6�~�Z���c�0{���/z��=)��)��n�<0�L��.i��,��OF���,�)��j[ء�)��o��FpfID-ԝ���1fF����ѭCE�-���'S;i�D	���cNb�k��L�%�҄��tU@8�D��Q    ^�)�~V#�ϖ��{�Lٔ�����y64�����u������18��鶘�zܵ�xӽ��ˇd�0��J
��kg����cs�j�>�6Ƕ�mU(9	���������XeΆV�����pF�"���[�D��u^�gY��\^�����$xF��w�wN�T�g!.eP,z����PF0�>�e�1n���w�UfB�X%]P��UKE�(A�3!b
�-�G���]�bi4G����!?|��"H�c�����RgB>+��(S:g��U��=���νȲL�R�i,��[��#��hhw�D�i;����=�5��`�\Z�<s��Ԅh�ܣ+�����yO�K( ���#4�Uݲ�c�!!k%�VN3/1Xr`���6˓<-ItY���c5,F��	93eZ~V�$�as[�eq�.RK⮩&m%�Ժ�x�nNH��i/�BB�����_W'�TA���Sہܮ:ӵ�C^��*�d���b1�����L��}�C����:�z�����.DVb�#;�zHP���3R`���*8�1X����nTn~+�A���!�ĒIT<� ���T
�KEhvz!$�oH��x�02��HT0�ץ���٣���=wm{ݪ����#�=A�K�	��U�A�4RaNUL�q7㼸լ9�A����c��4�:6j�8D&>��k��' Mg��u�����ɒf�[D��1�S߮��(h}h��^����Y���[�3�9�U1��`ߙ�J��3��*��5���/���J�6�, j��l����N�|ĥZ�x$��*�.m@N�c���8LVFP*�>�t��`����'6�5����cH�b�ܟ�Ԙ��������r&��<F\�M�;��tN�
r_B45�4?��ɥ�t���ɴ)�.������e�gW+��6�~�j��n�g���<��i>��lݥ�����L.5򐧫R�-ՐRG*�x�t_1޶xƖ�[ٱ'SG�v������LH1��q��^��Ҝ/���-))�Fͷi�q�Mk%qWM��~��B�5h�,��a���v�^��C��$�M�ٱO�Q� �����R��<լ+�4���B��� �Ts=��Y�,X[��ɾ÷���0�0�tvdX$����p҇:��"���ӯ�H���G��`�;�	�F�~��o訣�-��J�Y��S�?qп�k�����W���/t���כ��Q
P�1卤� ]��=REǤ�K�ry�;7N�k�3���?"�%��)q 9��L�%�崀�2t�Ȣ����t�G���"�6�Z��n��I�b�B�7����M��$�m��mb��=����S� "��zǜ�Z���)4L^+�����ߦ��WY騴�Bk�,��XT����۩�T1��+��m\����.�^t�ge/�������t�)a��z�Н�yv�Q�8�4�̸7R��6v٧%X���`�����JD	ѷC$Q���uy1<nɵ��=���E]�C���]7B��s�V���D��
Bc�V�tA0���mx2S*����a��۶/�uQ���g�'UY��٩`�grqD0K@b��D8{�mk�@����bS�M�d6V.4mzop�V�饪�x��zvI����s Z?+kz�xTP�u}ⷃ<�q'	�t���c�`���fڠ:��T�ɒg����q�'ӹ�`������U
�K���2�J&���+<a��t�,\R�����`��^<T.�!&Ҵ�#��#�@�X�*�@M�a���aڔ�������S�Rs�=�Y��y =5o�Bw�?�@��gQ@"=ı�?`�O��H�Dx�����-���P�%�P�f\��e��	�%OI�d�dEi.��������n�*+]t��ge�k[}���-e���:{��Υ�?�!\��dV�V��o�"��:�Ai6����S�7��.k�;ת�G���w���cLq�i�����MYK���yWaW�跺���V�îm��Lj��N�ւ;��i�O�-s
��a(���sJ���) c�^�f�m[�u�v��_'�3}&����i����{-'4��b����J�AƜ)���%�����a�jx��x�ce8�������dzw�'T �I�*�4R�)�i�J�z�B�bpZ?+;{�7V��}�u����dz{���b��"
Hb�wPf9���o��^Uu�J��#�Y];�%�\�m�ХF�!5N�+%�4i���	Ju?ր�-B���|k��:̊�u����mwGH˜�a�W��j�;�e)B�svFk���*i���z�+W�w״�C	=����<E�.ME+t���2�q6�ÈF��w�Ôt�l���.�e+�|(9�>U���-RA��8Ee̵k��s�$�ZUq ������/���i��;fK^�}����Y�ƺs�q
��:�+��&]�y�k�h��:�VP�-���S��K��8�����It:��f7�M����V_�Hցcy�%�%����Κ�|�u ���%�uE8���M��D&�v�F�c����Oxy����1���)�k�\��Tܪ52ߴmsgL�o6Lf�����{W��C����Qr�P�1N��\5�m���d�+0����X�Y}�
1����t�+῾�A��6���6w ƍB�e��{i�R�ˤ��OE��}���g�n���p�3^c� k ��T�X����__/L��R�i���l�8�̯�9��WUk�!OEs�*(�rk�;1����۴�#�1��֚��.��¸i���������J�~��]����G�>4m����&#�&¡��R���6#i���A�P�:�Z�V�O3֧ɁP�I��5?�2��h
ڶ���y��R��һ�ͳ����2CŚ�!��^-c�nՄ5&`�Z�Ҽ���EϠ~V6���H׫��J�3&��D�E�ZmF���*I�� ������6:2�ved�o48!!�q"��v��m�Vׁ�Z��U�GR�%
�E�8Er�Ƕ��l?�LY�יH��9W���o2*s�����q�����" q��~ն�]����1��ڱ!�� V�n>[�56@/38� ���VA���Dˋ؈"g�v����t���5�Ӡ���P��k�*��A<���F�ħ��o����/�R8Y?+���
@)��)�4��V��T	gD�Tk���!XDyv<�Ƽ��	pԸ���R+�z&V�@9]f�Ni<
T�R�j}ln���s�@�"xW���N��9��t:��޶��H�	�w}��#�Q�E=���`�@����;7%�}�����v؝e�=tl�A��y�i���L^�����`�k|6���T~z�P�1>�����b�L���&@���%Uch���&��R��2!���g��qn�ge����Y2c�Ҍ����g]��xO������z��mK�0��h�1T�Y���DG+{f�����R�Pʴ�^��{zx�I8���*��b�۶��Rm5��Ħ���:���8�4�d���e1�5˪��cɐV�Ω�H��g�$Bhx�c�6���iV�P�,� Aj�,4��_Si#�TEo����G�9��x�����^в���`28)���b߶C�F#0��f�3S�PC>���{��<|����Jd����/���V��νG/�����g�v��9䳲�'�JF{�u=���pK��?u-+�O�{�,&
�i5m\�.�j�R�A�Hܔz
2]Ny�M��#�\�5{�J��ڟG��sOcІh3و� �Ri۶-�X��_��UF'���đH}�,˔(�6̺Z+���<WH���g���	�T�O�Oęp���P���&LM���=y5��}��խ_�dM�<�ʻOK��4AO�ՓfvF��	r(�-�E��b��V͒
�/�h����֙�&�0�'�+��i&F���o�UY[����I��n$E�Zy�@������l���sDS�h�Ճp��}pj�)�0�/u����#�u(67�b�c�f��	*�j�nH�F��0��0Ƭ������}��v��G?>4=�Ql��k��8*�6�    g�������[�n�N٪M{�wY�n�}�u���$�R��l���Go�4}��U�.;/�")�%?�]�Œ�X�Y�ƓO�1a�b^�|T��lq�6��Xt�$����0>ͥ�QL#f4I^�����0�H�pO8�*�A�xř��Th��6e@�aR t�K��l���92+HayjR�{�0���䖉��֒�wV�@�3ـ~-�8ǹ��7���v�։Z��` ���Zsr�.�e]�h;�;�.KS�w�߳܏�6�}ۻZ��]_�(��k��)`U8�9]�|��>T��>S�]�����m���~���d]��,y���r�>T���"�:��u�b�F7)[b��wG���*s^��̄���컚�~<��u����4j�Ps���<����I����$��	���>��t�����4Bo�Bcm;�v�+V�#�b�_��rM��wi�6�a��l�|�;��ס���bO���C�w��~j��#�0o���<����Z�"�T3~��*+��������S�;͔��wC�/5��f	n�����?�����&�-Uc���l$��AЅ٪ww�䳲�'wEl���p�Jľ4՚T{*TQ�f�_� V=杅5q�{S��	Z��$_�1'E�s�6z`�x�ɊT֟*,C&�/(0�(�(�B��,�{��
0E�res��ضI2
 ��>1"2nvT�=����j��:N���G@�e�0��IYL�T�%0�l{s�G�Me�1O_��ֻ��\@Hm�.�� K�6�^���s���#�/lph��
�tbPq%YV���ڵh2O�/y؂\���)�M�{�Y7������՝m��eK��v���f��Q(�H��]��A��k�T,/�q���Q�LtTУ��[����T��Ex���e���BD*���r� �����i����E8�hh-.�iB!�q���t�`<�{SǮ�}�p�q׶��@ؕf��EmI����q��F"=����6��<p����0�"�ٯs�N��LA�Z6�g�^Uh�Z{=ūA,� ��d����[-A�:�f6G��_�k�B���<u?3���A�b��岳�2�F�dg}4��u�q�fg���r�"&����9i���xx���)!����X�����a҃��(�N>�T�q�8>|��Y��c;��\���մ�#�bU�B����:`���.�d�����)&��2�@g��d�6M�2C�Ҥ,}0��D�t���C�0.�1]1����ݒR���>�����gS졐�:��qa}�͒M�9�m{�{r�L+ኧ��U�J,�a��$��e��g
�ѝa6Z�g�{j<�8ܣ.}���b8�����}��Y���.(��$�Y���wDh+�2��*nm����7��5�D�C�̊�<M~RH��qc���4��,=�1��V�-7�*����9s�1�X������q�xe���A��a׶�]+�L�i��e�-h�ׂ=A��8�c�����h��մbM�A5�m4���Dn��R&�M��?q�
j�섘�������ʂ�:M�C���O��ԥpy���Uq!��i���%�G��ev!�9{o���{�|?�y����n��{��d�32��:�_�{x;�fz�3�U?x�|����ɪ���"��m�f���QV�wՁ�N4������ 4U�w 삄T�q�D�0�;J�De%�h;�;����{��*�}K&��<��}M�L�dCL]��'ۋ�HE���*�]��x��Xʫh��jnp�;�&�sX����b��8��M���I]p���,�O�zҋک��r�w"�͡�|�A����N=CFmB�U}N�-� 8���p9M�{f]�a���g �5���ٕI�e�e�a�i��*�T�y�����Դ�m����0�7�l�њ�,N�Ln�S�� ��).Er�V���i��6B�Ф��D4S]�ʺ���*�H�]J�����a2��me{����[K�� �D?�f�,�
����6ZyF2���J�XɓM-4�F�jת	3=+J\�V{7���J}	��n�6�XΟ_)p�M�2�������#���4��xVT��:cV-�Ů�h��	P��L�3u$�}Pj�RiM�
�A�D��)��n�c�\�V*^�f
S��'ʸ��h`��|j���	�`�U���<ŗL�\C�JכErJm0d�RiOL�����c]�3��ٱ�ܴ���rv]s?�=����L�C<m))����?���u�u8�(,����"ؿ]L����F�d���ڛƫ�N�t����S/kǓ@�k�mr֣c#B�5#�4�k��FU�/�4O�I{� ��5&0�]P;���ú��c�����k������㎛'�;_�;���t��ǔ��i���=: �����osbgp��l�6��a�%9�m-�οr@K�LA�L��gR!�	}Y�C�(�YmD���#��줓2�NO�G�j��֦�Y㘅tf��p')_�y�����
/b���*�^���"�)�6�D�	���嘦��io��ǭJrR�<��"����o�m�����m݇<��?!��	d��Li����w�~͂�ּS��IZ3�]oږx�Kd����Fl�|��?G�mv�V�����G���\�=��#k?�p
Cc�wm��X���+�@|'��b/3j�^%E�k�
�w"&i��[?���N�}ġt�B9Y�l��
@��#���6�QrZa��;L���f�����b��d�'\�E}�6�ٺ��՟��^B�`��67��xl�y�!	OhU��<8A�ɔWƨMOH�5����_��|2�G(�e��*�W0��Կ2s3��������,�o1Bd۶�m%G�&]q;�M/V�������� ���`�SnI�G����~O�-0#p-�
Z�!�v�9���5������b���<z��1�X0ĕ��&��mk
\�ѫ#��Y!٬��z)^�������%8�#�k�g���G5߬�w�j�����HB�Į����������v�|Գ7z�\[׋�S��u���͗��ߏ7
3k��::��ж�C�>5��tͺ��t� ���#�Y�w|^GF����! �jF�i�\` )۶Mg��!we1/��:S	bZl�eƑ�ީn������m�9��h�'�~ٲ%Qc�r/���]��®�/cjzG�}��g��4^�j�?�uS맇Dk�A7/�Kؘj�
u�Vm�\u��|5yP4H�@P�8Z�,�X�����`Ӑ=\F��P����6��.���XL&2~g�Z6�`�<�]/�H��lv�0�Y��z`�.���3��5�]�?C_1hɈ���b�"��b�q٭۴�G�z�H��8���Xr�;���J��Zح``$����҃�V�����l�"��Iԇ93M�U�묔�<l�$	�p��1�Y�m��V��>ު�!6� ��$3��b��S��j�p\@
��6��1&�����yM�ߣS�C2I3	��ZѴAhM��1����u'�@2�K��~��m:��a{I;��d���C��� Yv�Ȇ䳲�'�VLҠ��X�iC�b�nC����Le�l�����%4�I�'�}��ѩ�P���u-ovӶ��>�2�)b�R����>��Q�;U�`i!(ͮ� ��H'J�4��퓜�����g���C��L/c~�SiŖ�=>vhfuQ�N����@O �BlѻJFCe�����)V"�����+ox����4�������	a��f(O�y��A9�W��l��+�E;�UB^D(OQ�D�}�+���)�l��ge�%�������U9'�����Vd�j��Z�M�$��̄��m�����>�x�X�͔w_�Q��M��o���K�K�в���)T�f�m �$p==G�\�k581�4�o��ށ���4sjY�Ϊ�S�q���jWW��tM��=�{�0�:KzRy)gd�IuZ;4��}g��5�VD	Y���<[��M\�\�W�q
�X<����� ��6�G�<��>�c��{���f��geSO4�.}��FPĴ<!�gَ���Ӌ�=    s&�,��{�f*�a�:\���L:�iC���|Fv�<�BeS�#�n��U��p�g*�"���޷�������O�&H�NG����m��胷���[�@�U�G�ͽ��P�0U�c�^�8��R#�j��ٶ�n����^�@Y���dڧ��{yf{���L�� ��}�|z���J�-]�hD��ub��������\���{H���a�>�M�x��y}n�J��,g�0�I���¶wB���,,3��1P�z�XU�2�o!GQ��@�D�ާOs:�g���c�T�E���fn�Զ�M�\SH�f'W��C��~w��@��6Yօ�Gy�'�~������9H#jU�M���۝�6;o$�/��[b��0��g��ԭIIYr�N�8`�6�P����4M�ܿ�gV1��4��+Yj��@���<SZ	�և	(>�D�:ЧS\U��'�>��$����t�ȵ.�}9AQ>++��wU�`��7��q��ա/r6$І��X���HcUo�vN��x���W�n�ߡ�-߫\���|̴�����e��g��m ��7I��������v5�-�MT��0�������׈�EّQ���,�mū�4v�D�2�}br��"�� 	<uv�$��[����z̦ծC�"g0B3��^�C�(��؂Z��@`�2%yJ�}=�D�@��p����w?+;�9�/q�<J���|�m�5��?dÏC�m{����t����2>��y����;�XLy����KŐp���Z��o���rG&�I��q��ujH.?���_� ߝ@�E�f��p�*q8����>��L��u��I엱���H3OQ
1���Bu璀?��(�ï����*=����!��#^����m��uX��nmKt�@��quz-�Ni�u<�/.+Zx�~s�/�����p��d���� 0�lk�;�{��l����e�cy�S�hT�1~�s_un�-�D�j�f��"Zz��f]��Uٴ���$��~�������Nv2j"5���{�2d����k��{!����'���
�C���d��y�0��N?d���J
M�_�c�e��G��P��n|>�6��N�/���J���_~^]��mV��n`M����`BО�)�����!��U�Ժ�u3�:l	{729�pg�K���,~`�PQQ˓e�A<W�����v����	̎`��I����	+:Gq(��=�u��Z6���o�$�I�~�!!����",�͜��_��X]�'�>(j�s�z� %r}y���6�Ms��윚Mr�xۻb��<����j|�<�	�5$��2������]Ԍ�h���גWg̢�'�ߝ{�7�f$� QS��AƋ+L��l6s�v�9֢"�R�u�Q$���(�@�S�ܼ`Z���·�r�|V6��"��L����b�X�
s��b���� �� A�[O�T	��8qj���f����}޷��Й�h�����ƀ%�D����
�K��{���:����`	�[�|�X��X�J�6{*H/mP�Y!�n-Z�RFE��&�jO{vǦ�o�W��yj��$���*��~��]gj��|�V	Ab�^jn��]��y��פ�˦����qS�ξM�j�v�M65͉P���!|�-��tr���\��p73K�q�����G[Kz���r�|V6^��.������c�������]s�<�5��(:ڲ�M,q6�%�*���'���`�ST�Rp��=��xePp����)�șˇC�n*�S�y{�&�C��
�,��0�~����n�.hZ]�jb��CĈ�`煷<.��Ao��/@����~�1�n�2�hY<���[W8���3-��=�i;���ў�|	��y�K?+˒l�0�/����'�]���.��F�F����Tf�k��m[�o8���f�x5n�l�R���3NP��So=�(�,��ϑsSV�� ���U����Qs��{������k�Nk���@j~�X�Θ����oZ�J"lq�[=��{�4��s�ݏV�H>�����|�l�w(L/D�����/*�z��J&�1I�xu<I\�@���k��TW���Y�����.�p�kR���2�\��T�9�E�3G�����u']M��E���[�}�}��M=�ȕS=!)��dTEr]�M����M���̸���P�s=�l�t�n�}�� �������J�Š$1��}lѴc1a��t���S�4�\�H�m�Id��ta����� 6�Z-;�ד��%!Ymr����h���jqXY��J#�6�T�5K	�D+C�EQ��������<����޵`�/��l����xʫQH��H(��ɬ��F�aswU��a>8��dy�s�*i�T��m�2��E 0�@	�+��{^�$y�K�k]|p��7���y���2s6'�����sL�>ѭ*�i �f�Dg0�Z��C��h��Y-1Ey���j��60q��W���CP�m9�[�+�����9���}�l�:�]ճ�nx� ޖ����n�AF��Q���O�����z~Aּ��`!3���h���6��L��-m�v3�b�ge����1������*��������4�Q�̢n�&0���nul��FO�V��OmXT�/LR��e�I�x9Y��Z��EU��g��m���#\��w��+ �eޒQ@��V%j"��Dm���[q(��]i��.�m��ش�]�`dhi����)�ga��.�?Pĺ�]��>��00�)��v'c.1?*xϣ���:X_J/�)*ȹ�fw\�d�<�����\iWa�l���\��o&2��r"~�/J0��Y︜<5.�@Z��m��|�9��|R��d
],<$�$�`���A��c6 �z.����O�n���l�,C�pUp � ]�wé��+'w8LP��I�%:<5�|������3��H ��^z,��,��H�]cH��R�%W��E¯�֒1ҸUm�(�k^�K�%M����2����H�b��?��o9�|V��N����D��)R��ݣ)	v`Pz<��U��Z4R#�}ے7ض�LÇ�yɎ6��>�C$�LMRâ�jô�Vof��Y2�����^恶붽lK"n�]cǞ�Z�<���ja�R�1��	�N�ƛ��LoJ��\�L�7w��ض�]�����Oe �m��@�����g��N�?�Z�"�j<'ٛ����v�]��cg*Z(8H�,~�zK
��]��O�,'{�����o�>.b��,�IP6��%c�`�&�V|u�%�1cMjz�k[ˡ�żL\B.��5e:��^�|��p�f����Ҙ_U%OF���|ŷ�j����v3�u9�m{/	��Z3,J���1��<���$o��'����B�D���h�����VzVڝ��[	"�R§�S%@�
J�w��k�j�z!�:�\3�+N(�߬~KH#�4K��fT�d�&�a�d�#��(��j�FaI<�ی���빙�V�D�����^��Sc/!�b�;�]m�����3���J�H���*�~��\�ˁ�t)��C��u��Rď��Rw0'�`!�{j��F��Lu�b���L�Bɑ ;Qլ��vն�m�k���4r/�+�W%�	s�K1y	����Y �n���M����0�K�ABC|q�TY��
��!ZJ �J$i-�&��&��i ����A�6�Z=ɸ�>IZ�q�M��:�S�E��S|	V�W�W!�n �p�	<��5���źZ� gp���TbVm;v��5q_f���W�g�Vu���F��_��+lvH�.	��ؙH\��qGj%���S�ݲ1���D=�.=�ȶSt���4x_� ��8C�C������h���>I�Ϡ�i�G9��շi�.�Hz3��ɻ�G^���QȽr���X�ɯ�L"��W�V��R2Ti9Q;��o��^�bK����m�}�Z�θ��O��Z�f�ɑP�'�+)h>��3���@�4;�����8�Pտ&m�*��	�����F���P� 2  ���En�n-��'�����Ǫb.�w��0����$aD&+���͘���qJ�����(� ��9]lն]N~��,�]Q���(1��[��@:�Fb 	�T��#6�UP����E�QJ��-%�lo?�38b���BTn��"(�'6�O�'i> ��<GR.q��'6���;�$:. ������%���=u�"H����G��ͥ��`6c��V�D.�_�0�d%A^�z�2&����mC�<l�X�W$��	�R�/ʜ���Vj:�h^T�����%!�z��%��Yݤ�x޺�%�8���JR)cq����U��|��-��Y�^��������13y�qE���t�j���X'�Uj��˄��7�{#v�)��C���V��'8�6�J��b�"����Js$�Z��A5G�+-8���0�Q mG�l��K���6K�n��laͶӒ����u��x���;��7bI|1�����mZ�&u�����j�=�QqYS�2 �2���:�3�+���š�t�K�v��t'�OZn0J�P��	�a���p	ǘ��j�{fK�����Z�#%����i�J�&�_�$���G�g���Uk�rh]�OGWw��ɐ�#Wtlr�F��<J3)X��1!�ob�R%y�'�9N�<�N2�
�'^R�;�c��Xt�J�rw��]�nJX��0�H8�rb����$M���PCGW{�"/���JC�	9��[7���q�����L�����lcN�%P���޶�c���1� ���%3�hIt��jPb#�g:9�\�EKWu4�F%�kY���Û7o���         2   x�ʹ  ���p����@�"E	�2�)�6���W%}�         =   x�3�tL����,OM�4202�54�52R0��2��21�&�e��W\RT�\�_D��=... ���            x��]Y��F�~�~��@�&��͓���Ogf�慖蘀�����U�X�p;��Wߡ������m�c����rY��1��}��?�?�!Y���U���ڗ�[{�?[k����e��S?���[���<0u����s�����5]�7 ���{�缼<pM��}x������>�����cy^��`�����9,w�����\��q��kx-Dl�=�<l+>4�?/�~�������Tk����m����i�#}ؙo�kx\a�a�����o�e����۷�2���©����d���3|�~�a��o9��2{ ��o�t��y�m��n?̸�ɾL�OA~�����'���6~�;����U���]y��+7�y����1�M���B-���y����6�^�ņ�x�����ޏ�'��sx�H����"�1��Tŧy��[�|�������cx]�$�wd]��f��x�xHÏ��x�{`�ć��?_g�k��)~��w��3l1o4=�0��ZC�"6/S�;���-�/]���������1�]Dυ���x���}��,���3�W���U�P�9h��$M�+ϸ#t�����������{[=�ݐ��3�^�����|����w�������c����������~?}��	����TQ�&c���bY|��6[G{��o�Si�/ۇ����ֻJ�$_z�,fT��=]��/U��bK�CA�1s����M�i���s�����yഉ��p��$\��ͩa�|��_D��Q�^�У0��<������"<�9N�:��O������?�7���Y����8�⽽�(�n��W��D6R��uFįp��H�����HB���\BÆ��İE��"�4�ĺ⋱/�C6�ˇ���͵]}(>~�r>>%<�x��t������!��T��c�2�� ���Cv@z��E��.>�"��t�����O��k���o9.���'&V������5|�sB��f��D[��s���'L�b�T@a����@��'�k�OTx���1��D�UE��T�/���`��x�w��B7�*�����\��gr�T�o]a�XU"�P;��@�]��;���Ɩ�n��9�0.��pШ&Q����>���*��N���0���㩂յ,����+ޖ��1�U`�x>|�`��y!���8��Y��h[zЉ���+��ey�#�.֬�h}�-���m��'G1AF!�,���'`@��=�^�`�Zum���z�]H��Dw.��T|	\�w!Q�h�yxd#O3)��G���s�!�ޓs:����@�-~�D9�~���@��qmע���ߔm_f�`&�+�34��:����6WoO�&���{o(��.F���k ~�G�&Y�8>НZ �Q���x�n��Z�K{?��NOlXr��=�ت@�Mz�%4���Uda�C=��ǂ#�/�����e��T�2JD�<5�G閈�������tu�Z۵gؚ��G1�21R��z�=�X����%��S�l�Ȁ�>��A�5t�/sd$��}�e����x�꽨2��{�6�df���X���O��x]��3|�'���0��C��6zu$yil/�F�V���4d�{��3��G�6�^$X���MTp�|�����Iy���*l���/��T�5��k�#p��~���d|qv2�����|�N�U�������D�&t-|�gt�w4����o�te=	�y�I3�g��t�b�<����,\۝d���A���	����&c,O��f�H���D|�*� �E��xe�:q����P�;�M4Px��P��D��j7�P��NM�@�ž�7(1���#�F"�G&�R����>�c��U��q7��d:d�#��(P�����쐱U]�E��G�v����N`��'��[=4� $\|�]��p5F�=����8,c�"�.��C�Oގx9�]%=$��e�da�iȊC,��8�z˕��Εƞ�/�`opV�[b�	���G+r*X���Z'qs��l==��t|�8f9�`lRPc��n����76�)|��d�.�P6�#��x_3w�z�2�v�c��a/ �e:c
�fS���߭_�����Y��!sk���l��)�x��I�C��"ds�y�A>	�I���� �#�t217Q3��k��@��6�'0�n��<,�5�����f�U�1���3��$֯{8#�����WsJ���Ptm�J�3�QmXK���JN?�m��o��ոCp�o>d+�$��!q�(�n<�9����	� C��������T��<���[M�����6�I��
�p��?�63Y���< �=��߀�L�`�_�.Р��� !��I+5�c��� ���ؙ�jk�+�,��8�dL|'b���MΊ�Ai��m4�|5i؉���jc�:��]MVEN2 B�/�[ď@�X�*��P~EYP��K"����I�&'a�đ�O��,�!��5)�i�ӥ�@~�E-p>I)۝-�9�*s��ܷŵ]Yȑ�d���Ҁ��B�F�,��VY|����<���EC�Lx7��H��f)ņ=�M������m�:HS|�B�"Ok�A��mE}�ͷ�(�c�M!�	�Cx�Y�C�X|Q���$2A�'�}�0��2{wmR�:���<�׼��>��!��(R�~���<������5,p?��Eqc��FQN���/���RD�W�k{�� ��mޚ�mphT�}�
�ELX�3K�
�[�®9O�'�M1L�XM�=�e�jF:�̸j���:	������G[=��$?���o����5�q1�����=R��$'}�$NŧEb2�#LòbT9a�,b�ϴ�J��u`���1���
�>dn���z\]ە����ǫTl�@4YK�Y��N�e0}�[9�%���(Ǫ$D� ]T������u�����%5�I��PM��M5�K��̍:��U�PM�y����2OL9f���7qCۇ�[�2'>9���[�zV��4<�'N��N>A��2�oy`� �\�
R�̥�]��SH��p��S��,��+�M}*_�d<y$1��MJ`q��RMǺ���#���l�t���H����- �I&��E�
������`�S��4�M%�P�b)��̶
���$C����m%�_�*wz���p6�A�]OoM���Ǥ�Z�-x����5�&Q��]tO�g�@Nwa�|�����g�cD�#Ρ�ML?�ȃ�LǏ�w��WՖ���=�\ه�3�X?�ڮl�A'o���dJ<�Z&g��U��ACbU�+���KBY��.Ժ�����-��ap?�h5 JS�Ly���Q�P��v[c�Uhe�m��;�Ю�j���XBN�#�X�$/�X:1�19qO1NE��@V@����h��H����Z	���X�6S�1Wbp(��G\d�7c�TR�3I��!9��Q���l���	V��KiJ.������A�3�U��C)*k����ݚi�w<�(�t`t9��Vm�[��\��.�-E���g1m����d&8�Б},-xR�k�Ce�XK2Y�~<���/s"�]�g�&B�eAf����u�v�?��E�d��P ���v��p�Oq8�xߝ��Xv���X���,M�!����=v�URPՋ\� �*o��s��67�;�c��$��)��d�M�Qg�k��1�n�Z}r�\��FYC���!�`��\���7Vf��[�����q�<qs�2�A� Tk�����m���D;V�̡C�Q�.�.X��,`�s�A`��R�	�ý�_�2ȯ�����A9�y0�Fq,�zr>��0���=i����HQ��	W����tMI_��`�_-S�!�ls�.j���A�d�.�@*��v�<�H��L�at�8� ��.����^�U*�jSzN�s�5D<E��p�uh�>M2�)a{�����й�dVG��)v�)v�0 �  ]c�#���ub��v�:���
����$i0�{�*�B�V�⧡�K�I��#�t\���!�O�W�9Š���L�w'�h�=ź�\/��ii=�f5q��x�d�Ҟ��<%�v!.i�h]d�dw�L%�`�I�xlft����b����΁���P,,ݴ�&��5g��\��PK�m<-�f��.܎�6EL����l�(4�;hT�_M������[�.�O긏�p�6:��$@_sOY�Ztl^�����&�����Išf�Q���J�r�jVZ�=�k���;�$��=\`-�u���8π��k�>��i0�ŧ`���9=��81A���:u9�'V)$�`2�.���S���>) �B�亀��m]0��d�Z@��S����*��ee�����f��-Y;�6���y�+$;��E��C���G��B�Ǌ&���R{�kN�P���F��C�"1:�@&�ʷ,Nk@�FfqY��R+�0o���aM:�%)� ��=�T+�ng��*:��(�e����8��X�H���e�A��F��ipWWÏ���9���"�H��Z.]��F|Ugޤԟ�g���CE�������Uɭ]1A9�+#��Aho��{��C��q�+IAD����b:I]��;)
s0m�l�r�.���x�4!#C�\'D�S{
cH������F��p��Bm�+��N�I'cך�	!:��D�q�t�o=���<;a��'.���5��!m"��s��ۈ�z��d0����Z;[��EimW�4��]X�JG�H�م�F˜�9��t�V�{%�l��y�ĴӞ
�л(թ��C����VKؗ�Q��q����5��H��q����Ȇ<CY*m���|�L,�%����[�1ib������k(�����t�8�\J,�l�n���C蘉�&�Dk ��<S����{��8lj�\����ָwj#�:q�{Į ���(4ܒ���|��^Utؠe�\tJ�Ӄ�nH)[��04�C�#��ylM>�ր��b��$aC	(�D�+��.�����43��G�B�e�4̺h4aʀMHs�+�{'"��c���0pQrѶ<vT���w̼�&����:���1s�S�����<�'!I@���A��U�=s�<OV�LC�[L���5]�@[�PG�i�=~�}�<Jk��=�S��TP��?�#3��I�LFS�vD�א4waW������0`E\t'^������'W���c�E�<Jk L
ٲ�p9���f�.�V*@'�o� �E(����G
w��eA�C�bh���
�E�D9h��)���ؤ�i�Hd�[�w�����^�H�2�χ2#7�S��j�1h�$�Q��$�s����B�U������S�� K���p!�=>�lF����1W�}N�虗�����*����7�a|%	b��ZK�$ǂ��\a�n�0����@�;�����sx�I�����F��C�����;k7�oK���D���4-�eLnօ|b{��@�M=����v��KD�@Ǝ��9f
]��dԽ�(�K��z� +�d� P���6s@k��t�
\�+�d�D�h�A
wd�(��/ .,ȎF���쫣l���O'�*ւam"W<c1�x�ɋ�ص6��Vaj���(^7N8룠5�n"S�AB�{���d����8T���?I�E�����D&����<X�BY�aXz�N��^A���SfG�g7�_�$�6z=�q�6I�Ӑ�C�I�h�L��W�����i���?Ҹ9v�.��Rrig�>�7��/O��y܀;2\ECf(D��į&n`��ĩ(�nq�����Cku`DbX��8kB��."4�6��H��=.����4m���z�<�c>%�րԑ�[��
߇9���]������WL�)�{���3�Ӊ=r��g������*�+��Vu\�=�[��J�q}�S�;�n��܂�w(���ϔy�P�8��ߎ�FI,���I�;z2I���;i�
�v )M�	�e�^q�>|)N�r�Qz�N�69m��xC�Pgl$�^c���w�wR�ש�x$�
V����,b������g�	s�Iĺ�,�<DN��D��"v�zM~D27���]}���*��2D�lv�U�y�������S�NK��h����������{�B�6ˤ��D`;v�p��<�H����n)��/M��l�Zz���W<�ei�+yW�(ѿ>q��TH�+��J�Y�;�b�m��#uŨ�C��s�\"�N���e�9��6زj ꈉ�8a �O��D�91O�U�	�kƴT��I�96�s�#���)<�����o���a��]ȝ��S>}��vuy(>&�>�9E��8�BRT�"Q���
�W1��q^��'ͺ�RN�%q�����C+�՟J��ॅ��F�r=��@k@���$(��]���juQh9T��q��N�c,Չ�]m,�\ �(�Wb�W$.6��g�P�7$NּCk�v�/�J���ק$�S%�;�t2&�/��A3R��Q/" h?��=�͋q�E�B����}�}0 |͍	
�!7�3����}�Шt�+�]��|�@�P�ᇆ5n5�FxBѕ�HC�E�ᨌm3hw9]t��I-�&b��}��o��SpP��Ҥ�F�y���v�gv���ZN�6��-��w'jC�-Ճ[�w��E�߻h�R�tx���i�B>��Nk�3�n#�k�'��#�s@��!��B-�X�-O3T��Pv�mȝ��+	`P31a�4��j�$)�@�Oe8���eD%@g2��H��@76��yuT�Nw�ܖj�Cq����LN�zp����f���GB��%�-v��A~�s(y��Ɓe�m�X�0�*)�^#�,�4/'������c�m��vP��9�>�8b���8���	����Y�R��0rk��H3�轮�8�qlyIaG�n*����Am�4|�꽠5U�Z>ɚ�CUk2:V[Nz����k�1���"��p�iC@C;�q���(NS��E ���"��0�5�c;r��1�2[��l��ā''ٓX�ya̠�n�?k{d�r�Q���&qf�~n��r0̫Ա	��w��W��G��Y��vu{�BjNO�ފ��"[�N��l�
�����ǅVQ	���/yH�0Z x��ƅ�.r1c;i<�N"=���`9F��G���Ik@��ݘ�^���"��*���5�$�r.K�|0�������lm��дe"�)�y�I9��X�o�e�Y͎0���ث|�F���-�z)u")�̅5���/Pצ4�j���z���L��=�*k�!u<PN=��j5�g&;14�����Tb�0t�����!F�e�\�JZ����ϖ:�\��Qb��d�M��+��NM�*}�i3%��"s\�<'�Ԗ�#�Cx�W�Q��g��1#���3C(�3wG���d�;��:���Z���F�d��k�p_�[d�x��rR_��I��Օ,�O��i	��hz��#0����]����B?R<���"�dW}��G9I�Fg
����Of/¤5@�y���Z��[{�Omp�]�X��1p;b�y�x�hFIR�;R]X	SP�3�tÒV�n�@@�kR��s0��:qP�5rj��]R�.�	6�L��8=��Cx���xH�_�G�&����yiZ�m��+ n|8k+�5 ��� ��T}9��ʪ���LU.u�a�r#������R��UN�ͦM!��Z��*]m�Y�
e��l#���V۰��
�I[p��谻�?���I4z��\H�~�K�����C���3���g�t��P�1�������fE%���#�����#�-�E��V�e(�8�)��.�*��c[��ySI��y"��Hm۩���	���*	��̊ ��iA����x�#��l����\�C�-�HR�]ѭ�h���[(=�2ˁ��-�����/�j�>����e��^m�8�� Z�Yd}b$���yA���h^�^X�H�}I��J�/�!�Ω��}��}��v����      �   �  x��Q�n�@<�_�1�V�0���='`ĀX� �������g�Z�)Ziէ�RwWum{h<����w��v���k�����iv���d�jMx�� +~�R�]UΥ�H�Ε��24��Ѯ���C٠*�aGcb(�X��ɾ8^�����ǽc�{�=�C��B"X:��.Ļ�I;8��5/��̒g��~� �2�72�Oʞ��Q��Fy�Y������Z��6�e{��h��1��MW ��k�cVm����9��k´�0�a<��n�⫡0�=�f�9�A�����4�`lķ��Z;��{P5�0�I�,,���eb����D�H(���pw>�pݷ��q<�8��7��=�5M�4ސn.	��2w�y���GI�rOiR����t�Y0��] �eљ������ܜ�)�A��he�>f�B'y�8���R�qu ި����
\������΋����t�	�}�i      �   �  x��\�n�Ȳ]g�U�8^�fk�[�p7)2I�8��$%S_��]]���H�|�-D�u2qN�Q�����a]���sL35`9���n4�����X�mw��~��G#/j>��������k���:��[On{2���C���_�fX��������=Xη����7u�+󚟓Ŵ�p�
��9��?�;�����w|"��ެ|��o�zyÝ{��y��c֜���[y��m�����Ʃ3�vh?�\��-t�B�M4(+�eD鱂�F����e�E}qz\c�\
��Д!�A��ّd�x��3'!���'r���{�V�8Ɯ�H��&����	sZR\�+�eY�J��'�9�y��TL?�hZMہ�4�<�	�Qv$�Ʊ�Ʌ]q�����D���4G�᪤F%��'��;��Z��G!��sU�Ԝq�t����$�2��ɰ��EX�5|y������:��c�)=����M�1���
����^:ڳu�Ů���y�*�
����EpG�S��r���tϋ��p(v�HA8|����M���L��^��?�Y��n�9��!N��+��"'�L[�r�^]^���X��M��[�ʜ��E�g�Y����I�01�\mIL�l��$(`bf�rM�<�q]�ObF�Q��B�2����/��_���������L��F��~](���IT0�SW��˵��./�N߯B1�.z�,R�aX��2e��2�ARȸ\��w�͹ټ��\� �a벢�2!EJ��4)T32�?^��U�m1�����Pe����[,����^��u9��D����T+�2�̍Zߨ1���rś�>z��/b��;�bZe�A+�4l\,�GN!LbǓk�|�r���qt;��F�0��cN��D���\7'��S�<��v�D3�aeCsV�5gp"�̛���ኈA���Y�R /�L*�)�(�aFבL�0���{�xmh\�P�R�(�1��)[d�S���I�:b�W+SF2`�˄r�Ғ�_���cs��_�r,�C�κ4e.A%�gPI���-�%�d�]Xº�aq;��z8�x�������(�!-��6�:�my>ׇ8b�}4 J��(CZ&��3.pq-��LV��07�s,V��P''���pQ���6�T5������$�&b���?Y�q������U�-�Bԩ�\�f<��{���4�u0�e��*Ee��
�g�����������j�o�I�@�j���(��I�Հ���\��>�:��i�j��;�S����~����5��l�,�� �,��p����T�$?��W7��Y)���z�ݺ���	�,l9{�4N�q-�q�0����e��@�@2�lR����tLAՕ4�k�IZW^�;n�*����(�@\��h#�ܡ_ ��sY5�"��A�цE��v@!�B}�u�~b��G-�xk�"�a�f���d�,��m+z�\T/��p_��n��!VF�?+T@������ST�^Wu��ږ���yN!��-�� �-+�p�y���kvݰ��k8��6�Z�����	���W�z�����i��`�_�ﲢS&@I�r���'!��������qr�<�A�2DmǢ$Ž�d�rL�!0��mo�Ą����W@��Y�ֻ��.B�Kn6��y���(Š{m�����[(�m<4m���7ݧ�m�2���n��hP�����Xr�t�9��x�� ��4$te@��RRqPqjV�X�:Jc�n��w�C�Q}� ���U�/s�����~ �~o��Y�z;B���RyJ�p�C�\e���jg@�Z�U�=�5x9�^E���!� .A_5:�0ɣ����O�b�ƶ��FRJ2eF�%Rܫ^*�iR$,�<25s�U<*���Z��}��-�@@�
m�w"C���(.��R��r�g^���V��/v
�2R�=ĝ�7 5���$����&�r�G1�.�$��K���4�3٥Ƴsj҂�\A��e�r�@IN@j���W4�<��ś>�g����}4E�v�	{ǈ Y�h��JEzO���l6B����-��1:����Y�%פߜs�XN{0�W}t�	�7$4Sƈ@����(���+��墻y������(���c��la���8g\r�n�X����ź�����h�i� ��+�R�]�0��2>w7�E���Xw
|��JoGV8�S��x^���&�F3�=�K��M��g�a\�O��!wд��J7sct�@ +N8�`.y0(}z�83�/�)𽟞 �
K��q��o��D� ]t o&�^B�>c��Q����]�m�n����/�)>��U��g�0�|k��X�6��޸'ClJ��P����J����6&`�vSra4���tbb�������a�<�TEu/{1c�U�2��ȥ|b�e���%d$#���.�$V�>�ņ�\
V*���~�-�e��_a��|g���Xpq�������݀�5-\�9��Uޛ�a�q�.5|y�����z�h�K�}9���:Ͳ���^�]��: ��r�O�j�(�꽗��e�=ī։���K"6��h��v]��"b<D�#�]8��1���P��h0�ҧ�VT(������˽����@��������2��mt7$ԥ�X�^WO1�	iۮ�}�����/m�l�rÌ�Vk;g�A�i��/��@M�+��z��.$��ut�m�k�"����C2!e�ex�] IQ�i䚞<��<ib�B�g}��	a!��v�4MI[�N0o7���� �X�=��X�ڳ�R��([�y�2Z��fȍ6��ڕMX��
v����.6��2��q�{�lXrM�t���3Lİ����-���w�qJ�_���[�k�>�L�<�x��,/Q�i�uɒ����~�ZF�0m��u��La���;�w��<�m�ީ�ݳӚ5�&g@c^��@b��ʆ�:�����^�-#�:��#���z&%�8	CJ,���l��L�$K���h�"������#�I�#��dy=��ɉ6#�n~��;��X�G��Nhƫ�4�+Y��uB��/�M� ����c;�Ѩe���K�����J-O������F��e	^�eׂ�SBy�H��/�N�����wP�)�?
��A���m�]O�4��@����P���:c`Ĕ<k7ӌ������`{��>"���϶.�%�'<jK���c6��8�`"ָ����vѮ�j�49nd�cp�c�"]�P/#L�d)� M�����*��\��淼���X�Q�tt&����y;:V`t�5�Uf����ΰ>��w�����|>�n�K5�ʧ�l���'�_����>�΃�����rP;��?�����ln,�_�������M�o>9��S�>�É��/�����u�<]V˵:y����9����/0&:�e���7�*�܄�����Q��7��S�Y����㵓��je/��n���K>9;� ��z������g��� =��0�>U���:]��Ƨ�S���`�?mg!V���ow�/�mR˧��yv�є��d�:�������t�9�ˬn��eS�W��_��o,�����e����X�������;��:�����Y��=���ErkgS��Ew�$/������r��ߍ�7���7�}���k����!Z���y��-si�σm������fg��ƞa�&;�ϜD�����h̛o�փ	�0�������x�w� ��P�8Po�&V�_-��{�[~~w�f���\��in�|�o�����g_�<����_��|�Y�O�؈v3�%�(�1e���m�z/�.��2���ק��������L����}���������0��N�=;ϯ�ǹ1ڝ�If,���<��ܬ�p����c;��sH�s�����C��l�Ww�}��_�o���o�)�y     