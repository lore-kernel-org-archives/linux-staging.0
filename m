Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCE082492
	for <linux-staging@lists.linux.dev>; Sat, 22 Jun 2024 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719063297; cv=none; b=Bbg7jcpuSiS7qE0LeYFFIM+KEvTjmfocrKjTmM7cMXDK4F+KZ9B/HEuzmta6DZlvoJiRiLJOUcXdIaEkr1mT99MeI93zzJfEVX80Krg9xpOl0xUBT+6shX8uC0HHCx3Wo1Jo1dAhTwVFoffay5BUswlkMSq5b1GOk3cwuyTmZpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719063297; c=relaxed/simple;
	bh=9PcOwuoShfkOTMi4FA3UJOkI8ujSzTbYy53uK1oTlt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQVm8CVJz1neNaFQ9v0t4rx+vBs4xDOjB7lhSgUcJnpGJiSD6d/YuXwPdcHvsFVpQR/WxKU/x4ipHkX0b5xkFQ+ldHiN74ERKmw7qrJriYGgA1SZMvYyLthUAtNoMvE6kPJ2nhU7NiPJmhSrA37TOFuBOqBNNXJ/7Xigei2oT68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=OHVfIsol; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="OHVfIsol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1719063284; x=1719668084; i=wahrenst@gmx.net;
	bh=oB3wyyTnVlK7F2QMPp4BcsT9JyYZz6HlBFPKTmbIhB4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OHVfIsolfJvn9VRFQxpvv0o2xn234010AcFEYXoKX4SVy1n4hWLypQueu32wfO1G
	 CqQ2ZvEf8mZCEon9iS25jUw/LjNljZqNSen3ne7NksoAEWkQ3bEQNAyAmtE/6akLm
	 pgbdhhE5Hy2sudM78h2ieBonKv57jKIq3/QXGi2bRFlpu/3fO43mlKJOgG6x85BLT
	 jFPgPFWeI+V4CbIUEAcSGv61wIP2kVEes0ulTcWWRT0LFzSK+mzhHwNSkeCinVMgV
	 ymFxEjod+TeRB1E5Q3GGxjr+HBCVKWWifXrrBjnyq2gKPd4ZVxLeBmUJUMDfJJtFN
	 SDPyW8jxCBh1gXSMaw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MS3mz-1rwVqh1LsB-00U7W4; Sat, 22
 Jun 2024 15:34:44 +0200
Message-ID: <f6a7d151-0d4c-482d-95a1-4f9264dd071c@gmx.net>
Date: Sat, 22 Jun 2024 15:34:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 09/10] staging: vchiq_arm: Don't cast scatter-gather
 elements
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20240621131958.98208-1-wahrenst@gmx.net>
 <20240621131958.98208-10-wahrenst@gmx.net>
 <f655db50-b9d1-4b06-b1d9-5bfc22fd2756@suswa.mountain>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <f655db50-b9d1-4b06-b1d9-5bfc22fd2756@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xoi/iWR652to/6T/nGtx7OzTaHNxqeoirV3eIVvlgAOmxbymYnt
 4SHk0Eo7S0uyYZ/wgzz8W+xeMVP8CFUr4qz0noT7LGojALLkhIXrB469GmV3t0jHN6kNpy2
 kpSuLrX6VKfgJzjUV4wKVIEcmBONAfxalu5Ndw2cS9Vb8T5nxeiDCPVBvouXG5HeEHSr4Az
 Ww9lctwtIPvrzndfG39RQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:h9QLU8VeJUc=;o9ZL1Nh28CFkIVEVz3V8Lk8dNTt
 1JjeoGyoVwvs1YpaVRIhhmLlHNf/eo6g4CjW5AptY1L9xlfL++Mqtw8gviGr5fojFCS6DTTuO
 eA/wOoaffRBFv37q/bPJdzP47ghA4DY0uBI6kQlERHcIy4DuSXiQABX8pz6rLeMlc+9lRWE1Q
 PUjsUFw/lTGFvo4nZglddOsGgBtvUvx/5CaeVYD8c1mv2zYKkqdtxENkRmc2LkRRBMJSwR1Z+
 Dgc8jCmnlFePvHM12J5tLxIJOJogqNA/dJ83N7zU9hXVXNb9igdWstPOcg2Y1jvnnG0dnBwZY
 VURPh7RXDi3DmwECf8W9B1L/WQV/iQqVfB++chcPY/RH25iRkkM2NGRE8tcgEH3ue1QUMIMO+
 UHoh9rO+tKW0F+a+aIeBbSw2Q/bRnkIcpk1MkTzgoMuibGbe+PGdQp2QoLFwaJQqvDofH3sBT
 7Mcju5mCf389OVc3GK+QV8dw7dh76oDttaTAYtjGGDK8NQtvOC2a4uqdewtk4L4ZRx95S8+UI
 So5TdtWsPTzfTzTjuZ0uNeC+I66WNANyB8KHXB/BSKvYLyyfNe2zH29BGG/i4eEanG0QTDz3O
 HYfv98nRahnEDMlBxiQO10iqbMZKMYhD1f8KmdPUxoIfRhRMnBlqOrpe9rmD8jw9R3txrowNW
 PPV1K/YrgiE0473LiDArr9djEeloj1AUnWBl7Vs46X1NFRN08dwLJW+I9FdxL4nUVTt36R5wH
 3CHRel5LyXrsGT5aEgzUIEK2qaVwmVLNdcpVaZ7bFqjqqjT0JtrgoTo1+fcaBEaMdCuXZUBiI
 5CS2Chpak/fA050TvpJKlQq7OZs4ZqE6M5LUbHMXHQB3c=

Hi Dan,

Am 21.06.24 um 16:31 schrieb Dan Carpenter:
> On Fri, Jun 21, 2024 at 03:19:57PM +0200, Stefan Wahren wrote:
>> The kernel uses different types for DMA length & address,
>> so better use them.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 +++--=
-
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_ar=
m.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index e3d49d4bdb1d..9e6102c43e00 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -162,7 +162,7 @@ cleanup_pagelistinfo(struct vchiq_instance *instanc=
e, struct vchiq_pagelist_info
>>   }
>>
>>   static inline bool
>> -is_adjacent_block(u32 *addrs, u32 addr, unsigned int k)
>> +is_adjacent_block(u32 *addrs, dma_addr_t addr, unsigned int k)
>>   {
>>   	u32 tmp;
>>
> You can't actually use more than 32bits because *addrs is u32 and it's
> part of the UAPI.

i'm aware that we cannot use more than 32bits and AFAIK the VPU is not
able to handle that. The intention of this change was to use the special
Linux datatype as much as possible to signalize the special meaning and
allow to use the special format specificier in case we want to introduce
debug logs later.

Or do you mean this change possibly breaks something?
>
> regards,
> dan carpenter
>
>

