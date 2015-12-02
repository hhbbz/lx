/*--------------------------------------------------------------------------+
   $Id: EnumUtils.java 16749 2008-06-20 16:04:47Z deissenb $
 |                                                                          |
 | Copyright 2005-2008 Technische Universitaet Muenchen                     |
 |                                                                          |
 | Licensed under the Apache License, Version 2.0 (the "License");          |
 | you may not use this file except in compliance with the License.         |
 | You may obtain a copy of the License at                                  |
 |                                                                          |
 |    http://www.apache.org/licenses/LICENSE-2.                        |
 |                                                                          |
 | Unless required by applicable law or agreed to in writing, software      |
 | distributed under the License is distributed on an "AS IS" BASIS,        |
 | WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. |
 | See the License for the specific language governing permissions and      |
 | limitations under the License.                                           |
 +--------------------------------------------------------------------------*/
package aode.lx.utils;

/**
 * Utility class for enumerations.
 * 
 * @author Florian Deissenboeck
 * @author $Author: deissenb $
 * 
 * @version $Rev: 16749 $
 * @levd.rating GREEN Rev: 16749
 */
public class EnumUtils {

    /**
     * This works like {@link Enum#valueOf(Class, String)}
     * but returns <code>null</code> if constant wasn't found instead of
     * throwing an <code>IllegalArgumentException</code>.
     * 
     * @param enumType
     *            Enumeration class
     * @param constantName
     *            name of the constant
     * @return the matching constant or <code>null</code> if not found
     */
    public static <T extends Enum<T>> T valueOf(Class<T> enumType,
            String constantName) {
        try {
            T constant = Enum.valueOf(enumType, constantName);
            return constant;
        } catch (IllegalArgumentException ex) {
            return null;
        }
    }

    /**
     * Works like {@link #valueOf(Class, String)} but ignores case.
     * 
     * Worst case runtime is O('number of constants in enum').
     */
    public static <T extends Enum<T>> T valueOfIgnoreCase(Class<T> enumType,
            String constantName) {
        T[] constants = enumType.getEnumConstants();
        if (constants == null) {
            return null;
        }
        for (T constant : constants) {
            if (constant.name().equalsIgnoreCase(constantName)) {
                return constant;
            }
        }
        return null;
    }
}