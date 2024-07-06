Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12737B67E
	for <linux-staging@lists.linux.dev>; Sat,  6 Jul 2024 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720255811; cv=none; b=nfv0PcWfv4Rksf8g0nHfqPQrsMDrHrptOGu823BIioDmtoIeTVgk2ETkUDbCW94wPB6vyMpm8eQ+kvShPa/EmuIAXGdFQYtgTTwfEjJkHKt/ijisl0QJfwb9pTSjrdLpz0wW9hI+3KhNnXB07cwjCmKZ/fPrMwxqMINMEAnAX5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720255811; c=relaxed/simple;
	bh=Ak+3ilxLp1bnYMUyHSth8LWaVuTgH6IWCAlgrNaaixQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpDUmDi/9QU7AgqCeMymeSYreFQxiXZmxEv6nBujs+4v1eicQpWRBpybCw7ibZ/ZnYewegoqv9OOeLLN8jJT5H5SK3p0tDbMft32auEM5o2ivE4zRVGfHFCvGzDibcphp1M8hXEO37Rh2YAf7DerqtHrnjPECkh2Gm1T6E9H/rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=JiBRZ8w1; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JiBRZ8w1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1720255805; x=1720860605; i=wahrenst@gmx.net;
	bh=Ak+3ilxLp1bnYMUyHSth8LWaVuTgH6IWCAlgrNaaixQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JiBRZ8w1Ygpr8pcJUx7p1i+mZE1hpfrPx1dgE0mNdgTIvEpXH4wECzcbgRXnVjk9
	 2VKOuTZdkKwq1CEM7Sw/eY1nhDcu3OFG3PB/ipErVX7XN+bNTetqnW8ytXHHGHfk2
	 V4cEK09v2zkZcmM/ag4n5rmBmsaoqDWUzHzdXr63C/TDdeAaL1gUVj2ww2NNJfOSe
	 3xqGZANUoAOVyftKS0/I5aLrqqKnKiglGIY+d/vbQb1PN6w0ZCw6oSS2Vr+LCGAs3
	 2Dun6U3rUPYkzJhPqdZhP1oFfQq8uEBZG9aWG3Px9Z8//34N9fyjIcMl/z/Tyd5bq
	 2Kbn23FhMrmIh7NApA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQiS-1saUxv0CCE-007hNP; Sat, 06
 Jul 2024 10:50:05 +0200
Message-ID: <f2037585-afa6-443c-abfe-4e2b4b278433@gmx.net>
Date: Sat, 6 Jul 2024 10:50:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] staging: vchiq_core: Stop kthreads on module
 unload
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240703131052.597443-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240703131052.597443-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:PVLEwoxyv4kWCfgNLpCYhEErqAttowa+PzywBbytUJm9KqAWkBP
 XXaGLQiTh7fB4VBc6sElPTyac29S+BJTNFnoxkZVMOj/yjtqpPVBzXc7cNBQdWSU7XWeFwq
 ps1cheXYjKraeoxefLJQ/yElmOfNkI+qAGcDS2FPYKXRt8J5TotbZTRSCgKpHcvmzME8tk2
 Rm9uNTiO2bxt/UTTwyn+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SvKm0GPh9d0=;/+S/aKVODttQXVcJmUT8vOLEr7o
 RrUqRdIEPX+UzDmdwNa+rF7UCy7xRi7kLg/CKgOHtBf6IdEv4ePfxJjX+Jpj1qa9gU8N8shzE
 yVLRYYRjZj3qXutP3VpMyqPnj+bjto4Yk3VqqBt16mj4UUlsCDaE0vzRP/jk/ihDFPjpFNDU4
 UyLmU/2ZhO+4hllFwk3pHRxtcGUDkL/xZ108PGOKHVqYKaGB04qxQZl4aoJFJlR0jbk0HHkjK
 yZA6LcuBEhixeswBokn2YNYgrgN+G54sGSueJ7qVzAKyBB7hpY2x5dRf2SwnD6mHg2XpsErtg
 jlHD9n47G+Si2B6JId9qnvfMcRa/e1qHaF/FHqn1UJkbfOSeqhANltGPEWV/mfeVSPb7H3uOx
 XTb7OmjQ3+z/hLPnhKl3Yex5RkAMJj56YoEOAoW+XVKo5y0KNXy4hSKvhAk6d/kce4b+55vew
 zBtnr5cDQWVmCB7xbIv+lZZDTc5HLqgwknuY9SzH8Q/SF35a8gorVHBWEpx4nUWW7jsUvo3wh
 f7i0YvSkKwCKK6NWiepVQdKShMGiYodm2vG0OycBOdy1+4xDXuI7i9pEbe0/xd3OK8YNat44k
 mi/AY/ciXNDUQPHydXXJpwpDt2KPKHkqtfOa7HOL9fuxRWuh+VDj1G98JxYOtTAP13eAvV9Xh
 GyjK8X70X+k3wsg6dTWVouOwQQgetDB6tdW4d8EHWVabyglL5BFPMjec54BW5lVbe2tgEZtvr
 /S9S0zFMbyscN3FX2BNYmfq9STxGUea699yyjlDqTlVVCzkAmuJ8JWUaM+Y/zW15crwP9K57P
 Nsyr6xr/35iMIwstKaqQQarKfBvVhakALgAfvHF4tADE8=



Am 03.07.24 um 15:10 schrieb Umang Jain:
> This is a re-attempt of [1] where we noticed corruption of vc04 firmware
> on stopping the kthread.
>
> After investigation, I found that the case where
> wait_event_interruptible() can return early(wait failed) with
> -ERESTARTSYS, is something not handling in remote_event_wait(). Once we
> bubble up the that return/err code and handle it - the issue is resolved
> correctly and kthreads are stopped as expected.
>
> Patch 1/2 handles the returning of the return value from
> wait_event_interruptible()
>
> Patch 2/2 handles stopping of kthreads.
>
The whole series is:

Tested-by: Stefan Wahren <wahrenst@gmx.net>
