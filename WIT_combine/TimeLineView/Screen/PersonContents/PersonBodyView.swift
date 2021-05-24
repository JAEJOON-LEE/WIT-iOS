//
//  PersonBodyView.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/21.
//

import SwiftUI

struct PersonBodyView: View {

    @EnvironmentObject var store: Store //Observable 오브젝트를 Environment 오브젝트로 변환하면, 참조체를 전달할 필요없이 모든 뷰에서 Environment 오브젝트에 접근이 가능하다. 다른 뷰에 서도 @EnvironmentObject var store: Store 선언만 해주면 됨.
    //https://velog.io/@budlebee/SwiftUI-ObservableObject 자세한 설명.
    
    @StateObject var vm: PersonBodyViewModel = PersonBodyViewModel()
    var colWidth: CGFloat
    
    var body: some View {
        LazyVStack(alignment:.leading){
            ForEach(store.following,id: \.id){ person in
                PersonHeaderView(person: person)
                
                Image(vm.getContentOfOwners(ownerId: person.id)?.image ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                PersonFooterView(content: vm.getContentOfOwners(ownerId: person.id), colWidth: colWidth)
                    .padding(.bottom,10)
                
            }
        }
        .onAppear {
            //view가 나타날 때 수행할 action을 추가합니다.
            //파라미터 perform에 들어가는 action은 optional입니다.
            vm.setContentOfOwners(owners: store.following)
        }
        
    }
}
