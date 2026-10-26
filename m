Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792995421;
	b=a5C2dSt/C8qAzpMuitt2E9pdXMb49FYCuLQSSuEzuA8J9o/G8S0Obv7sHesiZVJcSFqM
	 AwPyT8bez6JW30NG2H0lTNfVemNhOEWheAe/S6lKahCQavoeRS+YV/9wU4l4hjQR4TQqP
	 grqGAY2VhTwKwsUV744CkExN5tcxcWhqEp/50eayO+CI7k7MBFYDZSSPM+iNFNKHfcKAd
	 tJ60lKqeQJwqt3hknwuuLXmIpa1DYGXEd6YmLu+Ipr6WeYwCjK2FtNExsPqmFmgFgL7U1
	 qagghsrk0+h2cCxEYaTKgHljYwiNTlHTBnAHvY96z9+SoEflmjD9Tkmqpx6Q1CklRfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CR207ipMmlY7BwQvStdyeXJZUxi3TPn4ECTm9b7xJwk=;
	b=EpCG4QGPrn3DP6fcvjV0z5e3NL6TC/TZPv49n2juCsHIm/xTI2gb7p6oQKj+b9Izekg/
	 PS+Z7qoH83OLYyL4v1KuVtzt57YT1XHwoBs/2zDyrueqEFpnsQOQFZWHMjQz8h4X+xsK/
	 12UXeQj8/WXDH9oV7IWvx1qsvDFyXD59f86MTG/jOQBfF3aAgkxSa1GoyR2XarLzxcysa
	 2UfqWy5e3ShaDC1ckDD/VtWQ89iarCtTBV2UnDHt+L5D9vLeRxm7qDq1uXwkAmCsq/0ho
	 lhDaIfNXM7gY3r00NUSJfob2H8NjxBfXZM4e0gBnofysOnmwIwMp6J29903Pmb9sbGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TgygqP0E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD2B606A31B
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 06:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD2B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TgygqP0E
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6df7f544919so1580744eaf.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 23:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792995419; cv=none;
        d=google.com; s=arc-20260327;
        b=HlBxJ3lOMxMcOwuMpwXrfs8tc4u+XvgFqgYj5RQLbmlccVH30TaRhRanC0gKnhHG+U
         yPdfJhKD4Dtq6q0KO5U6xcy79IPWBGkbC7NtT+SIOTBZoiS2G6IHggK4SgiRbmDJWBfA
         zrQTsqHkX2VYJV9XQuyHmJRk5ANSrfGJL1p7YYaXWL3Kv3BloMUEiIbft2/fGYsx4sPE
         99w7uv4sNpqQVXRDIXbj477gFQKDyDlyv7WTg3cqlkQoYIpJmMJCjMYRQHhfxdIL2ObU
         dKpH5S3CJeAcz+1224PDlf2QOrMr45dXnqjIiNSZJ5TPrWKWZtAGRbesiTa5QIRTh4XD
         Tt1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CR207ipMmlY7BwQvStdyeXJZUxi3TPn4ECTm9b7xJwk=;
        fh=qJBMP8vuglkDhWSHl4Dj/z7lSqRWfRh57prX9ObsEWI=;
        b=npi1hkErGZxNulS7lO56QVppQ69UtjtP0Z1KVfxFyxBwjMu919735hmZ87jZ8c9XQA
         QmkLSBKsX9lOdZpRQfWwi5p+tZNT7SmNVwW9zbcEYY8FCVgLRw1qsGOsoIdb+Aq1XwxT
         0ZjyRYFxT1MrUgtQ+ZTaU3QUJDsHFfqbt/RbP2ItCK2Ldt+nlOJ8yLn3k4sKGNamgVty
         57yzH3xLlB/73LFC/tU55KrfWAgNbIAIBgMeYItTL1uC3QgucbXKOE+rlEFhhInAi8iQ
         iS6Jho0qkIVe1sBfsWQFbPzLtZuUY12fxazbnFtNG203thy1wRSoxY4feorg/k1afTux
         qiDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792995419; x=1793600219; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CR207ipMmlY7BwQvStdyeXJZUxi3TPn4ECTm9b7xJwk=;
        b=TgygqP0ETSbG+FbxkHpuaDJ/cyMCPTOAqvaYEU+4OiY470Uj3JIJRoexUwI0pow6lj
         EHhrZnNthVI+qlAPNFzOy5DdpVCMqBJ6LqRAxhDAeYwXJXSHtVKoRNtqbVlnMqFExDRf
         wlp0BDuzlOkrpBPPmGncn0JUSACaYrTRSC3ATPWh20n1thypzVWFXbRzHboLuvak2xrD
         H9i6pcqmjncdjfA+klZjTNUac9unwioW/E7FnnmhgC9kFexwuWe9N2QC9AvLmsh0QQaI
         21KQy3BjcJKmKtMKkzjWbSHEdM98WuvUlmAmQIJrj6ZinYhTh9X9gy2MwXrCOzLA0/XL
         aIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995419; x=1793600219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CR207ipMmlY7BwQvStdyeXJZUxi3TPn4ECTm9b7xJwk=;
        b=qN+zELXk6nEEZMBwFe3PNfYFnV4W80d7AB55cKv4ghg/Ra1FV3nurm+xyT6RPbjPcb
         Lm2x9KA3gyWBevf7D9pOjhlvlsVZEDPRNh5zoAAf6khvYciRvfznHfDDmYE0r5x5nLNF
         Y611ulKHt+boaOBaWe1MjCjlQnn5O3KFRCZS227TEgvD6fSomqWt+3CKHDX7FWqVvY+0
         wmnbK5deByBKQadfeZPNlvPb6Bv61SFxTw03sGsQUibzh7fFCbOGpfDDLnD57UsDY4uu
         PGUFm6JvDjgH6lA6i5CLMsDdYtd/FvUHOhOuMvmPOHmrqRPPu7zoT1IL5bMSlazUqqzv
         EtCA==
