# Matlab

- Author：hongjh
- Time：20230531
- Version：

---------

[toc]

## fopen (打开文件)

![image-20230531230739648](MD_IMG/Matlab.assets/image-20230531230739648.png)

## fread (读取文件)

```matlab
## 将文件数据读取到维度为 sizeA 的数组 A 中，并将文件指针定位到最后读取的值之后。fread 按列顺序填充 A。根据 precision 描述的格式和大小解释文件中的值。
A = fread(fileID,sizeA,precision) 
```

![image-20230531231402603](MD_IMG/Matlab.assets/image-20230531231402603.png)

![image-20230531231446071](MD_IMG/Matlab.assets/image-20230531231446071.png)

## fprintf (将数据写入文件）

### 语法

```matlab
x = 0:.1:1;
A = [x; exp(x)];

fileID = fopen('exp.txt','w');
fprintf(fileID,'%6s %12s\n','x','exp(x)');
fprintf(fileID,'%6.2f %12.8f\n',A);
fclose(fileID);

## 第一个对 fprintf 的调用输出标题文本 x 和 exp(x)，第二个调用输出变量 A 的值。
```

### 格式操作符

格式化操作符以百分号 `%` 开头，以转换字符结尾。转换字符是必需的。您也可以在 `%` 和转换字符之间指定标识符、标志、字段宽度、精度和子类型操作符。（操作符之间的空格无效，在这里显示空格只是为了便于阅读。）

![image-20230531230024872](MD_IMG/Matlab.assets/image-20230531230024872.png)

### 转换字符

![image-20230531230044317](MD_IMG/Matlab.assets/image-20230531230044317.png)

### 标志

![image-20230531230241266](MD_IMG/Matlab.assets/image-20230531230241266.png)

### 特殊字符

![image-20230531230346466](MD_IMG/Matlab.assets/image-20230531230346466.png)

## 将16进制数写文件

```matlab
clear all;
clc;
data = randi([-128 127],1,256);% 产生随机的有符号数据 2^8(-128~127)
% 需要将负数转换为正数
for i = 1:length(data)
    if(data(i)<0)
        data_hex(i) = 2^8 + data(i);% 根据自己需要转换的位宽修改
    else
        data_hex(i) = data(i);
    end
end

%% 将有符号的十六进制数写入txt文件
fid = fopen('C:\Users\data_hex.txt', 'w+');
fprintf(fid,'%02x\n',data_hex(i));
fclose(fid);
```





