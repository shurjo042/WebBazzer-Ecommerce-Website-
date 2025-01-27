﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBazzer.Models;
using WebBazzer.BLL;
using System.Web.Security;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Data.Entity.Core.Objects;

namespace WebBazzer.Controllers
{
    public class LoginController : Controller
    {
       
        WebBazerEntities db = new WebBazerEntities();

        public ActionResult Index()
        {

            ViewBag.latestOrders = db.Orders.OrderByDescending(x => x.ID).Take(10).ToList();
            ViewBag.NewOrders = db.Orders.Where(a => a.DIspatched == false && a.Shipped == false && a.Deliver == false).Count();
            ViewBag.DispatchedOrders = db.Orders.Where(a => a.DIspatched == true && a.Shipped == false && a.Deliver == false).Count();
            ViewBag.ShippedOrders = db.Orders.Where(a => a.DIspatched == true && a.Shipped == true && a.Deliver == false).Count();
            ViewBag.DeliveredOrders = db.Orders.Where(a => a.DIspatched == true && a.Shipped == true && a.Deliver == true).Count();

            return View();
        }
        public ActionResult Order()
        {
            ViewBag.Order = db.Orders.ToList();
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Login login)
        {
            if (ModelState.IsValid)
            {
                var model = (from m in db.Admins
                             where m.Email == login.Email && m.Password == login.Password
                             select m).Any();
                if (model)
                {
                    var loginInfo = db.Admins.Where(x => x.Email == login.Email && x.Password == login.Password).FirstOrDefault();

                    Session["Email"] = loginInfo.Email;

                    return RedirectToAction("Order");
                }
            }
            return View("Index");
        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }




        public JsonResult GetSalesPerDay()
        {
            var data = (from O in db.Orders
                        select new { date = EntityFunctions.TruncateTime(O.OrderDate), O.TotalAmount } into a
                        group a by a.date into b
                        select new
                        {
                            period = b.Key,
                            sales = b.Sum(x => x.TotalAmount)
                        });

            List<AreaCharts> aa = new List<AreaCharts>();
            foreach (var item in data)
            {
                string date = item.period.ToString().Split(new[] { (' ') }, StringSplitOptions.None)[0];
                aa.Add(new AreaCharts() { period = date, sales = item.sales.GetValueOrDefault() });
            }
            return Json(aa, JsonRequestBehavior.AllowGet);
        }

        //Circle Graph
        public JsonResult GetTopProductSales()
        {
            var dataforchart = (from OD in db.OrderDetails
                                join P in db.Products
                                on OD.ProductID equals P.Id
                                select new { P.PName, OD.Quantity } into row
                                group row by row.PName into g
                                select new
                                {
                                    label = g.Key,
                                    value = g.Sum(x => x.Quantity)
                                })
                    .OrderByDescending(x => x.value)
                    .Take(3);
            return Json(dataforchart, JsonRequestBehavior.AllowGet);
        }


        //Line Grap
        public JsonResult GetOrderPerDay()
        {
            var data = from O in db.Orders
                       select new { Odate = EntityFunctions.TruncateTime(O.OrderDate), O.ID } into g
                       group g by g.Odate into col
                       select new
                       {
                           Order_Date = col.Key,
                           Count = col.Count(y => y.ID != null)
                       };
            List<LineCharts> aa = new List<LineCharts>();
            foreach (var item in data)
            {
                string date = item.Order_Date.ToString().Split(new[] { (' ') }, StringSplitOptions.None)[0];
                aa.Add(new LineCharts() { Date = date, Orders = item.Count });
            }
            return Json(aa, JsonRequestBehavior.AllowGet);
        }

        //Bar Grap
        public JsonResult GetSalesPerCountry()
        {
            var dataforBarchart = (from O in db.Orders
                                   join C in db.Coustomers
                                   on O.CustomerID equals C.Id
                                   select new { C.Country, O.TotalAmount } into row
                                   group row by row.Country into g
                                   select new
                                   {
                                       Country = g.Key,
                                       Sales_Amount = g.Sum(x => x.TotalAmount)
                                   })
                              .OrderByDescending(x => x.Sales_Amount)
                              .Take(6);
            return Json(dataforBarchart, JsonRequestBehavior.AllowGet);
        }

       
            
        }  
	
}