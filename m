Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BD5468C33
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248400; cv=none; b=aYJSbrcKy+kEnLq1uPkwN2FO7E6/GOCrcWLtf9RrScG1gvuWWdtF4OtW77VIJSeoA1yLp5HUA2oM6ulgEETKeotjnhSbXx9y2gY9MF6j44+2Res5oj7C3BO9WzhRtirwQYe7vXlIOVeQfGMGGyY+hEA0HP0Sq+M5B16rZJibnVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248400; c=relaxed/simple;
	bh=ehDE7RYYfCpdnswzW+7J85+kStX5HZj/6Uo3Dns6YP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3egYe+FeTNAUaAGFUlhqWX6+fC/TS5r3Zr2JZgTDutvULh0TfJrNJKcSzHLNgiXPcNQ4gnfcBDacivV1vKI8/SgtqNDS4XmUfK33SnGcxY6ZWs5PYkasoXsnaBFaZnknMwfbBbW31mUIXiHBC/Rp1jnQl9HVUC3D1XPgk8IYIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3Yl+Xg/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3Yl+Xg/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so42965885e9.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 00:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788248397; x=1788853197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFV4yBSab23d+ZQcyN166yeywrzh3EvBwUi0GdjrM3I=;
        b=k3Yl+Xg/DLxhVJVOeSQhnm0o0c2hE13jaw5u6+5tUX3Pr/vg/nyYuU6rWvgWJKFt2W
         Zn66Yuu2FJjv/BI72ifA5l4q9lUkcDLvm0OdIQkd8r3p797NmyQTaSdGifBoA4UziYs3
         krw332v3QNoOXKJNhn74DJp1bbEQv1g/6z+qp9cE0D5dgiomBmywdVzaEMwlqKKusLoK
         YZUvJnkEeMrnKRpWA3ndVor8tMAkA8XF3SGgXoc4HhfEU+JrAN27eC16eGkq59OoR9I2
         HpdF78KdzmdmWpXIabi2GkLIf8Jn+N4jRfd0JNmuuZayZUmTT+PiX6EOYRTCzZzM+a1Q
         HHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248397; x=1788853197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFV4yBSab23d+ZQcyN166yeywrzh3EvBwUi0GdjrM3I=;
        b=VeDcJbHytx/b9Y05SSWYyeNIYcHXP0uGwBS3qq0d7zF0Z2Px2U5lvUIaHUm4Jt2bFl
         nsGJ+uZEgwKs9jwB3Ujv8YOuF+k1LZfOdr68AKRavpiYuPOgKwPoRglAtKnnYQLP+F5j
         B4aorzyC2wG/a5KjVQlHgFIOhyFkd9xLNqAGkBgaO8VcFpwOhh/315Bscxozu5AmAKsV
         m7Xoy9GSz2ZvsMDW1V2lJnxBcVmdJwdIwQU/gws7EcnQpXZajIzqq3CE0sUoVSq38Eii
         FmJ2tJavqyZTSTkxZjrdWBVQ7BLQwqWMTrL6etXC2/Yr1lbYGpzDBHcu7BUoFLZ9oarQ
         fn+g==
X-Forwarded-Encrypted: i=1; AHgh+RqGZ2Op/xbRWvF5tA0Nb4d6Hti29GFLZDCdD40XCVPV9eO/vZG3ESlK13C09xNZmptXHjbUqKoj7qyOrExv@lists.linux.dev
X-Gm-Message-State: AFuF++lmWyb9gYJskMTA5Q7oO1pTsn4EttB6eTUIAUhvrqUFLIBx/I/D
	LStw1FV3xCdgG4teN+01+tn+UnFeYH9zweR1wut4wIxPrkhK64pnPiNX
