//
//  ViewController.swift
//  XAlertView
//
//  Created by jowsing on 12/14/2024.
//  Copyright (c) 2024 jowsing. All rights reserved.
//

import UIKit
import XAlertView
import SnapKit
import WebKit

class ViewController: UIViewController {
    
    static let title = "我是标题😂，你是啥🦆，君不见，月照长江却无痕。"
    
    static let shortMsg = "女娲炼石补天，用了三万六千五百颗石头，剩一块石未用，是为顽石，顽石经过修炼已经有了灵性。一僧一道携它变幻为美玉带入尘世，变成“通灵宝玉”。"
    
    static let longMsg = """
    女娲炼石补天，用了三万六千五百颗石头，剩一块石未用，是为顽石，顽石经过修炼已经有了灵性。一僧一道携它变幻为美玉带入尘世，变成“通灵宝玉”。适逢神瑛侍者对一株绛珠仙草有浇灌之恩，又动了凡心下凡游历人间。绛珠仙草后修炼成女体，闻讯亦随之下凡，打算把一生所有的眼泪还他。僧道二人欲了结这段公案，并将“通灵宝玉”夹带其中。元宵时节，霍启不慎丢失了英莲。葫芦庙失火祸及甄家，落魄的甄士隐被一僧一道点化，解出《好了歌注》出家。穷困的贾雨村反而由贫入官。贾府是金陵四大家族之一，受有功勋，分为宁荣二府，族中最长者为贾母，最疼生来口中就含有一块通灵宝玉（补天顽石）的孙儿贾宝玉（神瑛侍者）。贾宝玉生来不喜读圣贤书，却爱与青春女性玩耍，为此与其父贾政关系紧张。林黛玉（绛珠仙草）此时入居贾府。刘姥姥为了生计，也一进荣府。学堂内发生一场大混战，贾府男子众人，丑态尽出。[a]

    宁府长孙媳秦可卿去世，托梦叮嘱王熙凤盛筵必散。王熙凤协理秦氏丧事，场面辉煌，展示理家才能。荣府贾元春获选为妃并省亲，荣府为元春省亲修建别墅大观园，极尽奢华。

    宝玉在池边读《会真记》，黛玉第一次葬花。赵姨娘与其子贾环，最恨贾宝玉。贾环欲烫瞎宝玉的眼，幸而未伤到眼睛，王夫人不骂贾环，把赵姨娘一顿臭骂。赵姨娘遂又命马道婆扎纸人作法害凤姐和宝玉。凤姐有事求黛玉，被打断，拿宝玉和黛玉的婚事取笑。宝凤二人忽随即因道婆作法而发狂，一僧一道前来相救。宝黛在春季结束时第二次葬花，林黛玉作成葬花词一首。

    忽闻与贾府素无往来的忠顺王府来人，要找宝玉问琪官下落，说出交换汗巾之事，贾政大怒。贾政本要拿贾环出气，贾环却趁机说出金钏跳井之事，谎称金钏是因宝玉意图强奸而自尽。贾政怒不可遏，亲自下重手打了数十板，方被王夫人哭止，贾母闻讯训斥贾政，贾政亦自后悔。宝玉想听《牡丹亭》，却被龄官冷落，待见得贾蔷与龄官的景况，方知情缘皆有分定。


    袭人，出自清改琦绘《红楼梦图咏》
    探春写帖邀众人结诗社，众姐妹和宝玉以海棠为题作诗。宝玉想起湘云，邀来入社，湘云之作众人皆赞。刘姥姥二进荣国府，贾母设宴招待刘姥姥，刘姥姥闹出不少笑话；众人行酒令，所说词句颇有寓意，黛玉不经意说了几句《西厢记》中的句子，引起宝钗的注意，刘姥姥的令词又引发哄堂大笑。众人途经拢翠庵，妙玉请宝钗、黛玉到里间喝体己茶，宝玉也跟去。刘姥姥用了妙玉的一个成窑杯，妙玉嫌脏准备扔掉，宝玉做顺水人情送给了刘姥姥。刘姥姥出恭之后误打误撞到了怡红院，在宝玉的床上睡着，好在被袭人发现并掩饰过去。宝钗审问黛玉在行酒令时背出《西厢记》词句之事，以正言相劝，二人从此和好。黛玉于风雨夜作《秋窗风雨夕》词。

    贾赦欲纳鸳鸯为妾，鸳鸯发誓不嫁贾赦。贾赦闻讯，明言鸳鸯看上了宝玉，实则暗指鸳鸯与贾琏有“私情”。贾母闻讯大怒，认为贾赦有意要把她身边的人支开。香菱向黛玉学作诗，以月为题，苦吟多首之后终得佳作。邢岫烟进京，路遇李纹、李绮，加上宝琴一起住进大观园，湘云也被贾母留下，园中热闹许多，交织成大观园中最美丽的景色。众人争联即景诗。宝琴作了十首怀古诗。元宵当晚，贾母在荣国府设宴。贾母把陈腐旧套批驳一番。

    凤姐操劳成疾，李纨、探春、宝钗代为主持内务，更为严谨。蕊官托春燕给芳官带去蔷薇硝擦脸。贾环也想要，芳官把茉莉粉给了贾环。赵姨娘借此进园大闹，夏婆子从中加油添醋。

    柳家的想叫女儿去宝玉房中当差，托芳官给宝玉说，芳官要玫瑰露给柳五儿吃，并答应让五儿在宝玉房里当差。赵姨娘内侄却欲娶柳五儿，柳家父母同意，五儿不愿，父母未敢应允，钱槐气愧，偏与柳家相与。柳家欲回，其哥嫂送给柳五儿茯苓霜。迎春的丫头莲花儿为司棋到厨房要炖鸡蛋羹，柳家的不给，迎春的大丫头司棋便领人大闹厨房。柳五儿将茯苓霜分些赠芳官，回来被林之孝家的发现，王熙凤叫把柳家的打四十板，永不许进二门，把五儿打四十板，交给庄子，或卖或配人。宝玉替彩云瞒赃，平儿向偷太太玫瑰露给环儿的彩云说明情况，凤姐还要追究，经过平儿相劝，凤姐方罢。贾敬归天，尤氏理丧，尤老娘母女三人到宁府着家，贾蓉戏二姨。

    刚烈的尤三姐因柳湘莲的拒绝娶配而引剑自尽；温柔的尤二姐因王熙凤的迫害吞金自杀。黛玉做“桃花诗”。众人改海棠社为桃花社，推黛玉为社主。湘云填柳絮词，黛玉邀众填词。宝钗诗中有“任他随聚随分”之句。众人后放风筝。鸳鸯望候凤姐，说凤姐患的是“血山崩”。贾琏请求鸳鸯暂把老太太的金银家伙偷着运出一箱子，暂押千数两银子支腾过去。

    大观园内捡到绣春囊，王夫人命王熙凤带众仆抄检大观园，王熙凤消极配合。睿智聪颖的三妹贾探春愤而说出：“百足之虫，死而不僵！必须先要从家里自杀自灭起来，才能一败涂地！”宁府夜宴，祖先灵位前竟听见了诡谲的叹息声，似乎是在指责贾府的不肖子孙，即将毁掉百年的簪缨望族。史湘云和林黛玉中秋夜联诗，句句似乎预言了贾府的命运，极为凄凉感伤：“寒塘渡鹤影，冷月葬花魂”。之后宝玉的贴身丫鬟晴雯因谗言被王夫人逐，病亡之后宝玉作《芙蓉女儿诔》。而薛宝钗愚蠢纵玩的哥哥薛蟠，娶了泼辣闹家的妻子；贾宝玉懦弱温和的二姊（堂姐）贾迎春，嫁给了残暴淫秽的丈夫
    """

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let styles = ["Title", "Text Message", "Long Text Message", "Only Text Message", "Custom View Message", "Only Custom Message"]
        for i in 0..<styles.count {
            let btn = UIButton()
            btn.setTitle(styles[i], for: .normal)
            btn.setTitleColor(.systemBlue, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 17)
            btn.tag = i + 2024
            view.addSubview(btn)
            btn.snp.makeConstraints { make in
                if i == 0 {
                    make.top.equalTo(200)
                } else {
                    make.top.equalTo(view.viewWithTag(i+2023)!.snp.bottom).offset(20)
                }
                make.centerX.equalToSuperview()
            }
            btn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func customView() -> UIView {
        let custom = WKWebView(frame: .zero, configuration: .init())
        custom.load(.init(url: .init(string: "https://github.com/Jowsing/XAlertView")!))
        custom.snp.makeConstraints { make in
            make.height.equalTo(500)
        }
        return custom
    }
    
    @objc func btnClick(sender: UIButton) {
        let actions: [XAlertAction] = [
            .init(title: "取消"),
            .init(title: "确定"),
        ]
        let alert: XAlertView
        
        switch sender.tag - 2024 {
        case 0: alert = .init(title: Self.title, actions: actions)
        case 1: alert = .init(title: Self.title, msg: Self.shortMsg, actions: actions)
        case 2: alert = .init(title: Self.title, msg: Self.longMsg, actions: actions)
        case 3: alert = .init(msg: Self.longMsg, actions: actions)
        case 4: alert = .init(title: Self.title, view: customView(), actions: actions)
        default: alert = .init(view: customView(), actions: actions)
        }
        
        alert.show(on: view)
    }

}

