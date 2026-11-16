import { useState, useEffect } from "react";

export default function AcademicStructure() {
  const [activeTab, setActiveTab] = useState("classes");

  const [subjects, setSubjects] = useState([]);
  const [classes, setClasses] = useState([]);
  const [chapters, setChapters] = useState([]);

  // Form States
  const [subForm, setSubForm] = useState({ sub_name: "", sub_code: "" });
  const [classForm, setClassForm] = useState({ cla_name: "" });
  const [chapForm, setChapForm] = useState({
    sub_id: "",
    cla_id: "",
    cha_name: "",
    cha_number: "",
  });

  const API_BASE = "http://127.0.0.1:8000/api/v1/academic";

  const loadData = async () => {
    const subRes = await fetch(`${API_BASE}/subjects`);
    setSubjects(await subRes.json());

    const classRes = await fetch(`${API_BASE}/classes`);
    setClasses(await classRes.json());

    const chapRes = await fetch(`${API_BASE}/chapters`);
    setChapters(await chapRes.json());
  };

  useEffect(() => {
    loadData();
  }, []);

  const handleCreateSubject = async (e) => {
    e.preventDefault();
    await fetch(`${API_BASE}/subjects`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(subForm),
    });
    setSubForm({ sub_name: "", sub_code: "" });
    loadData();
  };

  const handleCreateClass = async (e) => {
    e.preventDefault();
    await fetch(`${API_BASE}/classes`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(classForm),
    });
    setClassForm({ cla_name: "" });
    loadData();
  };

  const handleCreateChapter = async (e) => {
    e.preventDefault();
    await fetch(`${API_BASE}/chapters`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(chapForm),
    });
    setChapForm({ sub_id: "", cla_id: "", cha_name: "", cha_number: "" });
    loadData();
  };

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold text-gray-800 mb-6">
        Academic Structure
      </h1>

      {/* TABS */}
      <div className="flex border-b border-gray-200 mb-6">
        {["classes", "subjects", "chapters"].map(
          (
            tab, // <-- Reordered array
          ) => (
            <button
              key={tab}
              className={`py-2 px-6 font-medium capitalize ${activeTab === tab ? "border-b-2 border-indigo-600 text-indigo-600" : "text-gray-500 hover:text-gray-700"}`}
              onClick={() => setActiveTab(tab)}
            >
              {tab}
            </button>
          ),
        )}
      </div>

      {/* SUBJECTS TAB */}
      {activeTab === "subjects" && (
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-100 col-span-1">
            <h2 className="text-lg font-bold mb-4">Add Subject</h2>
            <form onSubmit={handleCreateSubject} className="space-y-4">
              <input
                type="text"
                placeholder="Subject Name (e.g., Mathematics)"
                required
                className="w-full p-2 border rounded"
                value={subForm.sub_name}
                onChange={(e) =>
                  setSubForm({ ...subForm, sub_name: e.target.value })
                }
              />
              <input
                type="text"
                placeholder="Subject Code (e.g., MATH)"
                className="w-full p-2 border rounded"
                value={subForm.sub_code}
                onChange={(e) =>
                  setSubForm({ ...subForm, sub_code: e.target.value })
                }
              />
              <button
                type="submit"
                className="w-full bg-indigo-600 text-white p-2 rounded hover:bg-indigo-700 transition"
              >
                Save Subject
              </button>
            </form>
          </div>
          <div className="col-span-2 bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
            <table className="w-full text-left">
              <thead className="bg-gray-50 border-b">
                <tr>
                  <th className="p-4 font-medium text-gray-600">
                    Subject Name
                  </th>
                  <th className="p-4 font-medium text-gray-600">Code</th>
                </tr>
              </thead>
              <tbody>
                {subjects.map((s) => (
                  <tr
                    key={s.sub_id}
                    className="border-b last:border-0 hover:bg-gray-50"
                  >
                    <td className="p-4 font-medium">{s.sub_name}</td>
                    <td className="p-4">{s.sub_code || "-"}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}

      {/* CLASSES TAB */}
      {activeTab === "classes" && (
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-100 col-span-1">
            <h2 className="text-lg font-bold mb-4">Add Class</h2>
            <form onSubmit={handleCreateClass} className="space-y-4">
              <input
                type="text"
                placeholder="Class Name (e.g., Class 9)"
                required
                className="w-full p-2 border rounded"
                value={classForm.cla_name}
                onChange={(e) =>
                  setClassForm({ ...classForm, cla_name: e.target.value })
                }
              />
              <button
                type="submit"
                className="w-full bg-indigo-600 text-white p-2 rounded hover:bg-indigo-700 transition"
              >
                Save Class
              </button>
            </form>
          </div>
          <div className="col-span-2 bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
            <table className="w-full text-left">
              <thead className="bg-gray-50 border-b">
                <tr>
                  <th className="p-4 font-medium text-gray-600">Class Name</th>
                </tr>
              </thead>
              <tbody>
                {classes.map((c) => (
                  <tr
                    key={c.cla_id}
                    className="border-b last:border-0 hover:bg-gray-50"
                  >
                    <td className="p-4 font-medium">{c.cla_name}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}

      {/* CHAPTERS TAB */}
      {activeTab === "chapters" && (
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-100 col-span-1">
            <h2 className="text-lg font-bold mb-4">Add Chapter</h2>
            <form onSubmit={handleCreateChapter} className="space-y-3">
              <select
                required
                className="w-full p-2 border rounded"
                value={chapForm.sub_id}
                onChange={(e) =>
                  setChapForm({ ...chapForm, sub_id: e.target.value })
                }
              >
                <option value="">Select Subject</option>
                {subjects.map((s) => (
                  <option key={s.sub_id} value={s.sub_id}>
                    {s.sub_name}
                  </option>
                ))}
              </select>
              <select
                required
                className="w-full p-2 border rounded"
                value={chapForm.cla_id}
                onChange={(e) =>
                  setChapForm({ ...chapForm, cla_id: e.target.value })
                }
              >
                <option value="">Select Class</option>
                {classes.map((c) => (
                  <option key={c.cla_id} value={c.cla_id}>
                    {c.cla_name}
                  </option>
                ))}
              </select>
              <input
                type="text"
                placeholder="Chapter Name"
                required
                className="w-full p-2 border rounded"
                value={chapForm.cha_name}
                onChange={(e) =>
                  setChapForm({ ...chapForm, cha_name: e.target.value })
                }
              />
              <input
                type="number"
                placeholder="Chapter Number (Optional)"
                className="w-full p-2 border rounded"
                value={chapForm.cha_number}
                onChange={(e) =>
                  setChapForm({ ...chapForm, cha_number: e.target.value })
                }
              />
              <button
                type="submit"
                className="w-full bg-indigo-600 text-white p-2 rounded hover:bg-indigo-700 transition"
              >
                Save Chapter
              </button>
            </form>
          </div>
          <div className="col-span-2 bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
            <table className="w-full text-left">
              <thead className="bg-gray-50 border-b">
                <tr>
                  <th className="p-4 font-medium text-gray-600">Subject</th>
                  <th className="p-4 font-medium text-gray-600">Class</th>
                  <th className="p-4 font-medium text-gray-600">
                    Chapter Name
                  </th>
                  <th className="p-4 font-medium text-gray-600">#</th>
                </tr>
              </thead>
              <tbody>
                {chapters.map((c) => (
                  <tr
                    key={c.cha_id}
                    className="border-b last:border-0 hover:bg-gray-50"
                  >
                    <td className="p-4 font-medium">{c.sub_name}</td>
                    <td className="p-4">{c.cla_name}</td>
                    <td className="p-4">{c.cha_name}</td>
                    <td className="p-4">{c.cha_number || "-"}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}
    </div>
  );
}
