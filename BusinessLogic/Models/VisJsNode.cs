using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Models
{
    public class VisJsNode
    {
        public int id { get; set; }
        public string label { get; set; }
        public int group { get; set; }
        public int value { get; set; }

        public VisJsNode(Node node, List<NodeLink> links)
        {
            id = node.Id;
            label = $"{id}";
            value = node.Id;
            group = links.Count(link => link.NodeId == id);
        }
    }
}
