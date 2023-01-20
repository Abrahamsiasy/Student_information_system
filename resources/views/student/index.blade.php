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
                    {{-- Tailwind dropdown sselect option start --}}


                    <select name="catagory_id" id="catagory_id"
                        class="form-select appearance-none block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                        aria-label="Default select example">

                        {{-- fetch catagories --}}
                        @foreach ($campas as $camp)
                            <option value="{{ $camp->id }}">{{ $camp->name }}</option>
                        @endforeach
                    </select>



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
                                                        {{ $student->status }}
                                                    </td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        <div class="inline-flex shadow-md hover:shadow-lg focus:shadow-lg"
                                                            role="group">
                                                            <button type="button"
                                                                class="rounded-l inline-block px-6 py-2.5 bg-green-500 text-white font-medium text-xs leading-tight uppercase hover:bg-green-600 focus:bg-green-600 focus:outline-none focus:ring-0 active:bg-green-700 transition duration-150 ease-in-out">APROVE</button>

                                                            <button type="button"
                                                                class="rounded-r inline-block px-6 py-2.5 bg-red-600 text-white font-medium text-xs leading-tight uppercase hover:bg-red-700 focus:bg-red-700 focus:outline-none focus:ring-0 active:bg-red-800 transition duration-150 ease-in-out">DECLINE</button>
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
