ALTER TABLE profiles
ADD CONSTRAINT fk_profiles_user
FOREIGN KEY (user_id)
REFERENCES users(id);

ALTER TABLE foods
ADD CONSTRAINT fk_foods_user
FOREIGN KEY (user_id)
REFERENCES users(id);

ALTER TABLE daily_diets
ADD CONSTRAINT fk_daily_diets_user
FOREIGN KEY (user_id)
REFERENCES users(id);

ALTER TABLE meals
ADD CONSTRAINT fk_meals_daily_diet
FOREIGN KEY (daily_diet_id)
REFERENCES daily_diets(id)
ON DELETE CASCADE;

ALTER TABLE meal_foods
ADD CONSTRAINT fk_meal_foods_meal
FOREIGN KEY (meal_id)
REFERENCES meals(id)
ON DELETE CASCADE;

ALTER TABLE meal_foods
ADD CONSTRAINT fk_meal_foods_food
FOREIGN KEY (food_id)
REFERENCES foods(id)
ON DELETE SET NULL;

ALTER TABLE meal_plans
ADD CONSTRAINT fk_meal_plans_user
FOREIGN KEY (user_id)
REFERENCES users(id);

ALTER TABLE meal_plan_meals
ADD CONSTRAINT fk_meal_plan_meals_plan
FOREIGN KEY (meal_plan_id)
REFERENCES meal_plans(id)
ON DELETE CASCADE;

ALTER TABLE meal_plan_foods
ADD CONSTRAINT fk_meal_plan_foods_meal
FOREIGN KEY (meal_plan_meal_id)
REFERENCES meal_plan_meals(id)
ON DELETE CASCADE;

ALTER TABLE meal_plan_foods
ADD CONSTRAINT fk_meal_plan_foods_food
FOREIGN KEY (food_id)
REFERENCES foods(id);

ALTER TABLE water_records
ADD CONSTRAINT fk_water_records_daily_diet
FOREIGN KEY (daily_diet_id)
REFERENCES daily_diets(id)
ON DELETE CASCADE;

ALTER TABLE users
ADD CONSTRAINT uq_users_email
UNIQUE (email);

ALTER TABLE profiles
ADD CONSTRAINT uq_profiles_user
UNIQUE (user_id);

ALTER TABLE daily_diets
ADD CONSTRAINT uq_daily_diets_user_date
UNIQUE (user_id, date);

ALTER TABLE profiles
ADD CONSTRAINT chk_profiles_weight_positive
CHECK (weight_kg > 0);

ALTER TABLE profiles
ADD CONSTRAINT chk_profiles_height_positive
CHECK (height_cm > 0);

ALTER TABLE profiles
ADD CONSTRAINT chk_profiles_protein_goal_positive
CHECK (protein_goal_grams > 0);

ALTER TABLE profiles
ADD CONSTRAINT chk_profiles_carbohydrate_goal_positive
CHECK (carbohydrate_goal_grams > 0);

ALTER TABLE profiles
ADD CONSTRAINT chk_profiles_fat_goal_positive
CHECK (fat_goal_grams > 0);

ALTER TABLE profiles
ADD CONSTRAINT chk_profiles_custom_water_goal_positive
CHECK (custom_water_goal_ml IS NULL OR custom_water_goal_ml > 0);

ALTER TABLE profiles
ADD CONSTRAINT chk_profiles_bottle_size_positive
CHECK (bottle_size_ml > 0);

ALTER TABLE foods
ADD CONSTRAINT chk_foods_reference_quantity_positive
CHECK (reference_quantity > 0);

ALTER TABLE foods
ADD CONSTRAINT chk_foods_calories_nonnegative
CHECK (calories IS NULL OR calories >= 0);

ALTER TABLE foods
ADD CONSTRAINT chk_foods_protein_nonnegative
CHECK (protein IS NULL OR protein >= 0);

ALTER TABLE foods
ADD CONSTRAINT chk_foods_carbohydrates_nonnegative
CHECK (carbohydrates IS NULL OR carbohydrates >= 0);

ALTER TABLE foods
ADD CONSTRAINT chk_foods_fat_nonnegative
CHECK (fat IS NULL OR fat >= 0);

ALTER TABLE foods
ADD CONSTRAINT chk_foods_fiber_nonnegative
CHECK (fiber IS NULL OR fiber >= 0);

ALTER TABLE foods
ADD CONSTRAINT chk_foods_source
CHECK (source IN ('TACO', 'CUSTOM'));

ALTER TABLE foods
ADD CONSTRAINT chk_foods_source_user
CHECK (
    (source = 'TACO' AND user_id IS NULL)
    OR
    (source = 'CUSTOM' AND user_id IS NOT NULL)
);

ALTER TABLE meal_foods
ADD CONSTRAINT chk_meal_foods_selected_quantity_positive
CHECK (selected_quantity > 0);

ALTER TABLE meal_plan_foods
ADD CONSTRAINT chk_meal_plan_foods_selected_quantity_positive
CHECK (selected_quantity > 0);

ALTER TABLE water_records
ADD CONSTRAINT chk_water_records_amount_positive
CHECK (amount_ml > 0);

ALTER TABLE meals
ADD CONSTRAINT chk_meals_display_order_positive
CHECK (display_order > 0);

ALTER TABLE meal_plan_meals
ADD CONSTRAINT chk_meal_plan_meals_display_order_positive
CHECK (display_order > 0);

ALTER TABLE meals
ADD CONSTRAINT chk_meals_completion_status
CHECK (completion_status IN ('PENDING', 'COMPLETED'));