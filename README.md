# Classificação de Formas Geométricas com Redes Neuronais

## 📋 Descrição

Este projeto implementa um sistema de classificação de formas geométricas utilizando redes neuronais feedforward em MATLAB. O sistema é capaz de identificar e classificar seis tipos diferentes de formas: círculo, papagaio (kite), paralelogramo, quadrado, trapézio e triângulo.

## 🎯 Objetivos

- Implementar e treinar redes neuronais feedforward para reconhecimento de formas geométricas
- Explorar diferentes configurações de rede (topologias, funções de ativação, funções de treino)
- Avaliar o desempenho das redes em diferentes conjuntos de dados
- Comparar resultados entre múltiplas arquiteturas de rede

## 📁 Estrutura do Projeto

```
TPCR2425/
├── README.md                    # Este ficheiro
├── .gitignore                   # Ficheiros a ignorar no Git
│
├── docs/                        # Documentação do projeto
│   ├── RelatorioCR.docx        # Relatório do trabalho
│   └── TP2_IIA_2425.pdf        # Enunciado do trabalho
│
├── scripts/                     # Scripts MATLAB
│   ├── convertImage_*.m        # Funções de conversão de imagens
│   │   ├── convertImage_all.m  # Carrega todas as imagens (start, train, test)
│   │   ├── convertImage_start.m # Carrega imagens da pasta start
│   │   ├── convertImage_train.m # Carrega imagens da pasta train
│   │   ├── convertImage_test.m  # Carrega imagens da pasta test
│   │   └── convertImage_draw.m  # Carrega imagens da pasta draw
│   │
│   ├── train_*.m               # Scripts de treino
│   │   ├── train_start_a.m     # Treino com dados start (alínea a)
│   │   ├── train_train_b.m     # Treino com dados train (alínea b)
│   │   ├── train_test_c_i.m    # Teste com dados test (alínea c.i)
│   │   ├── train_test_c_ii.m   # Teste com dados test (alínea c.ii)
│   │   └── train_all_c_iii.m    # Treino com todos os dados (alínea c.iii)
│   │
│   ├── test_draw_d.m           # Teste com imagens desenhadas (alínea d)
│   └── app.mlapp               # Aplicação MATLAB App Designer
│
├── models/                     # Modelos de rede neural treinados
│   ├── rede_top_73_162459.mat  # Rede com 73% de precisão
│   ├── rede_top_64_152746.mat  # Rede com 64% de precisão
│   └── rede_top_62_162036.mat  # Rede com 62% de precisão
│
├── draw/                       # Imagens desenhadas manualmente
│   ├── circle/
│   ├── kite/
│   ├── parallelogram/
│   ├── square/
│   ├── trapezoid/
│   └── triangle/
│
├── start/                      # Conjunto inicial de imagens (5 por classe)
│   ├── circle/
│   ├── kite/
│   ├── parallelogram/
│   ├── square/
│   ├── trapezoid/
│   └── triangle/
│
├── train/                      # Conjunto de treino (50 por classe)
│   ├── circle/
│   ├── kite/
│   ├── parallelogram/
│   ├── square/
│   ├── trapezoid/
│   └── triangle/
│
└── test/                       # Conjunto de teste (10 por classe)
    ├── circle/
    ├── kite/
    ├── parallelogram/
    ├── square/
    ├── trapezoid/
    └── triangle/
```

## 🔧 Requisitos

- **MATLAB R2018b ou superior** (com Neural Network Toolbox)
- Toolboxes necessárias:
  - Neural Network Toolbox
  - Image Processing Toolbox

## 📊 Conjuntos de Dados

O projeto utiliza quatro conjuntos de imagens:

