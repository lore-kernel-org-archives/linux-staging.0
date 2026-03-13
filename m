Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4DD377EA0
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 08:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390742; cv=none; b=rf5onBHYGeZXJD2ooeEnbWKkdpjffJd0Vt0AM4lpS6SHGRMJknfFlh6QUnDWrYBHgZoTm5mBj9Xv+hiluGagGvIolSh5fLV+jbaSCOuEtxhGiTTinQ+84fMraObMr0CVzTw8Z0YhX2dYGTPqcpZIIQphy6wkk+bUFRFRK3EuRNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390742; c=relaxed/simple;
	bh=gF7U4AhLl2B54UlbLoigUUUH6Jsm/F5mlTaV5RfBX1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+e89y19Yx4dlpl5mLNgij6QV0L5mLB8ngfciR7cbxKj+WPD7Lm0/C7HM+fVL6v1dQSaGjSp+rAttfDEV5/+LFp9OBwGjjZR4qJAesg6L/iiHEyHOGuyrO3Aj8SdGbGK9On0uixwasnpb0LJw+dG+2FSG3v7t8WvP5v9qNs6ncA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XF8ba/qh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XF8ba/qh"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b942b36de08so336094566b.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773390739; x=1773995539; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zbcDxBVVYzOw7c6OTfNiMQmEPeMGSouBlRwpnguHKAQ=;
        b=XF8ba/qhY+hTmGSQ1Yjvr43Ex8Gz9iHU8V0LQiwHf2AhXnB74T2y9mKHb5tYmWNYao
         ibJkQesDWZC8+yKmf6GSJQWRnqyl2kHm8g8W0HCVx5YqQAvsiCfkhocyGjnAkOG2bW9r
         hWNChk4t7kU6TQb29WtZrruuAJGNh/bZJ2Ud0W2wJa+g8UwUd50V+2gVYtRrZe4/tP5t
         hGx9bQEU/PAdibxJ+ByoqWSKnWg1L6hO4ho+C+Bk43od86o0Nudb66apBIvLfyHaWB2k
         Ew8sroNyfXMkzyQr84ot6qI9/jBT0HJSFkjNU8dc4MCJGc+3VauEfcD4c/kCKq1MgfS+
         iV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773390739; x=1773995539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbcDxBVVYzOw7c6OTfNiMQmEPeMGSouBlRwpnguHKAQ=;
        b=SlLIA64l2Sf2FAKq88VCBmSmJzt5XbnmotfryKuCI/kEXYCev/MELuW8ZXUM2wOh3/
         eVu9aQegG8rPiRN2QUQCOlP+8BLN0fhrD5zFDK/8O6qIWZRWaeqf/XRlUyMVH39Oi9yd
         hAF1+we2uhSG8Ud1UM7LFai5qNsR4NRG2u31LoPL6RoF7B43AW9/f6HnwSL69ieEGc4g
         yAtDqTlSAVtvXr1sVvizjxRmxxyEsA96r2JNZKEmgfeVH7JrhQbsswc6842ihAvQ5Cjq
         QMVxIw2sgpZYrzU9W+bMj1JZjVkoiHmY+xRxs1oB+7c1DTbPmLcm7HZB3kczM9QQnve+
         Dosg==
X-Forwarded-Encrypted: i=1; AJvYcCVS/eOZNKLFYIjei4Am2IaFl+jAWUZo+IWYozB5yJAFMMIntCWFCSAa8pq77c20q9A4FLN9P/vTEZDtXtGN@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv3HxE2YvDbg4pcXinctGqls5WFSoHfKniCqpICYdBML80JQZ8
	X47Ljfp4FZbcbXiK/VQ7Yzu7l0d1n2Q4uOwltD+gX13Q4d7LUGXm6sBZ
