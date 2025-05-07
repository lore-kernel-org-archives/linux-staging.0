Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A84186E2E
	for <linux-staging@lists.linux.dev>; Wed,  7 May 2025 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607755; cv=none; b=W602J9BzrrgUsbFw7kVMy8zt+lMGrxpY2esMHkzh0+xtBIWapqdGjhIJUa6Uai4UCQ/zXw2dwQM/r8i/74h2U1cjeJYQlypJ88VPMnaZ0RK84zZQBdIduNqBgKC2HZdBKK37D1EaaoMcmkVenrr73NTg1hnSyNkNB1CDuYHln8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607755; c=relaxed/simple;
	bh=g/bgMzABqmeK5ZOGSDI7WEA1Yu3yTLaOQjHdBstHEi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYkey9H3fA/bvb1v2VuOVmkMkdSYevabLBtnQFPzAgXCZCYkLCl0Sgz1E9XmglYAIftDClo/rcluyvqrCkJpknLVfwWuxwgxARPYLVbhXmKrcC8UB9CdJ1DJu2pA/Kmt42Ho0u75Ug/AYwTeDfupNycYAzpyQsSqkBYUPjtmuN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVqGvtRg; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVqGvtRg"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so10468852a12.3
        for <linux-staging@lists.linux.dev>; Wed, 07 May 2025 01:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746607751; x=1747212551; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+10a6Fl3SYk8s9AOlehRcxdun4zG4/gdUlq2lQ15FrQ=;
        b=EVqGvtRgIOIsj47+w4Dr07bxTFLCJBTsr5Abbuj2n+1uOynPs83Rt/LbV/JDqwFBLT
         JWE4J61oq8YF2t3NqhxmCIHUlG27yLtcDDnkC/UMGuQ0I0KquUs33VOOkRfJ001H38lp
         UZCDMH0vts63ycPlyRbGs0TTSYTG3lMjKwQSny0Y03TuKvFbWpGzegPXb8AwuGYASl9+
         KpPMUrRDS2XgXpzWBnl6Ay39oBnz0S9plBpICQsYZbfN0O4T50YqTWWkLMpDwLvYJhsa
         2N6q4rikGjlx6cVoSDimVnMo1Lc1iuozPBgMPpJohBEkah6CI+ixj4svUG4E9/xjgTld
         B6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746607751; x=1747212551;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+10a6Fl3SYk8s9AOlehRcxdun4zG4/gdUlq2lQ15FrQ=;
        b=Wh/g1C0sb5XoP8FxmmLGKYxDp4XBNHjwp/gWDEK+FZTE1xFK6FwqbO16oj6rCltLbm
         Yg83xKvt7VcbI0z2zU1aYpQxTN3UYyTTF3G45aZJBhxT0HNUp1o/09TFsmHhzLmy/+dI
         lSLlbPrtSGQPPBBgc5hpESj6AkXWFsVWFBBvv0kGSxloJTzssMDQARvK6IsyyowgWnqg
         cyP0VucT7lKym2BurMalY2zioswfP1DHCc87HYaofP3Jd72oHB2wUY2YdK2/c/8YH5sD
         Ic6US67sEAv4GwnDUy6exqXPW0WIX+5cegGyusCvLhDQLb8Kfa+ZlVkxjz+P+xafLLMi
         EkaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmBqGpdciotu2Mqg6OaZhlO0eU12gNqY5F8dP1IS0RhpBLD3oS91OMBAXsAIlHkzRhtpeHP3YKMKomKCnc@lists.linux.dev
X-Gm-Message-State: AOJu0YxW2fFisM1uwtu/EiIvaoFDn7FPwQuGmtenj3ivrP6vSOCUqJUq
	ucJhk2HT8q8NIU9Q6YeFlS3mnS8bwbApiE223zqhTY7UyzuzH7fv
X-Gm-Gg: ASbGncs8tvc3l1UG9ASzB2gWBf32q/+9brV70v8WoQtCHu0vVyq71/ovfFyE3kgnj5f
	GMTvj7rBPa+E/wX83gl2UNKgon2Nbz8xOjHmktIw9t3D9xz+M522Yf4OrUoB9/tCZ+urJ3pU4PM
	SkG2Re7LHMrAZmumR6nrArkGN96CyM54ZovQlv2pZDYuIzvowKrp2eE70zd07tH5tzgNvE6YXVc
	rewZCTyzNb1aGc5O4rwt+J2iOtLzRICEce5/OCtRVcFmn1fxUVSfH2w9x+jNxGOQ7Hv0cb79Rya
	ZXBM4YaIaTwU0WXdeVpg+piQiGOkdUSvq6TDd1ApSRAkOw==
X-Google-Smtp-Source: AGHT+IH7l4ECxJMJdvAnFGxq4javtpxMVIOqZQGVLLZY3qh4kIT2AXvmCFtcH3BzW9LSfh6TllvpTg==
X-Received: by 2002:a17:907:86a4:b0:abf:733f:5c42 with SMTP id a640c23a62f3a-ad1e8cacfb8mr222839866b.8.1746607751184;
        Wed, 07 May 2025 01:49:11 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147431sm869699666b.8.2025.05.07.01.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 01:49:10 -0700 (PDT)
Message-ID: <c56d03cb-14a4-4a7f-82e7-80368c3ca4ec@gmail.com>
Date: Wed, 7 May 2025 11:49:06 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Jakub Kostiw <jakub.kostiw@videtronic.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-13-demonsingur@gmail.com>
 <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
 <f22f1343-9b7b-4ae6-9461-bc1b8108619f@gmail.com>
 <d4165e96-7587-471c-a7c5-ffa26531a796@videtronic.com>
 <eb2f0337-9261-4867-b6e2-dd6ca2fd25fa@gmail.com>
 <29eea52b-a512-4948-b4e0-e6d19d09ded4@videtronic.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <29eea52b-a512-4948-b4e0-e6d19d09ded4@videtronic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/7/25 10:28 AM, Jakub Kostiw wrote:
