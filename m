Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4508BE5A
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 10:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717582313; cv=none; b=DlKHgFst/K6gIgPgRE8R/AwRLWyvUemqE0p/Nj52vl4Q3yB6PeEr7gRtSz8m2mZNhzT3QH28IQbETw0yE+Y77qgYa3r4HVjt/5eHYp8mFbC1cFImZtBTnBqegpzueQqH86kxjWca8CWoT6dROk1s64Xl3Y0EKn7/752eYItTt7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717582313; c=relaxed/simple;
	bh=ddthtIlWP4TIyL8el74KstX/MAIrIUQ5Q8dIsa/d2sE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6BJQT3JbPclLyJ4iQIxp2P9awDLPKEDwCcXFuUDLB6qS4zAQvFLI2g2EeSe4qmgxGTOusIGXtd4U8s+oD2ah/ezVgFQM1u5hYsk7TFluizsE6v4PQC0id4sriqL4+17EfaRLX8H0ugrB/XZE7XazxdSpqLgCeW9N9ctLesEwU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=BMB7WaYF; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="BMB7WaYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717582302; x=1718187102; i=wahrenst@gmx.net;
	bh=nSq8vWNj8prrPnMXkQ299HtbdxLEqHAxD8F8LDR9+xU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BMB7WaYFU8xEHH6rpLf8175MjTQus2x4+SY5qxXOo7/RYoJZ4H6lIyhtbump+Ql7
	 bWWsQVg5zGSa4vNrP4FJIxiHlMpu7IPdjvnNDjehtcBRq8uJytrMf62/dH6G3F4nS
	 at/eKOJyDV8qawPhQuS15cDY04SIniQuQSwgofUZiEkHyzJZldGvk/12U3vGtEgaf
	 VLv019T/+3VuCJ6Yed+8Eh4DPHX7WclOEv22PMEmlT0fHiJu2/kfqoTf6Pz9tMyVE
	 AnLVtbxjCiyEc2oc+xH46gFzAqv51+XbYz8FGg5FNQfu0Q+eGTfEknCGjlCDDq8ng
	 5dCxJ4VIBKlvnZ2AWA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1sI5w13k1k-000Kog; Wed, 05
 Jun 2024 12:11:41 +0200
Message-ID: <f01308d9-505b-4c57-af6b-b3febfd98112@gmx.net>
Date: Wed, 5 Jun 2024 12:11:41 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] staging: vchiq_arm: Get the rid off struct
 vchiq_2835_state
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-6-wahrenst@gmx.net>
 <20240605071109.GG879@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240605071109.GG879@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Uqatu/0Ns0gs+/Q98plbQIhH8RUajr93yKeQQm/cMF/Fe5iGbH6
 TEGvV/7Hd/1cSN4hW3yiNOjyGAVydgGnSqoG45Dihhzcv5DDx7kZx4NSWR0LlUUGwa1//nB
 9AQyTuNsj8DODk8lyqk10Q0cUXngcJXrO+oFsbZoA6i7i2MZWak3QIk33h/2LCO1q04R4Mx
 xQQN2xmG7aQsGu2SCWuiA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZFJB4115RI8=;k+De29qyQc+aOkSH+rcWOAHlvC/
 sKh/j/5uDPIunjK+kz7jdQc24IEczveR1iaaHTZ/1lLemzAiHEj2JdocO6yQOAnIH5bc2GQ67
 XB6DGn6rAhoxnbfQr8rfzyLt1MLuLl57LtgVmEWyLyPpg14vcvkcpLaCg3tRyduMBQG0eD1pQ
 vTde2es5ZoyQNXmCXt9ppeDpCB6vAQKnXf7BAmRCwSewHRlsD+NoYN7ZQR6TydcNwBvuDV4J/
 y+p2XePZYbEU8P6WBSEMSNZIYewCn3MZo6x+rum1Q3059gZbsFHKUUdaoA7zqYinuam8L8e6m
 B2bMLqBeRR/35T+cJoTXhQmxmgh7ts+f9v32+GYwAh6UVGhEbZN2HlmVp43Y4Mw+zTlxqxFeA
 BmhMigebhqlooIdWIllAYUndsGhhkanrAITU/YNN4qhRwRnwqWibKmhuqBX605ELShbyreZp7
 34iLjbmfkqMSmaBY+iSnuwg4DvMHDXyt4Hoff+AhAlscK6QNMsH6w22eJnYUdML/yDoe6MeZY
 Mzy3eE0CIGv1hAJCzdE4z43i2mm6Q05YI5gXsMufSWewQo0dmpm2/FLcUUcwJItS06XNeYrJt
 /m+5L4cRht8PRCiLQNbH+yXXHPyIrqiFjrEkxgNzgnsgZRmvZ++50LR7LneLpcPyeU5Gf8Xf0
 hM0BJijZ+b/xZsaqh79Tzq7W2Av8njFuTmGDM5WQfGMz6mWyTzz7xl0ceClyT13IO23IyM0Ui
 eTHMQhJSCUsAdpFtRipj2xCLblAVA1zg97W8zof5VgetKfKXXI5hC2uPeWUPy/k09I/10tncD
 ISvxgdxiJCF3Hdt1Wt3LNFEfKP1s0ysH901sROE61appo=

