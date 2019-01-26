using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace prjStoredProcedure.Models
{
    public class ViewModelDepEmpByDep
    {
        public List<usp_GetAllDepartment_Result> department { get; set; }
        public List<usp_GetEmployeeByDepId_Result>  employee { get; set; }
    }

    public class ViewModelDepEmpByEmp
    {
        public List<usp_GetAllDepartment_Result>  department { get; set; }
        public usp_GetEmployeeByEmpID_Result employee { get; set; }
    }
}