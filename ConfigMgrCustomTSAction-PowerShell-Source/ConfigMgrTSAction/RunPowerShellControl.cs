#region

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Security.Permissions;

using Microsoft.ConfigurationManagement.AdminConsole;
using Microsoft.ConfigurationManagement.ManagementProvider;
using Microsoft.ConfigurationManagement.AdminConsole.TaskSequenceEditor;

#endregion


namespace ConfigMgrTSAction
{
    public partial class RunPowerShellControl : SmsOsdEditorPageControl
    {

        protected RunPowerShellControl()
        {
            InitializeComponent();
        }
        public RunPowerShellControl (SmsPageData pageData) : base(pageData)
        {
            this.Initialized = false;
            InitializeComponent();

            if (this.PropertyManager["RunPowerShell"].ObjectValue == null)
            {
                this.PropertyManager["RunPowerShell"].StringValue = string.Empty;
            }
            this.textBoxPowerShell.Text = this.PropertyManager["RunPowerShell"].StringValue;

            this.Initialized = true;

        }

        public override void InitializePageControl()
        {
            base.InitializePageControl();
        }


        protected override bool ApplyChanges(out Control errorControl, out bool showError)
        {
            // You can check the error here and return false.  
            if (this.HasError(out errorControl) == true)
            {
                this.ShowMessageBox(this.GetErrorString(),"Error",MessageBoxButtons.OK,MessageBoxIcon.Warning);
                errorControl = null;
                showError = true;
                return false;
            }

            this.PropertyManager["Name"].StringValue = textBoxName.Text;
            this.PropertyManager["Description"].StringValue = textBoxDescription.Text;
            this.PropertyManager["RunPowerShell"].StringValue = textBoxPowerShell.Text;

            return base.ApplyChanges(out errorControl, out showError);
        }

        /// <summary>
        /// Used to signal something happened on the page and determine the "dirty" flag state.
        /// </summary>
        private void DirtyControl_ValueChanged(object sender, EventArgs e)
        {
            this.SetDirty(true);
        }

        private void ConfigMgrTSActionControl_Load(object sender, EventArgs e)
        {
            textBoxName.Text = this.PropertyManager["Name"].StringValue;
            textBoxDescription.Text = this.PropertyManager["Description"].StringValue;
            textBoxPowerShell.Text = this.PropertyManager["RunPowerShell"].StringValue;

            if (this.Initialized == false)
            {
                return;
            }

            if (string.Equals(this.PropertyManager["Name"].StringValue, this.textBoxName.Text, StringComparison.OrdinalIgnoreCase) == false ||
                string.Equals(this.PropertyManager["Description"].StringValue, this.textBoxDescription.Text, StringComparison.OrdinalIgnoreCase) == false ||
                string.Equals(this.PropertyManager["RunPowerShell"].StringValue, this.textBoxPowerShell.Text, StringComparison.OrdinalIgnoreCase) == false)
            {
                base.SetDirty(true);
            }

            base.SetDirty(false);
        }

        private void textBoxName_TextChanged(object sender, EventArgs e)
        {
            this.SetDirty(true);
        }

        private void textBoxDescription_TextChanged(object sender, EventArgs e)
        {
            this.SetDirty(true);
        }

        private void textBoxPowerShell_TextChanged(object sender, EventArgs e)
        {
            this.SetDirty(true);
        }
    }
}
