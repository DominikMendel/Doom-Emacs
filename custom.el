(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-custom-commands
   '(("ot" "Overview test"
      ((agenda ""
               ((org-agenda-span 'day)
                (org-super-agenda-groups
                 '((:name "Today" :time-grid t :date today :todo "TODAY" :scheduled today :order 1)))))
       (alltodo ""
                ((org-agenda-overriding-header "")
                 (org-super-agenda-groups
                  '((:name "Next to do" :todo "NEXT" :order 4)
                    (:name "Important" :tag "Important" :priority "A" :order 6)
                    (:name "Due Today" :deadline today :order 2)
                    (:name "Due Soon" :deadline future :order 8)
                    (:name "Overdue" :deadline past :face error :order 7)
                    (:name "Projects" :tag "Project" :order 10)
                    (:name "Questions" :todo "QUESTION" :order 15)
                    (:name "Inprogress" :todo "INPROGRESS" :order 3)
                    (:name "In review" :todo "IN-REVIEW" :order 14)
                    (:name "Waiting" :todo "WAITING" :order 20)
                    (:name "Some day" :todo "SOMEDAY" :order 25)
                    (:name "Trivial" :priority<= "C" :tag
                     ("Trivial" "Unimportant")
                     :todo
                     ("SOMEDAY")
                     :order 90)
                    (:name "Everything else" :anything t :auto-tags t :order 89)
                    (:discard
                     (:tag
                      ("Chore" "Routine" "Daily")))))))))
     ("p" "Projects"
      ((let
           (org-super-agenda-groups
            `((:name "Projects" :childrent t)
              (:discard
               (:anything t)))))))))
 '(org-agenda-files
   '("/home/dominik/Dropbox/org/roam/website/developer.tcgplayer.com-tcgplayer_apis_developer_community_and_documentation.org" "/home/dominik/Dropbox/org/roam/website/orgmode.org-java_source_code_blocks_in_org_mode.org" "/home/dominik/Dropbox/org/roam/website/orgmode.org-org_tutorial_for_tables.org" "/home/dominik/Dropbox/org/roam/website/orgmode.org-template_expansion_the_org_manual.org" "/home/dominik/Dropbox/org/roam/website/orgmode.org-the_clock_table_the_org_manual.org" "/home/dominik/Dropbox/org/roam/website/orgmode.org-the_org_manual.org" "/home/dominik/Dropbox/org/roam/website/www.ianjones.us-own_your_second_brain_set_up_org_roam_on_your_own_machine.org" "/home/dominik/Dropbox/org/roam/website/www.orgroam.com-org_roam_user_manual.org" "/home/dominik/Dropbox/org/roam/aeneas.org" "/home/dominik/Dropbox/org/roam/android_studio_keybindings.org" "/home/dominik/Dropbox/org/roam/apostle_paul.org" "/home/dominik/Dropbox/org/roam/arch_linux.org" "/home/dominik/Dropbox/org/roam/arch_linux_commands.org" "/home/dominik/Dropbox/org/roam/arch_linux_programs.org" "/home/dominik/Dropbox/org/roam/asynchronous.org" "/home/dominik/Dropbox/org/roam/babel.org" "/home/dominik/Dropbox/org/roam/beatrice.org" "/home/dominik/Dropbox/org/roam/charon.org" "/home/dominik/Dropbox/org/roam/chizuru.org" "/home/dominik/Dropbox/org/roam/chris_lancaster.org" "/home/dominik/Dropbox/org/roam/coding.org" "/home/dominik/Dropbox/org/roam/coding_concepts.org" "/home/dominik/Dropbox/org/roam/dante.org" "/home/dominik/Dropbox/org/roam/dired.org" "/home/dominik/Dropbox/org/roam/divine_comedy.org" "/home/dominik/Dropbox/org/roam/divine_comedy_character.org" "/home/dominik/Dropbox/org/roam/doom_theme.org" "/home/dominik/Dropbox/org/roam/elijah.org" "/home/dominik/Dropbox/org/roam/emacs.org" "/home/dominik/Dropbox/org/roam/emacs_define_global_abbrevition.org" "/home/dominik/Dropbox/org/roam/emacs_keybindings.org" "/home/dominik/Dropbox/org/roam/emacs_language_selection.org" "/home/dominik/Dropbox/org/roam/emacs_literate_configuration.org" "/home/dominik/Dropbox/org/roam/emacs_spellcheck.org" "/home/dominik/Dropbox/org/roam/encryption.org" "/home/dominik/Dropbox/org/roam/finance.org" "/home/dominik/Dropbox/org/roam/genki_book_1.org" "/home/dominik/Dropbox/org/roam/genki_chapter_1.org" "/home/dominik/Dropbox/org/roam/getting_yourself_organized_with_org_mode.org" "/home/dominik/Dropbox/org/roam/gpg.org" "/home/dominik/Dropbox/org/roam/indexes.org" "/home/dominik/Dropbox/org/roam/inferno.org" "/home/dominik/Dropbox/org/roam/inferno_canto_1.org" "/home/dominik/Dropbox/org/roam/inferno_canto_2.org" "/home/dominik/Dropbox/org/roam/inferno_canto_3.org" "/home/dominik/Dropbox/org/roam/inferno_canto_4.org" "/home/dominik/Dropbox/org/roam/japanese.org" "/home/dominik/Dropbox/org/roam/kanji.org" "/home/dominik/Dropbox/org/roam/luciano.org" "/home/dominik/Dropbox/org/roam/luciano_notes.org" "/home/dominik/Dropbox/org/roam/magit.org" "/home/dominik/Dropbox/org/roam/mother.org" "/home/dominik/Dropbox/org/roam/mother_marry.org" "/home/dominik/Dropbox/org/roam/org.org" "/home/dominik/Dropbox/org/roam/org_agenda.org" "/home/dominik/Dropbox/org/roam/org_archive.org" "/home/dominik/Dropbox/org/roam/org_clocktable.org" "/home/dominik/Dropbox/org/roam/org_keybindings.org" "/home/dominik/Dropbox/org/roam/org_noter.org" "/home/dominik/Dropbox/org/roam/org_roam.org" "/home/dominik/Dropbox/org/roam/org_tables.org" "/home/dominik/Dropbox/org/roam/org_tags.org" "/home/dominik/Dropbox/org/roam/org_workflow_ideas.org" "/home/dominik/Dropbox/org/roam/paradise_lost.org" "/home/dominik/Dropbox/org/roam/paradiso.org" "/home/dominik/Dropbox/org/roam/pdf_viewer.org" "/home/dominik/Dropbox/org/roam/people.org" "/home/dominik/Dropbox/org/roam/personal_agenda.org" "/home/dominik/Dropbox/org/roam/purgatorio.org" "/home/dominik/Dropbox/org/roam/readings.org" "/home/dominik/Dropbox/org/roam/scraping_tcgplayer_project.org" "/home/dominik/Dropbox/org/roam/spencer.org" "/home/dominik/Dropbox/org/roam/ssg_work.org" "/home/dominik/Dropbox/org/roam/st_lucia.org" "/home/dominik/Dropbox/org/roam/sunshine_games.org" "/home/dominik/Dropbox/org/roam/synchronous.org" "/home/dominik/Dropbox/org/roam/testcrypt.org" "/home/dominik/Dropbox/org/roam/testcrypthost.org" "/home/dominik/Dropbox/org/roam/testing.org" "/home/dominik/Dropbox/org/roam/testing22.org" "/home/dominik/Dropbox/org/roam/vim_keybindings.org" "/home/dominik/Dropbox/org/roam/virgil.org" "/home/dominik/Dropbox/org/roam/vispero.org" "/home/dominik/Dropbox/org/roam/vispero_bugzilla.org" "/home/dominik/Dropbox/org/roam/journal/Journal 2021-08.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:slant italic))))
 '(font-lock-keyword-face ((t (:slant italic)))))
