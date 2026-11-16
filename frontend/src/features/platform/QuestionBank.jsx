import { useState, useEffect } from "react";

export default function QuestionBank() {
  const [questions, setQuestions] = useState([]);
  const [subjects, setSubjects] = useState([]);
  const [chapters, setChapters] = useState([]);

  // Form State
  const [form, setForm] = useState({
    sub_id: "",
    cha_id: "",
    difficulty: "Easy",
    question_text: "",
    option_a: "",
    option_b: "",
    option_c: "",
    option_d: "",
    correct_answer: "A",
    explanation: "",
  });

  const API_BASE = "http://127.0.0.1:8000/api/v1";

  const loadData = async () => {
    const qRes = await fetch(`${API_BASE}/questions/questions`);
    setQuestions(await qRes.json());

    const sRes = await fetch(`${API_BASE}/academic/subjects`);
    setSubjects(await sRes.json());

    const cRes = await fetch(`${API_BASE}/academic/chapters`);
    setChapters(await cRes.json());
  };

  useEffect(() => {
    loadData();
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Transform flat form data into the JSONB format the backend expects
    const payload = {
      sub_id: parseInt(form.sub_id),
      cha_id: form.cha_id ? parseInt(form.cha_id) : null,
      difficulty: form.difficulty,
      question_text: form.question_text,
      options: {
        A: form.option_a,
        B: form.option_b,
        C: form.option_c,
        D: form.option_d,
      },
      correct_answer: { answer: form.correct_answer },
      explanation: form.explanation,
      created_by: 1, // Hardcoded to Platform Admin (Ismail) for now
    };

    await fetch(`${API_BASE}/questions/questions`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload),
    });

    // Reset form
    setForm({
      sub_id: "",
      cha_id: "",
      difficulty: "Easy",
      question_text: "",
      option_a: "",
      option_b: "",
      option_c: "",
      option_d: "",
      correct_answer: "A",
      explanation: "",
    });
    loadData();
  };

  // Filter chapters based on selected subject
  const filteredChapters = chapters.filter(
    (c) => c.sub_id === parseInt(form.sub_id),
  );

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold text-gray-800 mb-6">
        Platform Question Bank
      </h1>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
        {/* FORM */}
        <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-100 col-span-1">
          <h2 className="text-lg font-bold mb-4">Add New Question</h2>
          <form onSubmit={handleSubmit} className="space-y-3">
            <select
              required
              className="w-full p-2 border rounded"
              value={form.sub_id}
              onChange={(e) =>
                setForm({ ...form, sub_id: e.target.value, cha_id: "" })
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
              className="w-full p-2 border rounded"
              value={form.cha_id}
              onChange={(e) => setForm({ ...form, cha_id: e.target.value })}
              disabled={!form.sub_id}
            >
              <option value="">Select Chapter (Optional)</option>
              {filteredChapters.map((c) => (
                <option key={c.cha_id} value={c.cha_id}>
                  {c.cha_name} - {c.cla_name}
                </option>
              ))}
            </select>

            <select
              required
              className="w-full p-2 border rounded"
              value={form.difficulty}
              onChange={(e) => setForm({ ...form, difficulty: e.target.value })}
            >
              <option value="Easy">Easy</option>
              <option value="Medium">Medium</option>
              <option value="Hard">Hard</option>
            </select>

            <textarea
              required
              placeholder="Question Text"
              className="w-full p-2 border rounded"
              rows="3"
              value={form.question_text}
              onChange={(e) =>
                setForm({ ...form, question_text: e.target.value })
              }
            />

            <input
              type="text"
              placeholder="Option A"
              required
              className="w-full p-2 border rounded"
              value={form.option_a}
              onChange={(e) => setForm({ ...form, option_a: e.target.value })}
            />
            <input
              type="text"
              placeholder="Option B"
              required
              className="w-full p-2 border rounded"
              value={form.option_b}
              onChange={(e) => setForm({ ...form, option_b: e.target.value })}
            />
            <input
              type="text"
              placeholder="Option C"
              required
              className="w-full p-2 border rounded"
              value={form.option_c}
              onChange={(e) => setForm({ ...form, option_c: e.target.value })}
            />
            <input
              type="text"
              placeholder="Option D"
              required
              className="w-full p-2 border rounded"
              value={form.option_d}
              onChange={(e) => setForm({ ...form, option_d: e.target.value })}
            />

            <select
              required
              className="w-full p-2 border rounded"
              value={form.correct_answer}
              onChange={(e) =>
                setForm({ ...form, correct_answer: e.target.value })
              }
            >
              <option value="A">Correct: A</option>
              <option value="B">Correct: B</option>
              <option value="C">Correct: C</option>
              <option value="D">Correct: D</option>
            </select>

            <textarea
              placeholder="Explanation (Optional)"
              className="w-full p-2 border rounded"
              rows="2"
              value={form.explanation}
              onChange={(e) =>
                setForm({ ...form, explanation: e.target.value })
              }
            />

            <button
              type="submit"
              className="w-full bg-indigo-600 text-white p-2 rounded hover:bg-indigo-700"
            >
              Save Question
            </button>
          </form>
        </div>

        {/* TABLE */}
        <div className="col-span-2 bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <table className="w-full text-left">
            <thead className="bg-gray-50 border-b">
              <tr>
                <th className="p-4 font-medium text-gray-600">Question</th>
                <th className="p-4 font-medium text-gray-600">Subject</th>
                <th className="p-4 font-medium text-gray-600">Difficulty</th>
                <th className="p-4 font-medium text-gray-600">Status</th>
              </tr>
            </thead>
            <tbody>
              {questions.map((q) => (
                <tr
                  key={q.que_id}
                  className="border-b last:border-0 hover:bg-gray-50"
                >
                  <td className="p-4 font-medium">{q.question_text}</td>
                  <td className="p-4 text-sm">{q.sub_name}</td>
                  <td className="p-4 text-sm">
                    <span
                      className={`px-2 py-1 rounded text-xs font-bold ${
                        q.difficulty === "Easy"
                          ? "bg-green-100 text-green-700"
                          : q.difficulty === "Medium"
                            ? "bg-yellow-100 text-yellow-700"
                            : "bg-red-100 text-red-700"
                      }`}
                    >
                      {q.difficulty}
                    </span>
                  </td>
                  <td className="p-4 text-sm capitalize">
                    {q.sta_id === 1 ? "Draft" : "Approved"}
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
