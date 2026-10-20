DO
$$BEGIN
   /* Exceptions of type integrity_constraint_violation within this block
    * are intercepted and don't make the script fail.
    */

   -- Add a constraint:
   ALTER TABLE angestellter
   ADD CONSTRAINT check_salaer
      CHECK (salaer BETWEEN 1000 AND 20000);

   -- Test the constraint:
   UPDATE angestellter SET salaer=30000 WHERE persnr = 1100;
   /* The UPDATE above fails, thereby making execution jump
    * into the EXCEPTION block below and causing a ROLLBACK
    * of all changes within the block so far,
    * incl. the addition of the constraint.
    */

   -- This exception is therefore never being raised:
   RAISE EXCEPTION 'The constraint did not work.';
EXCEPTION
   WHEN integrity_constraint_violation THEN
      -- Swallow the exception, but do print out its error message:
      RAISE NOTICE 'The constraint worked and made the UPDATE fail with message: %', SQLERRM;
END;$$;

DO
$$BEGIN
   /* Exceptions of type integrity_constraint_violation within this block
    * are intercepted and don't make the script fail.
    */

   -- Add a constraint:
   ALTER TABLE projektzuteilung
   ADD CONSTRAINT check_zeitanteil
      CHECK (zeitanteil BETWEEN 10 AND 90);

   -- Test the constraint:
   UPDATE projektzuteilung SET zeitanteil=99 WHERE persnr = 1100;
   /* The UPDATE above fails, thereby making execution jump
    * into the EXCEPTION block below and causing a ROLLBACK
    * of all changes within the block so far,
    * incl. the addition of the constraint.
    */

   -- This exception is therefore never being raised:
   RAISE EXCEPTION 'The constraint did not work.';
EXCEPTION
   WHEN integrity_constraint_violation THEN
      -- Swallow the exception, but do print out its error message:
      RAISE NOTICE 'The constraint worked and made the UPDATE fail with message: %', SQLERRM;
END;$$;
