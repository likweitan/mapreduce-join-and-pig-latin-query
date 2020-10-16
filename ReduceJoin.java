import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

import java.io.IOException;

/**
 * Author: Jiankai Dang
 * Date: 11/22/13
 * Time: 5:35 PM
 */
public class Join {
    public static void main(String[] args) throws Exception {
        Job job = new Job(new Configuration());
        job.setJarByClass(Join.class);

        job.setNumReduceTasks(1);

        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(Text.class);

        job.setMapperClass(Map.class);
        job.setReducerClass(Reduce.class);

        job.setInputFormatClass(TextInputFormat.class);
        job.setOutputFormatClass(TextOutputFormat.class);

        FileInputFormat.addInputPaths(job, args[2] + "," + args[4]);
        FileOutputFormat.setOutputPath(job, new Path(args[6]));

        job.waitForCompletion(true);
    }

    public static class Map extends Mapper<LongWritable, Text, Text, Text> {
        public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
            String line = value.toString().trim();
            if (line.equals("")) {
                return;
            }

            if (line.contains("\"")) {
                int i = line.lastIndexOf(","), j = line.indexOf(",");
                context.write(new Text(line.substring(i + 1) + ",1"), new Text(line.substring(0, j) + "\t" + line.substring(j + 1, i)));
            } else {
                String[] s = line.split(",");
                context.write(new Text(s[0] + ",0"), new Text(s[1] + "\t" + s[2]));
            }
        }
    }

    public static class Reduce extends Reducer<Text, Text, Text, Text> {
        private String userInfo = null;

        public void reduce(Text key, Iterable<Text> values, Context context)
                throws IOException, InterruptedException {
            String keyStr = key.toString();
            if (keyStr.endsWith(",0")) {
                userInfo = values.iterator().next().toString();
            } else {
                for (Text val : values) {
                    context.write(new Text(keyStr.split(",")[0]), new Text(userInfo + "\t" + val.toString()));
                }
            }
        }
    }
}