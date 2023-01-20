<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Student;
use Illuminate\Support\Str;
use Faker\Generator as Faker;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Student>
 */
class StudentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */

     protected $model = Student::class;
    public function definition()
    {

        static $studentId = 1;
        $campus_id = [1,2,3,4,5];
        return [
            'student_id' => 'JU' . $this->faker->randomElement(['R', 'E']) . '/'. str_pad($studentId++, 4, '0', STR_PAD_LEFT) . '/'. $this->faker->numberBetween(2020,2023),

            'first_name' => $this->faker->firstName,
            'middle_name' => $this->faker->lastName,
            'last_name' => $this->faker->lastName,
            'dob' => $this->faker->dateTimeBetween('-60 years', 'now'),
            // 'dob' =>  $this->faker->date($format = 'D-m-y', $max = 2012 ,$min = 1920 ),
            'sex' => $this->faker->randomElement(['M', 'F']),
            'join_year' => $this->faker->date,
            'phone_number' => $this->faker->unique()->phoneNumber,
            'email' => $this->faker->safeEmail,
            'profile' => 'photo.jpg',
            'status' => true,
            'passed_semester' => $this->faker->numberBetween(1,10),
            'taken_semester' => $this->faker->numberBetween(1,10),
            'program' => $this->faker->text(10,15),
            'campas_id' => $campus_id[array_rand($campus_id)],
            'clinic_id' => $campus_id[array_rand($campus_id)],
        ];
    }
}


