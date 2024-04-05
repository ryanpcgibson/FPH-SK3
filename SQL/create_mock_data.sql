TRUNCATE TABLE "hearts" RESTART IDENTITY CASCADE;
TRUNCATE TABLE "comments" RESTART IDENTITY CASCADE;
TRUNCATE TABLE "memories" RESTART IDENTITY CASCADE;
TRUNCATE TABLE "viewable_connections" RESTART IDENTITY CASCADE;
TRUNCATE TABLE "connections" RESTART IDENTITY CASCADE;
TRUNCATE TABLE "viewable_locations" RESTART IDENTITY CASCADE;
TRUNCATE TABLE "locations" RESTART IDENTITY CASCADE;
TRUNCATE TABLE "viewable_beings" RESTART IDENTITY CASCADE;
TRUNCATE TABLE "beings" RESTART IDENTITY CASCADE;
TRUNCATE TABLE "users" RESTART IDENTITY CASCADE;


-- Users
INSERT INTO "users" ("user_id", "username", "role", "created_at")
VALUES
('user1', 'Alice', 'Creator', '2024-04-01'),
('user2', 'Bob', 'Viewer', '2024-04-02'),
('user3', 'Charlie', 'Creator', '2024-04-03'),
('user4', 'Diana', 'Viewer', '2024-04-04'),
('user5', 'Evan', 'Creator', '2024-04-05');

-- Beings (Humans and Pets)
INSERT INTO "beings" ("being_id", "being_type", "name", "start_date", "end_date", "human_user_id", "pet_animal_type")
VALUES
(1, 'human', 'John Doe', '2022-01-01', NULL, 'user1', NULL),
(2, 'human', 'Jane Smith', '2022-02-01', NULL, 'user2', NULL),
(3, 'human', 'Mike Johnson', '2022-03-01', NULL, 'user3', NULL),
(4, 'pet', 'Rover', '2022-04-01', NULL, NULL, 'Dog'),
(5, 'pet', 'Whiskers', '2022-05-01', NULL, NULL, 'Cat');

-- Locations
INSERT INTO "locations" ("location_id", "name", "address", "location_type")
VALUES
(1, 'Home', '123 Main St', 'Home'),
(2, 'Park', '456 Park Ave', 'Neighborhood'),
(3, 'School', '789 School Rd', 'Class'),
(4, 'Vet Clinic', '321 Vet St', 'Town'),
(5, 'Pet Store', '654 Pet Blvd', 'Town');

-- Viewable Beings
INSERT INTO "viewable_beings" ("being_id", "user_id")
VALUES
(1, 'user1'),
(2, 'user2'),
(3, 'user3'),
(4, 'user4'),
(5, 'user5');

-- Viewable Locations
INSERT INTO "viewable_locations" ("location_id", "user_id")
VALUES
(1, 'user1'),
(2, 'user2'),
(3, 'user3'),
(4, 'user4'),
(5, 'user5');

-- Connections
INSERT INTO "connections" ("connection_id", "being_id", "connected_being_id", "connected_location_id", "connection_type", "start_date", "end_date")
VALUES
(1, 1, 4, NULL, 'Friend', '2022-06-01', NULL),
(2, 2, 5, NULL, 'Neighbor', '2022-07-01', NULL),
(3, 3, NULL, 3, 'Classmate', '2022-08-01', NULL),
(4, 4, NULL, 4, 'Housemate', '2022-09-01', NULL),
(5, 5, NULL, 5, 'Housemate', '2022-10-01', NULL);

-- Viewable Connections
INSERT INTO "viewable_connections" ("connection_id", "user_id")
VALUES
(1, 'user1'),
(2, 'user2'),
(3, 'user3'),
(4, 'user4'),
(5, 'user5');

-- Memories
INSERT INTO "memories" ("memory_id", "being_id", "img_url", "label", "memory_text", "location_id")
VALUES
(1, 1, 'https://example.com/john_doe.jpg', 'John at Home', 'John relaxing at home', 1),
(2, 2, 'https://example.com/jane_smith.jpg', 'Jane at Park', 'Jane enjoying the park', 2),
(3, 3, 'https://example.com/mike_johnson.jpg', 'Mike at School', 'Mike attending class', 3),
(4, 4, 'https://example.com/rover.jpg', 'Rover at Vet', 'Rover visiting the vet', 4),
(5, 5, 'https://example.com/whiskers.jpg', 'Whiskers at Store', 'Whiskers exploring the pet store', 5);

-- Comments
INSERT INTO "comments" ("comment_id", "author_id", "memory_id", "comment", "hidden")
VALUES
(1, 'user1', 1, 'Looks cozy!', FALSE),
(2, 'user2', 2, 'Beautiful day!', FALSE),
(3, 'user3', 3, 'Study hard!', FALSE),
(4, 'user4', 4, 'Hope Rover is okay!', FALSE),
(5, 'user5', 5, 'Whiskers seems curious!', FALSE);

-- Hearts
INSERT INTO "hearts" ("heart_id", "author_id", "being_id", "memory_id")
VALUES
(1, 'user1', 1, NULL),
(2, 'user2', NULL, 2),
(3, 'user3', 3, NULL),
(4, 'user4', NULL, 4),
(5, 'user5', 5, NULL);
