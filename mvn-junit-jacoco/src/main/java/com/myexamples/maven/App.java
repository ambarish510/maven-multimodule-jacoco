package com.myexamples.maven;


import org.apache.commons.lang.StringUtils;
import java.util.Scanner;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {

        System.out.println( "provide a non numeric string :" );
        Scanner scanner = new Scanner(System.in);

        if(isNumeric(scanner.nextLine())){
            System.out.println("provided string is numeric");
        }else{
            System.out.println("provided string is valid");
        }
        scanner.close();
    }

    private static boolean isNumeric(String s) {
        return StringUtils.isNumeric(s);

    }
}