1. **start/** - 5 imagens por classe (total: 30 imagens)
   - Usado para treino inicial e testes rápidos

2. **train/** - 50 imagens por classe (total: 300 imagens)
   - Conjunto principal de treino

3. **test/** - 10 imagens por classe (total: 60 imagens)
   - Conjunto de teste para avaliação final

4. **draw/** - 5 imagens por classe (total: 30 imagens)
   - Imagens desenhadas manualmente para teste adicional

### Classes de Formas

- `circle` - Círculo
- `kite` - Papagaio
- `parallelogram` - Paralelogramo
- `square` - Quadrado
- `trapezoid` - Trapézio
- `triangle` - Triângulo

## 🚀 Como Usar

### 1. Preparação dos Dados

As imagens são automaticamente processadas pelas funções `convertImage_*.m`:
- Conversão para escala de cinzentos (se necessário)
- Redimensionamento para 25x25 pixels
- Binarização das imagens
- Conversão para vetores coluna

### 2. Treino de Redes Neuronais

#### Alínea A - Treino com dados START
```matlab
cd scripts
train_start_a
```
Treina uma rede com o conjunto inicial (start) e explora diferentes topologias.

#### Alínea B - Treino com dados TRAIN
```matlab
cd scripts
train_train_b
```
Treina redes com o conjunto de treino completo, explorando:
- Diferentes topologias (número de neurónios e camadas)
- Diferentes funções de ativação (tansig, logsig, purelin)
- Diferentes funções de treino (trainlm, traingd, etc.)
- Diferentes rácios de divisão treino/validação/teste

#### Alínea C - Testes e Avaliação
```matlab
cd scripts
train_test_c_i      % Avalia redes treinadas no conjunto de teste
train_test_c_ii     % Treina redes com dados de teste e avalia em todos os conjuntos
train_all_c_iii     % Treina redes com todos os dados (start + train + test)
```

#### Alínea D - Teste com Imagens Desenhadas
```matlab
cd scripts
test_draw_d
```
Avalia o desempenho das redes com imagens desenhadas manualmente.

### 3. Uso da Aplicação

Execute o ficheiro `scripts/app.mlapp` no MATLAB App Designer para uma interface gráfica interativa.

**Nota**: Certifique-se de executar os scripts a partir da pasta `scripts/` ou adicione a pasta `scripts/` ao path do MATLAB.

## 📈 Resultados

O projeto inclui três modelos de rede neural pré-treinados com diferentes níveis de precisão (localizados em `models/`):

- **Rede 1** (`models/rede_top_73_162459.mat`): 73% de precisão
- **Rede 2** (`models/rede_top_64_152746.mat`): 64% de precisão
- **Rede 3** (`models/rede_top_62_162036.mat`): 62% de precisão

## 🔍 Processamento de Imagens

Todas as imagens passam pelo seguinte pipeline:

1. **Leitura**: Carregamento da imagem PNG
2. **Conversão para cinzentos**: Se a imagem for RGB
3. **Redimensionamento**: Para 25x25 pixels
4. **Binarização**: Conversão para imagem binária (preto/branco)
5. **Vetorização**: Conversão da matriz 25x25 para vetor coluna de 625 elementos

## 📝 Funções Principais

### `convertImage_start()`
Carrega e processa imagens da pasta `start/`.
- **Retorna**: `[inputs, targets]`
  - `inputs`: Matriz 625x30 (625 pixels, 30 imagens)
  - `targets`: Matriz 6x30 (one-hot encoding, 6 classes)

### `convertImage_train()`
Carrega e processa imagens da pasta `train/`.
- **Retorna**: `[inputs, targets]`
  - `inputs`: Matriz 625x300 (625 pixels, 300 imagens)
  - `targets`: Matriz 6x300 (one-hot encoding, 6 classes)

### `convertImage_test()`
Carrega e processa imagens da pasta `test/`.
- **Retorna**: `[inputs, targets]`
  - `inputs`: Matriz 625x60 (625 pixels, 60 imagens)
  - `targets`: Matriz 6x60 (one-hot encoding, 6 classes)

### `convertImage_draw()`
Carrega e processa imagens da pasta `draw/`.
- **Retorna**: `[inputs, targets]`
  - `inputs`: Matriz 625x30 (625 pixels, 30 imagens)
  - `targets`: Matriz 6x30 (one-hot encoding, 6 classes)

### `convertImage_all()`
Carrega e processa imagens de todas as pastas (start, train, test).
- **Retorna**: `[inputs, targets]`
  - `inputs`: Matriz 625x390 (625 pixels, 390 imagens)
  - `targets`: Matriz 6x390 (one-hot encoding, 6 classes)

## 🛠️ Configuração de Redes Neuronais

### Topologias Testadas
- Camada única: `[10]`, `[20]`, `[30]`
- Múltiplas camadas: `[20 20]`, `[20 20 20]`, `[30 20 10]`

### Funções de Ativação
- `tansig` - Tangente hiperbólica (padrão para camadas escondidas)
- `logsig` - Logística sigmoide
- `purelin` - Linear (usada na camada de saída)

### Funções de Treino
- `trainlm` - Levenberg-Marquardt (padrão, rápido mas usa muita memória)
- `traingd` - Gradiente descendente
- `traingda` - Gradiente descendente adaptativo

## 📊 Avaliação

O projeto inclui:
- **Matrizes de confusão** para análise detalhada
- **Precisão global** e por conjunto de dados
- **Comparação entre múltiplas redes**

## 📄 Licença

Este projeto foi desenvolvido no âmbito académico.

## 👤 Autor

Desenvolvido para o Trabalho Prático de Computação Robótica (TPCR) 2024/2025.

## 📚 Referências

- MATLAB Neural Network Toolbox Documentation
- MATLAB Image Processing Toolbox Documentation

---

**Nota**: Os scripts foram configurados para usar caminhos relativos. Execute os scripts a partir da pasta `scripts/` ou adicione a pasta ao path do MATLAB. Os modelos de rede são carregados automaticamente da pasta `models/` e as imagens das pastas `start/`, `train/`, `test/` e `draw/` na raiz do projeto.

