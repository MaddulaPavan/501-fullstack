import { Category, Transaction } from '../types';

export const categories: Category[] = [
  { id: '1', name: 'Salary', type: 'INCOME' },
  { id: '2', name: 'Freelance', type: 'INCOME' },
  { id: '3', name: 'Investments', type: 'INCOME' },
  { id: '4', name: 'Other Income', type: 'INCOMe' },
  { id: '5', name: 'Rent', type: 'EXPENSE' },
  { id: '6', name: 'Utilities', type: 'EXPENSE' },
  { id: '7', name: 'Groceries', type: 'EXPENSE' },
  { id: '8', name: 'Transportation', type: 'EXPENSE' },
  { id: '9', name: 'Entertainment', type: 'EXPENSE' },
  { id: '10', name: 'Healthcare', type: 'EXPENSE' },
  { id: '11', name: 'Shopping', type: 'EXPENSE' },
  { id: '12', name: 'Dining Out', type: 'EXPENSE' },
  { id: '13', name: 'Travel', type: 'EXPENSE' },
  { id: '14', name: 'Education', type: 'EXPENSE' },
  { id: '15', name: 'Other Expenses', type: 'EXPENSE' },
];

export const mockTransactions: Transaction[] = [
  {
    id: '1',
    amount: 5000,
    description: 'Monthly Salary',
    date: '2024-02-01',
    category: categories[0]
  },
  {
    id: '2',
    amount: 1000,
    description: 'Rent Payment',
    date: '2024-02-01',
    category: categories[4]
  },
  {
    id: '3',
    amount: 200,
    description: 'Freelance Work',
    date: '2024-02-02',
    category: categories[1]
  },
  {
    id: '4',
    amount: 150,
    description: 'Groceries',
    date: '2024-02-03',
    category: categories[6]
  },
  {
    id: '5',
    amount: 80,
    description: 'Dining Out',
    date: '2024-02-04',
    category: categories[11]
  }
];
