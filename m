Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8DA21ADA4
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775320176; cv=none; b=C0MABzLtL55mC26AiKRQ758ZURUZiV2cVtLf66UMUJkS/+ponNgIqU6tXicVAZoCXjwNxjHT+mRqkhsCp8PqNDZroiIc5Aq1pKk0csjUqY1X5Tfr8BprgCHT7/WZnkZm3jUJif7qj6LXSR8J7CqQH9XH4aUbntvDFL+sIkzIWsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775320176; c=relaxed/simple;
	bh=J+mH3tlc4DzHrOdvjC92wgc8hfC/3o2s8GlMhvE+s00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fhnnd460K4CsGLSBfJUmPEUlDRTBTlfHw3oOYoSoVElBPCZgwx6avX3xHmUbYJC1anLmuzxACr3mIGyU/oOIYIrLOxcj98x1pZ2nzmV8KlrHuak8mFVrvDOwI8SvXUROlEIrO6jx5DSd4A9si8cFScRxTci2vEThaN24yjMeKIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=p9/2sIPE; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="p9/2sIPE"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-46ceca1e0bbso1821910b6e.3
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 09:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775320172; x=1775924972; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++8C+TxvxhaCAqikK6VYVaMY+sXmVJh/F3nUP9aaBRo=;
        b=p9/2sIPEegcEmOmINRfuybvbP7CzUrxwFD9Z4BJP+sNwBKHLWHrPNsDC2xjAcvsPLe
         KF9YT5wysFmDyBWgoJnMC9lKkTaPZk0v4igYy9P4QmUVcHm5dHWvNxmch9cZflkOIrLq
         dTd2B7ZEh+Ns+4F8THZUoAKfpdfxWhw/Qvv34APWn+Ayaq3weJ1dm46fngUu9D+uOYGM
         LjOzrL24QA52HJwVp2eSSriF6M7FS78UkJ13hwNoSPf4UESic5sr9UTDEuy8XbC/AgSI
         vQS0VTHhnKxAvz2J7gWHv38qrUKB93av+L4bAFV4g6VrqJFTb0rjHVOib6bQe9Xb+x1Y
         dthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775320172; x=1775924972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++8C+TxvxhaCAqikK6VYVaMY+sXmVJh/F3nUP9aaBRo=;
        b=qFP4nnXPLGpLz9R09DmJpojORH1G0z4JYY97oje2ijucjQyn/dfzYsvzPSVNfzPPsz
         YhVQ4Dn0uFsBgeDFepRvv/VnH8lka3hUEp8oGYYkJP739KmuPKwxi8SW0AzOZ/E1jmNO
         hNiHv7GIC17ZMaNTF+WXlY65tduzENuNk1zaQPk0R1ljH7953eEwd5IqHCy1ABRkK22C
         d76WyEbCEFiGuK3HlSDfeuy9J6tIp93PhrJQ5fzd8WrlE9+sjuJL//YwBnwfGD5fY7Zv
         yrl5/nF4BNU63nQgLAM2UCxpsW2jVxdUSSIcrbXZgGInyJbhH9Dcadzt/KNHY1nFgpRQ
         obBg==
X-Forwarded-Encrypted: i=1; AJvYcCUNI0o4Fe88sBLs6QhdE8LnhF25GkA05g9/lI6BMoWTDBoQbNPmK2IywZL0m04ax7hBwW8Yw5Iih9fmNGH+@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhn8mvxUAbo92r6Qzflq9tyK3mBd+/NqQROq5W33dB/jSG0A0t
	hnOk0WlN4oDC3mNf1UpOu1zgAqlLHhe9wjBhiJk/vgYxCCHP9fvhtNAYgSs8KJz9398=
