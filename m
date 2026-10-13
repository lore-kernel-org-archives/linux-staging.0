Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B812239EF20
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877109; cv=pass; b=eBlvljvHr6mY9iyMj64ZZjnNhQ+HLKutMSkVNd9O3tx25VEq2ZPj5UzDoJPuC/2mWfeXegol4O+FlCqPu/5YVuvkvXWJSgf2tuf5EvinFYbhSENq4PDNz4cc5Cg2OM/dIyiT7rAHOK2LG2j1eXMhB3pRh5986PhdEgO11HI8P0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877109; c=relaxed/simple;
	bh=V1k4nSFZr1xJt1H3lra+Bd000BYLXmmIfiz8lIC2mAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SN9ENEbItzLiHKAQ31H3cx6wmjUR0aJ3FFCzTonpJDOynxaKbUDa9PMoqWXSqVW1a5sOWtb2riqFYt1KKtBOs54ml+DhOX57duOyZADi04puFpFoDybKZIDTFf/2pBLAw5ZZn7Zftkh71lhF6foUwSQj3c4G9qMQoHgY5UzdRUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=Eazt1Ba6; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="Eazt1Ba6"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bced78b3dfso1457079e87.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 00:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791877105; cv=none;
        d=google.com; s=arc-20260327;
        b=clTONKc7CH6RdRKwi/CoKcJOP/45I8olCJpz4O7n/ApEcmN90GQ3udihMLFC7IPTw7
         GsCEOvt34MZsBSJXg8UlgWzjHwAlAdLqg3fYDlk6L7+3R4beFgJJpR+D8im42A04LqYd
         UgjMfFuDdLCdVRqF7LhTiVB7mMUlUmXHXCobjWyeyWUR3rIuvPiHVIPNYqCnTEvpZZyT
         iGH2IaOSE89HtkxjCTFahcLgHgNPVpwZB1D1c3gd7Pqndwi9npOfoMcNKVA2z6mkh8pf
         7m53fVpMDShIbEn72ZwZJzaHuqRR0/oiTuYuJVrhbnc53lWWotlb/NPMDt9+QGkIiOOZ
         aLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RH7XohG3plPCEisncn3kNOyfQk5zAj4jOpXVESRoZmU=;
        fh=odIzzxKz3RBVydfE9gtYXf5PqPEJ1nLLoJFey1OglF8=;
        b=h3pKuMXLrBFnCpE5+CCb3fOAYfYmhnUn1mJpvV89isNoWT4OCtGu+txzWeyq39UmhH
         /rJRaP4+KYtJVW4CWZJZguJ5SgT0FTaYDhKxxTM1XnVR0SUrORSKKnF0O0hq9kRICw6D
         UxOyR9TqqK/wTrfAtGzMtKSDw1NbuV1nod8T0Jwf2oGiG/qCEWppM7sK59pi4x3s/jCb
         NNFuW8gpH9JvR9F3O6SrOb36UwEGPvrSSnUMUzSUSLbQnyrueUPEzClFGnCUGUE6S+P6
         PeMZecgnjCtahe68L9G+XTXrVji3MU8PeiEsguwJU+Nng3la6ymC2vMDatIo36UUEDIp
         qldg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1791877105; x=1792481905; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RH7XohG3plPCEisncn3kNOyfQk5zAj4jOpXVESRoZmU=;
        b=Eazt1Ba6ZcpZJNhEsKWfZlOdMGYKga3M6Pg1XGyqtg9QeqRpI1/z6BoCRVVQXnM468
         CL8eKtG2OAUGYuAN64Ro5UWJxiYy3dR07WCVWkTyTdxK3fsOb/tnPtjLmlzqRT3FoteP
         v1MQMznwfWXS90Kr+6rJJNcOihdRsovmH6A3/TwAzlS1NqaCaHcwoygFseqS+gTIJ7JS
         RKOr2cyeI35LUKfeD6mOLy7MnJWFbhupUM+1YzDoUxu4s0vhiozdnLerKgYZpH3F+yn/
         ZSqDOy4U6J6N/HftyAYWckC58AchSjshL/8YJTJTE/Y+3C9ZOaDAEwQWqDPuRWWg/fl1
         O8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877105; x=1792481905;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RH7XohG3plPCEisncn3kNOyfQk5zAj4jOpXVESRoZmU=;
        b=eZQZ4U1BaeFrFQATQpgyt4YmaGFFu6XyQq0KlK4lDt5rxwYwvlBaxVBEtC/v4fEgrC
         GxdAxlk94+lxc5YfZqNu2v2p8lIefEy3buTi6C8fBOjje8dYGnzyMB4lO1J9d5xsDDXC
         ADcbJe37ibGwYOTlodyLaml0j1UN3FSjeepApM8Sz7n5BTWTJnnmdNKuw+3cZuArp8Mg
         373+NrdDAHFzbIAQc0dBf3l+Zei+YpM8BoupodNcvyCd+D/RuEuA8U5k8guyno+wTsQx
         RqEoug2UfMW7uYYIY0JGafSuapQbKZzUEbU9NXLonbTzvQmUel6qp4lSCo3y4n3bfS+N
         FO+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGs9w2EGRk5gvix8kE7hjby9Gmgcaz7zzOrY9wYHkALv38IgjG+po9zAbp6HZm+a7SS1DTlvw3sNRNiZLS@lists.linux.dev
