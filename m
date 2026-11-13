Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794593378;
	b=JkeKdmf914NGEXrCS3uBopi8j9bvinIy/e7RvwoRwbqNVrtIBLHJ3Tj+I4nS7sVQX6WZ
	 9UxCSJMMEPZ0xf9i3oOrvUANmIDUSSUojLFcmnR2fvDgztuPRKVaFZW79Z0Y5W43Pz4Wq
	 wChx6ap46fzY4EhoBNZi69SlB74yZV+BKNVvbInAkcQxN7OJhJUcShi51No2Ro3dfPmyP
	 jSWjzv2LpYMR0TO6Y5wGQ01GYiz7CtRj4wqG8iyGAMTslB5Zm+MEdmnzCEzJ7M84lXU15
	 HFRUB+BC50S3TWfCJZx8IPl712/jRjbzhWwIH8JBkyHLlnZZ6Y2HMsVSUkkBv3Zw8iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
	b=MxJQoSknfEBGa5InHtNfH3XJFGG3EYfElv2Yvfp7yBnUmAoTTHL5GfPVZowdxOj9nkvK
	 yowmpkaQZA3JgW5/L4c+9myBE3f1WOeAla4+0l2duhGWJWSlBDTpeQTuVSsw5LR9ruDbe
	 ymfwshwAZCUiZb18uz4KNtryXOGxQ7fohCUJYf/wt5a9z3sBX9ovFuSwFggAtBfYbfEfk
	 EXjnusnGJOmW2pfeM0x0D7BjuRFmbCcFFrHYrmQg1/V1p9eHws367FWFyR+MHpsKGuvzn
	 xH313IUS6QQL1Py9my5db3iVlIuB9TG67Fia+7Pxb6fmYhiG0F1SVHMPkreYIeuectw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wetterwald.eu;
	spf=pass smtp.mailfrom=wetterwald.eu;
	dkim=pass header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=YBiXzDRw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779F7606A334
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 18:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 779F7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=YBiXzDRw
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae25c846edso14147301fa.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 10:09:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794593375; cv=none;
        d=google.com; s=arc-20260327;
        b=XcCPDvqxneQq8eOfAuLFSfflaYtnjwwNUg9BtWdlTYSi3FTnyqZ9QJGPyLCe6ZL+pf
         3zr+/F5EOFfeiWeJqsQXoNwQ4fYcnttTvoNwz3eCPrLg2ybeIbVaT7DUSg5O9ISl0Xpt
         TbisjxGmya1HuGdy/h13aNcT8LkwiUeQan6m2UxBzXvQ6I+QJSBxfzXZ1JdQnWpAhdRQ
         49cuR5r0dS/6kQa8Sr1+hopH3ImXDWJWaTjMLNyydS1AILyI0ejCPWAew4Fxxqj861qn
         SBuPTE/72uXCo/1wd0sk5HH25HjpszgU645dIZsaLP8Q+5e4YbmpWnCcSi80SlQi99oQ
         Vt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
        fh=QqStEJE1zxMcoxBB86+C7qX/nCTGkL/fz1w/zwZ4cj0=;
        b=WJBQpzOoqzEWhtW+NnZ5sh+SmzjsKeBLOOTT5l7RXId8hO6RIR2CclsN3xFfP/BuzQ
         UqNR8flLpfXvb7sg9RVAD3ue7Gu5At4oSEkWYbBHQImO6YwuWGTiAaFKOmMsmwgpoGWA
         wEIRYWr11j1S1+jAxzQLMbpVH8YsTxWQzmECPsAFrZ6suAA/knyQsIzh8cSgRdcYQprd
         RKQPwKIffCG3OVG929GuiM8syGc60ix9p1vLhmEEipmlkZiCWDlUR2bRdtV7akAueL+u
         H4rO0V8u9kiSJVqI2GlNynlOdAVtF9OVckSUIbDOr5Deu6DG6rhWrwam96W02rHizsnX
         hqwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1794593375; x=1795198175; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
        b=YBiXzDRw0l++d6f1Vx3bdkwpD6uXKvluXwZy9MEBBtcJN7nUhxuoLHtLmidbMs4blR
         5DyoLeUP6evIme+L3/FQoZJBhn7wNkQbDP0pktcrw7q1T82qi5oXMrj5gRExFrjkXFyS
         0XbC54z2Nuiin3fUTvcIzYSDarfrYpQVKZMRZxu5CkNywRz0NvUEDLYJKx9U0ed35s74
         d/rLMxkDb+ZhXMtt3lr908W8HkeE/WN9RJtWGgx4bgE+A9N76wUrjO5a5cI+pb5M/0jI
         CeEjyS9o09fMcsmjCJsR4jbF8r5p71P3RYyvt5A11+HgMuyOqaJj1CmIJqiu6ATfHf2T
         0dHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593375; x=1795198175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
        b=WSOJPqh2e3xIq0cFB+gLeIxFhBzBlDX6jC3Yq9t19GDVZM+ntPRTR6KVF60qE5V3JT
         o/Amqok6QnKjCnN4TC9vy412pf7CE3PhxvASVSwTKWOAzFuK97gEn+I3OIH3H//+F/Qj
         wl/vlEnC9CtrYtHtcaC/erL+1YUn3uDAEUeIMJVr/1T7BbjMhqWP8mNx0WHiQq98lQeW
         SjdEioheQwCN17KQvpIOa0amlP8ro/jLxu8DSgmfzA7hCo4KjO3nLG97X/wxXdgmQ81E
         CgIAh6tKY9C/jBuvf4wcsNxWgcgnwt9wQdEPBZ34Hs7Pi2Gl8HSTsQ+B/d5rdxrUlT/q
         3LUQ==
