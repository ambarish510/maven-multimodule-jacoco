package testPkgClassInMod3;

import org.testng.Assert;
import org.testng.annotations.Test;
import pkgClassInMod3.ClassInMod3;

public class TestClassInMod3 {
    ClassInMod3 sut = new ClassInMod3();

    @Test
    public void TestIsOddNumber(){
        Boolean result = sut.IsOddNumber(6);
        Assert.assertEquals(result,Boolean.FALSE,"IsOddNumber result is wrong");
    }

}
