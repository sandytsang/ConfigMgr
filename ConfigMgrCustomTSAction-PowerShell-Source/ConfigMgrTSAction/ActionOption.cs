using System;

using Microsoft.ConfigurationManagement.AdminConsole;
using Microsoft.ConfigurationManagement.AdminConsole.TaskSequenceEditor;


namespace ConfigMgrTSAction
{
    public partial class ActionOption : TaskSequenceOptionControl
    {
        public ActionOption() : base()
        {
            InitializeComponent();
        }
        public ActionOption(SmsPageData pageData) : base(pageData)
        {
            this.Title = Properties.Resources.ActionOptionPageTitle;
        }
    }
}
