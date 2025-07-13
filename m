Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71CC4A00
	for <linux-staging@lists.linux.dev>; Sun, 13 Jul 2025 20:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752438055; cv=none; b=gId+1qrXUJ8B7CjNYl3qde84sNY8aAcoJO/Ojg86hXVCgqeJV9pGX1QFZd9eNle2Ig/5aQlF11mRJHxurd1ksJvp3gPP4Cily/oRVDU2BFr+ptO/cLBpQuq2JtZ8DvSnc/jgUlH22vj//AbbxT0qOTlnmPG+rgH1Sbd5MWP+0MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752438055; c=relaxed/simple;
	bh=RpFAQxSgGTRwLN3XBjmCpwo+7oOQXzK6md8F5R3vllY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1A1rbWe1T21z+3zv43OcQeqMFAXz86hCzReqPVWc4lx3fN+d2Z+ZRPSsgW6kGLjnC9vLVX05liFjeJW8BM32FcGEPjAJt+VjVHBCpDAdXvweDUuyBKjxmFSiBLCT0FHniMjXA2lQpm7XMM7Lia/m8WOztjB+JunGNACp8X4Pqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=PN3/3PG3; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="PN3/3PG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1752438049; x=1753042849; i=wahrenst@gmx.net;
	bh=RpFAQxSgGTRwLN3XBjmCpwo+7oOQXzK6md8F5R3vllY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PN3/3PG3aj9673wi/GoddkX0PhpqiWk79J+f94orWicoY8oSkZlw/PZ5M3Iumoyg
	 g1k0s06WLtEid7h4ETzS4bjcwEa9pjwrhNhKOKQoXkrYVI/7SiySwyO0QhN8vfP5g
	 d81yJpIAB+kjOsWxjp88F0JhvkvE8KkPDWZEsGpnkwe+Ehdhx/2XHPNqa9Im9cpST
	 9jBWj0SLoul4cICl3El9A45sP87etxq+WiJcmuaLvhaI0SVX6WymuXfcDRrKJ3VoZ
	 /G/Wh3hBoC0i60BFBhOhoPWzxu0j0/mwW38SkHeyImtcIFiRln9Vm0928ZEQHFsP5
	 xMot9bqHWHOmJc12Jg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOREc-1uGlBv1tEc-00VwNd; Sun, 13
 Jul 2025 22:20:49 +0200
Message-ID: <2bc1070a-58c3-47ff-bedf-3ee48b6fc71b@gmx.net>
Date: Sun, 13 Jul 2025 22:20:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] staging: vchiq_arm: Make vchiq_shutdown never fail
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev
References: <20250711154031.24178-1-wahrenst@gmx.net>
 <20250711154031.24178-4-wahrenst@gmx.net>
 <b60b89b9-40e2-476c-ad67-1a5df548a167@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <b60b89b9-40e2-476c-ad67-1a5df548a167@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5F+JETWpf8bWTqwNzk1Kd5F8ODdkHfQZB2orji01Nqe1sDx7ara
 zqerku7d9h5YzjPus8WqX3xVg7UErhcfRbJb0eInwXSzVxTZHpqltQ56s4UtlaPtar0JzhM
 /O9NqJ55KOH8lzCSs1tQyw5bfudcoIk8HxWBgGy4klrxUHjuJD7HNuC365/IECBCJf6XRpT
 dexDyBKNJ7v45toJuxjiw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2b5h/w/OlJ4=;hburTxvQEQKZ5vaLVVKqCU/kqKF
 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

Am 13.07.25 um 20:46 schrieb Ma=C3=ADra Canal:
> Hi Stefan,
>
> On 11/07/25 12:40, Stefan Wahren wrote:
>> Most of the users of vchiq_shutdown ignore the return value,
>> which is bad because this could lead to resource leaks.
>> So instead of changing all calls to vchiq_shutdown, it's easier
>> to make vchiq_shutdown never fail.
>>
>> Fixes: 71bad7f08641 ("staging: add bcm2708 vchiq driver")
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>> =C2=A0 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | =
3 +--
>> =C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git=20
>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=20
>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index 6434cbdc1a6e..721b15b7e13b 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -393,8 +393,7 @@ int vchiq_shutdown(struct vchiq_instance *instance)
>
> If vchiq_shutdown() will always return 0 and most users ignore the
> return value, how about turning it into a void function?
I will send a separate patch for this later, because this fix is easier=20
to backport.

Regards
>
> Best Regards,
> - Ma=C3=ADra
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vchiq_state *state =3D instance->=
state;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (mutex_lock_killable(&state->mutex))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EAGAIN;
>> +=C2=A0=C2=A0=C2=A0 mutex_lock(&state->mutex);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Remove all services */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vchiq_shutdown_internal(state, instance)=
;
>

