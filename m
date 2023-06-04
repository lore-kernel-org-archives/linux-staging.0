Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944E82CA9
	for <linux-staging@lists.linux.dev>; Sun,  4 Jun 2023 21:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685914099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2EwAaiE1EReWg4vdJzSfny7K1VZxmbbQ8xua1kzbBu4=;
	b=UPVpwBIAfW7AlnnVVfdoKx0tKIldCpmFRRukPPDtXWxzC3Sv8n/Y8crJ9VFqkCKUtUSobj
	ZNH3L4f5SBpf5eb6FrN9jDQu57PnzHkggLdR4i0Dk9IMayrEltKVP+Ptnqps86wqw59M7h
	/3VUA7B9oGv8KVbcqJqpkOj8ongJ3ns=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-mMRNvLGcOim5Ue7tauK7Yw-1; Sun, 04 Jun 2023 17:28:18 -0400
X-MC-Unique: mMRNvLGcOim5Ue7tauK7Yw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-95847b4b4e7so328125466b.3
        for <linux-staging@lists.linux.dev>; Sun, 04 Jun 2023 14:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685914097; x=1688506097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EwAaiE1EReWg4vdJzSfny7K1VZxmbbQ8xua1kzbBu4=;
        b=DdJ56mSGZJB1RdTD9hHpIletwVdoLa/EdEWDSrJYqMXrYHjyKyjt46Pu2Cvw8pvy6y
         Uaonm5WIxXhPL7mYSztxIg3BxW+l9UX3zPFxBPSy4KirU94IPqMdn1bC3MMs+kw1F/wA
         UdcT16BgMzmB8tzr8HRK+GLrNt0cosEaejwICIIZKnvvmgohOfrwrXiI8Gf7ZXE1xWec
         Jr+OiOVg52JXVWBIynLItsyiHI5MAlwDJD9hUQPJ3alSIvAQAfPXD9fuxTahUI/LfgfC
         e9FnINhm1fTMC6Q6VZDOIPL4cLZ3p2HR1s3qsMfTZTU+Le1uPH1BEGgv+UXnTZ7Rs9dU
         6/EA==
X-Gm-Message-State: AC+VfDw4ePMz0WBJFpxXYMVsPwGfjripBKKKXuooKRVU/Bhx47GLdaHu
	FrshnqmLUVlNCE+fVdQ5JEmNwK+xbnLuLwjWSdFbGPyMPr0l+B4f3hxd5MMFUkJnVuqWHvwDAOV
	XBg7OQRDu3lPpNHFTdilNRSV4uA==
X-Received: by 2002:a17:907:961e:b0:977:d228:5b88 with SMTP id gb30-20020a170907961e00b00977d2285b88mr2786549ejc.75.1685914096976;
        Sun, 04 Jun 2023 14:28:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79jURXSz7RcWrbpe33LgzVd7M22CzMQRk3+tTO0NTq1t5Rnj0LCM9p+LsjeHrriLMDGu/MMA==
X-Received: by 2002:a17:907:961e:b0:977:d228:5b88 with SMTP id gb30-20020a170907961e00b00977d2285b88mr2786533ejc.75.1685914096633;
        Sun, 04 Jun 2023 14:28:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s18-20020a170906c31200b00969cbd5718asm3447567ejz.48.2023.06.04.14.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 14:28:15 -0700 (PDT)
Message-ID: <2cf31a31-9a57-81e4-b43b-c55c839a9991@redhat.com>
Date: Sun, 4 Jun 2023 23:28:14 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/5] media: atomisp: ov2680: Remove unnecessary registers
 from ov2680_global_setting[]
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230604161406.69369-1-hdegoede@redhat.com>
 <20230604161406.69369-4-hdegoede@redhat.com>
 <CAHp75VciVFzdUAkcGJO66ZCLks8qKmE-_TCp+6pnhtkGeiYurA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VciVFzdUAkcGJO66ZCLks8qKmE-_TCp+6pnhtkGeiYurA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/4/23 21:23, Andy Shevchenko wrote:
