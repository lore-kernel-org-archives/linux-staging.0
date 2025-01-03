Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D8816F8F5
	for <linux-staging@lists.linux.dev>; Fri,  3 Jan 2025 06:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735886679; cv=none; b=Uy9dYutisyGAe60GoH+Hd8ux2nOBBuSEVYNIu8uj0EmIjDxj20/MT8ARZFAwlOjYVfthdcYWbQXOruO5dhG7QG1A3TXAIzfrcCsIVv8IANFQZv2+uC8zeLia+cCS//xbqX1l2LIJLTNNyxd0fOoJgtCK4Bxm2gTeADiq5qnBuwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735886679; c=relaxed/simple;
	bh=3KP0nCS6lvOsicuamKMU2eVXmaOYVs8MJvEzz0z93VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4kFrAN0e6cbRHNvxyoJ9iPXq1XjYasrmjPvlptnt1xFqoVwR0XbZHFwBZjhzXc4A2szvkzOw5/Gj4bT3YmOHHUVNDLuPkrSt+S3a4puPo2rKH3rpig2HoS68C6SJsBmAMX+FtAROHDld5olAk8P5gVuHvtGajFr0yD0cREJPU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7oC8q+b; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7oC8q+b"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862b364538so6837122f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Jan 2025 22:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735886676; x=1736491476; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABL1p7nta/CRl8BsVQhOmjXI/HpJhPxNL3TKYtG8RXE=;
        b=T7oC8q+b2OEl4WiyplS/G6kbhKeu88G5m2Zjea+LyuKkWb72vFqk6LwU1ANeFOoB/M
         lJkO0DSP6uoZHgpwONVcsszC5X7VTAE9hfa8VJyTjGnhQoU+zsbpcV+DE2xXnr4fhFXX
         DZF3Pe0uCss9f2YBYwTmh8cwhk4h3bHSoWoQ5e+FrRWsgJ7e7Ouh4k7P2IXYIar1Vi5n
         Kp3oft+4GJxmGlkIhWSqUESNdj7B2tK4XS9JmEb5LXErYMuSpVcZJWSpEIqozyamVSvq
         ql41wfGmX6l0E4XrJOe94RoZX0TqIJ0z6StNDz5+Rc2BIgj/t34kC1b9+DEoYZ/cnMps
         7VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735886676; x=1736491476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABL1p7nta/CRl8BsVQhOmjXI/HpJhPxNL3TKYtG8RXE=;
        b=VfCnvCYgY6l10fj8RBgmyVcK7L0BP/X5IxQwWFpRCvu+ejABBHRRHnTIU5bmRl9oHr
         IOfa8zzaw8Y63O1WHvCvS+LFG8zcX+LX0YEkOnygLsHBkdG1zvkUlj2HF+vSVcHtOTez
         qnsBUbl/rCrf3wIcK7YNzcBfk9nvLvzfZt7tYkFPjf36Wb1QL/maG4M5b8mK9hGMkSS0
         6IblIrj/RKHGMfVn553lsA0zukO9iclthmuP6IWF80BEDwt6t3EKwPrbYaj0t7ZXE95b
         qoU0ega6C+1Z5YjKRZdZcY7wC9+ODeZJthNdqGHiBGf5xZUH0Mrch4YgbiHNw8P2aOph
         gmVg==
X-Forwarded-Encrypted: i=1; AJvYcCX2KqcSlyrjcCD+qBqRol90wbFUrRG4lWsNKKZDKpaCvaBOucNIAE1e1WVGIBqPFFmpPDGvjfLVaV4EEkY8@lists.linux.dev
X-Gm-Message-State: AOJu0Yx18bZ6dIpD1Aezuxww9RJij1PagYjTuqfRdZU7eM35YOcgDaum
	R40tg0Tvy/TY2vyYgUxyBDdn4vTb9RzQcJIeTjWtj01PJ+AmfRVJ
X-Gm-Gg: ASbGncvxeRdxaITNYuhgJp8hLE0sLhXty1SLlAjWaCA8Pq69vsGRuHmAr/4l93cpbpw
	/Dze7oeIEZWBN6AOsqYOqzyHQ4pW2IoLi/WIchN/F0nlaQ52KV0z8R6M8OGOArd69Bg8Kbn2X3z
	GxuNeIduDY3txfu8yMJM0//xzUK5dobheqnp3ipaMMVGjh8q9a53HL/9EGk0Z0JEvoMaw7OAIRH
	7d0crQQeOmZp8PtfAB5P87pRRDbxy8gaCCP2aIaiIdktZRv59E+ipgly7OzXZyQ41k87Ry9XS+O
	lYOGv4vzBEcKA7ZaaO6LC82V/d8=
