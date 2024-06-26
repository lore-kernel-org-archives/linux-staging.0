Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7261016A954
	for <linux-staging@lists.linux.dev>; Wed, 26 Jun 2024 09:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719393138; cv=none; b=KE17Q1rU5b2KMAlwrbAzTUDTKtDGZXPnblwPVH+jIuJ/FlMNIYuC2etBTYuHRYvmHVJj2kRpNvCT6m7fFMU9HxuMM6ZJ3q/fXWlyUT/EgbR2/gMeaiNtdLOh7PzovmvFM2BL6neg/VQn57vPEmc4yixK/zdv+q252VdooJKfbEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719393138; c=relaxed/simple;
	bh=CanSw/ga/v+NZ5681NPAHHodTA0bxrOv2IrK+wa7u/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfF/WRP3j7L5gXvgNVnYgixQIwOKfTYCOmP45/Gxr3+v4QfyoOTQgj/ySbI3diDNzRnkrC3MthZT6u3wpxLl/kALK84CI6GqIIx1yfGH/VUb4cwCgY/GeG3hdtFhM0JjGNC7ZZ1fOWrTzyUuRGqz/G+0qD9KGvTg501h9wylNPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy2wMg6R; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy2wMg6R"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6fe61793e2so266210066b.0
        for <linux-staging@lists.linux.dev>; Wed, 26 Jun 2024 02:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719393135; x=1719997935; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FongEw4DVTz7Uk7t+o0KVv9EUD1iaAZOmKGMy2sDWqU=;
        b=cy2wMg6RtY4JoHFAy4KCMfh5z8fJnXqbtkOffMsi7AUEA5lBMjqZU68s7xYkjjsTg4
         veJcO8DvBO2zE+IoojK2AGhHz8EHPWLyU5Zg6FM5aUq4KZTkEon3ETy3I5ZaHwEwRWzk
         SBHyvoSIQmRUwkrMTiaaxgTwoAKLzTe9sna122rTKuAtYzGUKWm3CIGWKFAIxxybGyIk
         RFANxv26oPxqwx5EUj7c4XYZh1ZG3/yrzO3Cuvg8BOUGoDdSNASB2oWtoq+hCPe2Z7CI
         QnZYLawySTU3Uw20l1bV9vN3B4xqVr78ImajI6/xrk80a+l134d9ClcEy72ZV1DVxoGs
         TeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719393135; x=1719997935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FongEw4DVTz7Uk7t+o0KVv9EUD1iaAZOmKGMy2sDWqU=;
        b=RzIkVRRfAovg+3ratwIH/tMg4q58r5ACdl0CjPz5j9RYD9oQIdbtvBid9GDb2Ue86b
         H8ACbfoJYcgGwY5yHDOy9WuMG2XgubR41H8uUwIIdXQqj5Lg0EEhghBfY4sPHT+06ef6
         pAuG4qyyFJnYw2FSlZIQroN3Tk5L9tAbim4FbQ4eL/1gtwoRuQd3UV769aXtE9xOmQGP
         qilM9Ul3oneqkRi8k9a+9KMXFVQXbe9WFUicuuAFq198aEZH5dN8gweb89yMRAVheiF+
         Q+WU3mjqCKyNh3RsAEKZmlnGwrHDH4cbVAxyGbKL+1kfjP17lcJEfYHfGYB7jZ7DFUi/
         pPlg==
X-Forwarded-Encrypted: i=1; AJvYcCUSynEDObMLenMd86FQliW5pKUS+aI9O/qZ3Z1HK4Qy/RvfXisi68esozxnVDUcsPtwfsP0EyshLWaFmg7LPs34ywFgtic+L1axyOov9w==
X-Gm-Message-State: AOJu0YwFcU9ePbwI+arQOZTpnuvX58aWmDV/bg/nx7Muq2YcXvLy9aFc
	OQjcxKNu1uWegWYdhlRlNN2/LSci1NvsT5cULyT2sKpd4AqY6Sk=
X-Google-Smtp-Source: AGHT+IGb5T6cpB/7EWvmhQ43Jf3bxUsfnnaogIExV5juuGP3ucFrS+SngbbnT41X1ojvJgNGssHk3Q==
X-Received: by 2002:a50:d5d3:0:b0:57c:7c44:74df with SMTP id 4fb4d7f45d1cf-57d4bdcabb7mr8935735a12.29.1719393133298;
        Wed, 26 Jun 2024 02:12:13 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:79e0:cc0d:71b1:3c08? ([2a02:810b:f40:4600:79e0:cc0d:71b1:3c08])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30413446sm7045617a12.31.2024.06.26.02.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 02:12:12 -0700 (PDT)
