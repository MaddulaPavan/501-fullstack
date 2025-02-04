export type Category = {
  id: string;
  name: string;
  type: 'INCOME' | 'EXPENSE';
};

export type Transaction = {
  id: string;
  amount: number;
  description: string;
  date: string;
  category: Category;
};