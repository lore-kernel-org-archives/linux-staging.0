Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5675F1553AA
	for <linux-staging@lists.linux.dev>; Wed,  7 May 2025 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617925; cv=none; b=ZcrMkm0PVYcCH4qQIyqVYB+k2uvvoYFdHkl/N2LZXafJZNW8CQB+gYGVYW8K8ufMJxdOBXNH3joS/sKN3nhQjra4Xu3WWO0b+jTya+O5JpAtIfp0zAIm5xwZRHZRs4yRGDMrDtLXYaG7yYRXACYwhfZf8OSy9U9XCEznxy3U9hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617925; c=relaxed/simple;
	bh=1yZlQJHQ4zomcuM/eaY4DuDI2Jgr0zUT6J/I8Q73GhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efY32gm+jCD+R6wcD5V7ehyl6ToZOs9YrMo/tt8SUe8n3nWj1n6gvetITm2YyVls3B5pNTEtw8N6qOMgnq7AE50VDN1vDgaKpqgL8hQgzcUaMQtKD2OgFFx/Et5Kqy8f47dqFsBDqevpiAkCMQ1HzEafu1+x5/guyu0tnUsGJlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fX54Z/pj; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fX54Z/pj"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fbf534f8dbso678535a12.3
        for <linux-staging@lists.linux.dev>; Wed, 07 May 2025 04:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746617922; x=1747222722; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fiVdAIN2EPB5/ddGNaW9SkB5MJnYa5J03/Pp0KFzzWw=;
        b=fX54Z/pj3dmzanl82andLv8mpiLcOFaMKaJSb4OiqIjg9mYsev5dVwxnwwMmOnBESm
         9OHJnve6UQv77FK4GG734jYObPCCEA0XLpns7VGL9CftHUv2wDeiHseLfJz3BJ7zlVzt
         M5Aw6JKzA9UTOFumxfg7kDC94q42pVTdB/migWKs7IqYHx3SrWW82eXVpFGLJFKuVHMB
         J2facnFQLGRa1YbtJIZCBnPSdsdybS5J/eu4GfHAGvvwWLZHVYlTv5coopO7QogbwrP3
         qhhi+3IF7J4gWZUmj3bGKG9eirf1D/mnqOL5fpw4ca9ygNSbKs7Nw2Bwk1Vf8Lktd5ZE
         ngMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746617922; x=1747222722;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiVdAIN2EPB5/ddGNaW9SkB5MJnYa5J03/Pp0KFzzWw=;
        b=QawDUKIjO4gtxki5fJ4jTBKP+OKLDrXIZnhjtZGxWOK3JkVT9B06TQpPlz1J8jiTH3
         wxPZ2Rl3FC/OtiZYzba98qUXLcACt2aJr9ZrTTHojRmvPtxgonc3u5jNvYT1FgmSj7fs
         hDIdyjMTRtoLRBMx6WvALG+IoIrTAtcVoQ2nPKcvqDxcxi1ZzvOHGDFlosbfjElaoXvv
         mYY5utEdr4jkyAeIeJUzE/+W4hKWJFh1yT15gy+VsQvsVzThAPURa0ohG1MsTsBjREX/
         m6FBqqwP0WKNt0WKm8vRHhyGq6jh0zn1J90jWP0eNvy7a97wZYCsnkLyfB0Otn+i8sl1
         VVEA==
X-Forwarded-Encrypted: i=1; AJvYcCUV0/cEoQ/ux9u38hmBwV2hkXXkMMNVwdubM/ReTaw823sVrrX59+sMCucYAMOnUAyPoaduFbw4uj39EKIn@lists.linux.dev
X-Gm-Message-State: AOJu0YymbAnS1wz8CtFwzXT5uRn4i3OMtnzSfNEwRTcQBzvJJ58Li2h0
	CFqNS86RbQ8/x6q7SZTzYkGecSyA7JsDCX3hxq0oSmEjJ+Kzu9EM
X-Gm-Gg: ASbGncuclW94gJzV+PpECGIudVWfXB7vOmzMNN5C0LJoOUSrYjqoOTmwj5GET3MPFSO
	YjbSRugLNR4mrJNqGFdEVsmO0GTannPKiLVVOx5/m8LcHgNFE2HBRPgfx4gc2WB8frGkhqIn5UX
	H8k6bfsaJX+8XhEiU5SfjlL0bnd5hyTfCAThMe0FGSBgT3HdtL4KJwDJowQfnrt9zG5mRe6QN7T
	/f7NVMgVVkrb39t8vkb6t/p6AkZY/g5Sy+Tm6WKH+VqdCtkSJ2Mj5LHnKq6DSJQjypEbFLujSpf
	j0gyjgJQeC0R1XjB9RfpkzE5j8ROhzmwk44EHUMCmHSibg==
