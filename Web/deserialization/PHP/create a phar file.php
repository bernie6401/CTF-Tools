<?php
    class Cat{
        // 不用管是什麼
        $phar = new Phar("pharfile.phar");
        $phar->startBuffering();
        $phar->setStub("<?php __HALT_COMPILER(); ?>");

        // 以下部分發揮創意
        $c = new Cat();
        $phar->setMetadata($c);
        $phar->addFromString("meow.txt", "test");
        $phar->stopBuffering();
    }
?>