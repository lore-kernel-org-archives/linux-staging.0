Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B041F369
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 02:01:22 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RmL6c3NP9ztSSW;
	Thu, 14 Sep 2023 09:57:12 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 14 Sep 2023 10:01:19 +0800
Message-ID: <1e4d321f-8252-f191-2011-043abd79a408@huawei.com>
Date: Thu, 14 Sep 2023 10:01:18 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v2 0/3] staging: rtl8192e: Do not call kfree_skb()
 under spin_lock_irqsave()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, <netdev@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <philipp.g.hortmann@gmail.com>,
	<straube.linux@gmail.com>, <Larry.Finger@lwfinger.net>,
	<wlanfae@realtek.com>, <mikem@ring3k.org>, <seanm@seanm.ca>,
	<linux-staging@lists.linux.dev>
References: <20230825015213.2697347-1-ruanjinjie@huawei.com>
 <d7326392-56e4-4ccb-a878-0a03c91d0d85@kadam.mountain>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <d7326392-56e4-4ccb-a878-0a03c91d0d85@kadam.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected



On 2023/9/5 19:59, Dan Carpenter wrote:
> Added netdev because they're really the experts.
> 
> On Fri, Aug 25, 2023 at 09:52:10AM +0800, Jinjie Ruan wrote:
>> It is not allowed to call kfree_skb() from hardware interrupt
>> context or with interrupts being disabled.
> 
> There are no comments which say that this is not allowed.  I have
> reviewed the code to see why it's not allowed.  The only thing I can
> see is that maybe the skb->destructor(skb); in skb_release_head_state()
> sleeps?  Or possibly the uarg->callback() in skb_zcopy_clear()?

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
> Can you comment more on why this isn't allowed?  Was this detected at
> runtime?  Do you have a stack trace?
> 
> Once I know more I can add this to Smatch so that it is detected
> automatically using static analysis.
> 
> regards,
> dan carpenter
> 
> 
