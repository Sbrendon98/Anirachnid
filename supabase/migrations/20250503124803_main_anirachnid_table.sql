create table if not exists public.users (
    id serial primary key,
    username varchar not null,
    firstname varchar not null,
    lastname varchar not null,
    password varchar not null,
    created_at timestamp default now()
);

create table if not exists public.manga (
    id serial primary key,
    name varchar,
    author varchar,
    chapters integer,
    ongoing bool,
    has_anime bool
);

create table if not exists public.anime (
    id serial primary key,
    name varchar,
    author varchar,
    episodes integer,
    ongoing bool,
    has_manga bool
);

create table if not exists public.downloads (
    downloads_user_id integer not null references public.users(id),
    downloads_anime_id integer not null references public.anime(id),
    downloads_manga_id integer not null references public.manga(id),
    created_at timestamp default now()
);

create table if not exists public.anime_progress (
    anime_progress_user_id integer not null references public.users(id),
    anime_progress_anime_id integer not null references public.anime(id),
    updated_at timestamp,
    current_episode integer
);

create table if not exists public.manga_progress (
    manga_progress_user_id integer not null references public.users(id),
    manga_progress_manga_id integer not null references public.manga(id),
    current_chapter integer,
    updated_at timestamp
);

create table if not exists public.anime_subscriptions (
    anime_subscriptions_user_id integer not null references public.users(id),
    anime_subscripptions_anime_id integer not null references public.anime(id),
    subscribed bool
);

create table if not exists public.manga_subscriptions (
    manga_subscriptions_user_id integer not null references public.users(id),
    manga_subscriptions_manga_id integer not null references public.manga(id),
    subscribed bool
);

create table if not exists public.manga_chapters (
    chapter_id serial primary key,
    manga_chapters_manga_id integer not null references public.manga(id),
    pages integer
);

create table if not exists public.anime_episodes (
    episode_id serial primary key,
    anime_episodes_anime_id integer not null references public.anime(id),
    episode_data varchar,
    episode_timestamp timestamp
);