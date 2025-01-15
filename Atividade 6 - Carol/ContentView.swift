//
//  ContentView.swift
//  Atividade 6 - Carol
//
//  Created by iredefbmac_28 on 15/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var palavra: String = "" // Palavra inserida pelo usuário
    @State private var anagramas: [String] = [] // Lista de anagramas gerados
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gerador de Anagramas")
                .font(.largeTitle)
                .bold()
                .padding()
            
            TextField("Digite uma palavra", text: $palavra)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: {
                anagramas = gerarAnagramas(palavra: palavra)
            }) {
                Text("Gerar Anagramas")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            if anagramas.isEmpty {
                Text("Nenhum anagrama gerado ainda")
                    .foregroundColor(.gray)
            } else {
                List(anagramas, id: \.self) { anagrama in
                    Text(anagrama)
                }
            }
        }
        .padding()
    }
    
    // Função para gerar anagramas
    func gerarAnagramas(palavra: String) -> [String] {
        guard !palavra.isEmpty else { return [] }
        var letras = Array(palavra)
        var anagramasSet: Set<String> = []
        
        for i in 0..<letras.count {
            for j in i+1..<letras.count {
                var novaPalavra = letras
                let letraAtual = novaPalavra[i]
                novaPalavra[i] = novaPalavra[j]
                novaPalavra[j] = letraAtual
                anagramasSet.insert(String(novaPalavra))
            }
        }
        
        return Array(anagramasSet).sorted()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
