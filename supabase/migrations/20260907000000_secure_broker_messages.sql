-- Keep every deal thread private and prevent clients from impersonating the broker.
DROP POLICY IF EXISTS "participants send messages" ON public.deal_messages;

CREATE POLICY "clients send private messages" ON public.deal_messages
FOR INSERT TO authenticated
WITH CHECK (
  sender_id = auth.uid()
  AND from_broker = false
  AND EXISTS (
    SELECT 1
    FROM public.deals d
    WHERE d.id = deal_id
      AND d.client_id = auth.uid()
  )
);

CREATE POLICY "brokers send private messages" ON public.deal_messages
FOR INSERT TO authenticated
WITH CHECK (
  sender_id = auth.uid()
  AND from_broker = true
  AND public.has_role(auth.uid(), 'broker')
  AND EXISTS (
    SELECT 1
    FROM public.deals d
    WHERE d.id = deal_id
  )
);
