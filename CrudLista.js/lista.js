class Node {
    constructor(value, next) {
        this.value = value;
        this .next = next;
    }
}

class LinkedList {
    constructor() {
        this.head = null;
    }
}

insertNode(value){
    const newNode = new Node (value,null);
    if (this.head === null) {
        this.head = newNode;
        return
    }
    let current = this.head;
    while (current.net) {
        current = current.next;
    }
    current.next = newNode;
}