Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793010176;
	b=kn77uAEwCDJOBhtfN9r3jN2Fd3yNjvrBWu+UCs6nCjiKISKlsTuVs9IbnsjsPqg2xrZk
	 VMJD3mNu/r7eacb5Fyxiibo7Pz98teynAAZwiAGq6dPLNQ05DIBiLFeBAP/RupECDLUEJ
	 dHv1fUS5RqvAT/RgmQokqC0enWQWKuLsywJDm20dksM9SsGkXdWy+RxnzfPwCv8Urndoi
	 LZGIkoEuUAlMRO1ecI8k2xwf5g5/KLnitzqLZUsPNS115bL3KJTAJFvGchfJnSShRgHRm
	 xjfyykNWdrh1JJ6rInp1HJ3RihWMitXbHDEAQJ4Yso3ugkRJqdaW/rGO1enpNrgdkoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4JFuCCDMVlFwxbA66iE/GNag0HLFCOElpF7r10IAp8Q=;
	b=jn5lJm1k3/5ZwE1PMQE+60cWODMYfnq+WxcnCXh4XrlOpL3aB8tam19mMcyknjHDXv4D
	 oS2G67tGD0na6IlJezEhBLgYmqUZyDuqw83TvWxJAuS3lWjh/Znp76N8Jf6Y55XWSFtK+
	 5VGltiWQKYVzcdK4+Z7PH9zpxellSIzvI4XSK9pyZ2DhEQA19D1RSO8+CEkIgHpQECgCJ
	 NoC0BEgs34d9FIgRTDIUh+7l9gwBq0IixgFv79/dgxLmSVqNbIc09B0o+B4jmB4Twsgn4
	 edrigiKAK3QNXc7O9+EGvWNRrXXg0mxvZSBrhup2pB9KeWgS8nz8GyFgie1GYNTSnig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sVWbQG14;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4F3606A329
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 10:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A4F3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sVWbQG14
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-823b938464fso2085876a34.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 03:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793010175; cv=none;
        d=google.com; s=arc-20260327;
        b=KpuP/xpV/aYG8mRJOhxDn+/Alq07h/ux/kqcIEILTUHFfIG6/GKlBsnHQWs8mn26kZ
         o7Y9yX7Xb6/rG5jubwBd5iF7NJupWTUDDXOyUKtPofnEm7NAITwLVE0HKzGuFcju9fXi
         sC0u4P8IdedV0ZebAN4DUr1nikugxdJ4iX4BKAIEU62SxL1pqCcDjjJJZjqvRpZ/+2lM
         3R0xm1Peny9UBRclGmXl26k7/agE42fl7bx/FJbWD69itqPM2BA7/UaS/sA8QDDRkDok
         5Eg/WYHei2kH+nrmzE2zZXqoOqqNuEM0hdpbPKeoAHorLj5+ple0FzYfrxozSd8zj+Ln
         Emnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4JFuCCDMVlFwxbA66iE/GNag0HLFCOElpF7r10IAp8Q=;
        fh=6KaKQXxhZLq9NQBU+rfKr3QM0Vh8ccpD7aJZjLyFw+0=;
        b=ewqGwgQ/S51kz+8FzjxOmOhZ8g+8E97SNeOI+gQhfmZBGhrBIx47UIvhwxQ3GgCGhB
         n2wiJ/BBRd6HYbh4EsLPnB+rxpX/Ocd5fngaueV0F2tjJ8bbsu474Z7HVfb3cWybnDLl
         +mNdKmSvMmN82QlxWtJXKlbSumCODAVn4RUCOjdkIZtXOsSpnsX1WBUX5DD5WNLM5NHH
         tSwbJyXdzY27ZdjrnDBAjPWYnxkYbS2rrYXk3qwfrxnAW4/twVX1ul260JAEwWvCb6Jl
         6p3S5V7sFOW/tia9VmEZpXPx1My2BAT7vuoLA35K86bfQK1Wlcf9TS70GiWyEmS8edl3
         mmQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010175; x=1793614975; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4JFuCCDMVlFwxbA66iE/GNag0HLFCOElpF7r10IAp8Q=;
        b=sVWbQG14bH/Y6B7Rhz7JOqcL7rRasWmm0josRvwTSTWHBuRaF5LSxNjuHVVbFtIHI/
         IAUWo8B/mlLBr3OGZXn9tRhqbgXcaP9uqZk3hob0IvmkAX5RdSi8oCG6mHdQSLQWxZj+
         qXacKFLza5xP2cuqXPkbo847uDzdVl4XF98xnAXFzUyhH/WdZ+1DgTmdxs//fV51zBL8
         qwymzxMDGRxKK93viDO/SLq2tzPG/nYy270GPZsw99GmCxDlhF2HaJ61MCOEHLTLPgVp
         U84gZ4vof6Sl7lqZrnVOgkowH06/lp5yENOdqjcsCUVznOedXJkHxuCnyEUh3RvX+gi4
         LR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010175; x=1793614975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JFuCCDMVlFwxbA66iE/GNag0HLFCOElpF7r10IAp8Q=;
        b=Gf107U1yfi7gVUqUaV6A8PcYdRO0sjQl/d0fJU1dIOZy0aRG7Q3jrEgsAIfwpwPKQF
         cEC4CEDnEpDPQPDvA5l3VM2hg+FS/LxI7E9/fhjEDNsx4Kdiy0IlVBwQCiisVsdfjrxv
         lSyg3U4SUWnurbtGnXIAM7OJ6JOykeUKlX4jut87YBNIV+iDhMGi2N1D/ib6yOKDB5Ht
         PzeDaC6Dx9jtyCbm2tQVT4qVeE8ffVPOjohw0TSuikb7MHuPUaX7C+dTlObJhY86WqM9
         jLUivD+V4yqEPZMHniLvuLUKkCZdAfpcRga4ib+JMZp8AHaX+/C1Jh9gU44DvVYJzQZ2
         NtaA==
