class Doctor {
  final String id;
  final String full_name;
  final String title;
  final String description;
  final String image;
  final int patients;
  final int experiences;
  final double rating;
  Doctor(
      {required this.full_name,
      required this.title,
      required this.id,
      required this.image,
      required this.description,
      required this.experiences,
      required this.patients,
      required this.rating});
}

List<Doctor> doctors = [
  Doctor(
    id: "1",
    image: "https://storage.googleapis.com/pai-images/1dfafa7c876f4330ae49c3965cc7472c.jpeg",
    full_name: 'Dr. John Doe',
    title: 'Cardiologist',
    description:
        'Dr. John Doe has 10 years of experience in the medical field. He is highly skilled and dedicated to providing the best care for his patients.',
    patients: 100,
    experiences: 10,
    rating: 4.5,
  ),
  Doctor(
    id: "2",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdgid2OWlmAyabLrKpfBm9raRWBe6cha3Dw_DQY01e7g&s",
    full_name: 'Dr. Sarah Smith',
    title: 'Pediatrician',
    description:
        'Dr. Sarah Smith has 15 years of experience in the medical field. She has a passion for working with children and is committed to providing compassionate care to her patients.',
    patients: 150,
    experiences: 15,
    rating: 4.8,
  ),
  Doctor(
    id: "3",
    image: "https://q1medical.com/wp-content/uploads/2018/10/male-doctor.png",
    full_name: 'Dr. Ahmed Ben Amor',
    title: 'Orthopedic Surgeon',
    description:
        'Dr. Ahmed Ben Amor has 20 years of experience in orthopedic surgery. He specializes in treating musculoskeletal injuries and disorders, helping his patients regain mobility and improve their quality of life.',
    patients: 200,
    experiences: 20,
    rating: 4.9,
  ),
  Doctor(
    id: "4",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1CVs0GYK0KcSPa_ztHDgcl9Vg40AODc_TRhDdAb1M0w&s",
    full_name: 'Dr. Maria Garcia',
    title: 'Oncologist',
    description:
        'Dr. Maria Garcia is a renowned oncologist with 25 years of experience. She is dedicated to providing comprehensive cancer care, from diagnosis to treatment, with empathy and compassion.',
    patients: 180,
    experiences: 25,
    rating: 4.7,
  ),
];
