Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD535F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:10:27 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9y5Z2dY2z17PVn;
	Thu,  1 Apr 2021 17:08:18 +0800 (CST)
Received: from [10.174.178.174] (10.174.178.174) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 1 Apr 2021 17:10:22 +0800
Subject: Re: [PATCH -next v2] staging: greybus: camera: Switch to
 memdup_user_nul()
To: Greg KH <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<johan@kernel.org>, <elder@kernel.org>
References: <20210401031752.2861248-1-yangyingliang@huawei.com>
 <YGVhLiV1EeqIJQnM@kroah.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <36473834-c62b-c6a7-0d36-ff9a8cd867ac@huawei.com>
Date: Thu, 1 Apr 2021 17:10:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YGVhLiV1EeqIJQnM@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-CFilter-Loop: Reflected


On 2021/4/1 13:59, Greg KH wrote:
> On Thu, Apr 01, 2021 at 11:17:52AM +0800, Yang Yingliang wrote:
>> Use memdup_user_nul() helper instead of open-coding to
>> simplify the code.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/staging/greybus/camera.c | 13 +++----------
>>   1 file changed, 3 insertions(+), 10 deletions(-)
> What changed from v1?
>
> Always put that below the --- line like the documentation asks you to.
> Please fix up and send a v3.

OK, I will add the changelog and send a v3 later

Thanks,

Yang

>
> thanks,
>
> greg k-h
> .
