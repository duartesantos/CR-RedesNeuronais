clear; clc;

[inputs, targets] = convertImage_start();
% ====== CONFIGURAÇÃO ======

% Define aqui a topologia a testar
% Ex: [10] = uma camada com 10 neurónios (default)
% Ex: [20 10] = duas camadas, 20 neurónios na 1ª e 10 na 2ª
topologia = 10;  % <==== ALTERAR AQUI PARA TESTES (para esta alinea troca se apenas a topologia)

% ==========================
fprintf('Treinar rede com topologia: [%s]\n', num2str(topologia));


% Criar rede com topologia definida
net = feedforwardnet(topologia);

    % Modificar as funções de ativação e de treino (neste caso vai ser a default)
% net.layers{1}.transferFcn = 'logsig';  % Modificar a função de ativação da 1ª camada
% net.layers{end}.transferFcn = 'purelin';  % Modificar a função de  ativação da camada de saida
% net.trainFcn = 'trainlm';  % Modificar a função de treino

% Mostrar funções por defeito
fprintf('Função de treino (default): %s\n', net.trainFcn);
fprintf('Função de ativação (camada escondida): %s\n', net.layers{1}.transferFcn);
%colocar aqui as camadas escondidas adicionais se necessario
fprintf('Função de ativação (camada de saída):   %s\n', net.layers{end}.transferFcn);

% Usar 100% para treino
net.divideFcn = '';

% Número de épocas 
net.trainParam.epochs = 20;  

% Treinar
net = train(net, inputs, targets);

% Avaliar desempenho
outputs = net(inputs);
[~, predClasses] = max(outputs);% Armazena os índices das classes previstas pela rede para cada exemplo de entrada.
[~, trueClasses] = max(targets); % armazena os índices das classes reais para cada entrada.

accuracy = sum(predClasses == trueClasses) / length(trueClasses);
fprintf('Precisão global: %.2f%%\n', accuracy * 100);

% Matriz de confusão (nao é obrigatorio, mas o chat disse que é bom fazer)
figure;
plotconfusion(targets, outputs);
title(sprintf('Confusion Matrix - Topologia [%s]', num2str(topologia)));



