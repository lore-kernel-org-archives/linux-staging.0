Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE8E253340
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876516; cv=pass; b=tScFnW+Dtf7NX6sJwf2Xb2ygmzH8VomMpeeucNTb2ygHMsAXmAw0pmrtzcGF7x2Kk7MIXb5Y/jrAYMy+Pinq1BXIhKzdEJKC88MwnQs1vhtbFIeiCZvCn077s10UKalAb60moOMjRuCPWU3EXt33Tl/HA191BXzAW89+r5bMe5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876516; c=relaxed/simple;
	bh=VDBmbDNAv1h36mVjKLxWMPIBZ3FcUkHtn28nSPBhjxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+ztPX0QNPFm9DQI5ZUQ5tfStImZGu+/jcONTkwqWs2apWgBKC9trNILilNpyB1zlhB9NmvQezTx8vJvjKydU6blO3PYmBvFYhhboSyZYQ7lX8sToYkVsjFZVp4gkmrKs55cqh8WtrIx57Ld05APALRTvO0CwSxYduVH1mjTovI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=iAlyMZh8; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="iAlyMZh8"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba3adf78f5so2203355e87.3
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 00:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791876511; cv=none;
        d=google.com; s=arc-20260327;
        b=InkHmNHb+Us1HN9SNR/d20JtzNxCo+pS0jbGeXU79ng/nJM36fBvtwXVM+pj8+Cxse
         x6EMN6L5jNqBFvUpSEeLVqRc0limUNyKP9Z6QQoxqdnKA4kuMrWAGPAYTiktn8ligbNY
         pA+DoloNWxASmVsj0AL2X6rUwkM/SrMU5m3HojkdEog9ElkRF/X7ma2XIpfdMaInuDYc
         y3ZTIVRP2yac3NvdrQPkkAhIJuG1jci3kynUAckxRBA5XXPcAZN/nas4wCG8GqLH1Tcc
         eCbN19BLnYsxfj5p/nOLvNTpMzeUVSNbLJIcQMX6qp9ZqYf0uPTxxY4QsP1liJ/j2twj
         rqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dYUiTz8cJsC4eMm5UNiPPT6RbOVFDPm0rzI9f7/DL0A=;
        fh=xvyV6L/ad+wm4m6Rd29s9fB75qkLeJFVgpu6OLRhFdc=;
        b=QY0fpVy4LXWnjp9fGRtZckC+9mkmC+ha69yJDLxWsmdPNfGU+Yng+YFuFTzLWMQPeU
         CGutkloF9nufKDR3H4mAo9W2WDbtZuNfhYJGgrit5cH4jBDzY3npKQb1LWHoiRlo3LMT
         NukBcA3ybDQfH/v8Y3id15xb8rpOzJLvAvueZLhNpGhHV0URyDxvDb0a2B5LTftBZSgQ
         YzxSp64F2iETBOCkgIZBGXLviOw8ACnI45B0mr4MA6w5BtktkWpePHbLZV9qCNimC7yC
         MEl2WsG4Lz4FB4HX/3tC64/OsDu4G9Uy70HUYZAZL/ZA4MK1ErJOCVYVfHshxs7nIpxS
         +wjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1791876511; x=1792481311; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYUiTz8cJsC4eMm5UNiPPT6RbOVFDPm0rzI9f7/DL0A=;
        b=iAlyMZh8dOVdQrtN98FRj9DftnCDu4N2t13oKE3jRe95RFPtAn5OyiTBF0fbwq1iWv
         sqpQHZz7ZmOo4Pw4L2rSgTfWMj/KTx4qQZZVfMa8B31MlCjYn2fTUEV7hYdKFJ/K/xAM
         Do5G0Ogs0pc/xO5MG43GdbJsZFBxVYtVaZr2XfGp6Dn8jgJYCRWDDSB2SxkfbSDpB44X
         ctU6dmIvgTC97uRWEmlIRZIsYNPfM68ZQ/Q1xvFoE7StNgknMsdwDGzH4J4Fb+E5iexO
         JSTMTU75lO5nXan0K4/Yvq3Tuo9yjCbZkVuXpEMNughx8OYrdzgcA3esJ/Rfn3dPOurd
         ptRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876511; x=1792481311;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dYUiTz8cJsC4eMm5UNiPPT6RbOVFDPm0rzI9f7/DL0A=;
        b=KQ2Rj0c9ZsZscNxfEHdK9cs1fVhhA/cjZ3C0cTPfGiC+sKbBYFRizMUVLn9xfd5ixx
         RCdaf56qbRv7FbdCUW735pLugF/dHONwWYiGNJSP1dvnl1AREDowRtlG8v8JzqFahFiu
         ZWAUR1vTIRAxKLpeXin3clA4XV3+hwdSjhMsWSI9XKwg7Cl+k61W/eILDC1a+7N5zkug
         +JBCZTFpVcPeM22z/9bzuag39DWe9QEopnMEilLp7XR0fioBbiGHPk1K/zFJoWeOJFzV
         pJNsMVZUukxHPv694CBZwI0lZNe1tzpeRgmqW6RBlC3SMu2ghrZp68Nu7IBLVAvfOnC1
         1QDw==
