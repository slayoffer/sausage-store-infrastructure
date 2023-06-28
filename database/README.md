schemaname |   tablename   | indexname | indexdef |
-----------|---------------|-----------|--------------------------------------------------------------------------------|
public     | order_product | o_p_idx   | CREATE INDEX o_p_idx ON public.order_product USING btree (product_id, order_id)| 
public     | orders        | oid_idx   | CREATE INDEX oid_idx ON public.orders USING btree (id)                         |
