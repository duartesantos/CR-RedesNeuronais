clear; clc;

% === Carregar imagens da pasta train ===
[inputs, targets] = convertImage_train();

%Implemente e treine redes neuronais feedforward para reconhecer o conjunto total de imagens da pasta train.
%i. Explore e compare várias configurações da rede
%- diferentes topologias: nº de neurónios e nº de camadas
%- diferentes funções de ativação
%- diferentes funções de treino
%- diferentes rácios de divisão em treino/validação/teste

% === Configuração da Rede ===
topologia = [20 20 20];                   % Exemplo: 2 camadas escondidas
funcTreino = 'trainlm';                % Exemplo: função de treino
funcAtivacao = 'tansig';               % Exemplo: função de ativação
ratios = [70 15 15];                   % [treino, validação, teste] %

fprintf('\nTopologia: [%s]\n', num2str(topologia));
fprintf('Função de treino: %s\n', funcTreino);
fprintf('Função de ativação: %s\n', funcAtivacao);
fprintf('Ratios: treino %d%% | validação %d%% | teste %d%%\n', ratios);

% === Criar rede ===
net = feedforwardnet(topologia, funcTreino);

% Definir funções de ativação para todas as camadas escondidas
for i = 1:length(net.layers) - 1
    net.layers{i}.transferFcn = funcAtivacao;
end

% Número de épocas 
net.trainParam.epochs = 20;  

% Rácio de divisão treino/validação/teste
net.divideParam.trainRatio = ratios(1)/100;
net.divideParam.valRatio   = ratios(2)/100;
net.divideParam.testRatio  = ratios(3)/100;

% === Treinar ===
[net, tr] = train(net, inputs, targets);

% === Avaliação ===
outputs = net(inputs);
[~, predClasses] = max(outputs);
[~, trueClasses] = max(targets);
accuracyGlobal = sum(predClasses == trueClasses) / length(trueClasses);

% Precisão no conjunto de teste
testInd = tr.testInd;
testOutputs = net(inputs(:, testInd));
[~, testPred] = max(testOutputs);
[~, testTrue] = max(targets(:, testInd));
accuracyTeste = sum(testPred == testTrue) / length(testTrue);

fprintf('Precisão GLOBAL: %.2f%%\n', accuracyGlobal * 100);
fprintf('Precisão TESTE:  %.2f%%\n', accuracyTeste * 100);

% === Matriz de confusão ===
figure;
plotconfusion(targets, outputs);
title(sprintf('Confusion Matrix - Topologia [%s]', num2str(topologia)));

%Gravar rede
nomeFicheiro = sprintf('../models/rede_top_%02d_%s.mat', round(accuracyTeste*100), datestr(now,'HHMMSS'));
save(nomeFicheiro, 'net');
fprintf('Rede guardada como "%s" com %.2f%% de precisão de teste.\n', nomeFicheiro, accuracyTeste * 100);



