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

                                            </tr>
                                        </thead>
                                        <tbody>


                                        <tbody>

                                            @foreach ($queues as $key => $queue)
                                                <tr class="border-b">
                                                    {{-- create a counter for each student --}}
                                                    <td
                                                        class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                        {{ $key + 1 }}
                                                    </td>

                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{ $queue->student->student_id }}
                                                    </td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{ $queue->student->first_name }}
                                                    </td>
                                                    </td>
                                                    <td
                                                        class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                                        {{$rooms->room_no}}

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