X-Forwarded-Encrypted: i=1; AKwUvBy70RF3zpQt5KRuanuJZ+x+Ktom4i7zSD7ZiyoU08hYK/TX692VVSVophogbUyQCrgme5FCfo07ZFJi79YI@lists.linux.dev
X-Gm-Message-State: AFq9FYIGyOZQXIOA5bkBi/g9tBykccW2LI96S+XpHNJtdt28s6vKIKWh
	gjA5HnBELNOo2U81nzHRf4zqaJE/aBYZDb4RNIu69JA6k0ZB93SSt8ewF6AIMringrhKUJ6IGQf
	fBpNRo7iwGU6NCnakszqZwRq5pDCkjXY=
X-Gm-Gg: AYBFou2CwPYwx0ADkxqyfKbf2XH1MYgdia+Gv+0zL9LLV/bPkNdWLRwrYEWfiesO33l
	qWffnLMG2peEO3kCkib+6D7ws7ytOsDvUglWA4F4WEOHlBbhwLyRLCejGxLn4AsHQV5uWKkSTT2
	aa2MylrIOeBELvZEmmC9Q9LgH0gx2cB/v2WkQr2p6Rs5pPZWnriQbZaik7x9X78pip5JM/qGL32
	LukcuLnemHUwXEaGT7mARw+fI0//4V58m0/CSFSdl75Q/rJHg3R3ijUYBAf7smMwNzg95mpRGag
	/nUayEEMRdQ3Vq2vgzgVg1yKJ7rN3RBqfmpLQkn5THig/Fw9HwcKA5OnS/ypP6IFf66nhyKNFKt
	/erDbF/5YbC5qBq4rhU9H4bUHbaAEE2GBngthqJn86TeLmJ6xGNACRNa/HYSrhiMSqK/YFYo=
X-Received: by 2002:a05:6820:340d:20b0:6b7:46fc:1d8 with SMTP id
 006d021491bc7-70ba0ef0690mr1914182eaf.55.1792995419601; Sun, 25 Oct 2026
 23:16:59 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025164003.143864-1-himanshu.bakshi478@gmail.com>
 <at7pu4hldDTgZtXy@stanley.mountain> <CAGLmz9JaXM8s4BHQ2Cn5QQdBZpzDXmHyb-GQ_jXtj4Rz6SJOJQ@mail.gmail.com>
 <at7s7We7bxdmmmSM@stanley.mountain>
In-Reply-To: <at7s7We7bxdmmmSM@stanley.mountain>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 11:46:48 +0530
X-Gm-Features: AclHuK_st-Xa8oKg66mPkm3FdUxLxM8NWdOA-cYaAmfiphj913FwW3RJaID5D5c
Message-ID: <CAGLmz9+R5Wsd3i+7kLZXL-KP2bqdEmNUJTSKtZph_NSP92Jung@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
To: Dan Carpenter <error27@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan and Andy,

I have not found any call site for fbtft_init_dbg and just assumed
that it might be useful later on as the driver develops. If you are
considering removal of the macro, please let me know, I can send
over a separate removal patch of the same.

I have also noticed that other helper macro just after this one
like fbtft_par_dbg and fbtft_par_dbg_hex have some minor style
issues too. If you want me to correct its style issue too, just let me
know.

Also, regarding the confusion of threads, I had sent over the patch
with a revised commit message as PATCH v2, which matches this
discussion's subject. (which I apologize for). And also sent over
the reply that I meant here in the original PATCH v1 email.

I hope you will forgive my incompetence,

Thanks and regards,
Himanshu Bakshi

On Mon, Oct 26, 2026 at 11:32=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
> On Mon, Oct 26, 2026 at 11:23:21AM +0530, Himanshu Bakshi wrote:
> > Hi Dan and Andy,
> >
> > I have sent over the comment on the v1 message chain and
> > also sent over the revised patch separately as v2, I will be glad
> > if you will go through it.
>
> The subject here says we are already discussing v2 so I'm confused.
> You can go through my response and decide what still applies I guess...
>
> regards,
> dan carpenter
>
