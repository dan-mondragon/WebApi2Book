using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApi2Book.Web.Api.MainTenanceProcessing;
using WebApi2Book.Web.Api.Models;
using WebApi2Book.Web.Common;
using WebApi2Book.Web.Common.Routing;

namespace WebApi2Book.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilterAttribute]
    [ApiVersion1RoutePrefix("tasks")]
    public class TasksController : ApiController
    {
        private readonly IAddTaskMaintenanceProcessor _addTaskMaintennaceProcessor;

        public TasksController(IAddTaskMaintenanceProcessor addTaskMaintennaceProcessor)
        {
            _addTaskMaintennaceProcessor = addTaskMaintennaceProcessor;
        }

        [Route("", Name = "AddTaskRoute")]
        [HttpPost]
        public Task AddTask(HttpRequestMessage requesteMessage, NewTask newTask)
        {
            var task = _addTaskMaintennaceProcessor.AddTask(newTask);
            return task;
        }
    }
}
