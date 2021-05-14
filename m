Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3135F72
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 01:19:00 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fh9Dc2Nphz1BK8V;
	Fri, 14 May 2021 09:00:16 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.72) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Fri, 14 May 2021
 09:02:53 +0800
Subject: Re: [PATCH 2/2] staging: rtl8723bs: core: eliminate erroneous
 reporting of unused variable 'evt_seq'
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Fabio Aiuto <fabioaiuto83@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
	linux-staging <linux-staging@lists.linux.dev>
References: <20210513094007.6435-1-thunder.leizhen@huawei.com>
 <20210513094007.6435-3-thunder.leizhen@huawei.com>
 <YJ1sSnEa+qFBOsli@kroah.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <ac2b2be3-3b1a-ce0f-0d9d-b6da533bf091@huawei.com>
Date: Fri, 14 May 2021 09:02:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YJ1sSnEa+qFBOsli@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected



On 2021/5/14 2:13, Greg Kroah-Hartman wrote:
> On Thu, May 13, 2021 at 05:40:07PM +0800, Zhen Lei wrote:
>> GCC reports the following warning with W=1:
>>
>> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:6003:15: warning:
>>  variable ‘evt_seq’ set but not used [-Wunused-but-set-variable]
>>  6030 |  u8 evt_code, evt_seq;
>>       |               ^~~~~~~
>>
>> The local variable ‘evt_seq’ is referenced only when the macro
>> CHECK_EVENT_SEQ is defined, move its definition and assignment into the
>> control scope of macro CHECK_EVENT_SEQ, to fix the warning.
>>
>> By the way, clear local coding style warnings and delete several redundant
>> blank lines.
> 
> Do not do lots of different things in the same patch, this should be
> broken up into doing "one logical thing per change".
> 
> Please fix up and send as a series.

OK, I will split it into two patches.

> 
> thanks,
> 
> greg k-h
> 
> .
> 

