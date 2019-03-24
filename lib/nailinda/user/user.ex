defmodule Nailinda.User do
  @moduledoc """
   This is the patients context
  """
  alias Nailinda.Repo
  alias Nailinda.User.Patient
  alias Nailinda.User.Receptionist
  alias Nailinda.User.Doctor
  alias Nailinda.Redis


  def create_patient(attrs) do
    %{"location" => location } = attrs

    [long, lat, member] = String.split(attrs)

    Redis.save_patient_location(long, lat, member)
    
    %Patient{}
    |> Patient.changeset(attrs)
    |> Repo.insert()
  end

  def update_patient(patient, attrs) do
    patient
    |> Patient.changeset(attrs)
    |> Repo.update()
  end

  def get_all_patients do
    Patient
    |> Repo.all()
  end

  def get_patient_by_id(id) do
    Patient
    |> Repo.get(id)
  end

  def delete_patient(%Patient{} = patient) do
    Repo.delete(patient)
  end

  def create_receptionist(attrs) do
    %Receptionist{}
    |> Receptionist.changeset(attrs)
    |> Repo.insert()
  end

  def create_doctor(attrs) do
    %Doctor{}
    |> Doctor.changeset(attrs)
    |> Repo.insert()
  end

  def get_doctor_by_id(id) do
    Doctor
    |> Repo.get!(id)
  end

  def get_all_doctors do
    Doctor
    |> Repo.all()
  end

  def delete_doctor(%Doctor{} = doctor) do
    Repo.delete(doctor)
  end
end
