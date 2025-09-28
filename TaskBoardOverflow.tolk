tolk 1.1

struct Task {
    title: string;
    completed: bool;
}

struct Storage {
    tasks: map<address, Task>;
    count: uint32;
    description: string;
}

fun Storage.load() = Storage.fromCell(contract.getData());
fun Storage.save(self) = contract.setData(self.toCell());

fun addTask(title: string) {
    var st = Storage.load();
    let caller = get_caller();

    st.count += 1;
    st.tasks.set(caller, Task{title: title, completed: false});
    st.description = "Task board contract storing tasks per user in a map, causing storage to grow infinitely.";
    st.save();
}