X-Google-Smtp-Source: AGHT+IFaUn9FlKna7lUxaaYjgUBZjL/UsUXC91d7yrrpq2Az6cyujMB9sV2nGW2h0aB7+bST1a06Qw==
X-Received: by 2002:a17:907:7fab:b0:ac7:18c9:2975 with SMTP id a640c23a62f3a-ad1e8d053b4mr311005066b.48.1746617921236;
        Wed, 07 May 2025 04:38:41 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a2515sm900306566b.39.2025.05.07.04.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 04:38:40 -0700 (PDT)
Message-ID: <b825ab7e-dbf6-4dcc-a35b-3fef0f0c4969@gmail.com>
Date: Wed, 7 May 2025 14:38:36 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jakub Kostiw <jakub.kostiw@videtronic.com>
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
 <CAPY8ntCtycm+fha9yuJyr2_9obq8cq6xjYJT7acnFPgh_sCi8Q@mail.gmail.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <CAPY8ntCtycm+fha9yuJyr2_9obq8cq6xjYJT7acnFPgh_sCi8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/7/25 2:22 PM, Dave Stevenson wrote:
> Hi Jakub and Cosmin
> 
> On Tue, 6 May 2025 at 19:34, Jakub Kostiw <jakub.kostiw@videtronic.com> wrote:
>>
>> Hi Cosmin
>>
>> Awesome work. The initiative to establish a common framework for GMSL
>> devices is a great idea.
>>
>> I believe that we have found few bugs:
>>
>>> +#define MAX9296A_BACKTOP22(x)                        (0x31d * (x) * 0x3)
>>
>> The first multiplication is wrong and should be replaced with addition:
>>
>> +#define MAX9296A_BACKTOP22(x)                  (0x31d + (x) * 0x3)
>>
>> The same goes for MAX96724 equivalent macro:
>>
>>> +#define MAX96724_BACKTOP22(x)                        (0x415 * (x) * 0x3)
>>
>> In MAX96714 driver there is an issue with setting up lane-polarities.
>>
>>> +static const struct max9296a_chip_info max96714_info = {
>>> +     .max_register = 0x5011,
>>> +     .set_pipe_stream_id = max96714_set_pipe_stream_id,
>>> +     .set_pipe_enable = max96714_set_pipe_enable,
>>> +     .set_pipe_tunnel_enable = max96714_set_pipe_tunnel_enable,
>>> +     .phys_configs = {
>>> +             .num_configs = ARRAY_SIZE(max96714_phys_configs),
>>> +             .configs = max96714_phys_configs,
>>> +     },
>>> +     .polarity_on_physical_lanes = true,
>>> +     .supports_phy_log = true,
>>> +     .adjust_rlms = true,
>>> +     .num_pipes = 1,
>>> +     .pipe_hw_ids = { 1 },
>>> +     .num_phys = 1,
>>> +     .phy_hw_ids = { 1 },
>>> +     .num_links = 1,
>>> +};
>>
>> In order to make thing work we had to set
>>
>>> +     .polarity_on_physical_lanes = true,
>>
>> To false. So this field is either improperly set for MAX96714, or handling of this case is wrong:
>>
>>> +             if (priv->info->polarity_on_physical_lanes)
>>> +                     map = phy->mipi.data_lanes[i];
>>> +             else
>>> +                     map = i;
>>
>> Upon mentioned changes we have successfully tested two GMSL2
>> combinations on Raspberry 5 platform:
>>
>> 1. MAX96724 + MAX96717 (only 2 MIPI-CSI2 lanes with single camera due to
>> hardware limitations)
>>
>> 2. MAX96714 + MAX96717
> 
> Feel free to shout if you want help on the Pi side.
> 
> Pi5 should be able to extract multiple virtual channels to support
> several sensors simultaneously (up to 4 VC/DT combinations). It does
> need a rework so the CFE runs from memory rather than being fed data
> directly from the CSI-2 receiver, but I believe that is pencilled in
> as future work with libcamera already.
> 

Hi Dave, thanks for your input! I'm glad this is getting some traction.

I'm currently testing using Tomi's pyv4l2 tool, which already contains
RPi5 GMSL configs.

I've tested the multi-camera simultaneously streaming usecase already,
all is working well, and I was able to get 4 separate camera image
streams (or 2 image and 2 meta), streaming to the RPi5, and then to
a remote host (where debayer is feasible to do without the help of an
ISP).

Last time I tried libcamera it was not able to properly configure all
entities, so testing with just the mainline CFE using pyv4l2 makes it
much simpler, since we're only interested in getting our hardware
supported.

> Unless things have regressed, libcamera should report all connected
> sensors to SerDes setups, and set up Media Controller appropriately to
> use them one at a time. I know I've had that working with simple CSI-2
> multiplexers and thought I'd had it working with TI FPD-Link III
> SerDes (Arducam's IMX219 V3Link kit, modded to remove their MCU). I
> don't have any GMSL hardware to test with.
> 
> We're also fairly open to merging drivers and overlays for 3rd party
> hardware into the downstream Pi kernel. If they've been reviewed and
> merged upstream then that is the ideal, but if you're prepared to
> support them, then it saves the user the headache of having to build
> out-of-tree modules.
> 
> Cheers
>    Dave

