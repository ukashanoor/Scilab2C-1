function INIT_RemoveDirs(FileInfo,SharedInfoRunMode)
// function INIT_RemoveDirs(FileInfo,SharedInfoRunMode)
// -----------------------------------------------------------------
// #RNU_RES_B
// Removes existing directories according to the RunMode
// specified by the user.
//
// Input data:
// FileInfo: structure containing all info about SCI2C files.
// SharedInfoRunMode: execution mode specified by the user in 
//                    the SCI2CInputParameters.sce file.
//
// Output data:
// ---
//
// #RNU_RES_E
// Status:
// 03-Jan-2008 -- Raffaele Nutricato: Author.
//
// Copyright 2008 Raffaele Nutricato.
// Contact: raffaele.nutricato@tiscali.it
// -----------------------------------------------------------------

// ------------------------------
// --- Check input arguments. ---
// ------------------------------
SCI2CNInArgCheck(argn(2),2,2);

// ----------------------------------------------------
// --- Remove previous versions of SCI2C files/dir. ---
// ----------------------------------------------------
if (SharedInfoRunMode == 'GenLibraryStructure' | SharedInfoRunMode == 'All')
   disp('Removing directory: '+FileInfo.WorkingDir);
   disp('Removing directory: '+FileInfo.OutCCCodeDir);
   // Remove software<->user interaction.
   // yesno=input('Are you sure [y/n]?','string');
   yesno = 'y';
   
   if (yesno=='y')      
      rmdir(FileInfo.WorkingDir,'s'); // delete WorkingDir if it exists due to previous translations...
      mdelete(FileInfo.OutCCCodeDir+'/*.h'); // delete .h files generated in previous translations (if any).
      mdelete(FileInfo.OutCCCodeDir+'/*.c'); // delete .c files generated in previous translations (if any).
      mdelete(FileInfo.OutCCCodeDir+'/*.cpp'); // delete .cpp files generated in previous translations (if any).
      mdelete(FileInfo.OutCCCodeDir+'/Makefile'); // delete .h files generated in previous translations (if any).
      // Note I don't delete includes, interfaces and and src directories to avoid recompiling them every time
      // a new translation is launched. I only delete source files generated by user.

   else
      SCI2Cerror('Cannot continue, because you don''t want to delete: '+FileInfo.WorkingDir);
      SCI2Cerror('Cannot continue, because you don''t want to delete: '+FileInfo.OutCCCodeDir);
   end
elseif (SharedInfoRunMode == 'Translate')
   // #RNU_RES_B
   //NUT: non cancella le cartelle dei file C creati nella iterazione precedente
   //NUT: occorre specificarlo bene nel manuale.
   // #RNU_RES_E
   disp('Removing directory: '+FileInfo.OutCCCodeDir);
   // Remove software<->user interaction.
   // yesno=input('Are you sure [y/n]?','string');
   yesno = 'y';
   if (yesno=='y')
      rmdir(FileInfo.OutCCCodeDir,'s');
   else
      SCI2Cerror('Cannot continue, because you don''t want to delete: '+FileInfo.OutCCCodeDir);
   end
else
   disp('Unknown RunMode: ""'+SharedInfoRunMode+'"".');
   disp('Please check RunMode parameter in the SCI2CInputParameters.sce file');
   SCI2Cerror(' ');
end

endfunction