> On Sun, Jun 4, 2023 at 7:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Many of the values in ov2680_global_setting[] match the default/reset
>> register value for the ov2680 sensor (verified with both datasheet
>> and actual hw) so they are no-ops.
>>
>> And there are also a coupe of others which are later overwritten
>> by ctrls or by ov2680_set_mode().
>>
>> Remove all the unnecessary entries and add annotations to
>> the remaining entries documenting what they change
>> (in sofar as things are documented in the datasheet).
> 
> My spell checker suggests either "in so far as" or "insofar as".
> 
>> This also removes the double writing of OV2680_REG_SOFT_RESET in
>> ov2680_init_registers() (one direct write, one in ov2680_global_setting[])
>> instead add a short sleep after the first write to give the sensor
>> time to reset.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../media/atomisp/i2c/atomisp-ov2680.c        |   1 +
>>  drivers/staging/media/atomisp/i2c/ov2680.h    | 117 ++++++++----------
>>  2 files changed, 56 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> index 1db2eb9f9e25..dcc06c725544 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> @@ -175,6 +175,7 @@ static int ov2680_init_registers(struct v4l2_subdev *sd)
>>         int ret;
>>
>>         ret = ov_write_reg8(client, OV2680_SW_RESET, 0x01);
>> +       usleep_range(1000, 2000);
> 
> Perhaps surround this with blank lines and s little comment?
> Also does this sleep is anyhow required by a datasheet, or is it
> purely empirical?

The sleep is taken from the drivers/media/i2c/ov2680.c version
of the driver, to replace writing the reset reg twice.

The datasheet says the first i2c-transaction after a reset
needs to be delayed by 8192 cycles of the provided external clk,
which with a 19.2MHz clk is roughly 0.5 ms.  But that is for
a reset through the XSHUTDOWN pin of the sensor. How long
a sw initiated reset takes is not specified.

Regards,

Hans



