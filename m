Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162DF179
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 00:57:39 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RX1hQ2SG7zVkL5;
	Fri, 25 Aug 2023 08:55:18 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 25 Aug 2023 08:57:36 +0800
Message-ID: <72663179-0e48-b55b-4827-07e01e5a44a7@huawei.com>
Date: Fri, 25 Aug 2023 08:57:35 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 0/2] staging: rtl8192e: Do not call kfree_skb()
 under spin_lock_irqsave()
Content-Language: en-US
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	<gregkh@linuxfoundation.org>, <straube.linux@gmail.com>, <seanm@seanm.ca>,
	<mikem@ring3k.org>, <Larry.Finger@lwfinger.net>, <wlanfae@realtek.com>,
	<linux-staging@lists.linux.dev>
References: <20230824074557.1928715-1-ruanjinjie@huawei.com>
 <c63053be-1852-4966-a5a3-38472d1cca00@gmail.com>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <c63053be-1852-4966-a5a3-38472d1cca00@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected



On 2023/8/25 4:36, Philipp Hortmann wrote:
> On 8/24/23 09:45, Jinjie Ruan wrote:
>> It is not allowed to call kfree_skb() from hardware interrupt
>> context or with interrupts being disabled. This patchset is
>> trying to add all skb to a free list, then free them after
>> spin_unlock_irqrestore() at once.
>>
>> Jinjie Ruan (2):
>>    staging: rtl8192e: Do not call kfree_skb() under spin_lock_irqsave()
>>    staging: rtl8192e: Do not call kfree_skb() under spin_lock_irqsave()
>>
>>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 22 ++++++++++++--------
>>   drivers/staging/rtl8192e/rtllib_softmac.c    |  6 +++++-
>>   2 files changed, 18 insertions(+), 10 deletions(-)
>>
> 
> 
> Hi,
> 
> for me as a tester I need to have different Subjects. I think I have now
> 3 patches with the same subject and a very similar description. Sorry
> How can I confirm which one is tested?

I'll resend them with different subjects.

> 
> Thanks for your patience.
> 
> Bye Philipp
