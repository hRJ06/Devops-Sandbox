# CLI Command

```sh
terraform plan -var="ami=ami-02dfbd4ff395f2a1b"
terraform plan -var-file="prod.tfvars"
```

# Variable Precedence (H → L)
1. **CLI**
   - `-var`
   - `-var-file`

2. **Auto-loaded variable file**
   - `*.auto.tfvars`
   - `*.auto.tfvars.json`

3. **Default variable file**
   - `terraform.tfvars`
   - `terraform.tfvars.json`

4. **Environment variable**
   - `TF_VAR_<variable_name>`

5. **Default value in `variable` block**
