-- paieškos konfigūracija produktų lentelei

CREATE TEXT SEARCH CONFIGURATION public.inbelly_german
	(COPY = pg_catalog.german);

CREATE TEXT SEARCH DICTIONARY inbelly_german_syn (
	TEMPLATE = synonym,
	SYNONYMS = german
);

CREATE TEXT SEARCH DICTIONARY inbelly_german_ispell (
	TEMPLATE = ispell,
	DictFile = german,
	AffFile = german,
	StopWords = german
);

ALTER TEXT SEARCH CONFIGURATION public.inbelly_german
	ALTER MAPPING FOR asciiword,asciihword,hword_asciipart, word, hword, hword_part
	WITH inbelly_german_syn, german_stem;

SET default_text_search_config = 'inbelly_german';

-- paieškos konfigūracija E lentelei -- ten daug chemijos terminų, tai šveplus juos reik palikt angliškam konfigui, kitką nagrinėjam ir mes

CREATE TEXT SEARCH CONFIGURATION public.german_e
	(COPY = pg_catalog.german);

ALTER TEXT SEARCH CONFIGURATION public.german_e
	ALTER MAPPING FOR word, hword, hword_part
	WITH german_stem;
	
CREATE TEXT SEARCH DICTIONARY public.sveikasvaikas_brands (
	TEMPLATE = thesaurus,
	DictFile = brands,
	Dictionary = simple);
	
ALTER TEXT SEARCH CONFIGURATION inbelly_german
	ALTER MAPPING FOR asciiword,asciihword,hword_asciipart, word, hword, hword_part
	WITH sveikasvaikas_brands, german_stem;
	
ALTER TEXT SEARCH CONFIGURATION public.german_e
	ALTER MAPPING FOR word, hword, hword_part
	WITH sveikasvaikas_brands, german_stem;
