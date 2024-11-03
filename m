Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10982582
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730646652; cv=none; b=crd9r+5FWTccb60J/PEsNnYKfU217lgvShCqGTe+bAPYij/zGKjwQasR3N6UBldI4nto5xqmDwOESSKoY4X0It3xWYHc6o9A/So9VRt7VUJjkEoqCI0AEOGaQuQZBNpeniJD0277n0jV8sS7B73L/dZ18Mw5VJWCInppMHs4dR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730646652; c=relaxed/simple;
	bh=tMB/fJGNm9+JsG3RkWjw4oTwHyNW5C0yfmIxhcRZGec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRzeDlxq6obuPvRrK0LXCX7RXZtVnEtVUys0HH3S4hQdDmysPcRGMXf1n7n8cKkDNUfniP3iz8EM31oCJxVV6BzDdgAYkFEFKs2I9I3gg0dqHh10vVSwnwieTc6rlJtjq8dol1EAGqq7acTrDy/cBRjluksGaRH2gJlunOvW2ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSmun9BM; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSmun9BM"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso547375366b.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 07:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730646649; x=1731251449; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nz3r1Hpii+Ch8EYMCNIE/V74gLWjSP1nHZUmQ2/A2GA=;
        b=dSmun9BMpqK29rZ+Tx3PYizjuMNhB9aAdApfWQ8SNmxlgNdLUCR0grNB9ox29zCZPv
         lx7pD+EOt6LiR/fg2FagAl0YPhgFlI+TQJjn0x46ayarrdVJFIaGTE93En+AZc91DsG7
         w0AqRi8eBW+1m3LpV8uQvqAphF/Hu++5VPftPlxc6FPT3o5YajskfGMzGVT1fo5vZoI9
         NoZbSZla47plpr6OBXZ6ToueG7wH617gayRD1CfkFYkp7E/HxnPJq4K/4KBgZ3kiJil9
         oE2zWF5sq6iqdLtyKV5s1gSTe0/SNvi8HA3r5duhCiq6XhM+l+9IgfwwNsvqjzpQIXSj
         Yrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730646649; x=1731251449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nz3r1Hpii+Ch8EYMCNIE/V74gLWjSP1nHZUmQ2/A2GA=;
        b=TeTWFjwoNi0OpbCte70AZ7MndMkACT+Gzt614dohYXcEAPrbmWeSEEcSPUrtiMxyvV
         bvwwfDvr5kHWhKc3GM+2vlSWDb+uHJouwFwr4ihopL0wnxAPWoWw3ptdpFVOXncqfSU3
         OvIfpeb6dwZFwa2RLl5NCg360nHWN8u5IWhDBy0HadMj0vThx9NMAe+rawJ9x6/kOpWr
         vp/y59ZmBrupkhuiQGJQRgD6631y7xs+r0IVgb0vQsVV93cArBSvFPC7y0L9HAGz2+nQ
         iiqMfpr1M0TdtYo2S79h1aOrzy8avhz7rgkivOO7/0mc8Y6/EQSKjcWAas3A+F/DdCqf
         vOPA==
X-Forwarded-Encrypted: i=1; AJvYcCW+5+kcD0Fwf5M5r9aVZD9JR5Q6LfMy+hjpYrd/oKp1yY1HI1dgds3h6/ObGH1WvbbR/quksfVa05J7Tvxq@lists.linux.dev
X-Gm-Message-State: AOJu0YymPL4vQSrGU6OivkxS09aLue+dCadqQFxZT7/w/evjkdXxHlah
	jX7wBnd8h9cqTuEVIsxfLWAauxPbW7v96DxQVY5FumdncbEyVFGW
X-Google-Smtp-Source: AGHT+IHUmY7geESJ8kCdBUqY+5Y+Nt2zmyXPqAPEff+mb+ZOGsyqYHajjJjuKQH9KTjBqdxIlsn05A==
X-Received: by 2002:a17:907:9729:b0:a9a:7f92:782 with SMTP id a640c23a62f3a-a9de61ea441mr2820644066b.52.1730646648964;
        Sun, 03 Nov 2024 07:10:48 -0800 (PST)
Received: from shift.daheim (p200300d5ff01130050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff01:1300:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e566843b0sm431466066b.212.2024.11.03.07.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 07:10:48 -0800 (PST)
Received: from localhost.daheim ([127.0.0.1])
	by shift.daheim with esmtp (Exim 4.98)
	(envelope-from <chunkeey@gmail.com>)
	id 1t7cFb-00000002Nzh-40r9;
	Sun, 03 Nov 2024 16:10:47 +0100
Message-ID: <15435fb5-ae39-407d-b022-93bbe9e14fab@gmail.com>
Date: Sun, 3 Nov 2024 16:10:47 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8712: Remove driver using deprecated API wext
To: Nam Cao <namcao@linutronix.de>,
 Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linux Driver Project Developer List
 <driverdev-devel@linuxdriverproject.org>, Kalle Valo <kvalo@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>, Xingquan Liu <b1n@b1n.io>,
 Tudor Gheorghiu <tudor.reda@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
 Manisha Singh <masingh.linux@gmail.com>,
 Dorine Tipo <dorine.a.tipo@gmail.com>, Tchadel Icard
 <hello@tchadelicard.fr>, Felix Yan <felixonmars@archlinux.org>,
 Moon Yeounsu <yyyynoom@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Roshan Khatri <topofeverest8848@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20241020144933.10956-1-philipp.g.hortmann@gmail.com>
 <20241030093830.QSofC7Cl@linutronix.de>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20241030093830.QSofC7Cl@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/24 10:38 AM, Nam Cao wrote:
> On Sun, Oct 20, 2024 at 04:49:29PM +0200, Philipp Hortmann wrote:
>> This driver is in the staging area since 2010.
>>
>> The following reasons lead to the removal:
>> - This driver generates maintenance workload for itself and for API wext
>> - A MAC80211 driver was available in 2016 time frame; This driver does
>>    not compile anymore but would be a better starting point than the
>>    current driver. Here the note from the TODO file:
>>    A replacement for this driver with MAC80211 support is available
>>    at https://github.com/chunkeey/rtl8192su
>> - no progress changing to mac80211
>> - Using this hardware is security wise not state of the art as WPA3 is
>>    not supported.
>>
>> The longterm kernels will still support this hardware for years.
>>
>> Find further discussions in the Link below.
>>
>> Link: https://lore.kernel.org/linux-staging/a02e3e0b-8a9b-47d5-87cf-2c957a474daa@gmail.com/T/#t
> 
> I added owner of that "replacement driver" to CC:
> Christian Lamparter <chunkeey@gmail.com>
> 
> I vaguely remembered that he mentioned the replacement driver doesn't work
> very well. But can't find that email again.

... and neither did r8712u. what lives on is the OpenBSD port:
<https://man.openbsd.org/rsu.4> and the firmware: rtlwifi/rtl8712u.bin
in linux-firmware.git:
<https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/rtlwifi/rtl8712u.bin>

Cheers,
Christian
