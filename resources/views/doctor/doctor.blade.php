<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">




                    <div class="flex flex-col">
                        <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="py-2 inline-block min-w-full sm:px-6 lg:px-8">
                                <div class="overflow-hidden">
                                    <table class="min-w-full">
                                        <thead class="border-b">
                                            <tr>
                                                <th scope="col"
                                                    class="text-sm font-larg text-gray-900 px-6 py-4 text-left">
                                                    #
                                                </th>
                                                <th scope="col"
                                                    class="text-sm font-larg text-gray-900 px-6 py-4 text-left">
                                                    STUDENT ID
                                                </th>
                                                <th scope="col"
                                                    class="text-sm font-larg text-gray-900 px-6 py-4 text-left">
                                                    STUDENT NAME
                                                </th>
                                                <th scope="col"
                                                    class="text-sm font-larg text-gray-900 px-6 py-4 text-left">
                                                    ROOM ID
                                                </th>
                                                <th scope="col"
                                                    class="text-sm font-larg text-gray-900 px-6 py-4 text-left">
                                                    Action
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>


                                        <tbody>

                                            @foreach ($students as $key => $student)
                                                <tr class="border-b">
                                                    {{-- create a counter for each student --}}
                                                    <td
                                                        class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                        {{ $key + 1 }}
                                                    </td>

                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{ $student->student->student_id }}
                                                    </td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{ $student->student->first_name }}
                                                    </td>
                                                    </td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{ $student->student->campas->name }}
                                                    </td>

                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        <div class="inline-flex shadow-md hover:shadow-lg focus:shadow-lg"
                                                            role="group">
                                                            <a href="/doctor/detail"
                                                                class="rounded-l inline-block px-6 py-2.5 bg-green-500 text-white font-medium text-xs leading-tight uppercase hover:bg-green-600 focus:bg-green-600 focus:outline-none focus:ring-0 active:bg-green-700 transition duration-150 ease-in-out">Accept</a>

                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach



                                        </tbody>

                                        </tbody>
                                    </table>
                                    {{-- <div class="py-6">{{ $students->links() }}</div> --}}
                                </div>
                            </div>
                        </div>
                    </div>




                </div>
            </div>
        </div>
    </div>
</x-app-layout>