Hi Laurent,

Am 05.06.24 um 09:11 schrieb Laurent Pinchart:
> Hi Stefan,
>
> Thank you for the patch.
>
> On Tue, Jun 04, 2024 at 07:28:58PM +0200, Stefan Wahren wrote:
>> The whole benefit of this encapsulating struct is questionable.
>> It just stores a flag to signalize the init state of vchiq_arm_state.
>> Beside the fact this flag is set too soon, the access to uninitialized
>> members should be avoided per design.
> Do you have plans to address the design ?
by using kzalloc and assigning platform_state at the end of
vchiq_platform_init_state, i would consider this as fulfilled. Or do you
care about the possible platform_state NULL pointer?
>
>> So initialize vchiq_arm_state
>> properly before assign it directly to vchiq_state.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   .../interface/vchiq_arm/vchiq_arm.c           | 25 +++++-------------=
-
>>   1 file changed, 6 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_ar=
m.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index 515cdcba043d..98a0b2d52af5 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -109,11 +109,6 @@ struct vchiq_arm_state {
>>   	int first_connect;
>>   };
>>
>> -struct vchiq_2835_state {
>> -	int inited;
>> -	struct vchiq_arm_state arm_state;
>> -};
>> -
>>   struct vchiq_pagelist_info {
>>   	struct pagelist *pagelist;
>>   	size_t pagelist_buffer_size;
>> @@ -613,29 +608,21 @@ vchiq_arm_init_state(struct vchiq_state *state,
>>   int
>>   vchiq_platform_init_state(struct vchiq_state *state)
>>   {
>> -	struct vchiq_2835_state *platform_state;
>> +	struct vchiq_arm_state *platform_state;
>>
>> -	state->platform_state =3D kzalloc(sizeof(*platform_state), GFP_KERNEL=
);
>> -	if (!state->platform_state)
>> +	platform_state =3D kzalloc(sizeof(*platform_state), GFP_KERNEL);
>> +	if (!platform_state)
>>   		return -ENOMEM;
>>
>> -	platform_state =3D (struct vchiq_2835_state *)state->platform_state;
>> -
>> -	platform_state->inited =3D 1;
>> -	vchiq_arm_init_state(state, &platform_state->arm_state);
>> +	vchiq_arm_init_state(state, platform_state);
>> +	state->platform_state =3D (struct opaque_platform_state *)platform_st=
ate;
>>
>>   	return 0;
>>   }
>>
>>   static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vc=
hiq_state *state)
>>   {
>> -	struct vchiq_2835_state *platform_state;
>> -
>> -	platform_state   =3D (struct vchiq_2835_state *)state->platform_state=
;
>> -
>> -	WARN_ON_ONCE(!platform_state->inited);
>> -
>> -	return &platform_state->arm_state;
>> +	return (struct vchiq_arm_state *)state->platform_state;
>>   }
>>
>>   void

