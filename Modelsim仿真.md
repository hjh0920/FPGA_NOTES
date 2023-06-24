- author：hongjh
- time：2021
- version:

---------

[toc]

# Quartus 联合 Modelsim

​		这里使用的版本是：

- Quartus Prime 18.1.0.222 Pro Edition

- Modelsim - INTEL FPGA STARTER EDITION 10.6d

  由于直接使用quartus安装时自带的modelsim，所以不需要单独进行Altera库的安装，直接新建工程即可仿真

注：quartus pro版本与modelsim目前所知道最简单的仿真方法就是使用quartus安装时下载的modelsim进行独立仿真，操作步骤如下：



## 新建工程

1. 在电脑上新建个文件夹，用来存放modelsim工程
2. 从windows开始菜单里打开modelsim软件

<img src="MD_IMG/Modelsim仿真.assets/image-20211105235512769.png" alt="image-20211105235512769" style="zoom: 80%;" />

2. 更改modelsim目录到新建的文件夹下

<img alt="20211108000445532" src="MD_IMG/Modelsim仿真.assets/image-20211108000445532.png"  />

3. 新建工程，点击 Add Existing File（添加所有要仿真的文件）

<img alt="20211108003308888" src="MD_IMG/Modelsim仿真.assets/image-20211108003308888.png"  />

4. 编译所有

<img src="MD_IMG/Modelsim仿真.assets/image-20211108001002004.png" alt="image-20211108001002004" style="zoom:80%;" />

5. 然后在命令行窗口输入下面语句，其中将 **work.zerodly_data_gen_tb** 改为 **work.+ 你要仿真的文件名**

```
vsim -L work   -L cyclone10gx_ver -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver -t ps -novopt work.top_scaler_tb  -t ns
```

6. 添加要观察的信号到波形窗口，命令行输入 **view wave**，命令行输入**run 1 ns**，即可观察波形
7. 每次修改代码，直接compile更改的文件 -> restart -> run

<img alt="20211108132118081" src="MD_IMG/Modelsim仿真.assets/image-20211108132118081.png"  />

8. 可以保存波形窗口格式，下次仿真==直接加载 **.do文件**，然后restart -> run==即可，不用再重新添加信号

## 仿真已有工程

**File -> Library -> a map to an existing library -> compile -> 命令行输入 view wave -> load do文件 -> run**

<img alt="20211106000209355" src="MD_IMG/Modelsim仿真.assets/image-20211106000209355.png"  />

# Vivado 联合 Modelsim

这里使用的版本是：

- Vivado 2019.1
- Modelsim SE-64 2020.4

## Modelsim 安装

1. 复制MentorKG.exe，mgls64.dll以及patch64_dll.bat这三个文件到Modelsim安装目录的win64文件夹下，如E:\modeltech64_2020.4\win64
2. 双击win64文件夹内粘贴过去的patch64_dll.bat文件，会生成LICENSE.TXT，另存到安装目录
3. 设置系统环境变量，变量值为LICENSE.TXT的路径   变量名：LM_LICENSE_FILE   变量值：E:\modeltech64_2020.4\LICENSE.TXT
4. 完成

## 联合 Vivado

1. 生成库文件

   ![image-20230624200514627](MD_IMG/Modelsim仿真.assets/image-20230624200514627.png)

2. 从库文件夹里的 modelsim.ini 文件中复制如下内容

   ![image-20230624201226528](MD_IMG/Modelsim仿真.assets/image-20230624201226528.png)

3. 将 modelsim 根目录下 modelsim.ini 文件属性只读关闭

4. 粘贴刚刚复制的内容到该文件的如下位置，然后保存，勾选只读

   ![image-20230624201314875](MD_IMG/Modelsim仿真.assets/image-20230624201314875.png)

5. Vivado 设置

   ![image-20230624201449182](MD_IMG/Modelsim仿真.assets/image-20230624201449182-1687608911932-1.png)

   ![image-20230624201515411](MD_IMG/Modelsim仿真.assets/image-20230624201515411.png)

6. 可以仿真了
