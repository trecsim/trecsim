using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Models
{
    public class VisJsEdge
    {
        public int from { get; set; }
        public int to { get; set; }

        public VisJsEdge(NodeLink link)
        {
            from = link.NodeId;
            to = link.LinkId;
        }
    }
}
