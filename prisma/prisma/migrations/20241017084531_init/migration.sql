-- CreateTable
CREATE TABLE `name` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `person_name` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `id`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
