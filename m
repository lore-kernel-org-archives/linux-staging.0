Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A48C192B66
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037527; cv=none; b=HzFPHZ1/cSAG2KLw4S3BWHsEPwvVc/+3y7eokPDyYXLF7h7ZwZaoqaY+NswmtvYr/9KxyJ+9sIZf+DzoaUsbEyM8hRr4TCoDU87OdDc6TfjTd5dygh5ZmDurx9rEe4wdvXDdLqOoLIfrD7lWpNpu/TlY7nH/tTYG2lKsrXDuSL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037527; c=relaxed/simple;
	bh=P1YBCAciV0G9IbPQVOOxG11W8/Y5KdV4jhdF9pPfUZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hm6q+WSnNMYTCqZkpwgPmf2tvag/4EIVpcFRcFFmbY6mlO2T7XrCl536zh/iUC+36sz73Lgv7eERnFw6odxbTbKDb7tRNYGw8pfGUA3bmUfB84h1b89w4+52k3pDK5pwG6uD2RYCCFaw8Lh+P748G0KC2VYnfNjxR6mg1D+lGEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=XjOApXsz; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="XjOApXsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1751037519; x=1751642319; i=wahrenst@gmx.net;
	bh=P1YBCAciV0G9IbPQVOOxG11W8/Y5KdV4jhdF9pPfUZc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XjOApXszP/fsNqW8lkf/rHZRK1Ryyf+qkhM41T43qZDP1WlqWg/xc2sEEyLN7Ta4
	 dxBTMDHFn533rSeJPtssSgIsWDfKdZkrS/Jgw882eRwB/3cfkHtnGAw4Fy0DZkMZj
	 zqLdomZqaIV3gFfDKfc0+1b5dVpqUghaPodUBw08VjITIUoFgoTH9v/RTdWSCWmf7
	 sL6AXKSWatt9yFSdbm6sDn3p3FK0WKXzvTvfRXZT0D7SL+T7iU3Y7tOjHIlCKlTpg
	 6eIdXi5Y3Vfhp98gYOF5k3SXZlB/Ad12eOkfXOXt8PpHtysjGIbGZhK+79VXPAOfP
	 NpMRVXU2pnyfZzlpPw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7b2T-1uNjnP49fh-00FEgW; Fri, 27
 Jun 2025 17:18:39 +0200
Message-ID: <232c4fbd-5c5c-4211-831b-2b6d8c757f2d@gmx.net>
Date: Fri, 27 Jun 2025 17:18:35 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] staging: vchiq_arm: Create keep-alive thread during
 probe
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev
References: <20250309125014.37166-1-wahrenst@gmx.net>
 <20250309125014.37166-5-wahrenst@gmx.net>
 <ba35b960-a981-4671-9f7f-060da10feaa1@usp.br>
 <7314139e-93fb-4abb-acac-0a07454d8d26@gmx.net>
 <1db32ad6-b699-4a28-abc2-56f8efae38df@igalia.com>
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
In-Reply-To: <1db32ad6-b699-4a28-abc2-56f8efae38df@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/s8mkVGe7aA30MuntEDbXGBs6Sqy6G5sAcB00cvo1HMvOCRc1D2
 jbNBtvED2tsETA/CZelGYvjqqERNpswzzGusaS7P0za4Iq5KhqgyUdYlOvSsMhY+B/0PFoH
 +whjke+fN1USk/gdDJ6dYl2MbM6yuzBASynZ/P+TtVj9ZV2xkixu2rMLvtKmt9ywjLJv3mr
 8gv9YIluusu3KNki+yd1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:g4KHjm2hw7k=;q1R/rYxp14tIsdXuhAEY4T8EZY8
 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

Hi Ma=C3=ADra,

[drop bouncing address from Umang and Ojaswin]

Am 26.06.25 um 22:30 schrieb Ma=C3=ADra Canal:
> Hi Stefan,
>
> On 26/06/25 17:14, Stefan Wahren wrote:
>> Hi Ma=C3=ADra,
>>
>> [add Arnd]
>>
>> Am 26.06.25 um 20:22 schrieb Ma=C3=ADra Canal:
>>> Hi Stefan,
>>>
>>> On 09/03/25 09:50, Stefan Wahren wrote:
>>>> Creating the keep-alive thread in vchiq_platform_init_state have
>>>> the following advantages:
>>>> - abort driver probe if kthread_create fails (more consistent=20
>>>> behavior)
>>>> - make resource release process easier
>>>>
>>>> Since vchiq_keepalive_thread_func is defined below
>>>> vchiq_platform_init_state, the latter must be moved.
>>>>
>>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>>> ---
>>>> =C2=A0 .../interface/vchiq_arm/vchiq_arm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 69=20
>>>> +++++++++----------
>>>> =C2=A0 1 file changed, 34 insertions(+), 35 deletions(-)
>>>>
>>>
>>> After this patch landed on 6.12 stable, I started to observe the
>>> following warning in Mesa CI [1]:
>> Is this also reproducible with 6.15.x or mainline ?
>
> I was able to reproduce it with 6.16.0-rc2 [2].
Thanks, does these hangs occur without any Mesa test / are these test=20
steps necessary to trigger the issue?

Is this reproducible with a real Raspberry Pi 3 (Plus)?

Do you use arm64/defconfig or a special kernel configuration?

Could you please provide kernel logs from boot until the first hang warnin=
g?

Best regards
>
> [2] https://gitlab.freedesktop.org/mairacanal/mesa/-/jobs/79092300
>
> Best Regards,
> - Ma=C3=ADra