X-Forwarded-Encrypted: i=1; AL+hErHzA81pNBtgil1dC8JSFBagx2ElhmPre7UYhld9gOBUY3Loj06VCRjYNbuDMcPp8K4rpPeFBW8IuSQLpD7g@lists.linux.dev
X-Gm-Message-State: APuU4Z9WOoBGu+V27zCL3q6dy12R8zQ2XHTeu7m+n615vYLPpYJ0tVbp
	TX5CtSBOaTIJa+Ujk4IqVbD83nO5wqFedrm6mMg6llpr2CUUfQ5dYCqeVaHczvuuE/XdRKpjimo
	ZoQUvx12YLfqhlEf25foMAFERhZTeSwLU3hJMilxizg==
X-Gm-Gg: AYBFou3byyQS9/h6RrBazYpXg29C5Qany6vcCFg1u7d8hSvjzaJpFz6zBPn8XDsBx8Q
	JZAWHBuWzl8OR9+Y5JAVAq6LzHpy47ez59YsAlQ4ijHP8Y9iHO73A8CvMCsCv6vMHdqvY1t5flw
	i6FBVLNjZ7O6uasc3Z0TZeTMeswXv2HGa57fkWha/FG23DYwuf8gXl1ZPq1XaOqDD1urLlyfubQ
	VI2niUmwxfGKyN3ccSEq6tSSuCfikF3n/XNN+QJz5u2cm1e8s0lmFRzhvz8YS7J9YhwHqRMHgMD
	0S/9IoYfLV7TLroYs8YRuG2nxj6+qXSQ1pP9eEreL8vV2cz2/d06l6VGpH/XodX8+UsHAtSWlhS
	rL3MaVxnyecWLjtkR1h6sZ3U9YUW6p1sVdS6i5NA0ghpyNSWc0DTvw+qQXGJOxr5vEm4A
X-Received: by 2002:a05:6512:1188:b0:5bf:b93d:a85b with SMTP id
 2adb3069b0e04-5c17099fafemr1222262e87.25.1794593375264; Fri, 13 Nov 2026
 10:09:35 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu> <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
In-Reply-To: <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Fri, 13 Nov 2026 19:09:24 +0100
X-Gm-Features: AclHuK_YnjdCkTrewni0BQPjUqpjzPPZv35V1L4cPB8ogSTTtBU8c_5Nldb95ug
Message-ID: <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Gaston Gonzalez <gascoar@gmail.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain <uajain@igalia.com>, 
	Kees Cook <kees@kernel.org>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:20=E2=80=AFPM Martin Wetterwald <martin@wetterwald=
.eu> wrote:
>
> On Thu, Oct 22, 2026 at 3:31=E2=80=AFPM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
> > > Hi Greg,
> > > this is a regression introduced by aa125180c673 (via your tree) in
> > > 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
> > > 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
> > > staging-linus would be great. Thanks!
> >
> > This is not a staging driver anymore, please route it through the prope=
r
> > tree after -rc1 is out.
> >
> > thanks,
> >
> > greg k-h
>
> Hi Florian,
> Now that -rc1 is out, could you take the patch?
>
> I've checked 7.4-rc1 and I confirm the issue is still present.
>
> Thanks!
> Martin

Hi Greg, Florian,

The file I changed (drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.=
c)
is currently listed with Florian as maintainer by get_maintainer.pl.
But Florian tells me he doesn't maintain VCHIQ.

How to proceed now? This file doesn't seem to have any maintainer as far as=
 I
understand.
Any pointer to someone able to take this patch would be appreciated.

Thanks,
Martin
