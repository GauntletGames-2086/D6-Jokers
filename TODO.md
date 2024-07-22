# To do before 1.0
## Art
### D6 Jokers
- [x] Basic Die 
- [x] Chips Die 
- [ ] Chips Die+ (W.I.P)
- [x] Mult Die 
- [ ] Mult Die+ (W.I.P)
- [x] XMult Die 
- [ ] XMult Die+ (W.I.P)
- [ ] Golden Die (W.I.P) (not shiny enough)
- [ ] Golden Die+ (W.I.P)
- [ ] Golden Die++ (W.I.P)
- [x] Tarot Die 
- [ ] Tarot Die+ (W.I.P)
- [x] Planet Die 
- [x] Planet Die+ (W.I.P/Done) (Might switch BG to be more dynamic)
- [x] Spectral Die 
- [ ] Spectral Die+ (W.I.P)
- [ ] Casino Die
- [ ] Casino Die+
- [ ] Self-Selling Die
- [ ] Support Die
- [ ] Chaos Die
- [x] Interstellar Die
- [ ] Interstellar Die+ (W.I.P)
- [ ] Impure: Gutless Die
- [ ] Impure: Broke Die
- [ ] Impure: Plague Die
- [ ] Pure: Savior Die
- [ ] Pure: Exchange Die
- [ ] Pure: Medical Die
### Consumables
- [ ] Concentration
- [ ] Reconstruction
- [ ] The Die Wielder
- [ ] Transplant
- [ ] Override
- [ ] Purification
- [ ] Lightshow
### Other
- [x] "Boostered" Texture

## Development
### D6 Jokers
- [x] Impure: Plague Die (Legendary)
- [x] Pure: Medical Die (Legendary)
- Stackable Series 
  - Note on stacks: They are shared for each side side type, i.e. a stackable chips side and stackable chips+ side will share stacks but not a stackable mult side. Stacks with different conditions are also not shared
  - [ ] Stackable Chips Die (TODO: Concept) 
  - [ ] Stackable Mult Die (TODO: Concept)
  - [ ] Holographic Die (Uncommon) 
    - [ ] 1, 2, 3: ???. X\[1.5+(0.25*stack)\] Mult. Gain \[Stack\] when a card is added. 
    - [ ] 4, 5, 6: ???. X\[1.5+(0.5*stack)\] Mult. Gain \[Stack\] when a card is destroyed. 
- [ ] Painted Die (Uncommon)
  - D6 Side selects a random suit, following Ancient Joker logic
  - [ ] ???. Played cards with \[Suit\] suit gives \[+Chips\] when scored
  - [ ] ???. Played cards with \[Suit\] suit gives \[+Mult\] when scored
  - [ ] ???. Played cards with \[Suit\] suit gives \[+Money\] when scored
- [ ] Painted Die+ (Rare)
  - D6 Side selects two random suits, following Ancient Joker logic. 1st is shared with prev level
  - [ ] ???+. Played cards with \[Suit1\] or \[Suit2\] suit gives \[+Chips\] when scored
  - [ ] ???+. Played cards with \[Suit1\] or \[Suit2\] suit gives \[+Mult\] when scored
  - [ ] ???+. Played cards with \[Suit1\] or \[Suit2\] suit gives \[+Money\] when scored
- [ ] The D6 (Uncommon) *"Reroll your destiny"... What could that mean?*
  - [ ] ???. 5 free rerolls per shop
  - [ ] ???. 2 free rerolls per shop
  - [ ] ???. Rerolling the shop is disabled
- [ ] Eternal D6 (Rare) *???*
  - [ ] ???. 7 free rerolls per shop
  - [ ] ???. Rerolling the shop is disabled
- [ ] D20 (Rare) *This cannot be here, but... how?*
  - [ ] ???. Reroll all consumable cards to Spectral cards at the end of the shop
  - [ ] ???. Reroll all consumable cards to Planet cards at the end of the shop
  - [ ] ???. Reroll all consumable cards to Tarot cards at the end of the shop
  - [ ] ???. Destroy all consumable cards at the end of the shop
- [x] Interstellar Die (Uncommon) *An abandoned spacecraft in the shape of a die. Still capable of transmitting data.*
- [x] Interstellar Die+ (Rare) *A populated space station in the shape of a die. Fully capable of sustaining human life.*
### Consumables
- [x] Lightshow (Tarot): All D6 Sides on selected D6 Joker gain a random edition (Foil, Holographic, Polychrome). 
- [x] Linked (Tarot): Selected D6 Joker cannot be rerolled. 
- [x] Duplication (Spectral): Selected D6 Side is copied to the D6 Side positions adjacent. 
### D6 Sides
- [x] Editions on D6 Sides
### Other
- [ ] Credits page
- [ ] Config page
  - Tooltip Settings
    - [ ] "Full Disable" (Disables the D6 Side tooltip from ever showing up)
    - [ ] "Disable Sprite" (Disables the sprite inside of D6 Side Tooltips)
  - JokerDisplay
    - [ ] Disable JokerDisplay (Disabled D6 Joker's JokerDisplay, separate from disabling all of it)
    - [ ] Disable D6 Side name (D6 Side name in JokerDisplay will not show up)