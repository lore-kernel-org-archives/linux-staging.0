Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EE16D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 08:30:18 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FFcwF5tXBz7tKn;
	Wed,  7 Apr 2021 16:27:57 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Wed, 7 Apr 2021
 16:30:00 +0800
Subject: Re: [PATCH] staging: greybus: move to use request_irq by
 IRQF_NO_AUTOEN flag
To: Greg KH <gregkh@linuxfoundation.org>, Tian Tao <tiantao6@hisilicon.com>
CC: <hvaibhav.linux@gmail.com>, <johan@kernel.org>, <elder@kernel.org>,
	<greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>
References: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>
 <YG1rwdRzKk83RBmG@kroah.com>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <5126cb93-4227-8a0f-1421-7685ade4b2e2@huawei.com>
Date: Wed, 7 Apr 2021 16:29:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YG1rwdRzKk83RBmG@kroah.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected


ÔÚ 2021/4/7 16:22, Greg KH Ð´µÀ:
> On Wed, Apr 07, 2021 at 02:50:03PM +0800, Tian Tao wrote:
>> disable_irq() after request_irq() still has a time gap in which
>> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
>> disable IRQ auto-enable because of requesting.
>>
>> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
>> is being merged: https://lore.kernel.org/patchwork/patch/1388765/
> Can you wait until that is merged before sending this out to us as we
> can't do anything until then.

this is already in linux-next.git.

cbe16f3 genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()


>
> thanks,
>
> greg k-h
> .
>

