class EmployeeStatisticsModel {
  final int totalEmployees;
  final double totalEmployeesPercentage;
  final int jobApplicants;
  final double jobApplicationsPercentagel;
  final int newEmployees;
  final double newEmployeesPercentagel;
  final int resignedEmployees;
  final double resignedEmployeesPercentagel;

  EmployeeStatisticsModel(
      {required this.totalEmployees,
      required this.totalEmployeesPercentage,
      required this.jobApplicants,
      required this.jobApplicationsPercentagel,
      required this.newEmployees,
      required this.newEmployeesPercentagel,
      required this.resignedEmployees,
      required this.resignedEmployeesPercentagel});

  Map<String, dynamic> toMap() {
    return {
      "Total Employees": totalEmployees,
      "Total Employees precentage": totalEmployeesPercentage,
      "Job Applicants": jobApplicants,
      "Job Applicants precentage": jobApplicationsPercentagel,
      "New Employees": newEmployees,
      "New Employees precentage": newEmployeesPercentagel,
      "Resigned Employees": resignedEmployees,
      "Resigned Employees precentage": resignedEmployees,
    };
  }
}
