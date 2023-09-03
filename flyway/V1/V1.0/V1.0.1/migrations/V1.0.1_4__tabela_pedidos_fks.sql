ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
		
ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE RESTRICT ON DELETE RESTRICT;		
