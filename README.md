# Terraform - Sleety's POV
- HCL: Hashicorp Configuration Language
- .tf - terraform configuration files
- .tfstate - records infrastructure state to match the defined state

# hcl syntax
```hcl
<block> <parameter> {
    key=value
}
```

# Terraform workflow
**FIRSTLY** create .tf script
1. init - initialise tf by downloading plugins
2. plan - review and verify changes; works like diff
3. apply - once ready, apply
4. destroy - destroy/discard infrastructure resources
>Note: show - to show resources created/changed

# Terraform characteristics
- Terraform follows an **immutable infrastructure** approach, the file was recreated although the contents are the same.
- Infrastructure as Code to provision resources.

# Resources used
- [Youtube](https://www.youtube.com/watch?v=YcJ9IeukJL8)
- [KodeKloud](https://learn.kodekloud.com/user/courses/udemy-labs-terraform-for-beginners/)