X-Forwarded-Encrypted: i=1; AKwUvBytju6pPEN6hlu7snIptlq76/bTwVbQArbZsAfkqt1dSMZnB7GSpMwIqTTnyzN9IqEK+wrq23xVkSjZn5Wo@lists.linux.dev
X-Gm-Message-State: AFq9FYKf337XTcVkX8llII61IKLKcZzLqYXYaomwgvKRtKMJSVZ1o1Mw
	NGjl2E9/XueSXz/F+HTakRl9WJhTko+g7+Juk0JnWIF5k7592J9350qZ5uq1lZVvgMYhCJXVFpC
	b63Tu89VYd/s9e4M6ENExDf7Ot+fdZom23HR04lwv+w==
X-Gm-Gg: AYBFou1B1/INKCrAO+P2NCkVpUvly9ozdzoCE71COenirrv2K3R5r0EHiunFIpMfjvg
	RFUVwLcZKKqeuRgHw/WJpafd8sq5HQoZGixNHN499kU1BsT6oud2ibgN4Gvncl3bfxfKk8YjbOm
	RNv1rAX4+NYNajiqv+hiXmU60sTF5fHSTdfvP5kUWyW9z/mD0CvIdA1FhZlRnwbnW/eO5MP4vm/
	3DdziAnKl1MCWZLBCEhEZCFXFT1LWNpuNoAyDSCx6NH1Z0vfKr9DgE5T7QUuOVaa/8D/pqpARXU
	ZPoypdHWs35ZCV7BO2cQ/5yld841g9rHcjHPsv2vB38e++InMJflmPvou4X1Kmq8ngfxlukK1VX
	1qApDdjPwBtsz/8j1UIsmeg==
X-Received: by 2002:a05:6512:a83:b0:5bb:27df:414c with SMTP id
 2adb3069b0e04-5bcde8d4e11mr4380160e87.45.1791876511001; Tue, 13 Oct 2026
 00:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <a6b71984-cd0b-4e81-a240-ec05abc6327a@leemhuis.info> <179186742507.11414.3709235533520575164@freya>
In-Reply-To: <179186742507.11414.3709235533520575164@freya>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Tue, 13 Oct 2026 09:28:19 +0200
X-Gm-Features: AclHuK9-3hXsyGzmHqElNPfneC09KIvVaOcvv-I6B6U6I2gxHhOmuQTkYu2Jgv4
Message-ID: <CAFERDQ1ygWAUbGCpzC6wFzfgAjMFmB-LpYmQp380N6D=2GLfFA@mail.gmail.com>
Subject: Re: [REGRESSION] bcm2835-audio fails to register on vchiq-bus in
 monolithic kernels since 6.19 (VCHIQ destaging?)
To: Jai Luthra <jai.luthra@ideasonboard.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: florian.fainelli@broadcom.com, gregkh@linuxfoundation.org, 
	uajain@igalia.com, Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jai, Thorsten,

> Hmm, no answer, so it seems nobody really cares. A bisection might help.
> Or at least validating your suspicion, hence: why can't you check the
> parent of aa125180c6738 and aa125180c6738 itself? Or at least the range
> with that commit in it? And is latest 7.3-rc still broken?
>
> Ciao, Thorsten

Thanks Thorsten for the follow up!
I didn't bisect because my image builder tool was not meant for kernel
development: it could only download stable release tarballs signed by Greg.

But now I've found a way around it and I've just bisected the issue! I've
bisected through the 6523 revisions between 6.18 and 6.19-rc1.

(The bisection was made on a Raspberry Pi 1B rev2 this time.)

> aa125180c673881f88b528600b57865dc158b3a7 is the first 'bad' commit
I confirm the issue was introduced by following commit:

> commit aa125180c673881f88b528600b57865dc158b3a7
> Author: Jai Luthra <jai.luthra@ideasonboard.com>
> Date:   Wed Oct 29 16:00:10 2025 +0530
>
>     platform/raspberrypi: Destage VCHIQ interface
>
>     Destage the VCHIQ interface driver to drivers/platform/raspberrypi.
>
>     There is still the remaining TODO item of improving the documentation,
>     which can be handled post destaging.
>
>     Secondly, multimedia drivers like codec and ISP that rely on this
>     interface need to be upstreamed. And lastly, the drivers that facilitate
>     the shared memory between VideoCore and Linux, like the vc-sm-cma driver
>     and vc_mem char driver also need to be upstreamed.
>
>     Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>     Link: https://patch.msgid.link/20251029-vchiq-destage-v3-6-da8d6c83c2c5@ideasonboard.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

#regzbot introduced: aa125180c673881f88b528600b57865dc158b3a7

> Sorry, this got lost in my inbox last month. It's likely my series that
> destaged VCHIQ broke the ordering as Martin suspects. I always tested with
> modules enabled so didn't encounter this issue.
>
> I'll look into how we can ensure the VCHIQ bus gets registered before
> peripheral drivers (like audio here) when CONFIG_MODULES=n. If someone
> already knows what to do, pointers are appreciated :-)

Thanks Jai!
I'm willing to make the patch, but I'm not familiar with initialization order
in the kernel boot sequence.
Would also love if someone has pointers on good ways to influence order of boot
sequence.

Martin
