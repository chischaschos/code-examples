fn main() {
    let mut ns = vec![1, 2, 3];

    let mut largest_1 = ns[0];
    let largest_2 = &mut ns[0];

    println!("{:?}", largest_1);
    largest_1 += 1;
    println!("{:?}", largest_1);

    println!("{:?}", largest_2);
    *largest_2 += 1;
    println!("{:?}", ns);

    let mut v = vec![2, 4, 6];
    for i in &mut v {
        *i *= 2;
    }
    println!("{:?}", v);


    let mut v = vec![2, 4, 6];
    for i in &mut v {
        *i = &*i * 3;
    }
    println!("{:?}", v);
}
