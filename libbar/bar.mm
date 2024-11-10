#import <Foundation/Foundation.h>
#include "bar.h"
#import <FBLPromises/FBLPromises.h>

FBLPromise<NSNumber *> *testQuxPromise() {
    return [FBLPromise onQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) async:^(FBLPromiseFulfillBlock fulfill, FBLPromiseRejectBlock reject) {
        // Создаём экземпляр Bar и вызываем метод qux
        Bar bar;
        bool result = bar.qux();
        
        // Выполняем fulfill с результатом
        fulfill(@(result));
        
        // Если бы произошла ошибка, мы могли бы вызвать reject, например:
        // NSError *error = [NSError errorWithDomain:@"BarErrorDomain" code:100 userInfo:@{NSLocalizedDescriptionKey: @"Ошибка в qux"}];
        // reject(error);
    }];
}

// Функция для тестирования метода norf()
FBLPromise<NSNumber *> *testNorfPromise() {
    return [FBLPromise onQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) async:^(FBLPromiseFulfillBlock fulfill, FBLPromiseRejectBlock reject) {
        // Создаём экземпляр Bar и вызываем метод norf
        Bar bar;
        bool result = bar.norf();
        
        // Выполняем fulfill с результатом
        fulfill(@(result));
        
        // Если бы произошла ошибка, мы могли бы вызвать reject, например:
        // NSError *error = [NSError errorWithDomain:@"BarErrorDomain" code:101 userInfo:@{NSLocalizedDescriptionKey: @"Ошибка в norf"}];
        // reject(error);
    }];
}

bool Bar::qux()
{
    return true;
}

bool Bar::norf()
{
    return false;
}


