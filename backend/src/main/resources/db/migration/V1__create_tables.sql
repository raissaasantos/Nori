CREATE TABLE users (
    id UUID PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE profiles (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    date_of_birth DATE NOT NULL,
    sex VARCHAR(20) NOT NULL,
    weight_kg NUMERIC(5,2) NOT NULL,
    height_cm NUMERIC(5,2) NOT NULL,
    activity_level VARCHAR(30) NOT NULL,
    goal VARCHAR(30) NOT NULL,
    calorie_adjustment INTEGER NOT NULL,
    protein_goal_grams NUMERIC(6,2) NOT NULL,
    carbohydrate_goal_grams NUMERIC(6,2) NOT NULL,
    fat_goal_grams NUMERIC(6,2) NOT NULL,
    custom_water_goal_ml INTEGER,
    bottle_size_ml INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE foods (
    id UUID PRIMARY KEY,
    user_id UUID,
    name VARCHAR(255) NOT NULL,
    source VARCHAR(20) NOT NULL,
    reference_quantity NUMERIC(8,2) NOT NULL,
    reference_unit VARCHAR(20) NOT NULL,
    calories NUMERIC(8,2),
    protein NUMERIC(8,2),
    carbohydrates NUMERIC(8,2),
    fat NUMERIC(8,2),
    fiber NUMERIC(8,2),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE daily_diets (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    date DATE NOT NULL,
    free_day BOOLEAN NOT NULL,
    tdee_snapshot NUMERIC(8,2) NOT NULL,
    calorie_goal_snapshot NUMERIC(8,2) NOT NULL,
    protein_goal_snapshot NUMERIC(8,2) NOT NULL,
    carbohydrate_goal_snapshot NUMERIC(8,2) NOT NULL,
    fat_goal_snapshot NUMERIC(8,2) NOT NULL,
    water_goal_snapshot INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE meals (
    id UUID PRIMARY KEY,
    daily_diet_id UUID NOT NULL,
    name VARCHAR(100) NOT NULL,
    display_order INTEGER NOT NULL,
    completion_status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE meal_foods (
    id UUID PRIMARY KEY,
    meal_id UUID NOT NULL,
    food_id UUID,
    selected_quantity NUMERIC(8,2) NOT NULL,
    food_name_snapshot VARCHAR(255) NOT NULL,
    food_source_snapshot VARCHAR(20) NOT NULL,
    calories_snapshot NUMERIC(8,2),
    protein_snapshot NUMERIC(8,2),
    carbohydrates_snapshot NUMERIC(8,2),
    fat_snapshot NUMERIC(8,2),
    fiber_snapshot NUMERIC(8,2),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE meal_plans (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE meal_plan_meals (
    id UUID PRIMARY KEY,
    meal_plan_id UUID NOT NULL,
    name VARCHAR(100) NOT NULL,
    display_order INTEGER NOT NULL
);

CREATE TABLE meal_plan_foods (
    id UUID PRIMARY KEY,
    meal_plan_meal_id UUID NOT NULL,
    food_id UUID NOT NULL,
    selected_quantity NUMERIC(8,2) NOT NULL
);

CREATE TABLE water_records (
    id UUID PRIMARY KEY,
    daily_diet_id UUID NOT NULL,
    amount_ml INTEGER NOT NULL,
    recorded_at TIMESTAMP WITH TIME ZONE NOT NULL
);