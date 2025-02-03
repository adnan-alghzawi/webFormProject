using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webFormProject.jana
{
    public partial class CancelReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/jana/reservations.txt");

            string roomId = "";
            if (!IsPostBack) // فقط عند تحميل الصفحة لأول مرة
            {
                if (Request.QueryString["roomID"] != null)
                {
                    roomId = Request.QueryString["roomID"].Trim(); // إزالة المسافات الزائدة
                }
            }

            bool isAvailable = false;
            if (File.Exists(filePath))
            {
                string[] reservations = File.ReadAllLines(filePath);

                for (var i = 0; i < reservations.Length; i++)
                {
                    string[] details = reservations[i].Split('|');

                    if (details.Length >= 9) // تأكد أن الفهرس 8 موجود
                    {
                        string existingRoomId = details[0].Trim();

                        if (existingRoomId == roomId)
                        {
                            details[8] = "Pending"; // تحديث الحالة إلى Pending
                            reservations[i] = string.Join("|", details); // حفظ التحديث في الصف

                            isAvailable = true;
                            break; // إنهاء الحلقة بمجرد العثور على الغرفة المطلوبة
                        }
                    }
                }

                if (isAvailable)
                {
                    File.WriteAllLines(filePath, reservations); // حفظ التغييرات في الملف
                    ShowAlert("Reservation status updated to Pending!", true);
                }
                else
                {
                    ShowAlert("Room not found or already updated.");
                }
            }
            else
            {
                ShowAlert("Reservation file not found.");
            }

            Response.Redirect("ViewRooms.aspx");
        }

        private void ShowAlert(string message, bool isSuccess = false)
        {
            string script = $@"
        Swal.fire({{
            title: '{(isSuccess ? "Success!" : "Error!")}',
            text: '{message}',
            icon: '{(isSuccess ? "success" : "error")}',
            confirmButtonText: 'OK'
        }});
    ";

            if (isSuccess)
            {
                script += "setTimeout(function(){ window.location.href=window.location.href; }, 2000);"; // Reload page after 2 seconds
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", script, true);
        }

    }
}