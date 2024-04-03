-- Insert users
INSERT INTO users (user_id, username, role, created_at) VALUES
('1', 'john_doe', 'Creator', '2023-04-01 12:00:00'),
('2', 'jane_doe', 'Viewer', '2023-04-02 13:00:00');

-- Insert pets
INSERT INTO pets (pet_id, name, animal_type) VALUES
(1, 'Rover', 'Dog'),
(2, 'Whiskers', 'Cat'),
(3, 'Goldie', 'Fish');

-- Insert viewable_pets
INSERT INTO viewable_pets (pet_id, user_id) VALUES
(1, '1'),
(2, '1'),
(3, '2');

-- Insert humans
INSERT INTO humans (human_id, user_id, name) VALUES
(1, '1', 'John Doe'),
(2, '2', 'Jane Doe');

-- Insert viewable_humans
INSERT INTO viewable_humans (human_id, user_id) VALUES
(1, '1'),
(2, '2');

-- Insert locations
INSERT INTO locations (location_id, name, address, location_type) VALUES
(1, 'Home Sweet Home', '123 Main St', 'Home'),
(2, 'Paws and Claws Pet Store', '456 Market St', 'Neighborhood');

-- Insert viewable_locations
INSERT INTO viewable_locations (location_id, user_id) VALUES
(1, '1'),
(2, '2');

-- Insert connections
INSERT INTO connections (connection_id, start_date, end_date, location_id, connection_type) VALUES
(1, '2023-04-01', '2023-04-10', 1, 'Friend'),
(2, '2023-04-05', NULL, 2, 'Neighbor');

-- Insert viewable_connections
INSERT INTO viewable_connections (connection_id, user_id) VALUES
(1, '1'),
(2, '2');

-- Insert pet_connection
INSERT INTO pet_connection (connection_id, pet_id) VALUESco
(1, 1),
(2, 2);

-- Insert human_connection
INSERT INTO human_connection (connection_id, human_id) VALUES
(1, 1),
(2, 2);

-- Insert comments
INSERT INTO comments (comment_id, author_id, memory_id, comment, hidden) VALUES
(1, '1', 1, 'Rover had a great time at the park today!', FALSE),
(2, '2', 2, 'Whiskers is getting better at climbing trees.', FALSE);

-- Insert pet_memories
INSERT INTO pet_memories (memory_id, pet_id, img_url, label, text, location_id) VALUES
(1, 1, 'https://example.com/rover-park.jpg', 'Rover at the Park', 'Rover playing with a frisbee at the park.', 1),
(2, 2, 'https://example.com/whiskers-tree.jpg', 'Whiskers Climbing', 'Whiskers climbing a tall tree.', 2);

-- Insert pet_hearts
INSERT INTO pet_hearts (heart_id, author_id, pet_id) VALUES
(1, '1', 1),
(2, '2', 2);

-- Insert memory_hearts
INSERT INTO memory_hearts (heart_id, author_id, memory_id) VALUES
(1, '1', 1),
(2, '2', 2);