X-Google-Smtp-Source: AGHT+IGAa139yx3LH2QxpRgTHdKaVEYWhB6ijI8gOCJypp9phUqVp1ost3xXdpx7HlRS9Snm1/kE5w==
X-Received: by 2002:a05:6000:2af:b0:388:ce0c:9f19 with SMTP id ffacd0b85a97d-38a1a177e24mr44534740f8f.0.1735886675749;
        Thu, 02 Jan 2025 22:44:35 -0800 (PST)
Received: from [192.168.2.105] (p57935577.dip0.t-ipconnect.de. [87.147.85.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366128a44fsm471876805e9.43.2025.01.02.22.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 22:44:35 -0800 (PST)
Message-ID: <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
Date: Fri, 3 Jan 2025 07:44:32 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove driver
 using deprecated API wext
To: Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geoff Levand <geoff@infradead.org>, Simon Horman <horms@kernel.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 Stanislaw Gruszka <stf_xl@wp.pl>,
 Gregory Greenman <gregory.greenman@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Stefan Lippers-Hollmann <s.l-h@gmx.de>
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30.12.24 09:22, Johannes Berg wrote:
> On Tue, 2024-12-24 at 09:07 +0100, Philipp Hortmann wrote:
>> Driver was contributed in 2008.
>>
>> The following reasons lead to the removal:
>> - This driver generates maintenance workload for itself and for API wext
> 
> So I've been wondering, why are you so concerned about this? And in
> particular, more concerned about it than the people actually doing the
> maintenance? :)

One of my big fears is the hand over to the next generation maintainers 
and developers. The less code and the less exceptions due to old 
interfaces the easier it will be. We loose maintainers and developers 
for many reasons, like: retirement, burnout, embargos or simply because 
they are not paid and need to earn money. After giving some support on 
the staging subsystem I cannot see at all that we can attract so many 
talented people as required for a save future beyond 7 years...

People who evolved with the kernel development do not have a good sense 
how difficult it can be to join nowadays.

A friend just bought two servers. One with a paid OS and one planned 
with Linux as OS. The difference was over 12000 € due to licenses. What 
would be the price when we do not have a choice? Do not feel save 
because of today. We need to fight for tomorrow.

Where do you want to invest your time? Into the new technologies to keep 
up at the front edge or to keep old stuff running that is not productive 
anymore. But there might be someone who can pull the hardware once every 
two month out of the shelf and ask why this is not working. Should this 
really stop us from progress?

> 
> We got here because I removed a *staging* driver that was in the way of
> some wext cleanups, but that had a thousand other reasons to never go
> anywhere anyway.
> 

Partial, for me more important was the try to remove all wext drivers in 
October 2023 by Arnd Bergmann.
[PATCH] [RFC] wireless: move obsolete drivers to staging
https://lore.kernel.org/linux-staging/20231010155444.858483-1-arnd@kernel.org/

>> - wext is deprecated and only used by two wireless drivers in
>>    mainline kernel
> 
> true
> 
>> - no progress changing to mac80211
> 
> It fundamentally cannot be converted to mac80211, it has a whole
> different model. In fact it cannot even be converted to cfg80211 because
> some APIs it uses just never existed there, and likely never will.
> 
>> Tested a rebased version of this patch on the Playstation 3. Used
>> T2 Linux with Kernel 6.12.5 to test the Ethernet connection.
>>
> 
> Arguably that's a pretty strong argument for *not* removing it, if it's
> actually relatively simple today to bring up the latest kernel on a PS3.

I was not able to use the WLAN on T2 Linux. I just tested the Ethernet 
connection as I know that the developer of T2 is using it. The reason 
why I bought the PS3 is to see if Linux on it is really a use case. But 
all I found is that it is only a test vehicle to say T2 is working on 
Power PC architecture.

At the time the PS3 WLAN driver was added to the mainline kernel it was 
really cool stuff. But nowadays it is just a high Power consuming device 
with a noisy fan and not enough RAM to do anything (256MB). The 
powerfull GPU is not supported by the kernel.

Do I need to find out why the WLAN is not working under T2 on PS3 to 
convince you? The WLAN is working under redribbon Linux with Kernel 3.5 
on the PS3.

T2 is working but to make this happen the T2 Author has an own repo for 
patches to apply. In the following video he publishes his view on how 
well the ps3disk is maintained and tested by the linux kernel community. 
My impression of this is that ps3disk is not tested on hardware at all.
You can find this in a youtube video: “I can't believe VIP Linux kernel 
developer BROKE PS3 support” but watch out that you are in a good mood 
otherwise it is pulling you down like me...

The commit that is breaking the function is:
commit a7f18b74dbe171625afc2751942a92f71a4dd4ba

This fixes are not in Mainline up to today. So who beside T2 Linux is 
using this? You can find more of those breaking patches... and videos...

The following points are also in the list of reasons:
- This driver has a maximum 54MBit/s as it supports only 802.11 b/g.
- Using this hardware is security wise not state of the art as WPA3 is
   not supported.

Thanks for your patience.

Bye Philipp


