package testPkgClassInMain;

import org.testng.Assert;
import org.testng.annotations.Test;
import pkgClassInMain.ClassInMain;

public class TestClassInMain {
    ClassInMain sut = new ClassInMain();

    @Test
    public void TestIsEvenNumber(){
        Boolean result = sut.IsEvenNumber(5);
        Assert.assertEquals(result,Boolean.FALSE,"IsEvenNumber result is wrong");
    }

}
