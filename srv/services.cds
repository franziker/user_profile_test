using { sap.capire.user as my } from '../db/schema';



/**
 * Provides functionalities for user management
 */
service UserService {
    @odata.draft.enabled
        entity User as select from my.User;
    entity language as projection on my.language;
    entity image as projection on my.image;
  
    }
    
/**
 * Provides administrative functionalities for managing users
 */
service AdminServie {
    entity User as projection on my.User
}

