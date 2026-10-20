/*
 * Fremdschluessel setzen
 */
 ALTER TABLE angestellter 
 ADD CONSTRAINT fk_ang_ang 
    FOREIGN KEY (chef) REFERENCES angestellter (persnr)
 ;
 
 ALTER TABLE angestellter 
 ADD CONSTRAINT fk_ang_abt 
    FOREIGN KEY (abtnr) REFERENCES abteilung (abtnr)
 ;
 
 ALTER TABLE abteilungsleitung 
 ADD CONSTRAINT fk_abtl_abt 
    FOREIGN KEY (abtnr) REFERENCES abteilung (abtnr)
    ON DELETE CASCADE
 ;
 
 ALTER TABLE abteilungsleitung 
 ADD CONSTRAINT fk_abtl_ang 
    FOREIGN KEY (abtchef) REFERENCES angestellter(persnr)
    ON DELETE CASCADE
 ;
 
 ALTER TABLE projekt 
 ADD CONSTRAINT fk_proj_ang 
    FOREIGN KEY (projleiter) REFERENCES angestellter(persnr)
 ;
 
 ALTER TABLE projektzuteilung 
 ADD CONSTRAINT fk_projz_ang 
    FOREIGN KEY (persnr) REFERENCES angestellter(persnr)
    ON DELETE CASCADE
 ;
 
 ALTER TABLE projektzuteilung 
 ADD CONSTRAINT fk_projz_proj 
    FOREIGN KEY (projnr) REFERENCES projekt(projnr)
    ON DELETE CASCADE
;
