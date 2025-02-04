import React from 'react';
import { Outlet } from 'react-router-dom';
import { PieChart } from 'lucide-react';

function Layout() {
  return (
    <div className="min-h-screen bg-gray-50">
      <nav className="bg-white shadow-sm">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between h-16">
            <div className="flex items-center">
              <PieChart className="h-8 w-8 text-indigo-600" />
              <span className="ml-2 text-xl font-semibold">Expense Tracker</span>
            </div>
          </div>
        </div>
      </nav>
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <Outlet />
      </main>
    </div>
  );
}

export default Layout;