Message-ID: <5a15b138-4e03-4487-8a53-b7ff3527701f@gmail.com>
Date: Wed, 26 Jun 2024 11:12:13 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: rockchip: Introduce the rkvdec2 driver
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
References: <20240620142532.406564-1-detlev.casanova@collabora.com>
 <20240620142532.406564-3-detlev.casanova@collabora.com>
 <c7882f94-e2cb-4023-a53e-87ebc8fa3460@gmail.com> <3815203.kQq0lBPeGt@arisu>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <3815203.kQq0lBPeGt@arisu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Detlev,

Am 25.06.24 um 18:56 schrieb Detlev Casanova:
> Hi Alex,
>
> On Sunday, June 23, 2024 5:33:28 A.M. EDT you wrote:
>> Hi Detlev,
>>
>> Am 20.06.24 um 16:19 schrieb Detlev Casanova:
>>> This driver supports the second generation of the Rockchip Video
>>> decoder, also known as vdpu34x.
>>> It is currently only used on the RK3588(s) SoC.
>>>
>>> There are 2 decoders on the RK3588 SoC that can work in pair to decode
>>> 8K video at 30 FPS but currently, only using one core at a time is
>>> supported.
>>>
>>> Scheduling requests between the two cores will be implemented later.
>>>
>>> The core supports H264, HEVC, VP9 and AVS2 decoding but this driver
>>> currently only supports H264.
>>>
>>> The driver is based on rkvdec and they may share some code in the
>>> future.
>>> The decision to make a different driver is mainly because rkvdec2 has
>>> more features and can work with multiple cores.
>>>
>>> The registers are mapped in a struct in RAM using bitfields. It is IO
>>> copied to the HW when all values are configured.
>>> The decision to use such a struct instead of writing buffers one by one
>>>
>>> is based on the following reasons:
>>>    - Rockchip cores are known to misbehave when registers are not written
>>>    
>>>      in address order,
>>>    
>>>    - Those cores also need the software to write all registers, even if
>>>    
>>>      they are written their default values or are not related to the task
>>>      (this core will not start decoding some H264 frames if some VP9
>>>      registers are not written to 0)
>>>    
>>>    - In the future, to support multiple cores, the scheduler could be
>>>    
>>>      optimized by storing the precomputed registers values and copy them
>>>      to the HW as soos as a core becomes available.
>>>
>>> This makes the code more readable and may bring performance improvements
>>> in future features.
>>>
>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>> ---
>>>
>>>    drivers/staging/media/Kconfig                |    1 +
>>>    drivers/staging/media/Makefile               |    1 +
>>>    drivers/staging/media/rkvdec2/Kconfig        |   15 +
>>>    drivers/staging/media/rkvdec2/Makefile       |    3 +
>>>    drivers/staging/media/rkvdec2/TODO           |    9 +
>>>    drivers/staging/media/rkvdec2/rkvdec2-h264.c |  739 +++++++++++
>>>    drivers/staging/media/rkvdec2/rkvdec2-regs.h |  345 +++++
>>>    drivers/staging/media/rkvdec2/rkvdec2.c      | 1253 ++++++++++++++++++
>>>    drivers/staging/media/rkvdec2/rkvdec2.h      |  130 ++
>>>    9 files changed, 2496 insertions(+)
>>>    create mode 100644 drivers/staging/media/rkvdec2/Kconfig
>>>    create mode 100644 drivers/staging/media/rkvdec2/Makefile
>>>    create mode 100644 drivers/staging/media/rkvdec2/TODO
>>>    create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-h264.c
>>>    create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-regs.h
>>>    create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.c
>>>    create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.h
>> ...
>>
>>> +static inline void rkvdec2_memcpy_toio(void __iomem *dst, void *src,
>>> size_t len) +{
>>> +#ifdef CONFIG_ARM64
>>> +	__iowrite32_copy(dst, src, len);
>>> +#elif defined(CONFIG_ARM)
>> I guess that can get an "#else" since memcpy_toio exists for all archs.
>>
>>> +	memcpy_toio(dst, src, len);
>>> +#endif
>>> +}
>>> +
>> ...
>>
>>> +	/* Set timeout threshold */
>>> +	if (pixels < RKVDEC2_1080P_PIXELS)
>>> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_1080p;
>>> +	else if (pixels < RKVDEC2_4K_PIXELS)
>>> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_4K;
>>> +	else if (pixels < RKVDEC2_8K_PIXELS)
>>> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_8K;
>>> +
>> Did you test if it works with anything > 8K? If so, you propably want to
>> make the check above
>>
>> +	else
>> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_8K;
>>
>> Otherwise the timeout may not be set/contain invalid values from any former
>> stream.
> That's right, but it would be set to 0 because of the memset.
> RKVDEC2_TIMEOUT_8K might not be enough for bigger frame sizes, so I'll set it
> to the maximum value (0xffffffff) when frames are bigger than 8K and also adapt
> the watchdog time: RKVDEC2_TIMEOUT_8K is around 100 ms, but 0xffffffff is arnoud
> 5.3 seconds (reg032/axi_clock_freq)
>
> I'll do more tests with this as well.
>
>> ...
>>
>>> +
>>> +static const struct rkvdec2_coded_fmt_desc rkvdec2_coded_fmts[] = {
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
>>> +		.frmsize = {
>>> +			.min_width = 16,
>>> +			.max_width =  65520,
>>> +			.step_width = 16,
>>> +			.min_height = 16,
>>> +			.max_height =  65520,
>>> +			.step_height = 16,
>>> +		},
>>> +		.ctrls = &rkvdec2_h264_ctrls,
>>> +		.ops = &rkvdec2_h264_fmt_ops,
>>> +		.num_decoded_fmts =
> ARRAY_SIZE(rkvdec2_h264_decoded_fmts),
>>> +		.decoded_fmts = rkvdec2_h264_decoded_fmts,
>>> +		.subsystem_flags =
> VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>>> +	},
>>> +};
>>> +
>> Note, that this is also given to userspace (VIDIOC_ENUM_FRAMESIZES) and
>> this is already incorrect in the old rkvdec driver (and hantro): From
>> userspace perspective we do not have a restriction in
>> step_width/step_width, as we are aligning any given width/height to HW
>> requirements in the driver - what we should give to userspace is
>> fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS; fsize->stepwise.min_height =
>> 1; fsize->stepwise.min_width = 1; fsize->stepwise.max_height = 65520;
>> fsize->stepwise.max_width = 65520;
> Is fsize->stepwise.min_height = 1; and fsize->stepwise.min_width = 1 correct ?
> Or do you mean fsize->stepwise.step_height = 1; and fsize->stepwise.setp_width
> = 1 ?
>
> It would give this instead:
>
> .frmsize = {
> 	.min_width = 16,
> 	.max_width =  65520,
> 	.step_width = 1,
> 	.min_height = 16,
> 	.max_height =  65520,
> 	.step_height = 1,
> },
>
> and .vidioc_enum_framesizes sets fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
You can't adapt this here, because this .frmsize is also given to the
v4l2_apply_frmsize_constraints helper, which does the actual alignment to
HW requirements and requires the HW step_with and step_height.
IIRC, we also align framesizes which are below minimum HW requirement, at
least in rkvdec1 driver and it looks a lot like this is done here the same:
so this should be .min_height = 1 and .min_width = 1. (I remember because
there are VP9 conformance tests with very small framesizes). And yes, it
looks like you've had to set .step_width and .step_height to 1 for
V4L2_FRMSIZE_TYPE_CONTINUOUS, not sure why that is required.

So, imho, the final rkvdec2_enum_framesizes should look like

+static int rkvdec2_enum_framesizes(struct file *file, void *priv,
+                   struct v4l2_frmsizeenum *fsize)
....
+    fmt = rkvdec2_find_coded_fmt_desc(fsize->pixel_format);
+    if (!fmt)
+        return -EINVAL;
+
+    fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+    fsize->stepwise.min_height = 1;
+    fsize->stepwise.max_height = fmt->frmsize.max_height;
+    fsize->stepwise.min_width = 1;
+    fsize->stepwise.max_width = fmt->frmsize.max_width;
+    fsize->stepwise.min_width = 1;
+    fsize->stepwise.step_height = 1;
+    fsize->stepwise.step_width = 1;
+    return 0;
+}

Note: Not even build tested :)
Jonas: maybe you can add a fixup patch to your rkvdec patches as well.

Regards,

Alex

>> I guess this new driver should be an
>> opportunity to fix that and distinguish between internal and external
>> frame size requirements and the .vidioc_enum_framesizes callback should
>> adapted accordingly. Regards, Alex
> Detlev.
