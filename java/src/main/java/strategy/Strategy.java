package strategy;

public interface Strategy<T> {
    T execute(T value);
}
