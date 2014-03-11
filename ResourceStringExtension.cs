using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Markup;

namespace MkGitkeep {
    [MarkupExtensionReturnTypeAttribute(typeof(string))]
    class ResourceStringExtension : MarkupExtension {

        string key;

        public ResourceStringExtension(string key) {
            this.key = key;
        }

        public override object ProvideValue(IServiceProvider serviceProvider) {
            if (string.IsNullOrEmpty(this.key)) {
                return "";
            }
            return Properties.Resources.ResourceManager.GetString(key) ?? "";
        }
    }
}
