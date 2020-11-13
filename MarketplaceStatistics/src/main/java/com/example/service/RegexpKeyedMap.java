package com.example.service;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.regexp.RE;
import org.apache.regexp.RESyntaxException;

public class RegexpKeyedMap extends HashMap
{
    public Object put(Object key, Object value)
    {
        if (key instanceof String)
            return super.put(key, value);
        else
            throw new RuntimeException("RegexpKeyedMap - only accepts Strings as keys.");    
    }
        
    /**
     * The key passed in should always be a String.  The map will return the first element whose key, treated as a regular expression, matches the key passed in
     * NOTE: It is possible for this map to have more than one return value, for example, if a key is passed into get() which matches more than one regexp.
     * 
     * E.g., consider the following keys in the map - '[A-Za-z]*' and 'Hello'.  Passing in 'Hello' as a key to the get() method would match either of the regexps,
     * and whichever apears first in the map (which is indeterminate) will be returned. 
     *
     */
    public Object get(Object key)
    {
        Iterator regexps = keySet().iterator();
        String keyString;
        Object result = null;
        
        String stringToMatch = cleanKey( key );
        
        while (regexps.hasNext())
        {
            keyString = regexps.next().toString();
            try
            {
                RE regexp = new RE(keyString);
                if (regexp.match(stringToMatch))
                {
                    result = super.get(keyString);
                    break;
                }
            }
            catch (RESyntaxException e)
            {
                // invalid regexp.  ignore?
            }
        }
        return result;
    }
    
    /**
     * Strip any 'dirty' chars from the key we are searching for, 
     * otherwise we end up with funny results from the RE
     * 
     * @param obj
     * @return
     */
    private String cleanKey( Object obj )
    {
        String retVal = obj.toString();
        
        // remove any '^' from start of key - prevents the RE from matching !?!?  
        return ( retVal.charAt(0) == '^' )  ? retVal.substring(1) : retVal;
    }
    
}