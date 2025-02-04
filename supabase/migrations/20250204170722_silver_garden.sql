/*
  # Initial Schema for Personal Expense Tracker

  1. New Tables
    - `categories`
      - `id` (uuid, primary key)
      - `name` (text, unique)
      - `type` (text) - 'INCOME' or 'EXPENSE'
      - `created_at` (timestamp)
      
    - `transactions`
      - `id` (uuid, primary key)
      - `user_id` (uuid, foreign key to auth.users)
      - `category_id` (uuid, foreign key to categories)
      - `amount` (decimal)
      - `description` (text)
      - `date` (date)
      - `created_at` (timestamp)
      
  2. Security
    - Enable RLS on both tables
    - Add policies for authenticated users to:
      - Read all categories
      - CRUD their own transactions
*/

-- Create categories table
CREATE TABLE categories (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name text UNIQUE NOT NULL,
    type text NOT NULL CHECK (type IN ('INCOME', 'EXPENSE')),
    created_at timestamptz DEFAULT now()
);

-- Create transactions table
CREATE TABLE transactions (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES auth.users NOT NULL,
    category_id uuid REFERENCES categories NOT NULL,
    amount decimal NOT NULL,
    description text,
    date date NOT NULL DEFAULT CURRENT_DATE,
    created_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;

-- Categories policies (viewable by all authenticated users)
CREATE POLICY "Categories are viewable by authenticated users"
    ON categories FOR SELECT
    TO authenticated
    USING (true);

-- Transactions policies
CREATE POLICY "Users can manage their own transactions"
    ON transactions FOR ALL
    TO authenticated
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- Insert default categories
INSERT INTO categories (name, type) VALUES
    ('Salary', 'INCOME'),
    ('Freelance', 'INCOME'),
    ('Investments', 'INCOME'),
    ('Other Income', 'INCOME'),
    ('Rent', 'EXPENSE'),
    ('Utilities', 'EXPENSE'),
    ('Groceries', 'EXPENSE'),
    ('Transportation', 'EXPENSE'),
    ('Entertainment', 'EXPENSE'),
    ('Healthcare', 'EXPENSE'),
    ('Shopping', 'EXPENSE'),
    ('Dining Out', 'EXPENSE'),
    ('Travel', 'EXPENSE'),
    ('Education', 'EXPENSE'),
    ('Other Expenses', 'EXPENSE');