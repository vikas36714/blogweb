<?php

use Illuminate\Database\Seeder;
use App\User;
class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       // Let's clear the users table first
       User::truncate();

       $faker = \Faker\Factory::create();

       // Let's make sure everyone has the same password and 
       // let's hash it before the loop, or else our seeder 
       // will be too slow.
       $password = Hash::make('toptal');

    //    User::create([
    //        'username' => 'admin',
    //        'email' => 'admin@test.com',
    //        'password' => $password,
    //    ]);

        // And now, let's create a few User in our database:
        for ($i = 0; $i < 5; $i++) {
            User::create([
                'username' => $faker->sentence,
                'first_name' => $faker->name,
                'last_name' => $faker->name,
                'email' => $faker->email,
                'password' => $faker->password,
                'is_active' => 1,
            ]);
        }
    }
}
