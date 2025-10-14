# Music Classification (Flutter App)

**Music Classification** é um aplicativo Flutter para classificação e análise de **álbuns musicais**, com tema claro/escuro, animações, filtro de busca e visualização detalhada. Ideal para quem quer explorar conceitos de UI/UX, navegação, consumo de JSON local e animações no Flutter.

---

## Funcionalidades

- Lista de álbuns com visual em **grid** ou **lista**  
- Filtro/Busca por título ou artista  
- Tela de detalhes do álbum com capa, faixas, críticas e info  
- Modo claro / escuro com alternância manual  
- Animações: fade + scale nos cards, Hero transition para capa  
- Persistência local (favoritos ou tema) [em hipótese futura]   
- Estrutura modularizada (models, screens, widgets, animações)

---


## Tecnologias & Dependências

- Flutter (Dart)  
- `provider` — gerenciamento de estado  
- `shared_preferences` — armazenamento local  
- `fl_chart` — gráficos de avaliação  
- `audioplayers` — prévia de faixas  
- `device_preview` — testes em diferentes resoluções  
- Assets: JSON local + imagens de capas  

---

## Uso / Exemplo de Navegação

Ao abrir o aplicativo:

Você verá a lista ou grade de álbuns.

Use a barra de busca para filtrar por nome ou artista.

Toque em um álbum para abrir a tela de detalhes (com animação).

Na tela de detalhes, veja a capa em alta resolução, críticas, faixas e informações adicionais.
