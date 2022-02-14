import SwiftUI

struct CoinbaseScreenView: View {
    
    @EnvironmentObject var themeService: ThemeService
    @StateObject var viewModel: CoinbaseScreenViewModel = CoinbaseScreenViewModel()
    
    var body: some View {
        ZStack {
            themeService.backgroundColor
                .ignoresSafeArea(.all)
            
            VStack {
                navigationBar
                
                ScrollView {
                    VStack(spacing: 32) {
                        headerSection
                        
                        watchlistSection
                        
                        topMoversSection
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
    
    @ViewBuilder var topMoversSection: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    
                    Spacer(minLength: 0)
                    
                    ForEach(viewModel.data, id:\.name) { coin in
                        ZStack {
                            themeService.backgroundOffsetColor
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Image(coin.ticker.lowercased())
                                
                                HStack {
                                    text(coin.ticker)
                                    text(coin.price, color: themeService.foregroundColor.opacity(0.4))
                                }
                                
                                text(viewModel.percentageString(coin.differencePercentage),
                                     color: viewModel.percentageColor(coin.differencePercentage) ,font: .title)
                            }
                            .padding()
                        }
                        .cornerRadius(10)
                    }
                    Spacer(minLength: 0)
                }
                }
        }
    }
    
    @ViewBuilder var watchlistSection: some View {
        VStack(spacing: 16) {
            text("Watchlist", font: .title3, fontWeight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(viewModel.data, id:\.name) { coin in
                HStack {
                    Image(coin.ticker.lowercased())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        text(coin.name, fontWeight: .bold)
                        text(coin.ticker, color: themeService.foregroundSecondaryColor)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        text(coin.price, fontWeight: .bold)
                        text(viewModel.percentageString(coin.differencePercentage),
                             color: viewModel.percentageColor(coin.differencePercentage))
                    }
                    
                    LineGraph(yPoints: .init(with: CoinbaseScreenViewModel.randomPoints), smoothness: 0.2)
                        .stroke(Color.indigo, lineWidth: 1)
                        .frame(width: 30, height: 15)
                    
                }
            }
            
            Button {
                print("Show More")
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(themeService.backgroundOffsetColor)
                    .frame(height: 45)
                    .overlay(
                        text("See all")
                    )
            }
            
            Divider()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder var navigationBar: some View {
        HStack {
            
            iconButton(systemName: "line.3.horizontal.decrease")
            
            Spacer()
            
            Toggle(isOn: $themeService.isDarkModeEnabled) {}
            .tint(Color.indigo)
            
            iconButton(systemName: "bell")
        }
        .padding()
    }
    
    @ViewBuilder var headerSection: some View {
        VStack {
            VStack {
                HStack {
                    text("Your balance",
                         color: themeService.foregroundSecondaryColor,
                         fontWeight: .bold)

                    Button {
                        withAnimation {
                            viewModel.yPoints = CoinbaseScreenViewModel.randomPoints
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    .foregroundColor(Color.indigo)
                    
                    Spacer()
                }
                
                HStack {
                    text("£100.50", font: .title,
                         fontWeight: .heavy)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    LineGraph(yPoints: .init(with: viewModel.yPoints), smoothness: 0.2)
                        .stroke(Color.indigo, lineWidth: 2)
                        .frame(width: 75)
                }
            }
            
            HStack {
                headerIconButton(systemName: "plus", labelText: "Buy")
                Spacer()
                headerIconButton(systemName: "minus", labelText: "Sell")
                Spacer()
                headerIconButton(systemName: "arrow.up", labelText: "Send")
                Spacer()
                headerIconButton(systemName: "arrow.down", labelText: "Receive")
                Spacer()
                headerIconButton(systemName: "ellipsis", labelText: "More")
            }
            
            Divider()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder func iconButton(systemName: String) -> some View {
        Button {
            print("Button Tapped")
        } label: {
            Image(systemName: systemName)
                .frame(width: 20, height: 20)
        }
        .foregroundColor(themeService.foregroundColor)
    }
    
    @ViewBuilder func headerIconButton(systemName: String,
                                       labelText: String) -> some View {
        VStack {
            Button {
                print("Tapped Icon")
            } label: {
                Circle()
                    .fill(Color.indigo)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: systemName)
                            .foregroundColor(themeService.backgroundColor)
                    )
            }
            text(labelText)
        }
    }
    
    @ViewBuilder func text(_ text: String,
                           color: Color? = nil,
                           font: Font = .caption,
                           fontWeight: Font.Weight = .medium) -> some View {
        Text(text)
            .fontWeight(fontWeight)
            .font(font)
            .foregroundColor(color ?? themeService.foregroundColor)
    }
    
    
}
