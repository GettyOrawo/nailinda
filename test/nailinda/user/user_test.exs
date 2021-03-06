defmodule Nailinda.UserTest do
  use Nailinda.DataCase

  alias Nailinda.User
  alias Nailinda.User.Patient
  alias Nailinda.User.Receptionist
  alias Nailinda.User.Doctor

  describe "users" do
    @valid_attrs %{
      first_name: "jackline",
      last_name: "kaunda",
      date_of_birth: ~D[2019-01-28],
      location: "Kisumu",
      id_number: 4_576_890,
      phone_number: "079056431",
      next_of_kin: "wayua"
    }
    @invalid_attrs %{
      first_name: nil,
      last_name: nil,
      date_of_birth: nil,
      location: nil,
      id_number: nil,
      phone_number: nil,
      next_of_kin: nil
    }

    test "creates patient with valid data " do
      assert {:ok, %Patient{} = patient} = User.create_patient(@valid_attrs)
      assert patient.first_name == "jackline"
      assert patient.last_name == "kaunda"
      assert patient.date_of_birth == ~D[2019-01-28]
      assert patient.location == "Kisumu"
      assert patient.id_number == 4_576_890
      assert patient.phone_number == "079056431"
      assert patient.next_of_kin == "wayua"
    end

    test "create user with invalid data to return a error" do
      assert {:error, %Ecto.Changeset{}} = User.create_patient(@invalid_attrs)
    end

    test "creates valid receptionist successfully " do
      assert {:ok, %Receptionist{} = patient} = User.create_receptionist(@valid_attrs)
      assert patient.first_name == "jackline"
      assert patient.phone_number == "079056431"
    end

    test "fails when creating invalid receptionist" do
      assert {:error, %Ecto.Changeset{}} = User.create_receptionist(@invalid_attrs)
    end
  end

  describe "doctors" do
    @valid_attrs %{
      first_name: "okoth",
      middle_name: "kongo",
      surname: "kaunda",
      location: "Kisumu",
      department: "Paeditrician",
      speciality: "kids",
      email: "okothjacky@gmail.com",
      id_number: 4_576_890
    }
    @invalid_attrs %{
      first_name: nil,
      surname: nil,
      location: nil,
      id_number: nil,
      phone_number: nil,
      next_of_kin: nil
    }

    test "creates doctor with valid data " do
      assert {:ok, %Doctor{} = doctor} = User.create_doctor(@valid_attrs)
      assert doctor.first_name == "okoth"
      assert doctor.surname == "kaunda"
      assert doctor.location == "Kisumu"
      assert doctor.id_number == 4_576_890
    end

    test "create doctor with invalid data to return a error" do
      assert {:error, %Ecto.Changeset{}} = User.create_doctor(@invalid_attrs)
    end
  end
end
