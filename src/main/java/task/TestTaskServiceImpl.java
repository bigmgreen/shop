package task;

import org.apache.log4j.Logger;
public class TestTaskServiceImpl {




    private static Logger logger = Logger.getLogger(TestTaskServiceImpl.class);
    public static void main(String[] args) {
        logger.debug(" This is debug!!!");
        logger.info(" This is info!!!");
        logger.warn(" This is warn!!!");
        logger.error(" This is error!!!");
        logger.fatal(" This is fatal!!!");
    }
}