Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D81D2DF96
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Jy8T0xyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1698327897; x=1698932697; i=wahrenst@gmx.net;
	bh=8N0BAQRXOaiBUnXS9AVWhXbFxOndfSaUK0M6YqDPpN8=;
	h=X-UI-Sender-Class:Date:Subject:To:References:Cc:From:
	 In-Reply-To;
	b=Jy8T0xyxWQNaeOmPjEdSFMZ0bi8FJJmoixoJdQPr+9KbCdwnZCeEeuBMo9hFea+2
	 0TUdZ2iNGUKqQzV3KJ3SKhtowmuN6xBe6xinIBdk/EdRhadlUZU7q2yIAdfO+W9cs
	 FKJYK+Dwttj9Z+DjK2R6Mp4GYN5CxIdu77QxS1c/m8LUjwdt8O7x2MfcH/yu4Q4xc
	 5q/YXpUleLEwREREWXW0cOpwUHwkmczZBbenfQ0fbigPwabJyJR9QfJjUG9jcE2o7
	 t9MeBiSXbD/B4vJYiyavsDkU8lZ9ZT9HukhJVoh8bqhw6ZVpF+k6fHQyc5l7QxBQd
	 im63BpBTrQx/oSp44g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLiCo-1rDXWC3oAa-00Hclc; Thu, 26
 Oct 2023 15:44:56 +0200
Message-ID: <2ebd5dea-e7a8-4021-9f37-c062b0ad77b9@gmx.net>
Date: Thu, 26 Oct 2023 15:44:56 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] staging: vc04_services: Drop completed TODO item
To: Umang Jain <umang.jain@ideasonboard.com>
References: <20231025103300.340572-1-umang.jain@ideasonboard.com>
 <20231025103300.340572-2-umang.jain@ideasonboard.com>
 <8355043f-36fc-45f5-a868-2e96e6427e28@gmx.net>
 <019c778c-4bf2-5d1c-769a-2b0fc5eb2a2e@ideasonboard.com>
Content-Language: en-US
Cc: linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <019c778c-4bf2-5d1c-769a-2b0fc5eb2a2e@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:68lkocvW0LafqvxJSC86VO9BaCXlsMSatSXovV00iZXnJ1Yltcw
 74l4y5wNWfM5rjw8ZD6dRnFzwu8Qiic6kQOyE1zgOHbLWHcHrm1k9AdPxyhogqyNqaSfvEF
 xQxH2LBxPOAwJ2DBwnI9EFzG1KFaaqSbyvXjEnSrU63Hb3xwOrNArRPidmn1iEjSgbbbYRV
 T9Mda8b0Q1GGO4xW8qveA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8HYBAfWEhbU=;wAUx8iOtFvFf9sgw7uA9YqHt8+s
 s56143hWVZIi4+0l4CYSxSiFxvaMR9koqHYXASIwOa/ydr9KiZORAd8zDHmiI61qAbD3tzK9y
 WvdIiDMLc6dIvaCGB2/erPEk1MMeCXC1S2gq9xdTpN1b6IeZa9oRhe38SnMxIF9L4zAGW7OJ9
 wshn6m9U3d9zaNHYDc3eA2vzJi8Ey5yaaue0n7yufHBmMqaaSLcDWJhMm/j7bwCBdxGavowd3
 XuC4tJRKHWBHLXtz2ylTQU5HzxwD+rghMP9S8JHThrIOSp5vHgEOutBCy25950HP5rdUzajAL
 Xds9c2UUp2grdredGApGDwSY1T57t6IQaSBJbBCKkAe3Ck2EPiRN1uZBlsCh4y2lm5kVcBriG
 R5CBxPclRLUoduPtAt89Vxeu/L/ODCaZVH/ODf0+LbfeVfQvF3ADMucDEn0WYqqj8ggqjaqWZ
 LQdOtGDVRLQhkXWPvf0QRmt4LkfX/Ud36VtUSrvoHNL0xnQGr737Wd7e3ERUlCQbSOt1MrJp1
 QYUesNr8thm+9uY2GvK0mexq4gnj7HHRMIMgshEMNL035iy2/ff0HVfByhQoA4tqxoW4AmCh+
 q3qzHEjpL+tKjy4GNEkNy9wkGfRH8BWZYn/OFGXDRl/y6BqcXmTC1S+q628ufRM1DSCrNNeYm
 s+UCWtaMhsz//Z2JLnm9WCDtf/uvp2CNWvam1sd9Hhs/09kRV5Z0VJICRMhICVjPP3AyerwWF
 0yGr7Zord+A1FLdPMvK8UTf1dMYs3vqMXAnwNBBMpCdCbHQ8Bs086KrRW4SCPOQFVw0O43Zfu
 le

Hi Umang,

i hope it's okay to add the most of the recipients again.

Am 26.10.23 um 14:42 schrieb Umang Jain:
> Hi Stefan
>
> On 10/25/23 10:16 PM, Stefan Wahren wrote:
>> Hi Umang,
>>
>> Am 25.10.23 um 12:32 schrieb Umang Jain:
>>> Drop the TODO item which deals with non-essential global
>>> structures and per-device structure. All this has been
>>> handled now through vchiq-bus and struct vchiq_device.
>>>
>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>> ---
>>> =C2=A0 drivers/staging/vc04_services/interface/TODO | 8 --------
>>> =C2=A0 1 file changed, 8 deletions(-)
>>>
>>> diff --git a/drivers/staging/vc04_services/interface/TODO
>>> b/drivers/staging/vc04_services/interface/TODO
>>> index 6d9d4a800aa7..9c79ed549831 100644
>>> --- a/drivers/staging/vc04_services/interface/TODO
>>> +++ b/drivers/staging/vc04_services/interface/TODO
>>> @@ -46,14 +46,6 @@ The code follows the 80 characters limitation yet
>>> tends to go 3 or 4 levels of
>>> =C2=A0 indentation deep making it very unpleasant to read. This is
>>> specially relevant
>>> =C2=A0 in the character driver ioctl code and in the core thread funct=
ions.
>>>
>>> -* Get rid of all non essential global structures and create a
>>> proper per
>>> -device structure
>> at first thank for all the great work. Currently i don't have much time
>> to give a feedback for everything :-(
>
> No worries. As long as things are progressing, I don't mind.
>>
>> Tbh this TODO is not finished yet. There are still global structures.
>> Please look at variables starting with g_* in vchiq_arm.c and
>> vchiq_connected.c
>>
>
> Ah just saw them now. Oh god, these are a pain.
>> Unfortunately i cannot tell which of them are easy to move into the
>> device structure.
>
> Indeed. I don't have much time left this week, so probably I'll start
> developing something over next week. :-/
>
> Also do you know where I can find some overview documentation of the
> driver itself? I don't think I understand the details of "how this
> driver is supposed to function" in the first place.
unfortunately this is the reason for point 4 in the TODO list.

In the past i started a request in the Raspberry Pi github [1], but i
didn't get a fully satisfying response. Maybe this kind of documentation
is under NDA.

I vaguely remember of a little bit documentation on Github, but it
wasn't specific to the Linux driver.

[1] - https://github.com/raspberrypi/linux/issues/2730

