Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC3915CD54
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 20:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712088534; cv=none; b=Hfs+3Wo2894zOeeUwM+853FaPUdNArHA+uOF2k3Tyhhe2moLOk4Cp9kyGqXdSM4PZi/J7limy9N5/KKUXAEKbWhVACwIltKF5ygJ94baUGDiA3ip5IeUaaTa2EBCFor9cClRBmy+VSP1UhlrVx7L4xrbbtC+bg/Aqbgt9nDwI74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712088534; c=relaxed/simple;
	bh=qxWFvC5irnWDEYpezEKoBVsYTtZUzSruxvk1s5wKyB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOZSt9yNJ7Kl6aQlu8VseMkCWIhoQ1d6FI862Zj3PcOA6nW4h8aP+Yb/RKJ7Om5kgfc4AxI7m8f8qax7mbGNjBXsNr+ZbsKnO4GJD6jBGMhZoRLKbvnH2WtbAfrLXT62JJDe232B/+9mos5QiIoQNRJBDNQpMiMo7wII10Xxu3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=s7WMmvQK; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="s7WMmvQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1712088521; x=1712693321; i=wahrenst@gmx.net;
	bh=qxWFvC5irnWDEYpezEKoBVsYTtZUzSruxvk1s5wKyB8=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=s7WMmvQK0VBvgh/bocAmwsKvt5+0wyFzulRsYEOLh1U4SmRYjxR3f8eQyEzWnMyf
	 J/e7ZKAyRh/VS9RG0tMUeUol9DmzuqzZpZx5tmiEKe3hpyRcwEXQs/SdxMxqYoiIc
	 79z46lq5cS9tBseyTXi2Gxqs15oPXFFRGDGRDXHpbhkDKH1yWNbPuQorDG6IK5361
	 aaWYNmpjid6QQ1YrXQnRoM/eyxTf96BkRxQDHFqskQKlCzVNxt/KIBVFj0ppgcCDa
	 UUU3aJSH0pqouyD8AYDxPXg8XST2hcRTHKf6dRDSe/wI8bMN33ltz/13IEeyQ3ktQ
	 YKtghFPIdIOSyO7Ykg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVNB1-1sHlTq0rln-00SNo0; Tue, 02
 Apr 2024 22:08:41 +0200
Message-ID: <818b0a19-a861-4b99-a418-919d67379293@gmx.net>
Date: Tue, 2 Apr 2024 22:08:40 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "staging: vc04_services: vchiq_core: Stop kthreads
 on shutdown"
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>,
 Mark Brown <broonie@kernel.org>
References: <20240330160440.49179-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240330160440.49179-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fNP8r4a1qWjgDpl5iitVTzkU3X6mK/EYwKnRsaTvaTZjgIaoAmz
 SwtMkcF01UtLJMRHyWLqNhue8WgtOddjxCZb0RsJbMSbGGZp9MV81wxm969t/1XRNyN3LvT
 zjsKbFX2CXGajJJFtAUKQQx+qgAtTkMyGMMZqiQHSHHQa8U+rY6XP3dKdr0pGQrq73qOtKc
 NeujvnmrPOO5LKiim/dqA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fYazDpe0/Qs=;rEhDoVaUq0t0fyYR9MpCbzy/hMf
 MW27b22bq/ucpF/kraN41HUUdy+5MSiKQHWjGRchyRvlIDFc+knfvrpY/gIThM00MjoCcVx3M
 2dgAzjCTmKFoj+0A+ZJ0x12E3QgHlGBv64Rizq0YpCv8RMElzDtSTTXan3Km4HrVqisF98q3w
 vGAWdwsi7UgRV6PFok7qeACsMSeRBk4wdX5t08vJO8JmP9SJ0rJOy6kWFiP0bApMBVKJLyaAX
 ugBFzWfuLN6gz0AHCuu5Wi8r6NmdPxS+JvdbNpwboB13HEmpjiGl4piy3eTfy0xqvGOepmqAx
 HBXUUm5OeevGSjtQrbxkZkd8b5c6IwX2VRfvrr9iK/XeacDWObb48salf5ZPxA20fX+AVvDzM
 eyZNkpYPqu61H+0mnxIqNYFxXsfxdX0uBRzvoY3c4pQUfoHboYxuOdYFK0xOmyiFvCA4lzAsr
 GnmnpP7W0LXQ8gjVcfDkGYgrGyGW1jSPdEgjwsDA5NZxDZ1ZtBBshUJOdroZZnTw2N4tacAn5
 d9xl8KzxXoohh//eeRB3I/DLbk0cT+38ziaJIH0qj8qRxTfiP81Kd1tHaRb+tupbduO6+F4kX
 H6qXqneDi8m/1nWWdMFWtprW2t+wMnjCLrMv8dMCV6rieEtpwo0w4NMwT9EFddLZJJxn+VJbM
 DpqG7x1Ww4NS9QmC32gNYHlDVGcr63tcjcWXGQQ0+rVvAbk/p4TNmlbAl+hhMx2P4nJA/Z96J
 TcEKN16kd0Uv1LXJoSYD0NuecwrDB2Z6+QNtF4m7odn7UUVJFlMfe77NorBGO/ThTqzHhw68f
 O7Ajx26IRJpuSzPLgSbBMQvlJuvqogZ+/2/+WzOuzwf8E=

Hi Umang,

Am 30.03.24 um 17:04 schrieb Umang Jain:
> This reverts commit d9c60badccc183eb971e0941bb86f9475d4b9551.
>
> It has been reported that stopping kthreads corrupts the VC04 firmware
> and creates issues at boot time.
>
> A fix-up version of this patch [2] was also attempted but it also doesn'=
t
the usual approach (hash + subject) to reference a commit would be
better, even the commit hasn't be applied yet to mainline.

> properly fix the TODO (i.e. clean module unload) and similar errors
> were observed when stopping these khthreads on RaspberryPi 3.
>
> Hence, revert the entire patch for now since it is not very clear why
> stopping the kthreads breaks the firmware.
>
> [1]: https://lore.kernel.org/linux-staging/CAPY8ntBaz_RGr2sboQqbuUv+xZNf=
Rct6-sckDLYPTig_HWyXEw@mail.gmail.com/t/#me90b9a9bc91599f18cd65ceb7eedd40e=
5fee0cdd
There is no reference to [1]. I assume this should be in the second
sentence.

Except of these nits, the patch looks good to me.

Best regards
>
> [2]: https://lore.kernel.org/linux-staging/171161507013.3072637.12125782=
507523919379@ping.linuxembedded.co.uk/T/#m1d3de7d2fa73b2447274858353bbd4a0=
c3a8ba14
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
