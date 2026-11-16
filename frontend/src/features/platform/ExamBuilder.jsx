import { useState, useEffect } from "react";

export default function ExamBuilder() {
  const [exams, setExams] = useState([]);
  const [subjects, setSubjects] = useState([]);

  // Form State
  const [form, setForm] = useState({
    exa_title: "",
    sub_id: "",
    easy_count: 5,
    medium_count: 5,
    hard_count: 0,
  });

  const [generatedPaper, setGeneratedPaper] = useState(null);
  const [generatedExvId, setGeneratedExvId] = useState(null); // Stores the ID for PDF download

  const API_BASE = "http://127.0.0.1:8000/api/v1";

  const loadData = async () => {
    try {
      const eRes = await fetch(`${API_BASE}/exams/`);
      setExams(await eRes.json());

      const sRes = await fetch(`${API_BASE}/academic/subjects`);
      setSubjects(await sRes.json());
    } catch (error) {
      console.error("Error loading data:", error);
    }
  };

  useEffect(() => {
    loadData();
  }, []);

  const handleGenerate = async (e) => {
    e.preventDefault();

    const payload = {
      ...form,
      sub_id: parseInt(form.sub_id),
      easy_count: parseInt(form.easy_count),
      medium_count: parseInt(form.medium_count),
      hard_count: parseInt(form.hard_count),
      created_by: 1,
    };

    try {
      const res = await fetch(`${API_BASE}/exams/generate`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });

      if (res.ok) {
        const data = await res.json();
        alert(`Exam Generated! Total Questions: ${data.total_questions}`);

        setGeneratedExvId(data.exv_id);

        // 1. Fetch the paper snapshot
        const paperRes = await fetch(`${API_BASE}/exams/${data.exv_id}/paper`);

        // 2. Parse the JSON and store it in the 'paperData' variable
        const paperData = await paperRes.json();

        // 3. Set the state using the exact variable name 'paperData'
        setGeneratedPaper(paperData);

        loadData();
      } else {
        const err = await res.json();
        alert(`Error: ${err.detail}`);
      }
    } catch (error) {
      console.error("Error generating exam:", error);
      alert("Failed to generate exam.");
    }
  };

  const viewExam = async (exv_id) => {
    try {
      const paperRes = await fetch(`${API_BASE}/exams/${exv_id}/paper`);
      if (paperRes.ok) {
        const paperData = await paperRes.json();
        setGeneratedExvId(exv_id);
        setGeneratedPaper(paperData);
      } else {
        alert("Failed to load exam paper.");
      }
    } catch (error) {
      console.error("Error fetching exam:", error);
    }
  };

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold text-gray-800 mb-6">
        Examination Builder
      </h1>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
        {/* GENERATE FORM */}
        <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-100 col-span-1 h-fit">
          <h2 className="text-lg font-bold mb-4">Generate New Exam</h2>
          <form onSubmit={handleGenerate} className="space-y-3">
            <input
              type="text"
              placeholder="Exam Title (e.g., Midterm 2026)"
              required
              className="w-full p-2 border rounded"
              value={form.exa_title}
              onChange={(e) => setForm({ ...form, exa_title: e.target.value })}
            />

            <select
              required
              className="w-full p-2 border rounded"
              value={form.sub_id}
              onChange={(e) => setForm({ ...form, sub_id: e.target.value })}
            >
              <option value="">Select Subject</option>
              {subjects.map((s) => (
                <option key={s.sub_id} value={s.sub_id}>
                  {s.sub_name}
                </option>
              ))}
            </select>

            <div className="flex gap-2">
              <div className="flex-1">
                <label className="text-xs font-medium text-gray-500">
                  Easy Qs
                </label>
                <input
                  type="number"
                  min="0"
                  className="w-full p-2 border rounded"
                  value={form.easy_count}
                  onChange={(e) =>
                    setForm({ ...form, easy_count: e.target.value })
                  }
                />
              </div>
              <div className="flex-1">
                <label className="text-xs font-medium text-gray-500">
                  Medium Qs
                </label>
                <input
                  type="number"
                  min="0"
                  className="w-full p-2 border rounded"
                  value={form.medium_count}
                  onChange={(e) =>
                    setForm({ ...form, medium_count: e.target.value })
                  }
                />
              </div>
              <div className="flex-1">
                <label className="text-xs font-medium text-gray-500">
                  Hard Qs
                </label>
                <input
                  type="number"
                  min="0"
                  className="w-full p-2 border rounded"
                  value={form.hard_count}
                  onChange={(e) =>
                    setForm({ ...form, hard_count: e.target.value })
                  }
                />
              </div>
            </div>

            <button
              type="submit"
              className="w-full bg-indigo-600 text-white p-2 rounded hover:bg-indigo-700 mt-4 transition"
            >
              Generate Exam Paper
            </button>
          </form>
        </div>

        {/* EXAMS LIST */}
        <div className="col-span-2 bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <table className="w-full text-left">
            <thead className="bg-gray-50 border-b">
              <tr>
                <th className="p-4 font-medium text-gray-600">Exam Title</th>
                <th className="p-4 font-medium text-gray-600">Subject</th>
                <th className="p-4 font-medium text-gray-600">Total Marks</th>
                <th className="p-4 font-medium text-gray-600">Date Created</th>
                <th className="p-4 font-medium text-gray-600">Actions</th>
              </tr>
            </thead>
            <tbody>
              {exams.length > 0 ? (
                exams.map((e) => (
                  <tr
                    key={e.exa_id}
                    className="border-b last:border-0 hover:bg-gray-50"
                  >
                    <td
                      className="p-4 font-medium text-indigo-600 cursor-pointer hover:underline"
                      onClick={() => viewExam(e.exv_id)}
                    >
                      {e.exa_title}
                    </td>
                    <td className="p-4 text-sm">{e.sub_name}</td>
                    <td className="p-4 text-sm font-bold">{e.total_marks}</td>
                    <td className="p-4 text-sm text-gray-500">
                      {new Date(e.created_at).toLocaleDateString()}
                    </td>
                    <td className="p-4">
                      <button
                        onClick={() => viewExam(e.exv_id)}
                        className="text-indigo-600 hover:underline text-sm font-medium"
                      >
                        View Paper
                      </button>
                    </td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan="5" className="p-4 text-center text-gray-500">
                    No exams generated yet.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>

      {/* PREVIEW GENERATED PAPER */}
      {generatedPaper && (
        <div className="mt-8 bg-white p-8 rounded-xl shadow-sm border border-gray-100">
          <div className="flex justify-between items-center mb-6 border-b pb-4">
            <h2 className="text-xl font-bold">Exam Paper Preview (Snapshot)</h2>

            <div className="flex gap-4">
              <a
                href={`${API_BASE}/exams/${generatedExvId}/pdf`}
                target="_blank"
                rel="noreferrer"
                className="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700 text-sm font-medium transition"
              >
                Download PDF
              </a>
              <button
                onClick={() => {
                  setGeneratedPaper(null);
                  setGeneratedExvId(null);
                }}
                className="text-red-500 text-sm hover:underline font-medium"
              >
                Close Preview
              </button>
            </div>
          </div>

          <div className="space-y-6">
            {generatedPaper.map((q, index) => (
              <div key={index} className="border-l-4 border-indigo-500 pl-4">
                <p className="font-bold text-gray-800 mb-2">
                  Q{index + 1}. {q.question_snapshot.question_text}
                </p>
                <ul className="list-disc pl-5 text-gray-600">
                  {Object.entries(q.question_snapshot.options).map(
                    ([key, value]) => (
                      <li key={key}>
                        {key}) {value}
                      </li>
                    ),
                  )}
                </ul>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
