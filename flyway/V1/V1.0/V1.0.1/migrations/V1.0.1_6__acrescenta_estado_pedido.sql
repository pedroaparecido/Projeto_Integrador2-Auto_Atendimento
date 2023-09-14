CREATE TYPE public.order_status_enum AS ENUM ('Pendente', 'Preparando', 'Pronto','Cancelado','Retirado');

ALTER TABLE public.order ADD status public.order_status_enum NOT NULL DEFAULT 'Pendente';