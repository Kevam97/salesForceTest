public class localLaborWrapper {

	public class LocalLabor{
		public String status;
		public String labor_rate;
	}
	public List<LocalLabor> labors;
	public static localLaborWrapper parse(String json) {
		return (localLaborWrapper) System.JSON.deserialize(json, localLaborWrapper.class);
	}
}