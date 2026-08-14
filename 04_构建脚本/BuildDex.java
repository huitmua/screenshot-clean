import brut.androlib.mod.SmaliMod;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.writer.builder.DexBuilder;
import com.android.tools.smali.dexlib2.writer.io.FileDataStore;
import java.io.File;

public class BuildDex {
    public static void main(String[] args) throws Exception {
        File smaliDir = new File(args[0]);
        int api = Integer.parseInt(args[1]);
        File outFile = new File(args[2]);
        Opcodes opcodes = new Opcodes(api, api >= 35 ? 15 : api >= 34 ? 14 : 12);
        DexBuilder dexBuilder = new DexBuilder(opcodes);
        int[] count = {0};
        walk(smaliDir, dexBuilder, api, count);
        dexBuilder.writeTo(new FileDataStore(outFile));
        System.out.println("DONE, files=" + count[0] + ", dex=" + outFile.length());
    }

    static void walk(File dir, DexBuilder db, int api, int[] count) throws Exception {
        File[] files = dir.listFiles();
        if (files == null) return;
        for (File f : files) {
            if (f.isDirectory()) {
                walk(f, db, api, count);
            } else if (f.getName().endsWith(".smali")) {
                boolean ok = SmaliMod.assembleSmaliFile(f, db, api);
                if (!ok) {
                    System.err.println("ASSEMBLE FAILED: " + f);
                    System.exit(1);
                }
                count[0]++;
            }
        }
    }
}