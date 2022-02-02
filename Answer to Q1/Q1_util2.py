from tensorflow.keras.datasets import mnist
from tensorflow.keras.utils import to_categorical
from tensorflow.keras.models import Sequential  
from tensorflow.keras.layers import Dense       

def mnist_data():
    (train_images, train_labels), (test_images, test_labels) = mnist.load_data()
    x_train = train_images.reshape((60000, 28 * 28)) 
    x_train = x_train.astype('float32') / 255   
    x_test = test_images.reshape((10000, 28 * 28))  
    x_test = x_test.astype('float32') / 255         
    y_train = to_categorical(train_labels)  
    y_test  = to_categorical(test_labels) 
    return (x_train, x_test), (y_train, y_test)

def mnist_model():
    model = Sequential()                 
    model.add(Dense(512, activation='relu', input_dim= 784)) 
    model.add(Dense(10, activation='softmax'))     
    model.compile(optimizer='rmsprop',            
                  loss='categorical_crossentropy', 
                  metrics=['acc'])                 
    return model

###################################################################

import matplotlib.pyplot as plt

def plot(history_dict, keys, title=None, xyLabel=[], ylim=(), size=()):
    lineType = ('-', '--', '.', ':')    
    if len(ylim)==2: plt.ylim(*ylim)    
    if len(size)==2: plt.gcf().set_size_inches(*size)  
    epochs = range(1, len(history_dict[keys[0]])+1)  
    for i in range(len(keys)):   
        plt.plot(epochs, history_dict[keys[i]], lineType[i])  
    if title:   
        plt.title(title)
    if len(xyLabel)==2:  
        plt.xlabel(xyLabel[0])
        plt.ylabel(xyLabel[1])
    plt.legend(keys, loc='best') 
    plt.show()  
