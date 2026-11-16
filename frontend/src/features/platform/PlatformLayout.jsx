import { useState } from "react";
import PlatformAdmin from "./ManageTenants"; // Assuming PlatformAdmin was renamed
import ManageIndividuals from "./ManageIndividuals";
import AcademicStructure from "./AcademicStructure";
import QuestionBank from "./QuestionBank";

export default function PlatformLayout({ data, onLogout }) {
  const [activeNav, setActiveNav] = useState("dashboard");

  return (
    <div className="flex h-screen bg-gray-50">
      {/* SIDEBAR */}
      <aside className="w-64 bg-white border-r border-gray-200 flex flex-col">
        <div className="h-16 flex items-center px-6 border-b border-gray-200 shrink-0">
          <span className="text-2xl font-bold text-indigo-600 tracking-tight">
            PaperPilot
          </span>
        </div>

        <nav className="flex-1 p-4 space-y-2 overflow-y-auto">
          <button
            onClick={() => setActiveNav("dashboard")}
            className={`w-full text-left block px-4 py-2 rounded-lg font-medium transition ${activeNav === "dashboard" ? "bg-indigo-50 text-indigo-700" : "text-gray-600 hover:bg-gray-100"}`}
          >
            Platform Overview
          </button>

          <button
            onClick={() => setActiveNav("manage")}
            className={`w-full text-left block px-4 py-2 rounded-lg font-medium transition ${activeNav === "manage" ? "bg-indigo-50 text-indigo-700" : "text-gray-600 hover:bg-gray-100"}`}
          >
            Manage Tenants & Users
          </button>

          <button
            onClick={() => setActiveNav("individuals")}
            className={`w-full text-left block px-4 py-2 rounded-lg font-medium transition ${activeNav === "individuals" ? "bg-indigo-50 text-indigo-700" : "text-gray-600 hover:bg-gray-100"}`}
          >
            Manage Individual Users
          </button>

          <div className="pt-4 pb-2">
            <p className="px-4 text-xs font-semibold text-gray-400 uppercase tracking-wider">
              Content Management
            </p>
          </div>

          <button
            onClick={() => setActiveNav("academic")}
            className={`w-full text-left block px-4 py-2 rounded-lg font-medium transition ${activeNav === "academic" ? "bg-indigo-50 text-indigo-700" : "text-gray-600 hover:bg-gray-100"}`}
          >
            Academic Structure
          </button>

          <button
            onClick={() => setActiveNav("questions")}
            className={`w-full text-left block px-4 py-2 rounded-lg font-medium transition ${activeNav === "questions" ? "bg-indigo-50 text-indigo-700" : "text-gray-600 hover:bg-gray-100"}`}
          >
            Platform Question Bank
          </button>
        </nav>

        <div className="p-4 border-t border-gray-200 shrink-0">
          <button
            onClick={onLogout}
            className="w-full text-left px-4 py-2 text-red-600 font-medium hover:bg-red-50 rounded-lg transition"
          >
            Log out
          </button>
        </div>
      </aside>

      {/* MAIN CONTENT AREA */}
      <main className="flex-1 flex flex-col overflow-y-auto">
        <header className="h-16 bg-white border-b border-gray-200 flex items-center justify-between px-8 shrink-0">
          <h1 className="text-xl font-semibold text-gray-800">
            {activeNav === "dashboard" && "Platform Overview"}
            {activeNav === "manage" && "Management Portal"}
            {activeNav === "individuals" && "Individual Users"}
            {activeNav === "academic" && "Academic Structure"}
            {activeNav === "questions" && "Platform Question Bank"}
          </h1>
          <div className="flex items-center gap-4">
            <span className="bg-purple-100 text-purple-700 px-3 py-1 rounded-full text-xs font-bold uppercase tracking-wide">
              Platform Admin
            </span>
            <div className="w-10 h-10 rounded-full bg-indigo-100 flex items-center justify-center text-indigo-700 font-bold">
              {data.user.first_name[0]}
              {data.user.last_name[0]}
            </div>
          </div>
        </header>

        {/* CONDITIONAL RENDERING */}
        {activeNav === "dashboard" && (
          <div className="p-8 space-y-8">
            {/* Platform Overview Stats */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                <h3 className="text-gray-500 text-sm font-medium mb-2">
                  Total Head Offices
                </h3>
                <p className="text-3xl font-bold text-gray-900">
                  {data.stats.total_head_offices}
                </p>
                <p className="text-sm text-gray-400 mt-2">
                  Registered organisations
                </p>
              </div>
              <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                <h3 className="text-gray-500 text-sm font-medium mb-2">
                  Total Campuses
                </h3>
                <p className="text-3xl font-bold text-gray-900">
                  {data.stats.total_campuses}
                </p>
                <p className="text-sm text-gray-400 mt-2">
                  Across all organisations
                </p>
              </div>
              <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                <h3 className="text-gray-500 text-sm font-medium mb-2">
                  Total Users
                </h3>
                <p className="text-3xl font-bold text-gray-900">
                  {data.stats.total_users}
                </p>
                <p className="text-sm text-gray-400 mt-2">
                  Teachers, Admins & Students
                </p>
              </div>
            </div>

            <div className="bg-indigo-600 rounded-2xl p-8 text-white shadow-md">
              <h2 className="text-2xl font-bold mb-2">
                Welcome to PaperPilot Admin
              </h2>
              <p className="text-indigo-100 max-w-2xl">
                From here you can manage all the Head Offices, Campuses, and
                Users across the entire SaaS platform. Use the sidebar to
                navigate to the Management Portal, Individual Users, Academic
                Structure, and the Central Question Bank.
              </p>
            </div>
          </div>
        )}

        {activeNav === "manage" && <PlatformAdmin />}
        {activeNav === "individuals" && <ManageIndividuals />}
        {activeNav === "academic" && <AcademicStructure />}
        {activeNav === "questions" && <QuestionBank />}
      </main>
    </div>
  );
}
