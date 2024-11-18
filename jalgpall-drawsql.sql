CREATE TABLE `mängurollid`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `mänguroll` VARCHAR(255) NOT NULL
);
CREATE TABLE `mängud_mängijad`(
    `mängija_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE KEY,
    `mängu_id` BIGINT NOT NULL
);
ALTER TABLE
    `mängud_mängijad` ADD UNIQUE `mängud_mängijad_mängu_id_unique`(`mängu_id`);
CREATE TABLE `mängud_klubid`(
    `mängu_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE KEY,
    `klubi_id` BIGINT NOT NULL
);
CREATE TABLE `mängijad`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nimi` VARCHAR(255) NOT NULL,
    `klubi_id` BIGINT NOT NULL,
    `treeneri_id` BIGINT NOT NULL,
    `rolli_id` BIGINT NOT NULL,
    `formatsioonid` VARCHAR(255) NOT NULL
);
CREATE TABLE `mängud`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `mängu_kuupäev` DATE NOT NULL,
    `klubi_id` BIGINT NOT NULL
);
CREATE TABLE `treenerid`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nimi` BIGINT NOT NULL,
    `klubi_id` BIGINT NOT NULL
);
ALTER TABLE
    `treenerid` ADD UNIQUE `treenerid_klubi_id_unique`(`klubi_id`);
CREATE TABLE `formatsioonid`(
    `formatsioon` VARCHAR(255) NOT NULL,
    `mängu_id` BIGINT NOT NULL,
    PRIMARY KEY(`formatsioon`)
);
CREATE TABLE `klubid`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nimi` BIGINT NOT NULL
);
ALTER TABLE
    `mängijad` ADD CONSTRAINT `mängijad_formatsioonid_foreign` FOREIGN KEY(`formatsioonid`) REFERENCES `formatsioonid`(`formatsioon`);
ALTER TABLE
    `mängijad` ADD CONSTRAINT `mängijad_klubi_id_foreign` FOREIGN KEY(`klubi_id`) REFERENCES `klubid`(`id`);
ALTER TABLE
    `mängud` ADD CONSTRAINT `mängud_klubi_id_foreign` FOREIGN KEY(`klubi_id`) REFERENCES `klubid`(`id`);
ALTER TABLE
    `mängijad` ADD CONSTRAINT `mängijad_treeneri_id_foreign` FOREIGN KEY(`treeneri_id`) REFERENCES `treenerid`(`id`);
ALTER TABLE
    `formatsioonid` ADD CONSTRAINT `formatsioonid_mängu_id_foreign` FOREIGN KEY(`mängu_id`) REFERENCES `mängud`(`id`);
ALTER TABLE
    `mängud_klubid` ADD CONSTRAINT `mängud_klubid_mängu_id_foreign` FOREIGN KEY(`mängu_id`) REFERENCES `mängud`(`id`);
ALTER TABLE
    `treenerid` ADD CONSTRAINT `treenerid_klubi_id_foreign` FOREIGN KEY(`klubi_id`) REFERENCES `klubid`(`id`);
ALTER TABLE
    `mängud_klubid` ADD CONSTRAINT `mängud_klubid_klubi_id_foreign` FOREIGN KEY(`klubi_id`) REFERENCES `klubid`(`id`);
ALTER TABLE
    `mängud_mängijad` ADD CONSTRAINT `mängud_mängijad_mängu_id_foreign` FOREIGN KEY(`mängu_id`) REFERENCES `mängud`(`id`);
ALTER TABLE
    `mängud_mängijad` ADD CONSTRAINT `mängud_mängijad_mängija_id_foreign` FOREIGN KEY(`mängija_id`) REFERENCES `mängijad`(`id`);
ALTER TABLE
    `mängijad` ADD CONSTRAINT `mängijad_rolli_id_foreign` FOREIGN KEY(`rolli_id`) REFERENCES `mängurollid`(`id`);