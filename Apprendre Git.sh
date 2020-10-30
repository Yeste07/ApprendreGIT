Git : le control de version


#1)Creation du dossier de projet sur le local.
#2)Cibler le dossier avec la commande init.

YESTE@IT-Engineer MINGW64 /
$ cd D:\PremierProjet

YESTE@IT-Engineer MINGW64 /d/PremierProjet
$ git init
Initialized empty Git repository in D:/PremierProjet/.git/

YESTE@IT-Engineer MINGW64 /d/PremierProjet (master)

#3) to point vers un depot a distant github.

YESTE@IT-Engineer MINGW64 /d/PremierProjet (master)
$ git remote add OPENCLASS https://github.com/OpenClassrooms-Student-Center/ProjetOpenSource.git

YESTE@IT-Engineer MINGW64 /d/PremierProjet (master)
$

#4) cloner le contenu de projet de depot github vers le dossier local.

YESTE@IT-Engineer MINGW64 /d/PremierProjet (master)
$ git clone https://github.com/OpenClassrooms-Student-Center/ProjetOpenSource.git
Cloning into 'ProjetOpenSource'...
remote: Enumerating objects: 7, done.
remote: Total 7 (delta 0), reused 0 (delta 0), pack-reused 7
Receiving objects: 100% (7/7), done.

YESTE@IT-Engineer MINGW64 /d/PremierProjet (master)


#5) Apprendre le système branch : creation branch pour toute modification temporaire puis on lapplique sur branch
   principal master. 
 
 git branch edev   [pour creation de la branch dev]
 git branch        [pour afficher toute les branchs]

 YESTE@IT-Engineer MINGW64 /d/Test (master)
$ git branch
  dev
* master
  preprod
  recette

 git checkout dev [pour ce deplacer vers la branch dev]

YESTE@IT-Engineer MINGW64 /d/Test (master)
$ git checkout dev
Switched to branch 'dev'
D       PremierFichier.txt.txt

YESTE@IT-Engineer MINGW64 /d/Test (dev)
$ git branch
* dev
  master
  preprod
  recette

#6) voir le status Git : phase de preparation de contenu

YESTE@IT-Engineer MINGW64 /d/Test (dev)
$ git status
On branch dev
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    PremierFichier.txt.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        PremierFichierDev.txt

no changes added to commit (use "git add" and/or "git commit -a")

#7) ajout de fichier txt : phase numéro 1

YESTE@IT-Engineer MINGW64 /d/Test (dev)
$ git add PremierFichierDev.txt

YESTE@IT-Engineer MINGW64 /d/Test (dev)
$ git status
On branch dev
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   PremierFichierDev.txt

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    PremierFichier.txt.txt

#8) commit la modification : phase numero 2

YESTE@IT-Engineer MINGW64 /d/Test (dev)
$ git commit -m "Creation du fichier de dev"
[dev 6bb9c58] Creation du fichier de dev
 1 file changed, 1 insertion(+)
 create mode 100644 PremierFichierDev.txt

#9) push la modification : phase numero 3 (mais avant il faut faire un git remote add ... to specifier le deport distant)
YESTE@IT-Engineer MINGW64 /d/Test (dev)
$ git push
fatal: No configured push destination.
Either specify the URL from the command-line or configure a remote repository using

    git remote add <name> <url>

and then push using the remote name

    git push <name>

#10) le merge de la branch dev avec la branch master.(merge= master+modification de dev) 

YESTE@IT-Engineer MINGW64 /d/Test (dev)
$ git checkout master
Switched to branch 'master'
D       PremierFichier.txt.txt

YESTE@IT-Engineer MINGW64 /d/Test (master)
$ git merge dev
Updating 3c7143a..6bb9c58
Fast-forward
 PremierFichierDev.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 PremierFichierDev.txt

#11)Supprimer un commit dans la branch master.

YESTE@IT-Engineer MINGW64 /d/Test (recette)
$ git checkout master
Switched to branch 'master'
D       PremierFichier.txt.txt

YESTE@IT-Engineer MINGW64 /d/Test (master)
$ git log
commit 6bb9c580fe5803bc4a6914a51be26e2ad817f75d (HEAD -> master, dev)
Author: Yassine Sadellah <Yassine Sadellah>
Date:   Fri Oct 30 19:17:26 2020 +0100

    Creation du fichier de dev

commit 3c7143a848a2ec7b12854078f4e225e2d90522c2 (recette, preprod)
Author: Yassine Sadellah <Yassine Sadellah>
Date:   Fri Oct 30 19:07:32 2020 +0100

    ajout de la balise script

commit 056e94148ac91f2faf92dffff2248e1fd3c679d2
Author: Yassine Sadellah <Yassine Sadellah>
Date:   Fri Oct 30 19:01:25 2020 +0100

    first commit

YESTE@IT-Engineer MINGW64 /d/Test (master)
$ git reset --hard 3c7143a848a2ec
HEAD is now at 3c7143a ajout de la balise script

YESTE@IT-Engineer MINGW64 /d/Test (master)
$ git log
commit 3c7143a848a2ec7b12854078f4e225e2d90522c2 (HEAD -> master, recette, preprod)
Author: Yassine Sadellah <Yassine Sadellah>
Date:   Fri Oct 30 19:07:32 2020 +0100

    ajout de la balise script

commit 056e94148ac91f2faf92dffff2248e1fd3c679d2
Author: Yassine Sadellah <Yassine Sadellah>
Date:   Fri Oct 30 19:01:25 2020 +0100

    first commit

#12)modifier le message de dernier commit

git commit -m 'firstCommit'
git commit --amend - 'stepnumber1' [Cette commande permet de modifier mon message commit]



