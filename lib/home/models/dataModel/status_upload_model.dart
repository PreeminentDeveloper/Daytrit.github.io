

 import 'dart:io';

class StatusUploadModel { 

   String statusContent; 
   File statusMedia; 
  
   StatusUploadModel({ 
      
     this.statusContent = '', 
     required this.statusMedia, 
   }); 
  
  
  
   @override 
   String toString() => 
       'StatusUploadModel(statusContent: $statusContent, statusMedia: $statusMedia)'; 
 }