X-Forwarded-Encrypted: i=1; AKwUvBwNdYGYh2qGiY5RFIcpkqc4yeNvGbTgS641GuTUOZxUpS/g+DcrKXSHjSVVUp2JfrxjO0q85gqw2YegMeta@lists.linux.dev
X-Gm-Message-State: AFq9FYIlC50AutB1ntUcbUvNCrq43M3PAmAwbcr0OnwOby7PTuGFKcrg
	XTsM9cSuOH1aZoDsjOFdnKwQlypya4Z2TeQ4pyQ/XyxiHIPMC1ymlPEAOZf1SqbQznCwd+kPKu2
	r0S2K3/bEYVSlAdvt142+adlBWnoPyWYyoNoM
X-Gm-Gg: AYBFou0zd0wGbMUbsGjH2EwXNrleoHaKnl+JtB7sxCbxUUnhK2n8OXLC2OvdBHpcxW6
	fMONSy+fT0u+1gYGc9gXt54zqB+LHlNT3zKjsdE9A92Jha/fQ69XN/8nyJgmUmqidVXPECokE4U
	xmrYyRSiMnR38Eptagd6YBvMCLy4kV0945rV7WTB24R9PQ14RSVc24PBsyC0cMHra1BWVGD7pXJ
	SGBXD+nyNpwbu9kQ+FEoanLKp786NfRlN7vbINgZhifCFMsWc1fvKCK95+aGTfBqjGIvQTd6q/L
	ah/P6Y3Ct35Gqi1oaSGuK8PRKIOZtkGjlZ3lqt9SUtayYoN9JC14Z0A7Gcj3qmNxOFLmOJefS37
	qARdLGKj220TnrMNKNJFOH9ymO/FdwPuavgIhhN2U9G1ygnOsaLylj0EOjsGlwup0s0tY2YQ=
X-Received: by 2002:a05:6830:43a2:b0:806:ab05:c1dd with SMTP id
 46e09a7af769-850fbd152cdmr5102659a34.4.1793010175125; Mon, 26 Oct 2026
 03:22:55 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026092423.66168-1-himanshu.bakshi478@gmail.com> <at8lztOr7xpvHEdo@stanley.mountain>
In-Reply-To: <at8lztOr7xpvHEdo@stanley.mountain>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 15:52:43 +0530
X-Gm-Features: AclHuK-LrngTyM9fVjS8n0vJ2sFwVm_Ut-1pAzzYtokYdGgpWPQQI0AOYQG4gS4
Message-ID: <CAGLmz9KAs7oKnmLv8NK6Z8yBQyrdV41oiouoRrNBY-j-p_H2+g@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Remove unused fbtft_init_dbg()
To: Dan Carpenter <error27@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com, 
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thanks for letting me know. I have already
sent the v3 patch, so I apologize for not waiting for
a day. I will keep it in mind.

Thanks and Regards,
Himanshu Bakshi

On Mon, Oct 26, 2026 at 3:35=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Mon, Oct 26, 2026 at 02:54:23PM +0530, himanshu bakshi wrote:
> > From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> >
> > The fbtft_init_dbg() macro is not being used, so delete it.
> >
> > Reviewed-by: Dan Carpenter error27@gmail.com
>
> This is formatted incorrectly.
>
> >
>
> Don't add a blank line in the middle of the Tag block.
> Tags are supposed to be in chronological order.  So Acks come
> after the S-o-by tag.
>
> > Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> > ---
>
> No v2 text.
>
> Please, wait a day between resends, even for small things.
>
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>
> regards,
> dan carpenter
>