X-Gm-Gg: AR+sD12tH3DOjmJmK5VBvqr4jrbyyh3JZaaL5q43EbD5o7bku3RuFp2bbnHKRrm8QNG
	J7SlPLmgrqYZFu3ilGPSvQi0SCR2zZy3Gua3ScNXo5dPWlMfw7SmXda/9AwZsKMFGFiFMiuLxjO
	LRYeSEg4Azzc5volIqu8iM15z1tELPAR4sJjIMSWt1frfVLg2UEEdFgO6uL6g5r6dGQIOHEcgqB
	WdMxUvCLeEHvwJk/vpVzO3D5ExrYMbmI4g+bPutFBc6Gzld5Ia5Oo2J8DDXOmcPLheOlLXMRO5t
	vauStbml/RspoPaf0vmtvQoAf/+ckLaD/H7e4g4rilLd2rHAonIH6+A81fwuD7E6RnLiHwTZft0
	hq8t1Nk/m7TGYBQZ/hT3sIyGoNIcIi+qOEaHwg13/sx6Y75vVX5WqSKwRwW3JfhhcHhl8M28+Xl
	EAHK9cuhrZTiHpxQcCbSAq4OgpS091P9TPze38NLtnKhRdZeGxGLCCucT+g32mo+4=
X-Received: by 2002:a05:600c:1906:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cdc555496mr97428045e9.15.1788248396295;
        Tue, 01 Sep 2026 00:39:56 -0700 (PDT)
Received: from [172.31.2.29] ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1e1ebsm48703365e9.14.2026.09.01.00.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:39:55 -0700 (PDT)
Message-ID: <65b703e7-e4a0-4046-9d35-7d0ff1057f96@gmail.com>
Date: Tue, 1 Sep 2026 10:39:53 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org, Martin Hecht <Martin.Hecht@avnet.eu>,
 Andrian Suciu <Adrian.Suciu@analog.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831170303.GB1116206@ragnatech.se>
Content-Language: en-US
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <20260831170303.GB1116206@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/31/26 8:03 PM, Niklas Söderlund wrote:
> Hello,
> 
> Thanks for  your continued effort pushing this work forward!
> 
> On 2026-08-31 16:21:19 +0300, Dumitru Ceclan via B4 Relay wrote:
>> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
>> replacing the few GMSL2 drivers already in upstream, and introducing a
>> common framework that can be used to implement such GMSL chips, which
>> avoids code duplication while also adding support for previously
>> unsupported features.
>>
>> While the normally acceptable and polite way would be to extend the
>> current mainline drivers, the choice was made here to add a totally new
>> set of drivers. The current drivers support only a small subset of the
>> possible features, and only a few devices, so the end result after
>> extending them would in any case be essentially fully rewritten, new
>> drivers.
>>
>> This series depends on support for internal pads, for which a patch has
>> been added.
> 
> It also depends on enabling the streams API right? At least I need to do 
> so to be able to use the TPG. Out of curiosity do you know the plan to 
> enable it by default upstream?
> 

I do not know when default enable is planned, but series could make it
so VIDEO_MAXIM_SERDES selection causes v4l2_subdev_enable_streams_api=1.
  I am not sure that such a hack would be acceptable by Sakari or
upstream in general.

>> The drivers have been tested on the following hardware combinations, 
>> but
>> further testing is welcome to ensure no / minimal breakage:
>> * Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
>> * Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219
>> * Raspberry Pi 5 + MAX96716A + 2xMAX96717 + 2xIMX219
>> * Raspberry Pi 5 + MAX96712 + 4xMAX96717 + 4xIMX219
>> * Raspberry Pi 5 + MAX96724 + 4xMAX96717 + 4xIMX219
>> * Raspberry Pi 5 + MAX96792A + 1xMAX96793 + 1xMAX96717 + 2xIMX219
>> * Raspberry Pi 5 + MAX96792A + 2xMAX96717 + 2xIMX219
>> * Renesas V4H + MAX96712 + 2xMAX96717 + 2xIMX219
> 
> I tested the TPG on Renesas V3U + MAX96712 and it works as just as good 
> or better then the staging driver this work makes obsolete.
> 
