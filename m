Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1E970
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 09:29:42 +0000 (UTC)
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.59])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FqlvX0dFFzkZQ0;
	Wed, 26 May 2021 17:26:48 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 17:29:39 +0800
Received: from [10.67.77.175] (10.67.77.175) by dggpeml500023.china.huawei.com
 (7.185.36.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 26 May
 2021 17:29:39 +0800
Subject: Re: [PATCH v2] staging: rtl8723bs: remove the repeated declaration
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>, Dan Carpenter <dan.carpenter@oracle.com>,
	Hans de Goede <hdegoede@redhat.com>
References: <1622018639-55426-1-git-send-email-zhangshaokun@hisilicon.com>
 <YK4UR3mJA3QGnzUL@kroah.com>
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <ca6c1c96-da86-80ec-50e4-48f3a5e41eb0@hisilicon.com>
Date: Wed, 26 May 2021 17:29:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YK4UR3mJA3QGnzUL@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.77.175]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected

Hi Greg,

On 2021/5/26 17:26, Greg Kroah-Hartman wrote:
> On Wed, May 26, 2021 at 04:43:59PM +0800, Shaokun Zhang wrote:
>> Function 'rtw_indicate_wx_disassoc_event' and 'Hal_SetBandwidth' are
>> declared twice in their header file, so remove the repeated declaration.
>>
>> Cc: Dan Carpenter <dan.carpenter@oracle.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
>> ---
>>  drivers/staging/rtl8723bs/include/drv_types.h | 1 -
>>  drivers/staging/rtl8723bs/include/rtw_mp.h    | 1 -
>>  2 files changed, 2 deletions(-)
> 
> What changed from v1?  Always list that below the --- line please.
> 

Sorry, I lost this.

> v3?

Ok,

Thanks,
Shaokun

> .
> 