>> Can you revert the change you made to polarity_on_physical_lanes, and
>> try the following?
>>
>> diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/ 
>> media/i2c/maxim-serdes/max9296a.c
>> index f48f5b68a750..dea0518fd790 100644
>> --- a/drivers/media/i2c/maxim-serdes/max9296a.c
>> +++ b/drivers/media/i2c/maxim-serdes/max9296a.c
>> @@ -474,7 +474,7 @@ static int max9296a_init_phy(struct max_des *des, 
>> struct max_des_phy *phy)
>>                  */
>>
>>                 if (priv->info->polarity_on_physical_lanes)
>> -                       map = phy->mipi.data_lanes[i];
>> +                       map = phy->mipi.data_lanes[i] - 1;
>>                 else
>>                         map = i;
>>
>> data_lanes is 1-based (since 0 is the clock lane), but the bits
>> in register 0x335 start from 0. That means we should adjust the
>> values in data_lanes to be 0-based. 
> 
> I have applied your patch and polarity settings seems to be correct now 
> (based on register contents).
> However, I have came across another issue.
> When I was debugging the driver for MAX96714, before I found out that 
> the issue was with polarity settings, I have commented out calls to 
> MAX9296A_DPLL_0. Probably because I thought it was there by mistake. I 
> totally forgot about that change.
> Before applying your patch I reverted any changes to the driver, so 
> MAX9296A_DPLL_0 writes were back again. Sadly, video stream did not 
> work. So I began to wonder, and just for sake of testing, commented 
> these calls again (added some logs for quick tracing purposes):
> 
> diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/media/ 
> i2c/maxim-serdes/max9296a.c
> index f48f5b68a..b24a8e2d6 100644
> --- a/drivers/media/i2c/maxim-serdes/max9296a.c
> +++ b/drivers/media/i2c/maxim-serdes/max9296a.c
> @@ -391,6 +391,8 @@ static int max9296a_init_phy(struct max_des *des, 
> struct max_des_phy *phy)
>           * PHY1 Lane 1 = D3
>           */
> 
> +       dev_info(priv->dev, "Using  %d lanes", num_data_lanes);
> +
>          /* Configure a lane count. */
>          ret = regmap_update_bits(priv->regmap, 
> MAX9296A_MIPI_TX10(hw_index),
>                                   MAX9296A_MIPI_TX10_CSI2_LANE_CNT,
> @@ -474,7 +476,7 @@ static int max9296a_init_phy(struct max_des *des, 
> struct max_des_phy *phy)
>                   */
> 
>                  if (priv->info->polarity_on_physical_lanes)
> -                       map = phy->mipi.data_lanes[i];
> +                       map = phy->mipi.data_lanes[i] - 1;
>                  else
>                          map = i;
> 
> @@ -484,6 +486,9 @@ static int max9296a_init_phy(struct max_des *des, 
> struct max_des_phy *phy)
>          if (phy->index == 0 && priv->info->phy0_lanes_0_1_on_second_phy)
>                  val = ((val & 0x3) << 2) | ((val >> 2) & 0x3);
> 
> +       dev_info(priv->dev, "Val for MIPI_PHY5 (0_1): %lx", 
> FIELD_PREP(MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1, val));
> +       dev_info(priv->dev, "Val for MIPI_PHY5 (2_3): %lx", 
> FIELD_PREP(MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3, val >> 2));
> +
>          ret = regmap_update_bits(priv->regmap, MAX9296A_MIPI_PHY5(index),
> MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1 |
> MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3,
> @@ -499,10 +504,10 @@ static int max9296a_init_phy(struct max_des *des, 
> struct max_des_phy *phy)
>                  return ret;
> 
>          /* Put DPLL block into reset. */
> -       ret = regmap_clear_bits(priv->regmap, MAX9296A_DPLL_0(hw_index),
> - MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
> -       if (ret)
> -               return ret;
> +       //ret = regmap_clear_bits(priv->regmap, MAX9296A_DPLL_0(hw_index),
> +       // MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
> +       //if (ret)
> +       //      return ret;
> 
>          /* Set DPLL frequency. */
>          ret = regmap_update_bits(priv->regmap, MAX9296A_BACKTOP22(index),
> @@ -519,10 +524,10 @@ static int max9296a_init_phy(struct max_des *des, 
> struct max_des_phy *phy)
>                  return ret;
> 
>          /* Pull DPLL block out of reset. */
> -       ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(index),
> -                             MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
> -       if (ret)
> -               return ret;
> +       //ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(index),
> +       //                    MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
> +       //if (ret)
> +       //      return ret;
> 
>          if (dpll_freq > 1500000000ull) {
>                  /* Enable initial deskew with 2 x 32k UI. */
> 
> To my surprise it works this way. I tested this 2 times back and forth. 
> Can these calls really cause some issues?


Can you revert your changes and try this?

diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c 
b/drivers/media/i2c/maxim-serdes/max9296a.c
index dea0518fd790..3bb80fe42a22 100644
--- a/drivers/media/i2c/maxim-serdes/max9296a.c
+++ b/drivers/media/i2c/maxim-serdes/max9296a.c
@@ -519,7 +519,7 @@ static int max9296a_init_phy(struct max_des *des, 
struct max_des_phy *phy)
  		return ret;

  	/* Pull DPLL block out of reset. */
-	ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(index),
+	ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(hw_index),
  			      MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
  	if (ret)
  		return ret;


