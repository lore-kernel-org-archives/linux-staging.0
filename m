Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E029D3D74
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 10:58:10 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MWM4D08Vmz14QfQ;
	Mon, 19 Sep 2022 18:54:04 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 18:58:08 +0800
Received: from [10.174.176.230] (10.174.176.230) by
 kwepemm600008.china.huawei.com (7.193.23.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 18:58:07 +0800
Message-ID: <01f68cc6-3fef-8a3a-b412-255a1e20c2c4@huawei.com>
Date: Mon, 19 Sep 2022 18:58:06 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH -next v4] staging: fwserial: Switch to kfree_rcu() API
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: Greg KH <gregkh@linuxfoundation.org>, <andy.shevchenko@gmail.com>,
	<ilpo.jarvinen@linux.intel.com>, <linux-staging@lists.linux.dev>
References: <20220919091056.29527-1-shangxiaojing@huawei.com>
 <YygySR0Zh1gw5M6d@kroah.com>
 <0f98fa2d-0bba-479c-914d-e6d1a8605733@huawei.com> <YyhEBYGPSaB3XfNV@kadam>
From: shangxiaojing <shangxiaojing@huawei.com>
In-Reply-To: <YyhEBYGPSaB3XfNV@kadam>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.230]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected


On 2022/9/19 18:27, Dan Carpenter wrote:
> On Mon, Sep 19, 2022 at 05:43:33PM +0800, shangxiaojing wrote:
>> On 2022/9/19 17:11, Greg KH wrote:
>>> On Mon, Sep 19, 2022 at 05:10:56PM +0800, Shang XiaoJing wrote:
>>>> Instead of invoking a synchronize_rcu() to free a pointer after a grace
>>>> period, we can directly make use of a new API that does the same but in
>>>> a more efficient way.
>>>>
>>>> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
>>>> ---
>>>> Changelog:
>>>> v3: the first version of the PATCH
>>>> v1: v3 resent as v1
>>>> v2: use kfree_rcu() instead of kvfree_rcu() for clarity
>>>> v4: resend v2 as v4 to avoid versioning confusion
>>>> ---
>>>>    drivers/staging/fwserial/fwserial.c | 3 +--
>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/fwserial/fwserial.c b/drivers/staging/fwserial/fwserial.c
>>>> index 81b06d88ed0d..8d2b4ed1f39e 100644
>>>> --- a/drivers/staging/fwserial/fwserial.c
>>>> +++ b/drivers/staging/fwserial/fwserial.c
>>>> @@ -2117,8 +2117,7 @@ static void fwserial_remove_peer(struct fwtty_peer *peer)
>>>>    	if (port)
>>>>    		fwserial_release_port(port, true);
>>>> -	synchronize_rcu();
>>>> -	kfree(peer);
>>>> +	kfree_rcu(peer);
>> The kfree_rcu(peer) should be kfree_rcu(peer, rcu), due to the rcu_head
>> member named rcu in fwtty_peer.
> Oh, huh.  What happens if you don't pas the "rcu" parameter?  I see
> there is a similar instance in ext4_apply_quota_options().
>
> 		kfree_rcu(qname);

We assume for the condition that CONFIG_KASAN_GENERIC does not defined 
and system has no pressure (bacause kvfree_call_rcu maintains 3 path):

The input parameter "head" of kvfree_call_rcu will be NULL if we don't 
pass the rcu, which will run like:

                             might_sleep();
                             synchronize_rcu();
                             kvfree((void *) func);

instead of:

                             if (head) {
                                     call_rcu(head, func);
                                     return;
                             }

where the difference is synchronize_rcu vs call_rcu.

call_rcu() will not block, having a wider range of use compared with 
synchronize_rcu().

>
> regards,
> dan carpenter

Thanks,

Shang XiaoJing

