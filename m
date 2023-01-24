Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4473710F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 11:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674559781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iKvyGA3eKwxGhwNQQQ5wYVrvzSYRhmGXSO5oGhfNkrQ=;
	b=ejMLApwbLEYajXNILyxdNQKMJ4ajdMFr7VnxwQrEX7if1UUB0JGXJu0xcwlfjj2Nw2A8On
	p4shjPIHRwyEl5bth2SqX8f0PfPfLx21wvma4RtTCtOIwCup2qp3Onafyc4Ezhv+ZXwnpz
	UqijihWLbtlAOP2CZOJfI7fAd47wsYc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-tP5Uo2SBN56ezck4ybB4Hw-1; Tue, 24 Jan 2023 06:29:40 -0500
X-MC-Unique: tP5Uo2SBN56ezck4ybB4Hw-1
Received: by mail-ej1-f71.google.com with SMTP id nb4-20020a1709071c8400b0084d4712780bso9711372ejc.18
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 03:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iKvyGA3eKwxGhwNQQQ5wYVrvzSYRhmGXSO5oGhfNkrQ=;
        b=3G0lVpNoMF5Do69o8Qgh+O4oUjj4UGrhU8ri+30GXzSlEV9e9kuEibrJCCqKtjsvN4
         v0/qySOZv8XbDrkftfHDmXuYHav50HzZXWGnUauSHj2HM4MnG7442D7UmamUnMzIPGkS
         BvHYXKnSAHRUdi3rzAtym2h56oZkhPWOrc9FcRIhhTwWBXuiFBBzgDIaFM4l5MxYsUHY
         Kt8cGp0vf7oBa0f0qO6ZmmucMRBifuVgAdUpJyRIhroHJROkWhrBQ7XAzTDwRYjDct95
         MS4l3LsxOi+o0Coyn02rIphi6lx1inr3lraTUd11kFgy0VOVpegQIcYzMOa41BxUMO6U
         OH1w==
X-Gm-Message-State: AFqh2krIBDA+YvZqCspdM16aRnjkM3i0iavd99EmmzbRDixBunjatKfX
	GesY6R5Kl+0jnj6paocwmivicoERKq1hWMOiW1cpOre7dqUr6ySpE7ZT+O49Tdosu/EQT+G14Gw
	3T8bbNH9nSplClVOhYpTzOOZj3Q==
X-Received: by 2002:a17:907:a601:b0:877:a7ec:5ff with SMTP id vt1-20020a170907a60100b00877a7ec05ffmr15201254ejc.10.1674559778933;
        Tue, 24 Jan 2023 03:29:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvhVBg8FFeD/NQQUQhWdedsoSMLZip7WQnJFAsLlELR8ZNC1+Bt0uY89BKhV2vZad/NZlvWuA==
X-Received: by 2002:a17:907:a601:b0:877:a7ec:5ff with SMTP id vt1-20020a170907a60100b00877a7ec05ffmr15201232ejc.10.1674559778705;
        Tue, 24 Jan 2023 03:29:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a8-20020a17090680c800b0084d397e0938sm748722ejx.195.2023.01.24.03.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:29:38 -0800 (PST)
Message-ID: <6c2e79f9-17df-ba7f-24a9-ca1ab8e480ca@redhat.com>
Date: Tue, 24 Jan 2023 12:29:37 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 41/57] media: atomisp: ov2680: Fix frame_size list
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-42-hdegoede@redhat.com>
 <Y8+29/sVriYtlUTx@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y8+29/sVriYtlUTx@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/24/23 11:46, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:49PM +0100, Hans de Goede wrote:
>> 3 fixes for the framesize list:
>>
>> 1. Drop modes < 640x480, these are made by significant cropping,
>>    leading to such a small remainig field-of-view that they are
>>    not really usable
> 
> Wondering if we have an algo to actually scale instead of crop.

The sensor can "bin" the pixels, that is use every other pixel,
that already is used. Plain binning gives us 1600x1200 -> 800x600,
640x480 is binning + some cropping.

Regards,

Hans


> 
>> 2. 1616x1082 is presumably intended to be 1600x1080 + 16 pixels
>>    padding in both dimensions, but the height is wrong.
>>    Change this to 1616x1096.
>>
>> 3. The 800x600 mode is missing the 16 pixels padding and
>>    720x592 is missing 16 pixels padding in its width and
>>    the 720x576 base mode is a mode with non square pixels,
>>    while the sensor has square pixels.
>>    Replace both with 768x576 + 16 pixels padding -> 784x592
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> index 432539dd274c..81fd36b09090 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> @@ -700,17 +700,13 @@ static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
>>  {
>>  	static const struct v4l2_frmsize_discrete ov2680_frame_sizes[] = {
>>  		{ 1616, 1216 },
>> -		{ 1616, 1082 },
>> +		{ 1616, 1096 },
>>  		{ 1616,  916 },
>>  		{ 1456, 1096 },
>>  		{ 1296,  976 },
>>  		{ 1296,  736 },
>> -		{  800,  600 },
>> -		{  720,  592 },
>> +		{  784,  592 },
>>  		{  656,  496 },
>> -		{  336,  256 },
>> -		{  352,  288 },
>> -		{  176,  144 },
>>  	};
>>  	int index = fse->index;
>>  
>> -- 
>> 2.39.0
>>
> 