X-Gm-Gg: ATEYQzzxzH0VPieokXQcetR4B+RVpUpQH/sHi3agGJyY7T6p2UjUgGOQhS4ha7SpSFT
	A7eWOlakfuHkGZzBpsN0/t8q6NXgNY3ktY7qs9jAmd9sBu9T7I44hIYI8esIMK1HRZfxko8xWdk
	srS5Yygyn1OYufKZfa9SLzoXOjRU90FhuymSXbW1gmnKtQLefiRvjBWE1LmpWk4mhL+EW3BtQYv
	Z9rwksYca46i1bJDX9wsOZwOiBpaOcN5yGRbD5sv1NdOaJYgUA8GpnAlLfYbwO1Rj+hCuGd6+/6
	e663G8hhO/gRngRdJZOgLuO9xdO8zw7dmWzUldWIkovxGRD65oMK0srdWsC/N8zLjUg1M3c3t07
	mUWwnVbZblRPxOgTKFcCpoBQRDmckWBKQfiJhwjvGiwk68Dq8T1OVlrcHPoVozs/goWyhaE6Prg
	BIcDjAQ87fSoxGkOZlMGeK4bPjwbnSK/WHb1MF5MuBMakEzsivfLp/yqBhWxuIHJ6+7g==
X-Received: by 2002:a17:907:9285:b0:b97:73ae:e2e with SMTP id a640c23a62f3a-b9773ae119bmr31732166b.18.1773390738986;
        Fri, 13 Mar 2026 01:32:18 -0700 (PDT)
Received: from ?IPV6:2a02:8109:8617:d700:5998:31f2:ed8:c4f? ([2a02:8109:8617:d700:5998:31f2:ed8:c4f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba6ec4sm29152166b.5.2026.03.13.01.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:32:18 -0700 (PDT)
Message-ID: <2bcc0442-cdd7-4093-831c-0bd4652edf56@gmail.com>
Date: Fri, 13 Mar 2026 09:32:18 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/21] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, mitrutzceclan@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <demonsingur@gmail.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
 <abEgijQAqW27i5fU@kekkonen.localdomain>
Content-Language: en-US
From: Martin Hecht <mhecht73@gmail.com>
In-Reply-To: <abEgijQAqW27i5fU@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari, hi Dumitru,

I'm testing v8 already and will migrate next week to that version. Below 
some further comments.

On 3/11/26 08:58, Sakari Ailus wrote:
> Hi Dumitru,
> 
> On Wed, Mar 11, 2026 at 09:17:12AM +0200, Dumitru Ceclan via B4 Relay wrote:
>> The following deserializers are supported:
>> * MAX96712 (already exists in staging)
>> * MAX96714 (already exists)
>> * MAX96714F (already exists)
>> * MAX96714R (GMSL2)
>> * MAX96716 (GMSL2)
>> * MAX96724 (already exists as part of existing MAX96712 driver)
>> * MAX96724F (GMSL2)
>> * MAX96724R (GMSL2)
>> * MAX9296A (GMSL2)
>> * MAX96792A (GMSL3)
>>
>> The following serializers are supported:
>> * MAX96717 (already exists)
>> * MAX9295A (GMSL2)
>> * MAX96793 (GMSL3)
> 
> It'd be nice to have more reviews as well as comments from the users of the
> existing drivers especially on how this works for them.
> 
> Are there differences in functionality or UAPI compared to the drivers
> already in upstream?

Compared with the current mainline drivers from Julian (what offere a 
good basic functionality) there are a lot or more features enabled. One 
ov them is support for routing the channels as well as i2c-atr instead 
of i2c-gate only. Both helps to setup up more complex and reconfigurable 
routing of the video channels in complex systems with many 
sensors/cameras/streams.

Additionally a lot more and never devices are supported by that patchset 
including the new GMSL3 devices what are also backward compatible to GMSL2.

Both link types are supported now. Generation of test patterns in pixel 
mode has been added.

Also log-status returns a lot of very useful information about the link 
mode (tunnel mode versus pixel mode) and potential errors / packet 
losses over cable by presenting the counter registers. That helps to 
monitor the quality and reliability of the GMSL links as well as CSI links.

> 
> ...
> 
>> The following v4l2-compliance test still fails:
>>                  fail: v4l2-test-subdevs.cpp(371): fmt.code == 0 || fmt.code == ~0U
>>                  fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
>>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
> 
> Could you post the full report here, please?
> 

BR Martin
