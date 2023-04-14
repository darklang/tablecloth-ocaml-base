To deploy to opam

- update /tablecloth-base.opam to version x.y.z
- git tag -f x.y.z
- git push origin x.y.z
- opam-publish tablecloth-base -v x.y.z https://github.com/darklang/tablecloth/archive/x.y.z.tar.gz
- make the pull request work
