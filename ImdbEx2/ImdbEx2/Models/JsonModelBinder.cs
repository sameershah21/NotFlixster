using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Net;
using System.Web.Http.ModelBinding;
using System.Web.Mvc;
using System.IO;

namespace ImdbEx2.Models
{

    //public class JsonModelBinder : System.Web.Mvc.IModelBinder
    //{
    //    public object BindModel(ControllerContext controllerContext, System.Web.Mvc.ModelBindingContext bindingContext)
    //    {
    //        RootObject model;

    //        if (controllerContext.RequestContext.HttpContext.Request.AcceptTypes.Contains("application/json"))
    //        {
    //            var serializer = new JavaScriptSerializer();
    //            var form = controllerContext.RequestContext.HttpContext.Request.Form.ToString();
    //            model = serializer.Deserialize<RootObject>(HttpUtility.UrlDecode(form));
    //        }
    //        else
    //        {
    //            model = (RootObject)ModelBinders.Binders.DefaultBinder.BindModel(controllerContext, bindingContext);
    //        }

    //        return model;
    //    }
    //}








    public class JsonModelBinder : System.Web.Mvc.DefaultModelBinder
    {

        /// <summary>
        /// To bind the Model to the controller. Checks if the data is indeed json type and deserialiizes it. A global entry has been made in application_start() 
        /// </summary>
        /// <param name="controllerContext"></param>
        /// <param name="bindingContext"></param>
        /// <returns></returns>
        public override object BindModel(ControllerContext controllerContext, System.Web.Mvc.ModelBindingContext bindingContext)
        {
            if (!IsJSONRequest(controllerContext))
            {
                return base.BindModel(controllerContext, bindingContext);
            }

            // Get the JSON data that's been posted
            var request = controllerContext.HttpContext.Request;
            var jsonStringData = new StreamReader(request.InputStream).ReadToEnd();

            //Use the built-in serializer 
            return new JavaScriptSerializer().Deserialize(jsonStringData, bindingContext.ModelMetadata.ModelType);
        }
          

        private static bool IsJSONRequest(ControllerContext controllerContext)
        {
            var contentType = controllerContext.HttpContext.Request.ContentType;
            return contentType.Contains("json");
        }


    }
}