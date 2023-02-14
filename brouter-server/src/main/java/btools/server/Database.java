package btools.server;

import org.bson.Document;
import org.bson.types.ObjectId;
import java.util.List;
import java.util.Arrays;

import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.FindIterable;
import static com.mongodb.client.model.Filters.in;

public class Database {
  private static MongoCollection<Document> nogos;
  public enum NogoGroupType { region, nogoGroup }

  public static void init() {
    String uri = System.getenv("MONGODB_URL");
    if (uri == null) {
      uri = "mongodb://localhost:27017";
    }
    MongoClient mongoClient = MongoClients.create(uri);
    MongoDatabase database = mongoClient.getDatabase("safecycle");
    nogos = database.getCollection("nogos");
  }

  public static String getPolylinesByRegionsOrGroups(String[] ids, NogoGroupType groupType) {
    String polylines = "";
    Boolean firstObject = true;
    ObjectId[] objIds = Arrays.stream(ids).map(id -> new ObjectId(id)).toArray(ObjectId[]::new);
    FindIterable<Document> nogoIterable = nogos.find(in(groupType.toString(), objIds));
    MongoCursor<Document> cursor = nogoIterable.iterator();
    try {
      while (cursor.hasNext()) {
        Document nogo = cursor.next();
        Document lineString = nogo.get("lineString", Document.class);
        List<List<Double>> coords = (List<List<Double>>) lineString.get("coordinates");
        if (!firstObject) {
          polylines += "|";
        } else {
          firstObject = false;
        }
        for (int j = 0; j < coords.size(); j++) {
          List<Double> coord = coords.get(j);
          polylines += coord.get(0) + "," + coord.get(1) + ",";
        }
      }
    } finally {
      cursor.close();
    }
    return polylines;
  }
}
