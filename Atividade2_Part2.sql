use classicmodels;

CREATE ROLE Desenvolvedor;
CREATE ROLE Suporte;
CREATE ROLE Consultor;

GRANT ALL PRIVILEGES ON classicmodels.* TO Desenvolvedor;
GRANT SELECT,INSERT,DELETE,UPDATE ON classicmodels.* TO Suporte;
GRANT SELECT ON classicmodels.* TO Consultor;

CREATE USER Desenvolvedor1 IDENTIFIED BY '123';
CREATE USER Desenvolvedor2 IDENTIFIED BY '123';
CREATE USER Suporte1 IDENTIFIED BY '123';
CREATE USER Suporte2 IDENTIFIED BY '123';
CREATE USER Consultor1 IDENTIFIED BY '123';
CREATE USER Consultor2 IDENTIFIED BY '123';
/*o usuario pode ser criado sem a senha da seguinte forma
CREATE USER Desenvolverdor1;
CREATE USER Desenvolverdor2;
CREATE USER Suporte1;
CREATE USER Suporte2;
CREATE USER Consultor1;
CREATE USER Consultor2;
*/

GRANT Desenvolvedor TO Desenvolvedor1, Desenvolvedor2;
GRANT Suporte TO Suporte1, Suporte2;
GRANT Consultor TO Consultor1, Consultor2;

REVOKE DROP ON classicmodels.* FROM Desenvolvedor;




