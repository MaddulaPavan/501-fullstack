CREATE TABLE categories (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name text UNIQUE NOT NULL,
    type text NOT NULL CHECK (type IN ('INCOME', 'EXPENSE')),
    created_at timestamptz DEFAULT now()
);

CREATE TABLE transactions (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES auth.users NOT NULL,
    category_id uuid REFERENCES categories NOT NULL,
    amount decimal NOT NULL,
    description text,
    date date NOT NULL DEFAULT CURRENT_DATE,
    created_at timestamptz DEFAULT now()
);

ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Categories are viewable by authenticated users"
    ON categories FOR SELECT
    TO authenticated
    USING (true);

CREATE POLICY "Users can manage their own transactions"
    ON transactions FOR ALL
    TO authenticated
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

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
