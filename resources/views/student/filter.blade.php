<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>



        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    {{-- to be deleted start --}}

                    <form method="" class="py-4">

                        <div class="flex">
                            <div
                                class="min-w-10    font-medium text-center text-gray-900 bg-gray-100 border border-gray-300 rounded-l-lg hover:bg-gray-200">
                                {{-- fetch catagories --}}
                                @foreach ($campas as $camp)
                                    <a href="/s/?camp={{$camp->id}}" class="block">{{ $camp->name }} </a>
                                @endforeach
                            </div>
                            <div class="relative w-full">
                                <input type="search" id="search-dropdown"
                                    class="block p-2.5 w-full z-20 text-sm text-gray-900 bg-gray-50 rounded-r-lg border-l-gray-50 border-l-2 border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-l-gray-700  dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:border-blue-500"
                                    placeholder="Search Student by Name, Id ..." required>
                                <button type="submit"
                                    class="absolute top-0 right-0 p-2.5 text-sm font-medium text-white bg-green-500 rounded-r-lg border border-green-500 hover:bg-green-600 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                    <svg aria-hidden="true" class="w-5 h-5" fill="none" stroke="currentColor"
                                        viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                    </svg>
                                    <span class="sr-only">Search</span>
                                </button>
                            </div>
                        </div>
                    </form>

                    {{-- to be delted end --}}




                    {{-- search and drop down start --}}




                    {{-- search and drop down end --}}






                    {{-- Tailwind dropdown sselect option end --}}

                    {{-- Tailwind table start --}}
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
                                                    CAMPAS
                                                </th>
                                                <th scope="col"
                                                    class="text-sm font-larg text-gray-900 px-6 py-4 text-left">
                                                    Status
                                                </th>
                                                <th scope="col"
                                                    class="text-sm font-larg text-gray-900 px-6 py-4 text-left">
                                                    ACTION
                                                </th>
                                            </tr>
                                        </thead>
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
                                                        {{ $student->student_id }}
                                                    </td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{ $student->first_name . ' ' . $student->middle_name . ' ' . $student->last_name }}
                                                    </td>
                                                    </td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{ $student->campas->name }}
                                                    </td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{ $student->id }}
                                                    </td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        <div class="inline-flex shadow-md hover:shadow-lg focus:shadow-lg"
                                                            role="group">
                                                            <a href="/student/{{$student->id}}" type="button"
                                                                class="rounded-l inline-block px-6 py-2.5 bg-green-500 text-white font-medium text-xs leading-tight uppercase hover:bg-green-600 focus:bg-green-600 focus:outline-none focus:ring-0 active:bg-green-700 transition duration-150 ease-in-out">APROVE</a>

                                                            <a type="button"
                                                                class="rounded-r inline-block px-6 py-2.5 bg-red-600 text-white font-medium text-xs leading-tight uppercase hover:bg-red-700 focus:bg-red-700 focus:outline-none focus:ring-0 active:bg-red-800 transition duration-150 ease-in-out">DECLINE</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach



                                        </tbody>
                                    </table>
                                    <div class="py-6">{{ $students->links() }}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {{-- Tailwind table end --}}

                </div>
            </div>
        </div>
    </div>
</x-app-layout>
