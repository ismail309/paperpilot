import { useState, useEffect } from "react";

export default function ManageIndividuals() {
  const [users, setUsers] = useState([]);
  const [form, setForm] = useState({
    first_name: "",
    last_name: "",
    email: "",
    password: "",
    role_name: "individual_teacher",
  });

  const loadData = async () => {
    const res = await fetch(
      "http://127.0.0.1:8000/api/v1/platform/individual-users",
    );
    setUsers(await res.json());
  };

  useEffect(() => {
    loadData();
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    await fetch("http://127.0.0.1:8000/api/v1/platform/individual-users", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(form),
    });
    setForm({
      first_name: "",
      last_name: "",
      email: "",
      password: "",
      role_name: "individual_teacher",
    });
    loadData();
  };

  const handleToggleUser = async (usr_id, currentStaId) => {
    if (
      !window.confirm(
        "Are you sure you want to deactivate this individual user?",
      )
    )
      return;

    const isCurrentlyActive = Number(currentStaId) === 1;
    const newStatus = !isCurrentlyActive;

    await fetch(
      `http://127.0.0.1:8000/api/v1/platform/users/${usr_id}/status?is_active=${newStatus}`,
      {
        method: "PUT",
      },
    );
    loadData(); // Refresh the list
  };

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold text-gray-800 mb-6">
        Manage Individual Users
      </h1>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
        {/* Form */}
        <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-100 col-span-1">
          <h2 className="text-lg font-bold mb-4">Add Individual Teacher</h2>
          <form onSubmit={handleSubmit} className="space-y-4">
            <input
              type="text"
              placeholder="First Name"
              required
              className="w-full p-2 border rounded"
              value={form.first_name}
              onChange={(e) => setForm({ ...form, first_name: e.target.value })}
            />
            <input
              type="text"
              placeholder="Last Name"
              required
              className="w-full p-2 border rounded"
              value={form.last_name}
              onChange={(e) => setForm({ ...form, last_name: e.target.value })}
            />
            <input
              type="email"
              placeholder="Email"
              required
              pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
              title="Please enter a valid email address with a domain (e.g., user@example.com)"
              className="w-full p-2 border rounded"
              value={form.email}
              onChange={(e) => setForm({ ...form, email: e.target.value })}
            />
            <input
              type="password"
              placeholder="Password"
              required
              className="w-full p-2 border rounded"
              value={form.password}
              onChange={(e) => setForm({ ...form, password: e.target.value })}
            />
            <button
              type="submit"
              className="w-full bg-indigo-600 text-white p-2 rounded hover:bg-indigo-700"
            >
              Create User
            </button>
          </form>
        </div>

        {/* Table */}
        <div className="col-span-2 bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <table className="w-full text-left">
            <thead className="bg-gray-50 border-b">
              <tr>
                <th className="p-4 font-medium text-gray-600">Name</th>
                <th className="p-4 font-medium text-gray-600">Email</th>
                <th className="p-4 font-medium text-gray-600">Joined</th>
                <th className="p-4 font-medium text-gray-600">Actions</th>
              </tr>
            </thead>
            <tbody>
              {users.map((u) => (
                <tr
                  key={u.usr_id}
                  className="border-b last:border-0 hover:bg-gray-50"
                >
                  <td className="p-4 font-medium">
                    {u.first_name} {u.last_name}
                  </td>
                  <td className="p-4">{u.email}</td>
                  <td className="p-4 text-sm text-gray-500">
                    {new Date(u.created_at).toLocaleDateString()}
                  </td>
                  <td className="p-4">
                    <button
                      onClick={() => handleToggleUser(u.usr_id, u.sta_id)}
                      className="text-red-600 hover:underline text-sm font-medium"
                    >
                      Deactivate
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
