Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AF922B594
	for <linux-staging@lists.linux.dev>; Sat, 28 Jun 2025 22:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751150062; cv=none; b=Vj3RLFVk08EANnYDY9ME4eDpiIKWtbbFL9wzuA9glPaqgQOkb9XJCEh7h9sbMmKDbS9J7OlZrGv7JN5WAUBjUtlswozrwZhswCBqHOaGKVGL9wvCoySdUNiBrMlW1cjmwNyLo0KK3wesvf2mi7oJHogTKdyP/F/QjUKFB0soV98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751150062; c=relaxed/simple;
	bh=iFllL8DW6wGNuwAO8h6osw7s/s99sup23ibXJ1OyRPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIoKcBxpYLwl0LU3USWIT67OLt3JNCyV/GtV4pzuFWvsdUlWrkJQvkad3EXxNduTF+01M7QUG8S0S9ZDyqEtr8gV1/R84Vmyu8JFSjpjc8zNI7z0HmjE2D2lwbgplEkz9xqslzXO/iB3TNeWWJX1Mtw88+E9G/yzQQHJI6D5P9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=V9E8acdM; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="V9E8acdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1751150056; x=1751754856; i=wahrenst@gmx.net;
	bh=iFllL8DW6wGNuwAO8h6osw7s/s99sup23ibXJ1OyRPc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=V9E8acdM3bCxvWgAhFJLYc7XuSy2U3lK3SmJqf6FH2WBaWXrVMLG760eGq0YRJSW
	 NdfxfFCvfpZkilTqQqHk0ORzsozJTpr4Hn1u8JBzpAYE72WW1T9chjzircFMiUe43
	 DLDvR5gR+uaL/D0XiXDYAPRhlHyvs+ZifmdkZdiFpVdVUKWZkly5UCx96NEQ3sEUK
	 14Ds7yCwjaY3AI29y4OLWHgdx2BXztLfU3cau9MdSFpVfutNq3EGcpiyelsBrbEjz
	 k5lCeMyEBXaSqrFbRwbL7k7zxJANyjQSe4DiOV/c14GAoDWlJ3azVoGU6jGNTpmTL
	 2nIJw+FyIhyS/8fojg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5GE1-1ufqft1rjp-00r9YS; Sun, 29
 Jun 2025 00:34:16 +0200
Message-ID: <0c2840c2-241c-4f98-9518-6a3676286823@gmx.net>
Date: Sun, 29 Jun 2025 00:34:14 +0200
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
 <232c4fbd-5c5c-4211-831b-2b6d8c757f2d@gmx.net>
 <7b901778-94e6-430d-b409-823a503165e0@igalia.com>
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
In-Reply-To: <7b901778-94e6-430d-b409-823a503165e0@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pl18EXZuot+zXt/qKt4L32mCR8ym5/G0+kkNdBoK/q7hF5fa0F1
 3dkAXotU7L17QJCvEadWEuRdSHMYJK/3JyGAWQQYEi4ec5rUliCN0UyH71PFE9wrc1Tusp5
 erHIdwxPJI8/uTUWC1yVkGvUqV5Jc0TEl6KXINrsiuAjlcjUvDKP6UVK9WxRagC/uNrLKYa
 +fOcE7vL2JXRYc5wbrPXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hdo8gtg0g+E=;xCfJONjYgDEiTkVmAdrMKBauF+R
 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
 jw==

Am 28.06.25 um 00:28 schrieb Ma=C3=ADra Canal:
> Hi Stefan,
>
> On 27/06/25 12:18, Stefan Wahren wrote:
>> Hi Ma=C3=ADra,
>>
>> Is this reproducible with a real Raspberry Pi 3 (Plus)?
>
> Yes, it is. It's also reproducible in a RPi 4 with the downstream
> kernel. As RPi OS loads all those media-related modules, to easily
> reproduce the error in RPi OS (without dealing with systemd and such),
> you can just add the following modules to the modprobe blacklist:
>
> blacklist snd_bcm2835
> blacklist bcm2835_v4l2
>
> # only for rpi4
> blacklist bcm2835_codec
> blacklist bcm2835_isp
> blacklist bcm2835_mmal_vchiq
>
> Reboot the device, wait a couple of minutes (2-3 minutes), and you will
> get the warning in the dmesg output.
>
>>
>> Do you use arm64/defconfig or a special kernel configuration?
>
> defconfig
Okay, after disabling all VCHIQ users including VCHIQ_CDEV and enabling=20
DETECT_HUNG_TASK, i was able to reproduce it.

I will try to fix that.
