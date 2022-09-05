Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE2E7E
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 13:08:17 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MLpdR3zPLzjXZk;
	Mon,  5 Sep 2022 21:04:43 +0800 (CST)
Received: from [10.67.110.173] (10.67.110.173) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 5 Sep 2022 21:08:15 +0800
Message-ID: <359e3e0e-92bd-8fd0-2820-f4ad89ca8385@huawei.com>
Date: Mon, 5 Sep 2022 21:08:15 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RESEND PATCH] staging: r8188eu: Fix return type for
 implementation of ndo_start_xmit
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>, <Larry.Finger@lwfinger.net>,
	<phil@philpotter.co.uk>, <paskripkin@gmail.com>
References: <20220902081653.60682-1-guozihua@huawei.com>
 <YxG+DNzyUcPIjXZC@kroah.com>
 <2a5e1f33-45ee-2da7-19fb-f0ef66418e9e@huawei.com>
 <YxWGM+f1d4+sCKMj@kroah.com>
From: "Guozihua (Scott)" <guozihua@huawei.com>
In-Reply-To: <YxWGM+f1d4+sCKMj@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.173]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected

Hi Greg,

On 2022/9/5 13:16, Greg KH wrote:
> On Mon, Sep 05, 2022 at 09:23:15AM +0800, Guozihua (Scott) wrote:
>> Hi Greg,
>>
>> Sorry for the confusion.
>>
>> On 2022/9/2 16:25, Greg KH wrote:
>>> On Fri, Sep 02, 2022 at 04:16:53PM +0800, GUO Zihua wrote:
>>>> Since Linux now supports CFI, it will be a good idea to fix mismatched
>>>> return type for implementation of hooks. Otherwise this might get
>>>> cought out by CFI and cause a panic.
>>>>
>>>> Use enums from netdev_tx_t as return value instead, then change return
>>>> type to netdev_tx_t.
>>>>
>>>> Signed-off-by: GUO Zihua <guozihua@huawei.com>
>>>> ---
>>>>    drivers/staging/r8188eu/include/xmit_osdep.h | 2 +-
>>>>    drivers/staging/r8188eu/os_dep/xmit_linux.c  | 4 ++--
>>>>    2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> Why is this and the other commits, marked as RESEND?
>>
>> The first version of the patch has a truncated subject, thus the resend. It
>> might be better to send a v2 patches instead..
> 
> Yes please do that.

The patch is sent as V3, as the RESEND patches should be considered as 
V2 as Dan suggested.
> 
>>> And any reason you didn't cc: the staging maintainer on this commit?
>>
>> It's my first time sending patches to the staging maillist. When I run
>> get_maintainer.pl on the patch I don't see a "maintainer", but only
>> "supporters" and "reviewers". Is that for staging there are a group of
>> maintainers for all modules?
> 
> See the MAINTAINERS file for what "supported" and "maintained" and the
> rest mean and just include them all when you submit a patch.
> 
> thanks,
> 
> greg k-h
> .

I check the MAINTAINER file and I would include everyone with supported 
and maintained role.

-- 
Best
GUO Zihua
