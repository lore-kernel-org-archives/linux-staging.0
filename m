Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1B6363093
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 18:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776019936; cv=none; b=E+PdGq92V0+RvbyNRUlL8BRqcaOXQhDFLBXF6LSc/knx4JenHy6k3g7qAJaJ5m3Cdj5fJ6Om8ETlG/utL/7EgC/ekdrOeMHBlUqE2m5tAzgfL6ynvtJ61rSN454LRqRIzfHgAetaqjj5/TM+NmH20gp5T1IK/BqQqWF6B5masR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776019936; c=relaxed/simple;
	bh=Pd/hnVKuluDMGXFrmK+hPDJ6CozFH0uTu02gz7MUWBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZjwKxOnF/JRTRC6bgNT4fW0x/i0bBzf/fHc+RxPx3VN2tBpeEnKUMxykhyPlLFlU3QUXhXNrXzAt9Tfh/agPWq29moL2btCwJnKqwHg8G+H2MTQghFSxPjxaiL8y50l3kSijdnWABs0Jscs6XjcHurNiWyymztDzypa2kblB3hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=vTwKd48a; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="vTwKd48a"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d55b97f358so2210612a34.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 11:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776019934; x=1776624734; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fys629eMO179bbNIA9Bgqf2+pU0BIPxhSDRjIB2+TI=;
        b=vTwKd48aDN/bztLo+4lPhMLXoJe/uf0n0G+UOfXeoW3T3qCA73VV2v1MOdYWNOhYDE
         8OkDJDZCb3gixtWhdb16/klScXxfmZ+GyxOVP7wsDazgOVvmV3IKW1s/kLAQSHAixuTp
         sICNe6SetpZQ6p8qEbJFR68WJ1LlySR39560ugQc+hWopHf69eSXgHyFmOe+sWuJX0qA
         OKr8JSpAzTSUtO8jK4sl9tqCKa8IoZPuQ4mhRMKBG/4IX7inUsvDPpz9KEqYk5oPht6S
         KPyMj9SvxXqMN4OjbCN0MbNjlztmGprbZ7Q0OLvsqOB8e5hhuR/skO3C4ONDVe8z7pS2
         RCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776019934; x=1776624734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fys629eMO179bbNIA9Bgqf2+pU0BIPxhSDRjIB2+TI=;
        b=CrJ/YXRRl6Xxs4bRQLmHPus/PPE9c+Sm9V/8M0VOQrZQ9h4wiNnmBNkxWAIJ7YgIJx
         SHOb72TzRqOgWE8Ly52to9fTi/FqLFsqn2Q8ApZW50IpqAM4Fy8dIjOEwxjxlC8L5YCi
         ZECzoGuaTQFzBsK3CzWjgglVOUreU6lyzVOihQmPGzUvBVppFWvpNMVag6TrHOVnR50G
         NhvMx6QamU7ErSyJFMwYwLJBnK1kLQ7Q6FdPOHAmp8jmCvVZAlslZMd6SEFx4YhfbsvW
         zrM8DDGgK2ZMhJgOmKZcDUvp4hH+QgI/2ZXwWpMwROLH7csLdk/RByCAdY9zLMc616sK
         p2JA==
X-Forwarded-Encrypted: i=1; AJvYcCVXpslFyRlDDVCyfo0ByvmrPBJw5TDjU5ZbnHYEqX6bIqsrYKcJ+7QXOY89eGd6eLjMe9Gbpd+2wso5lU0L@lists.linux.dev
X-Gm-Message-State: AOJu0YxnZq7RocjvNMycfJksU6BiLBmbpdEfJra70HuPBEfwaOn0UIPZ
	LdqVT3xwvNZC/kDyMzt9x1R6+bsQ+UVAGFE5tav6kNROcQt9ju53nge94dzI8wwzl94=
X-Gm-Gg: AeBDieuNLZ8omF4/rSjCbffsvUBnM85CHCm3KonUUfcwlq0shkdXgw84VxuTUIphR/K
	RMIaHh8qi816xdDnlBhcznkpLiOG31nAlS8E0XyrtmN4hQ1fsXwQduPtFu4gWB9M8hQs69JGrd6
	JfiYgeR65RmKFnwekSlX2rDlOp5cAxjl+3QxVx6e+/QpFMpYVxXhWYbQioG2s+kd55KHKsrmNT2
	ciQIhdT0VjpGdBnYFdwPzMiRaW/Nho3nG4GTWm5ymzF79qU1XrJMF9ETsV3BmMsVRJiqTw+0E1O
	HlFHfetZBRaksVX0CV+lE6EAhJjVymEatMn9RjHdOQ/Lc+YlsfEaP3El0i61akj3cQEZzxha9VN
	0Yo5jTak94J4OCZRh+3VtyDzTbwc9dip3eujD49Cnucu0VZjL5mFvyuz+85GZTEZ/MsuAdTn6wb
	7ix2UXs+zmO11qXPw+CJxLPi+JtzKoxRdCOQhvYuLtojQDqY/DDxfBpPY8pDLaolYsiEojU5FtK
	w==
X-Received: by 2002:a05:6830:4116:b0:7d8:7d95:fa59 with SMTP id 46e09a7af769-7dc27a28405mr7191572a34.0.1776019933611;
        Sun, 12 Apr 2026 11:52:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:5c13:5a8e:1b91:8035? ([2600:8803:e7e4:500:5c13:5a8e:1b91:8035])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc26965485sm6752348a34.22.2026.04.12.11.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 11:52:13 -0700 (PDT)
Message-ID: <2d966423-52b5-4b8a-a4d1-0edcd93a841b@baylibre.com>
Date: Sun, 12 Apr 2026 13:52:12 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] staging: iio: magnetometer: Add QST QMC5883P
 driver
To: Hardik Phalet <hardik.phalet@pm.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brigham Campbell
 <me@brighamcampbell.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20260409210639.3197576-1-hardik.phalet@pm.me>
 <20260409210639.3197576-4-hardik.phalet@pm.me>
 <736964f9-1e93-47e7-80ca-1a89f239a353@baylibre.com>
 <DHR32TA81G99.14OO5FKEDU8CB@pm.me>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DHR32TA81G99.14OO5FKEDU8CB@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/12/26 4:54 AM, Hardik Phalet wrote:
> On Sat Apr 11, 2026 at 1:32 AM IST, David Lechner wrote:
>> On 4/9/26 4:07 PM, Hardik Phalet wrote:
>>
>> This is a little bit much to review all in one patch. Could be nice
>> to split out power management to a separate patch.
>>

...

>>> +static IIO_DEVICE_ATTR(downsampling_ratio, 0644, downsampling_ratio_show,
>>> +		       downsampling_ratio_store, 0);
>>> +static IIO_CONST_ATTR(downsampling_ratio_available, "1 2 4 8");
>>
>> As mentioned in the cover letter, we'd like to know more about what
>> this actually does. If there is a good reason it doesn't fit with
>> any existing filter attribute, then we'll need a patch to document
>> the sysfs ABI as well.
>>
> In the device datasheet, OSR2("Down sampling ratio") is mentioned like this:
> "Another filter is added for better noise performance; the depth can be
> adjusted through OSR2". OSR2's defintion is called "down sampling ratio"
> in a table. Nowhere else. I didn't know what attribute to map it to in
> this case.
> 
I wonder if there is an application note or something that explains it
in more detail if the datasheet does not.

We could always omit the feature if no one knows what it actually does.
