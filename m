Received: from mail.meizu.com (edge07.meizu.com [112.91.151.210])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D3617C9
	for <linux-staging@lists.linux.dev>; Tue, 31 May 2022 01:41:50 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail11.meizu.com
 (172.16.1.15) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 31 May
 2022 09:41:41 +0800
Received: from [172.16.137.70] (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 31 May
 2022 09:41:41 +0800
Message-ID: <4c7f6aa3-4463-81f7-fe6e-8428286a42f2@meizu.com>
Date: Tue, 31 May 2022 09:41:41 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: atomisp-mt9m114: Fix pointer dereferenced before
 checking
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <1653897481-25681-1-git-send-email-baihaowen@meizu.com>
 <20220530112232.GB99280@tom-ThinkPad-T14s-Gen-2i>
 <20220530113750.GD99280@tom-ThinkPad-T14s-Gen-2i>
From: baihaowen <baihaowen@meizu.com>
In-Reply-To: <20220530113750.GD99280@tom-ThinkPad-T14s-Gen-2i>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)

在 2022/5/30 下午7:37, Tommaso Merciai 写道:
> On Mon, May 30, 2022 at 01:22:32PM +0200, Tommaso Merciai wrote:
>> On Mon, May 30, 2022 at 03:58:01PM +0800, Haowen Bai wrote:
>>> The info->data is dereferencing before null checking, so move
>>> it after checking.
>>>
>>> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
>>> ---
>>>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
>>> index 00d6842c07d6..3c81ab73cdae 100644
>>> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
>>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
>>> @@ -616,13 +616,15 @@ static int mt9m114_get_intg_factor(struct i2c_client *client,
>>>  				   struct camera_mipi_info *info,
>>>  				   const struct mt9m114_res_struct *res)
>>>  {
>>> -	struct atomisp_sensor_mode_data *buf = &info->data;
>>> +	struct atomisp_sensor_mode_data *buf;
>>>  	u32 reg_val;
>>>  	int ret;
>>>  
>>>  	if (!info)
>>>  		return -EINVAL;
>>>  
>>> +	buf = &info->data;
>>> +
>>>  	ret =  mt9m114_read_reg(client, MISENSOR_32BIT,
>>>  				REG_PIXEL_CLK, &reg_val);
>>>  	if (ret)
>>> -- 
>>> 2.7.4
>>>
>> Hi Haowen,
>> Looks good to me, thanks.
>>
>> Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> Hi,
> My bad, Dan is right. Nothing to fix here.
> Sorry for previous review.
>
> Regards,
> Tommaso
>> -- 
>> Tommaso Merciai
>> Embedded Linux Engineer
>> tommaso.merciai@amarulasolutions.com
>> __________________________________
>>
>> Amarula Solutions SRL
>> Via Le Canevare 30, 31100 Treviso, Veneto, IT
>> T. +39 042 243 5310
>> info@amarulasolutions.com
>> www.amarulasolutions.com
hi, Dan
Thank you for pointing out. I'm clear now.

-- 
Haowen Bai

