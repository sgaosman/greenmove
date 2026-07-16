package com.gardenplanner;

import com.gardenplanner.service.GapAnalyser;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class GapAnalyserRunner implements ApplicationRunner {

    private final GapAnalyser gapAnalyser;

    public GapAnalyserRunner(GapAnalyser gapAnalyser) {
        this.gapAnalyser = gapAnalyser;
    }

    @Override
    public void run(ApplicationArguments args) {
        if (args.containsOption("analyse-gaps")) {
            gapAnalyser.run();
            System.exit(0);
        }
    }
}