X-Gm-Gg: AeBDietbmn2n/ap2yBchX9rClu7aCmmWnxLUzFGcPhTdrxayB7TCPPEk+5bBAY8qOoh
	5OLVC2xh+GZhndjl/1yjSZ3tq8fqwLJ8vdZtxWT6kmWbTcjrkQ6x6iurcU9KPAz8c2fSIywB+VH
	SpxFsSnFk6Ekx3hStakApKqeVw4DTIfjkezChodim9LfuNr7FHya3TasIij/ogDSTUdqS3QIceE
	xj9LR5AqCX/PR7Mjld6jQyqxXAB9zxA3Fu+RIa4wxZRSjID6eGOwpXJ6tKKC0rgRmWBfsWb1RDa
	08cou7ancofKhnB8z+VRgEndi0ZNkc7iBg/n9ArD6VwU9jnT7gz7RqGPhREJCzFLBb+4KmiAKsG
	2WaThysq7xPAhJxMEciAMomQYc4kHMlcGOHqNxWAF19RLgGjeAp2qMGsPeFExM/cPryr80+Zyjv
	isXbIYIIf5O9UBwl0htbaiIoJi4D1AOyjoEIuIGWi19CxS42m6PDCSjtGhj/FICnnuDkwmkqaR+
	A==
X-Received: by 2002:a05:6808:894c:b0:463:927c:1e3d with SMTP id 5614622812f47-46ef66f9cd7mr3956595b6e.23.1775320171996;
        Sat, 04 Apr 2026 09:29:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e14e:bcc6:3f95:26eb? ([2600:8803:e7e4:500:e14e:bcc6:3f95:26eb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46d9387a763sm5220382b6e.18.2026.04.04.09.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 09:29:30 -0700 (PDT)
Message-ID: <fc46eb9c-abe0-49af-9f19-fa06f6cf2847@baylibre.com>
Date: Sat, 4 Apr 2026 11:29:28 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Move adis16203 inclinometer driver out of staging
To: Sheng Kun Chang <nothingchang@mirrorstack.ai>, jic23@kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, nuno.sa@analog.com,
 andy@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/1/26 11:24 AM, Sheng Kun Chang wrote:
> This series moves the ADIS16203 Programmable 360 Degrees Inclinometer
> driver out of staging and into drivers/iio/accel/.
> 
> The driver already uses standard IIO channel interfaces and devm
> managed APIs. The only missing piece was devicetree binding
> documentation, which is added in patch 1.
> 
> Patch 1: Add devicetree binding documentation
> Patch 2: Fix MODULE_LICENSE to match SPDX identifier
> Patch 3: Move the driver from staging to drivers/iio/accel/
> 
> Sheng Kun Chang (3):
>   dt-bindings: iio: accel: add binding for adi,adis16203
>   staging: iio: adis16203: align MODULE_LICENSE with SPDX identifier
>   iio: accel: move adis16203 out of staging
> 
>  .../bindings/iio/accel/adi,adis16203.yaml     | 52 +++++++++++++++++++
>  drivers/iio/accel/Kconfig                     | 12 +++++
>  drivers/iio/accel/Makefile                    |  1 +
>  drivers/{staging => }/iio/accel/adis16203.c   |  2 +-
>  drivers/staging/iio/Kconfig                   |  1 -
>  drivers/staging/iio/Makefile                  |  1 -
>  drivers/staging/iio/accel/Kconfig             | 19 -------
>  drivers/staging/iio/accel/Makefile            |  6 ---
>  8 files changed, 66 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml
>  rename drivers/{staging => }/iio/accel/adis16203.c (99%)
>  delete mode 100644 drivers/staging/iio/accel/Kconfig
>  delete mode 100644 drivers/staging/iio/accel/Makefile
> 

Quite a few people have attempted this already [1]. It is likely not as simple
as renaming the file. Please review and give a summary of all of the previous
attempts so that all of us reviewers don't have to go read all of those messages.

[1]: https://lore.kernel.org/linux-iio/?q=adis16203

And when reading those messages, you should find that the rename patch needs
to have the full diff (I think this is the --no-renames option to git
format-patch). This way we can review the driver in it's current state one
more time to make sure we didn't miss any cleanups that are needed first.
