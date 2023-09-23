import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';
import '../widgets/appointmentcalender.dart';

class DoctorDetails extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String imageUrl;

  const DoctorDetails({
    Key? key,
    required this.doctorName,
    required this.specialty,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const Text('Detail Doctor'),
            backgroundColor: Color(MyColors.primary),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: DetailBody(
              doctorName: doctorName,
              specialty: specialty,
            ),
          ),
          const SliverToBoxAdapter(
            child: AppointmentCalendar(
                onAppointmentSelected: _handleAppointmentSelection),
          ),
        ],
      ),
    );
  }
}

void _handleAppointmentSelection(
    DateTime selectedDate, DateTime _selectedTimeSlot) {
  // TODO: Implement storing the appointment details
  // Here, you would store the appointment date, time, and other relevant details
  // You can use a database or any storage mechanism suitable for your application.
  print(
      'Appointment selected: Date: $selectedDate, Time Slot: $_selectedTimeSlot');
}

class DetailBody extends StatelessWidget {
  final String doctorName;
  final String specialty;

  const DetailBody({
    Key? key,
    required this.doctorName,
    required this.specialty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DetailDoctorCard(
            doctorName: doctorName,
            specialty: specialty,
            imageUrl: 'assets/doctorImages/hospital.jpg',
          ),
          SizedBox(
            height: 15,
          ),
          DoctorInfo(),
          SizedBox(
            height: 30,
          ),
          Text(
            'About Doctor',
            style: kTitleStyle,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'About the Doctor',
            style: TextStyle(
              color: Color(MyColors.purple01),
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Location',
            style: kTitleStyle,
          ),
          SizedBox(
            height: 25,
          ),
          DoctorLocation(),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color(MyColors.primary),
              ),
            ),
            child: Text('Book Appointment'),
            onPressed: () => {},
          )
        ],
      ),
    );
  }
}

class DoctorLocation extends StatelessWidget {
  const DoctorLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 200,
      // child: ClipRRect(
      //   borderRadius: BorderRadius.circular(20),
      //   child: FlutterMap(
      //     options: MapOptions(
      //       center: latLng.LatLng(51.5, -0.09),
      //       zoom: 13.0,
      //     ),
      //     layers: [
      //       TileLayerOptions(
      //         urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      //         subdomains: ['a', 'b', 'c'],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        NumberCard(
          label: 'Patients',
          value: '100+',
        ),
        SizedBox(width: 15),
        NumberCard(
          label: 'Experiences',
          value: '10 years',
        ),
        SizedBox(width: 15),
        NumberCard(
          label: 'Rating',
          value: '4.0',
        ),
      ],
    );
  }
}

class NumberCard extends StatelessWidget {
  final String label;
  final String value;

  const NumberCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(MyColors.bg03),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Color(MyColors.grey02),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: TextStyle(
                color: Color(MyColors.header01),
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailDoctorCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String imageUrl;

  const DetailDoctorCard({
    Key? key,
    required this.doctorName,
    required this.specialty,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: TextStyle(
                          color: Color(MyColors.header01),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      specialty,
                      style: TextStyle(
                        color: Color(MyColors.grey02),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Image(
                image: AssetImage(imageUrl),
                width: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
