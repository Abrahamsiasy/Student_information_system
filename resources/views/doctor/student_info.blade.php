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


                    <div class="w-full mx-2 h-64 ">
                        <!-- Profile tab -->
                        <!-- About Section -->
                        <div class="bg-white p-3 shadow-sm rounded-sm">
                            <div class="flex items-center space-x-2 font-semibold text-gray-900 leading-8">
                                <span clas="text-green-500">
                                    <svg class="h-5" xmlns="http://www.w3.org/2000/svg" fill="none"
                                        viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                    </svg>
                                </span>
                                <span class="tracking-wide">About</span>
                            </div>
                            <div class="text-gray-700 ">
                                <div class="grid md:grid-cols-2 ">
                                    <div class="grid grid-cols-2">
                                        <div class="px-4 py-2 font-semibold">First Name</div>
                                        <div class="px-4 py-2">{{ $student->first_name }}</div>
                                    </div>
                                    <div class="grid grid-cols-2">
                                        <div class="px-4 py-2 font-semibold">Last Name</div>
                                        <div class="px-4 py-2">{{ $student->last_name }}</div>
                                    </div>
                                    <div class="grid grid-cols-2">
                                        <div class="px-4 py-2 font-semibold">Gender</div>
                                        <div class="px-4 py-2">{{ $student->sex }}</div>
                                    </div>
                                    <div class="grid grid-cols-2">
                                        <div class="px-4 py-2 font-semibold">Contact No.</div>
                                        <div class="px-4 py-2">{{ $student->phone_number }}</div>
                                    </div>

                                    <div class="grid grid-cols-2">
                                        <div class="px-4 py-2 font-semibold">Email.</div>
                                        <div class="px-4 py-2">
                                            <a class="text-blue-800" href="">{{ $student->email }}</a>
                                        </div>
                                    </div>
                                    <div class="grid grid-cols-2">
                                        <div class="px-4 py-2 font-semibold">Birthday</div>
                                        <div class="px-4 py-2">{{ $student->dob }}</div>
                                    </div>
                                </div>
                            </div>
                            <button
                                class="block w-full text-blue-800 text-lg font-semibold rounded-lg hover:bg-gray-100 focus:outline-none focus:shadow-outline focus:bg-gray-100 hover:shadow-xs p-3 my-4">Show
                                Full Information</button>
                        </div>
                        <!-- End of profile tab -->
                    </div>

                    {{-- medication history table start --}}
                    <!-- component -->
                    {{-- @foreach ($histories as $history) --}}
                    <div class="flex flex-col">
                        <div class="overflow-x-auto sm:mx-0.5 lg:mx-0.5">
                            <div class="py-2 inline-block min-w-full sm:px-6 lg:px-8">
                                <h3 class="font-medium leading-tight text-2xl mt-0 mb-2 text-blue-600">
                                    Medication History
                                </h3>
                                <div class="overflow-hidden">
                                    <table class="min-w-full">
                                        <thead class="bg-white border-b">
                                            <tr>
                                                <th scope="col"
                                                    class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                                                    #
                                                </th>
                                                <th scope="col"
                                                    class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                                                    Medication Name
                                                </th>
                                                <th scope="col"
                                                    class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                                                    Description
                                                </th>
                                                <th scope="col"
                                                    class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                                                    Dose
                                                </th>
                                                <th scope="col"
                                                    class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                                                    Duration
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($medhistories as $key => $medhistory)
                                                <tr class="bg-gray-100 border-b">
                                                    <td
                                                        class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                        1</td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{ $medhistory->name }}
                                                    </td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{ $medhistory->description }}
                                                    </td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{ $medhistory->dose }}
                                                    </td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{ $medhistory->medicalhistories_id }}
                                                    </td>
                                                </tr>
                                            @endforeach

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="py-2 inline-block min-w-full sm:px-6 lg:px-8">
                                <h3 class="font-medium leading-tight text-2xl mt-0 mb-2 text-blue-600">
                                    Lab History
                                </h3>
                                <table class="table-auto min-w-full">
                                    <thead>
                                        <tr class="text-left">
                                            <th class="px-4 py-2">#</th>
                                            <th class="px-4 py-2">Title</th>
                                            <th class="px-4 py-2">Description</th>
                                            <th class="px-4 py-2">Comment</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($labhistories as $key => $labhistory)
                                            <tr class="text-left">
                                                <td class="border px-4 py-2">1</td>
                                                <td class="border px-4 py-2">{{ $labhistory->title }}</td>
                                                <td class="border px-4 py-3">{{ $labhistory->description }}
                                                </td>
                                                <td class="border px-4 py-2">{{ $labhistory->comment }}</td>
                                            </tr>
                                        @endforeach


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    {{-- @endforeach --}}
                    {{-- medication history table end --}}

                    {{-- lab report create start --}}
                    <form method="POST" class="p-7" action="/doctor/detail/{{ $student->id }}">
                        @csrf
                        <div class="mb-6">
                            <label class="block mb-2 text-sm font-medium text-gray-900  ">Lab
                                Title</label>
                            <input type="titel" name="title"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                        </div>
                        @error('title')
                            <div class="bg-orange-100 border-l-4 border-orange-500 text-orange-700 p-4" role="alert">
                                <p>{{ $message }}.</p>
                            </div>
                        @enderror
                        <div class="mb-6">
                            <label class="block mb-2 text-sm font-medium text-gray-900  "> Lab
                                Description</label>
                            <textarea name="description"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                                rows="5">
                            </textarea>
                        </div>
                        <button type="submit"
                            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center ">Submit</button>
                    </form>
                    {{-- lab report create end --}}
                    <div>
                        <button type="submit"
                            class="text-white text-4xl justify-center align-middle bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-9xl rounded-lg w-full sm:w-auto px-5 py-2.5 text-center ">Submit</button>

                    </div>

                </div>
            </div>
        </div>
    </div>
</x-app-layout>
