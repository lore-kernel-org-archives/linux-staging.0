Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC827E1
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 08:06:05 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MP7kF4jkrzmVGY;
	Fri,  9 Sep 2022 16:01:57 +0800 (CST)
Received: from [10.67.110.173] (10.67.110.173) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 16:05:35 +0800
Message-ID: <adb34ed6-dab5-5e05-b550-748fe4dcc9b5@huawei.com>
Date: Fri, 9 Sep 2022 16:05:35 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] staging: rtl8723bs: Fix return type for implementation
 of ndo_start_xmit
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>
References: <20220905130310.11489-1-guozihua@huawei.com>
 <YxrvYuVFqSg+CcyF@kroah.com>
From: "Guozihua (Scott)" <guozihua@huawei.com>
In-Reply-To: <YxrvYuVFqSg+CcyF@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.173]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected

On 2022/9/9 15:46, Greg KH wrote:
> On Mon, Sep 05, 2022 at 09:03:10PM +0800, GUO Zihua wrote:
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
>> As returns from _rtw_xmit_entry() would always be 0, remove unneeded
>> variable ret and use enums from netdev_tx_t as return value instead.
>> Then change return type to netdev_tx_t.
> 
> If _rtw_xmit_entry() can never fail, then it needs to not have a return
> value at all, and that needs to also be fixed.  Can you make this a
> patch series that does the return type change for _rtw_xmit_entry()
> first, and then this change on top of that one.
> 
> thanks,
> 
> greg k-h
> .

Sure Greg

-- 
Best
GUO Zihua
