Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190D317D0
	for <linux-staging@lists.linux.dev>; Tue,  6 Dec 2022 02:11:57 +0000 (UTC)
Received: from dggpemm500013.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NR3Ml0Z8jz15N4y;
	Tue,  6 Dec 2022 09:52:51 +0800 (CST)
Received: from [10.67.108.67] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 6 Dec
 2022 09:53:38 +0800
Message-ID: <8f90dbbe-51b0-67c8-d6cb-3bd9c1d9d481@huawei.com>
Date: Tue, 6 Dec 2022 09:53:38 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH] vme: Fix error not catched in fake_init()
To: Greg KH <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<martyn@welchs.me.uk>, <manohar.vanga@gmail.com>, <arnd@arndb.de>
References: <20221205084805.147436-1-chenzhongjin@huawei.com>
 <Y43kr/73sorrMWA0@kroah.com>
Content-Language: en-US
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <Y43kr/73sorrMWA0@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected

Hi,

On 2022/12/5 20:31, Greg KH wrote:
> On Mon, Dec 05, 2022 at 04:48:05PM +0800, Chen Zhongjin wrote:
>> In fake_init(), __root_device_register() is possible to fail but it's
>> ignored, which can cause unregistering vme_root fail when exit.
>>
>>   general protection fault,
>>   probably for non-canonical address 0xdffffc000000008c
>>   KASAN: null-ptr-deref in range [0x0000000000000460-0x0000000000000467]
>>   RIP: 0010:root_device_unregister+0x26/0x60
>>   Call Trace:
>>    <TASK>
>>    __x64_sys_delete_module+0x34f/0x540
>>    do_syscall_64+0x38/0x90
>>    entry_SYSCALL_64_after_hwframe+0x63/0xcd
>>
>> Return error when __root_device_register() fails.
>>
>> Fixes: 658bcdae9c67 ("vme: Adding Fake VME driver")
>> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
>> ---
>>   drivers/staging/vme_user/vme_fake.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
>> index dd646b0c531d..1ee432c223e2 100644
>> --- a/drivers/staging/vme_user/vme_fake.c
>> +++ b/drivers/staging/vme_user/vme_fake.c
>> @@ -1073,6 +1073,8 @@ static int __init fake_init(void)
>>   
>>   	/* We need a fake parent device */
>>   	vme_root = __root_device_register("vme", THIS_MODULE);
> This should be calling root_device_register() as well, not this version
> of the call.
Of course it should. Have sent another patch for it.

Thanks for your time!
Chen
> thanks,
>
> greg k-h
