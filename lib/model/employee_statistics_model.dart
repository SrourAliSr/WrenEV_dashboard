class EmployeeStatisticsModel {
  final int totalEmployees;
  final int jobApplicants;
  final int newEmployees;
  final int resignedEmployees;

  EmployeeStatisticsModel({
    required this.totalEmployees,
    required this.jobApplicants,
    required this.newEmployees,
    required this.resignedEmployees,
  });

  Map<String, int> toMap() {
    return {
      "Total Employees": totalEmployees,
      "Job Applicants": jobApplicants,
      "New Employees": newEmployees,
      "Resigned Employees": resignedEmployees,
    };
  }
}
