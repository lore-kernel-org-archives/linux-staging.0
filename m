Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B0CEC4
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 02:16:39 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RmL6y0BrNzVjP2;
	Thu, 14 Sep 2023 09:57:30 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 14 Sep 2023 10:00:18 +0800
Message-ID: <89d2e898-3a5f-75cd-14db-1af3319a2a4d@huawei.com>
Date: Thu, 14 Sep 2023 10:00:17 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v2 1/3] staging: rtl8192e: rtl_core: Call
 dev_kfree_skb_irq() instead of kfree_skb() under spin_lock_irqsave()
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <philipp.g.hortmann@gmail.com>, <straube.linux@gmail.com>,
	<Larry.Finger@lwfinger.net>, <wlanfae@realtek.com>, <mikem@ring3k.org>,
	<seanm@seanm.ca>, <linux-staging@lists.linux.dev>
References: <20230825015213.2697347-1-ruanjinjie@huawei.com>
 <20230825015213.2697347-2-ruanjinjie@huawei.com>
 <2023091352-mouth-escapist-6eb4@gregkh>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <2023091352-mouth-escapist-6eb4@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected



On 2023/9/13 16:34, Greg KH wrote:
> On Fri, Aug 25, 2023 at 09:52:11AM +0800, Jinjie Ruan wrote:
>> It is not allowed to call kfree_skb() from hardware interrupt
>> context or with hardware interrupts being disabled.
> 
> Why not?  Seems to work so far :)

The commit e6247027e517 ("net: introduce dev_consume_skb_any()") has the
below comment:

3830 /*
3831  * It is not allowed to call kfree_skb() or consume_skb() from hardware
3832  * interrupt context or with hardware interrupts being disabled.
3833  * (in_hardirq() || irqs_disabled())
3834  *
3835  * We provide four helpers that can be used in following contexts :
3836  *
3837  * dev_kfree_skb_irq(skb) when caller drops a packet from irq context,
3838  *  replacing kfree_skb(skb)
3839  *
3840  * dev_consume_skb_irq(skb) when caller consumes a packet from irq
context.
3841  *  Typically used in place of consume_skb(skb) in TX completion path
3842  *
3843  * dev_kfree_skb_any(skb) when caller doesn't know its current irq
context,
3844  *  replacing kfree_skb(skb)
3845  *
3846  * dev_consume_skb_any(skb) when caller doesn't know its current
irq context,
3847  *  and consumed a packet. Used in place of consume_skb(skb)
3848  */


> 
> Are you fixing up all of the normal network drivers for this first?
> 
> thanks,
> 
> greg k-h
