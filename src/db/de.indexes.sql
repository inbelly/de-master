CREATE INDEX search_german ON product USING gin (to_tsvector('german', coalesce(name,'')||' '||coalesce(conservantstext,'')||' '||coalesce(tags,'')||' '||coalesce(company,'')));
CREATE INDEX search_german_productcategory ON productcategory USING gin (to_tsvector('german', coalesce(name,'')));

