Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DE47E1
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 08:05:05 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MP7hb2DskzZcKk;
	Fri,  9 Sep 2022 16:00:31 +0800 (CST)
Received: from [10.67.110.173] (10.67.110.173) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 16:05:02 +0800
Message-ID: <12f2b845-7450-bc29-9b81-624804c0e3e4@huawei.com>
Date: Fri, 9 Sep 2022 16:05:02 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] staging: r8188eu: Fix return type for implementation
 of ndo_start_xmit
Content-Language: en-US
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	<Larry.Finger@lwfinger.net>, <phil@philpotter.co.uk>,
	<gregkh@linuxfoundation.org>, <dan.carpenter@oracle.com>
CC: <linux-staging@lists.linux.dev>
References: <20220908011323.22186-1-guozihua@huawei.com>
 <88f8c741-525d-fe3e-5fbd-3d7b16ca3254@gmail.com>
From: "Guozihua (Scott)" <guozihua@huawei.com>
In-Reply-To: <88f8c741-525d-fe3e-5fbd-3d7b16ca3254@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.173]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected

On 2022/9/9 3:22, Philipp Hortmann wrote:
> On 9/8/22 03:13, GUO Zihua wrote:
>> CFI (Control Flow Integrity) is a safety feature allowing the system to
>> detect and react should a potential control flow hijacking occurs. In
>> particular, the Forward-Edge CFI protects indirect function calls by
>> ensuring the prototype of function that is actually called matches the
>> definition of the function hook.
>>
>> Since Linux now supports CFI, it will be a good idea to fix mismatched
>> return type for implementation of hooks. Otherwise this would get
>> cought out by CFI and cause a panic.
>>
>> Use enums from netdev_tx_t as return value instead, then change return
>> type to netdev_tx_t.
>>
>> Fixes: cf68fffb66d6 ("add support for Clang CFI")
>> Signed-off-by: GUO Zihua <guozihua@huawei.com>
>> ---
>>
>> v4:
>>    Added Fixes tag.
>>
>> v3:
>>    Provide detail on CFI.
>>
>> v2:
>>    Fix truncated subject.
>>
>> ---
>>   drivers/staging/r8188eu/include/xmit_osdep.h | 2 +-
>>   drivers/staging/r8188eu/os_dep/xmit_linux.c  | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h 
>> b/drivers/staging/r8188eu/include/xmit_osdep.h
>> index 00658681fef9..947242486144 100644
>> --- a/drivers/staging/r8188eu/include/xmit_osdep.h
>> +++ b/drivers/staging/r8188eu/include/xmit_osdep.h
>> @@ -28,7 +28,7 @@ struct sta_xmit_priv;
>>   struct xmit_frame;
>>   struct xmit_buf;
>> -int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
>> +netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct  net_device 
>> *pnetdev);
>>   void rtw_os_xmit_schedule(struct adapter *padapter);
>> diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c 
>> b/drivers/staging/r8188eu/os_dep/xmit_linux.c
>> index 91a1e4e3219a..0b04010d6d82 100644
>> --- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
>> +++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
>> @@ -198,7 +198,7 @@ static int rtw_mlcst2unicst(struct adapter 
>> *padapter, struct sk_buff *skb)
>>       return true;
>>   }
>> -int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
>> +netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct  net_device 
>> *pnetdev)
>>   {
>>       struct adapter *padapter = (struct adapter 
>> *)rtw_netdev_priv(pnetdev);
>>       struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
>> @@ -233,5 +233,5 @@ int rtw_xmit_entry(struct sk_buff *pkt, struct  
>> net_device *pnetdev)
>>   exit:
>> -    return 0;
>> +    return NETDEV_TX_OK;
>>   }
> 
> Hi,
> 
> I cannot apply your patch:
> 
> Applying: staging: r8188eu: Fix return type for implementation of 
> ndo_start_xmit
> error: drivers/staging/r8188eu/include/xmit_osdep.h: does not exist in 
> index
> error: drivers/staging/r8188eu/os_dep/xmit_linux.c: does not exist in index
> Patch failed at 0001 staging: r8188eu: Fix return type for 
> implementation of ndo_start_xmit
> 
> 
> Fetch URL: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> 
> branch staging-testing
> 
> Do you know why?
> 
> Bye Philipp
> .

Hi Philipp,

It seems that folder drivers/staging/r8188eu no longer presents on the 
branch you mentioned. However, they are still there on master branch.

-- 
Best
GUO Zihua