> 
>>         ret |= ov2680_write_reg_array(client, ov2680_global_setting);
> 
> Side note: this is weird for an int returned variable.
> 
>>         return ret;
>> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
>> index b6c0ef591c69..6a71de55600b 100644
>> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
>> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
>> @@ -172,82 +172,75 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
>>  }
>>
>>  static struct ov2680_reg const ov2680_global_setting[] = {
>> -       {0x0103, 0x01},
>> -       {0x3002, 0x00},
>> +       /* MIPI PHY, 0x10 -> 0x1c enable bp_c_hs_en_lat and bp_d_hs_en_lat */
>>         {0x3016, 0x1c},
>> -       {0x3018, 0x44},
>> -       {0x3020, 0x00},
>> -       {0x3080, 0x02},
>> +
>> +       /* PLL MULT bits 0-7, datasheet default 0x37 for 24MHz extclk, use 0x45 for 19.2 Mhz extclk */
>>         {0x3082, 0x45},
>> -       {0x3084, 0x09},
>> -       {0x3085, 0x04},
>> -       {0x3086, 0x00},
>> +
>> +       /* R MANUAL set exposure (0x01) and gain (0x02) to manual (hw does not do auto) */
>>         {0x3503, 0x03},
>> -       {0x350b, 0x36},
>> -       {0x3600, 0xb4},
>> -       {0x3603, 0x39},
>> -       {0x3604, 0x24},
>> -       {0x3605, 0x00},
>> -       {0x3620, 0x26},
>> -       {0x3621, 0x37},
>> -       {0x3622, 0x04},
>> -       {0x3628, 0x00},
>> -       {0x3705, 0x3c},
>> -       {0x370c, 0x50},
>> -       {0x370d, 0xc0},
>> -       {0x3718, 0x88},
>> -       {0x3720, 0x00},
>> -       {0x3721, 0x00},
>> -       {0x3722, 0x00},
>> -       {0x3723, 0x00},
>> -       {0x3738, 0x00},
>> -       {0x3717, 0x58},
>> -       {0x3781, 0x80},
>> -       {0x3789, 0x60},
>> -       {0x3800, 0x00},
>> -       {0x3819, 0x04},
>> +
>> +       /* Analog control register tweaks */
>> +       {0x3603, 0x39}, /* Reset value 0x99 */
>> +       {0x3604, 0x24}, /* Reset value 0x74 */
>> +       {0x3621, 0x37}, /* Reset value 0x44 */
>> +
>> +       /* Sensor control register tweaks */
>> +       {0x3701, 0x64}, /* Reset value 0x61 */
>> +       {0x3705, 0x3c}, /* Reset value 0x21 */
>> +       {0x370c, 0x50}, /* Reset value 0x10 */
>> +       {0x370d, 0xc0}, /* Reset value 0x00 */
>> +       {0x3718, 0x88}, /* Reset value 0x80 */
>> +
>> +       /* PSRAM tweaks */
>> +       {0x3781, 0x80}, /* Reset value 0x00 */
>> +       {0x3784, 0x0c}, /* Reset value 0x00, based on OV2680_R1A_AM10.ovt */
>> +       {0x3789, 0x60}, /* Reset value 0x50 */
>> +
>> +       /* BLC CTRL00 0x01 -> 0x81 set avg_weight to 8 */
>>         {0x4000, 0x81},
>> -       {0x4001, 0x40},
>> +
>> +       /* Set black level compensation range to 0 - 3 (default 0 - 11) */
>>         {0x4008, 0x00},
>>         {0x4009, 0x03},
>> +
>> +       /* VFIFO R2 0x00 -> 0x02 set Frame reset enable */
>>         {0x4602, 0x02},
>> +
>> +       /* MIPI ctrl CLK PREPARE MIN change from 0x26 (38) -> 0x36 (54) */
>>         {0x481f, 0x36},
>> +
>> +       /* MIPI ctrl CLK LPX P MIN change from 0x32 (50) -> 0x36 (54) */
>>         {0x4825, 0x36},
>> -       {0x4837, 0x18},
>> +
>> +       /* R ISP CTRL2 0x20 -> 0x30, set sof_sel bit */
>>         {0x5002, 0x30},
>> -       {0x5004, 0x04},//manual awb 1x
>> -       {0x5005, 0x00},
>> -       {0x5006, 0x04},
>> -       {0x5007, 0x00},
>> -       {0x5008, 0x04},
>> -       {0x5009, 0x00},
>> -       {0x5080, 0x00},
>> -       {0x5081, 0x41},
>> -       {0x5708, 0x01},  /* add for full size flip off and mirror off 2014/09/11 */
>> -       {0x3701, 0x64},  //add on 14/05/13
>> -       {0x3784, 0x0c},  //based OV2680_R1A_AM10.ovt add on 14/06/13
>> -       {0x5780, 0x3e},  //based OV2680_R1A_AM10.ovt,Adjust DPC setting (57xx) on 14/06/13
>> -       {0x5781, 0x0f},
>> -       {0x5782, 0x04},
>> -       {0x5783, 0x02},
>> -       {0x5784, 0x01},
>> -       {0x5785, 0x01},
>> -       {0x5786, 0x00},
>> -       {0x5787, 0x04},
>> +
>> +       /*
>> +        * Window CONTROL 0x00 -> 0x01, enable manual window control,
>> +        * this is necessary for full size flip and mirror support.
>> +        */
>> +       {0x5708, 0x01},
>> +
>> +       /*
>> +        * DPC CTRL0 0x14 -> 0x3e, set enable_tail, enable_3x3_cluster
>> +        * and enable_general_tail bits based OV2680_R1A_AM10.ovt.
>> +        */
>> +       {0x5780, 0x3e},
>> +
>> +       /* DPC MORE CONNECTION CASE THRE 0x0c (12) -> 0x02 (2) */
>>         {0x5788, 0x02},
>> -       {0x5789, 0x00},
>> -       {0x578a, 0x01},
>> -       {0x578b, 0x02},
>> -       {0x578c, 0x03},
>> -       {0x578d, 0x03},
>> +
>> +       /* DPC GAIN LIST1 0x0f (15) -> 0x08 (8) */
>>         {0x578e, 0x08},
>> +
>> +       /* DPC GAIN LIST2 0x3f (63) -> 0x0c (12) */
>>         {0x578f, 0x0c},
>> -       {0x5790, 0x08},
>> -       {0x5791, 0x04},
>> +
>> +       /* DPC THRE RATIO 0x04 (4) -> 0x00 (0) */
>>         {0x5792, 0x00},
>> -       {0x5793, 0x00},
>> -       {0x5794, 0x03}, //based OV2680_R1A_AM10.ovt,Adjust DPC setting (57xx) on 14/06/13
>> -       {0x0100, 0x00}, //stream off
>> +
>>         {}
>>  };
>>
>> --
>> 2.40.1
>>
> 
> 

