<!DOCTYPE html>
<html>
<head>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <title>Students by Campus</title>
</head>
<body>
    <h1 class="text-2xl font-medium text-center">Students by Campus</h1>
    <div class="w-1/2 mx-auto">
        <label for="campus-select" class="block font-medium text-lg mb-2">Select Campus:</label>
        <select id="campus-select" class="bg-white p-2 rounded-md">
            <option value="campus1">Campus 1</option>
            <option value="campus2">Campus 2</option>
            <option value="campus3">Campus 3</option>
        </select>
    </div>
    <table class="w-full mt-4 text-left table-auto">
        <thead>
            <tr>
                <th class="px-4 py-2">Name</th>
                <th class="px-4 py-2">ID Number</th>
            </tr>
        </thead>
        <tbody id="student-list">
        </tbody>
    </table>
    <script>
        let students = {
            campus1: [
                { name: "John Doe", id: "12345" },
                { name: "Jane Smith", id: "67890" },
                { name: "Bob Johnson", id: "09876" }
            ],
            campus2: [
                { name: "Emily Davis", id: "54321" },
                { name: "Michael Brown", id: "67890" },
                { name: "Jessica Garcia", id: "09876" }
            ],
            campus3: [
                { name: "Jacob Martinez", id: "12345" },
                { name: "Ashley Thompson", id: "67890" },
                { name: "Brian Anderson", id: "09876" }
            ]
        };

        let select = document.getElementById("campus-select");
        let studentList = document.getElementById("student-list");

        select.addEventListener("change", function() {
            let campus = select.value;
            let html = "";
            students[campus].forEach(function(student) {
                html += `<tr>
                            <td class="border px-4 py-2">${student.name}</td>
                            <td class="border px-4 py-2">${student.id}</td>
                        </tr>`;
            });
            studentList.innerHTML = html;
        });
    </script>
</body>
</html>
