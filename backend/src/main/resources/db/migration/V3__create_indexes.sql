CREATE INDEX idx_meals_daily_diet_id
ON meals(daily_diet_id);

CREATE INDEX idx_meal_foods_meal_id
ON meal_foods(meal_id);

CREATE INDEX idx_meal_foods_food_id
ON meal_foods(food_id);

CREATE INDEX idx_meal_plans_user_id
ON meal_plans(user_id);

CREATE INDEX idx_meal_plan_meals_meal_plan_id
ON meal_plan_meals(meal_plan_id);

CREATE INDEX idx_meal_plan_foods_meal_plan_meal_id
ON meal_plan_foods(meal_plan_meal_id);

CREATE INDEX idx_meal_plan_foods_food_id
ON meal_plan_foods(food_id);

CREATE INDEX idx_water_records_daily_diet_id
ON water_records(daily_diet_id);