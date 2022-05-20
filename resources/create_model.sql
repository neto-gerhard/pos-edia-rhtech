BEGIN;
--
-- Create model Departaments
--
CREATE TABLE "rh_departaments" ("id" bigserial NOT NULL PRIMARY KEY, "name" varchar(255) NOT NULL);
--
-- Create model Employee
--
CREATE TABLE "rh_employee" ("id" bigserial NOT NULL PRIMARY KEY, "name" varchar(255) NOT NULL, "date_joined" date NOT NULL, "departament_id_id" bigint NOT NULL);
--
-- Create model Roles
--
CREATE TABLE "rh_roles" ("id" bigserial NOT NULL PRIMARY KEY, "name" varchar(255) NOT NULL);
--
-- Create model Payments
--
CREATE TABLE "rh_payments" ("id" bigserial NOT NULL PRIMARY KEY, "year_month" integer NOT NULL, "salary" numeric(10, 2) NOT NULL, "bonus" numeric(10, 2) NOT NULL, "employee_id_id" bigint NOT NULL);
--
-- Create model Invoicing
--
CREATE TABLE "rh_invoicing" ("id" bigserial NOT NULL PRIMARY KEY, "year_month" integer NOT NULL, "value" numeric(10, 2) NOT NULL, "description" varchar(255) NOT NULL, "departament_id_id" bigint NOT NULL);
--
-- Add field role_id to employee
--
ALTER TABLE "rh_employee" ADD COLUMN "role_id_id" bigint NOT NULL CONSTRAINT "rh_employee_role_id_id_265f3452_fk_rh_roles_id" REFERENCES "rh_roles"("id") DEFERRABLE INITIALLY DEFERRED; SET CONSTRAINTS "rh_employee_role_id_id_265f3452_fk_rh_roles_id" IMMEDIATE;
--
-- Create model Costs
--
CREATE TABLE "rh_costs" ("id" bigserial NOT NULL PRIMARY KEY, "year_month" integer NOT NULL, "value" numeric(10, 2) NOT NULL, "description" varchar(255) NOT NULL, "departament_id_id" bigint NOT NULL);
ALTER TABLE "rh_employee" ADD CONSTRAINT "rh_employee_departament_id_id_514342ee_fk_rh_departaments_id" FOREIGN KEY ("departament_id_id") REFERENCES "rh_departaments" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "rh_employee_departament_id_id_514342ee" ON "rh_employee" ("departament_id_id");
ALTER TABLE "rh_payments" ADD CONSTRAINT "rh_payments_employee_id_id_b74a5703_fk_rh_employee_id" FOREIGN KEY ("employee_id_id") REFERENCES "rh_employee" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "rh_payments_employee_id_id_b74a5703" ON "rh_payments" ("employee_id_id");
ALTER TABLE "rh_invoicing" ADD CONSTRAINT "rh_invoicing_departament_id_id_d5e9af0b_fk_rh_employee_id" FOREIGN KEY ("departament_id_id") REFERENCES "rh_employee" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "rh_invoicing_departament_id_id_d5e9af0b" ON "rh_invoicing" ("departament_id_id");
CREATE INDEX "rh_employee_role_id_id_265f3452" ON "rh_employee" ("role_id_id");
ALTER TABLE "rh_costs" ADD CONSTRAINT "rh_costs_departament_id_id_ff899048_fk_rh_employee_id" FOREIGN KEY ("departament_id_id") REFERENCES "rh_employee" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "rh_costs_departament_id_id_ff899048" ON "rh_costs" ("departament_id_id");
COMMIT;