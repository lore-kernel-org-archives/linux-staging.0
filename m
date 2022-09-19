Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9F72103
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 09:43:38 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MWKQC4jngz14Qg2;
	Mon, 19 Sep 2022 17:39:31 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 17:43:35 +0800
Received: from [10.174.176.230] (10.174.176.230) by
 kwepemm600008.china.huawei.com (7.193.23.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 17:43:35 +0800
Message-ID: <0f98fa2d-0bba-479c-914d-e6d1a8605733@huawei.com>
Date: Mon, 19 Sep 2022 17:43:33 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH -next v4] staging: fwserial: Switch to kfree_rcu() API
To: Greg KH <gregkh@linuxfoundation.org>
CC: <andy.shevchenko@gmail.com>, <ilpo.jarvinen@linux.intel.com>,
	<linux-staging@lists.linux.dev>
References: <20220919091056.29527-1-shangxiaojing@huawei.com>
 <YygySR0Zh1gw5M6d@kroah.com>
From: shangxiaojing <shangxiaojing@huawei.com>
In-Reply-To: <YygySR0Zh1gw5M6d@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.230]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected


On 2022/9/19 17:11, Greg KH wrote:
> On Mon, Sep 19, 2022 at 05:10:56PM +0800, Shang XiaoJing wrote:
>> Instead of invoking a synchronize_rcu() to free a pointer after a grace
>> period, we can directly make use of a new API that does the same but in
>> a more efficient way.
>>
>> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
>> ---
>> Changelog:
>> v3: the first version of the PATCH
>> v1: v3 resent as v1
>> v2: use kfree_rcu() instead of kvfree_rcu() for clarity
>> v4: resend v2 as v4 to avoid versioning confusion
>> ---
>>   drivers/staging/fwserial/fwserial.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/fwserial/fwserial.c b/drivers/staging/fwserial/fwserial.c
>> index 81b06d88ed0d..8d2b4ed1f39e 100644
>> --- a/drivers/staging/fwserial/fwserial.c
>> +++ b/drivers/staging/fwserial/fwserial.c
>> @@ -2117,8 +2117,7 @@ static void fwserial_remove_peer(struct fwtty_peer *peer)
>>   	if (port)
>>   		fwserial_release_port(port, true);
>>   
>> -	synchronize_rcu();
>> -	kfree(peer);
>> +	kfree_rcu(peer);

The kfree_rcu(peer) should be kfree_rcu(peer, rcu), due to the rcu_head 
member named rcu in fwtty_peer.

This will be fixed in v5, sorry.

> What is "more efficient" about this change?

kfree_rcu() will call kvfree_call_rcu, due to the note in kernel/rcu/tree.c:

/Each kvfree_call_rcu() request is added to a batch. The batch will be 
drained every KFREE_DRAIN_JIFFIES number of jiffies. All the objects in 
the batch will be free'd in workqueue context. This allows us to: batch 
requests together to reduce the number of grace periods during heavy 
kfree_rcu()/kvfree_rcu() load. ///

which is the reason I use "more efficient".
>
> And do you have the hardware for this device to test with?  It would be
> good to finally get this out of staging, or to just remove it entirely
> if no one uses it.
Actually, not. I just found the code here may be optimized.
>
> thanks,
>
> greg k-h

Thanks,

Shang XiaoJing