X-Gm-Message-State: AFq9FYKhuieS6xy04BbpAFHxFX7KUEQcdnWnG7cb+SHjzg/r1uQHYLAg
	qlBgkCSinSC8tEnqMwSZl2uF8mkr3j8yAFOp/rL+2mWi6Ii/8DLKliH1Aa85mcnYf4tnY+d4cB5
	75sI1qOiU8anrWzPRnZ4gU3TVP1d997Bq7ja/mOPMPw==
X-Gm-Gg: AYBFou3nMmyAj7YsaPNoVAkQZqDfOZEdqYJS5yPZ/07ixjckSfW+wNnkYWMG489Xt2z
	2IyHRdAsIUziknZ+Syn+Y3hXs+/1Ff8lDFty7zN4wDwc9MfYM1HUlTLaTcUCOeDLoBzGCP0j/Ff
	GKqLkc3ruFWBOTraDLhLzJh5OPfO/qAePKGmaFp8R5hF8ORXBUKeNzjgLXH2U+osBzS2LtJz1/9
	e/uZHI3vJx9jzFUIt+dd/qTCNaQOhuEeSLG2Nvp7fU2bWq8W9ExVSmv1Lkqdxsn7HxbstwxAmhr
	ymknbnjJNSWJ7kHQfBa6VorBrUoJmuxWKQxjEMZffLpo6D4M/TgzsBICsv892ELeHR7W2gmX5ie
	5arR6mPf1m0M=
X-Received: by 2002:a05:6512:2352:b0:5ba:429b:c5bf with SMTP id
 2adb3069b0e04-5bcde8c83f1mr3998408e87.51.1791877104819; Tue, 13 Oct 2026
 00:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <a6b71984-cd0b-4e81-a240-ec05abc6327a@leemhuis.info> <179186742507.11414.3709235533520575164@freya>
 <CAFERDQ1ygWAUbGCpzC6wFzfgAjMFmB-LpYmQp380N6D=2GLfFA@mail.gmail.com>
In-Reply-To: <CAFERDQ1ygWAUbGCpzC6wFzfgAjMFmB-LpYmQp380N6D=2GLfFA@mail.gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Tue, 13 Oct 2026 09:38:13 +0200
X-Gm-Features: AclHuK_pFLQgFcLikEPMCqMuaHVirlYeSTDqIJTGGA38_SlV0soLaYiyZtfgzdk
Message-ID: <CAFERDQ0PkaVP+jNWityZMUKNpQOKbU+W+f7u9ZSONhBdkwGB=g@mail.gmail.com>
Subject: Re: [REGRESSION] bcm2835-audio fails to register on vchiq-bus in
 monolithic kernels since 6.19 (VCHIQ destaging?)
To: Jai Luthra <jai.luthra@ideasonboard.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: florian.fainelli@broadcom.com, gregkh@linuxfoundation.org, 
	uajain@igalia.com, Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I also tested current mainline (7.3-rc7), and I confirm the issue is
still there.
Martin

On Tue, Oct 13, 2026 at 9:28=E2=80=AFAM Martin Wetterwald <martin@wetterwal=
d.eu> wrote:
>
> Hi Jai, Thorsten,
>
> > Hmm, no answer, so it seems nobody really cares. A bisection might help=
.
> > Or at least validating your suspicion, hence: why can't you check the
> > parent of aa125180c6738 and aa125180c6738 itself? Or at least the range
> > with that commit in it? And is latest 7.3-rc still broken?
> >
> > Ciao, Thorsten
>
> Thanks Thorsten for the follow up!
> I didn't bisect because my image builder tool was not meant for kernel
> development: it could only download stable release tarballs signed by Gre=
g.
>
> But now I've found a way around it and I've just bisected the issue! I've
> bisected through the 6523 revisions between 6.18 and 6.19-rc1.
>
> (The bisection was made on a Raspberry Pi 1B rev2 this time.)
>
> > aa125180c673881f88b528600b57865dc158b3a7 is the first 'bad' commit
> I confirm the issue was introduced by following commit:
>
> > commit aa125180c673881f88b528600b57865dc158b3a7
> > Author: Jai Luthra <jai.luthra@ideasonboard.com>
> > Date:   Wed Oct 29 16:00:10 2025 +0530
> >
> >     platform/raspberrypi: Destage VCHIQ interface
> >
> >     Destage the VCHIQ interface driver to drivers/platform/raspberrypi.
> >
> >     There is still the remaining TODO item of improving the documentati=
on,
> >     which can be handled post destaging.
> >
> >     Secondly, multimedia drivers like codec and ISP that rely on this
> >     interface need to be upstreamed. And lastly, the drivers that facil=
itate
> >     the shared memory between VideoCore and Linux, like the vc-sm-cma d=
river
> >     and vc_mem char driver also need to be upstreamed.
> >
> >     Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> >     Link: https://patch.msgid.link/20251029-vchiq-destage-v3-6-da8d6c83=
c2c5@ideasonboard.com
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> #regzbot introduced: aa125180c673881f88b528600b57865dc158b3a7
>
> > Sorry, this got lost in my inbox last month. It's likely my series that
> > destaged VCHIQ broke the ordering as Martin suspects. I always tested w=
ith
> > modules enabled so didn't encounter this issue.
> >
> > I'll look into how we can ensure the VCHIQ bus gets registered before
> > peripheral drivers (like audio here) when CONFIG_MODULES=3Dn. If someon=
e
> > already knows what to do, pointers are appreciated :-)
>
> Thanks Jai!
> I'm willing to make the patch, but I'm not familiar with initialization o=
rder
> in the kernel boot sequence.
> Would also love if someone has pointers on good ways to influence order o=
f boot
> sequence.
>
> Martin
