Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6BF3F65EE
	for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781365120; cv=pass; b=YbvWD9bhogBeD2zqMxB9QWDBDJf8sZc19O8PihgnXKnVVk1hsH9vTC0ycgxNBnW8LeO2w06kQOOAjEbEiByILcxfS/nPKTuC4unfRypHALhXwLwN6B7jDcDyQ54ExV4LQf+cAvcQqjHpmv43gV6JQXfoFqL202uvhmx/Jw4SAUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781365120; c=relaxed/simple;
	bh=VaQzUiho6R6X5BFdJKnwhM2JaGoPaixUC9YOjsiaI/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NgEwLolDpZRvuVpzP+d3V8JZD3fV2cXaFC7slfj6dE42LLo6h5ooiWRrivOpeDzf0dS0MPClJWnmVvVrn+QwPxxbGO1vxAFTmCxcnBeNm+Ag2o8rjERAFUOQji77U73U8mFn+yn+bOyjDZEKX5SeZ+NzXa0yoyRZat2XJgfi9k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKKF9+Xj; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKKF9+Xj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bec429c2bb1so281036866b.1
        for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 08:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781365116; cv=none;
        d=google.com; s=arc-20240605;
        b=V1tInj+s7TSNG65WC/Y2ZLk4UWh/27bdIRrQebzIc+DykVIpGofj59HIBQ/m7uECqI
         f6Gq59dLxFvcEUyndrkuG1xYGPgaKGFuHtoqlLfq3vjDz9R+pc71m7MFHLLEu7uyKoai
         PrBovYKl+eHU1jaj3dgIsbJFZh5bPlQ0/pH9pK+lEGyE122q7B7JoDSYhDIeWcQ1I3Wk
         xRHJV2RE+0DoH75kKq3IRSyoKWTtuc2mVSXiQhOCWfDxuOX8oVv1Jw4/SsYKdd0dYpEc
         9OEy7EZ3kFs31Hz7UfXLCHkbzWC8yip7/AWeik0Nx5HFGxALRUSVW8oThTx1ziKpBJ51
         p/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOWDGizk9369FTjRLh6NLGNPGfs8z28wb9Xl2vEAMls=;
        fh=n4OaXloWr8JAT+F9FmYiM1Oo1LSRjW3srYBDUv0mXho=;
        b=OoGew8IikzvpZsPPhrwpu7pgTh1CecOMZH+K1rNToGi1xo3bgGdhoNWlWIDw9l0D3x
         8BzS2D70a+HzFc7o4HZb/npRFCWrXaOsMDEi6dTbkPrEJFerRWAg2IWReuctb2Zrvj2C
         /cScSeTTZ28CSXr1Gqv4aTjFz3551c7qtirYAqGXRhz2FeT05e6ULOi8AP8C4tIm4Yez
         VBiUuKRxQS5WU0zLKZqwFhB8HIPVDuCyQ8sBYKaKDG4pybJngwZLyw4N79vCrDagbZAE
         lipHPOF1qpb9A7kDUwWURIlOTDPCZ84IR5azh0PxqGnnKHj7vDHAplM9oktI4jgBy9lx
         IkUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781365116; x=1781969916; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOWDGizk9369FTjRLh6NLGNPGfs8z28wb9Xl2vEAMls=;
        b=VKKF9+Xj+VzDGdjWBhCsjiHMvCQGMSZEPSXNazkGNlTcgZDpe36Rig2EvZrMmY+KUv
         EocepDXfa8Q9asmG9gf4J2OUncODKWJJ4gHTKbGeSAXC5j0M6XYTR7QwZq1aFJmWsKwz
         L/ivheNvuEU+r1KlJ+JjuHKrIBhjJbKD5XhWRDMkHg6uaWaNiNn+03ric+xDoi+XrNKN
         hhKXV7ts4FCI1X5qUQ546lh7sVqDaZwV57w7jHEYCFQjzdZNavf0GK4IM95K2R3JUusR
         BpdAExxLEQufmllrmlfncqOR7LFcnKahy9lqpCWgspOT3S5T0eg1arNAMcyD1/Jpasu4
         RfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781365116; x=1781969916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uOWDGizk9369FTjRLh6NLGNPGfs8z28wb9Xl2vEAMls=;
        b=Xgm3knvacJ6FAfvdb9UGc3I/RwJE+PJYRBO/EpSeXTFI7D53gnH4rAWtsCevO4G3ER
         64e3QwxhiqtTIU7C09scy7mI9r68hNiUEWAIuLUZgucBvQcya5A/wPKHi8DCteNEM+ov
         SXViUd/V9K2JEn3/d9l1Pd3k+M5qwYVKUq+/31J+VZGeFDQYRZWBKHGEw0grwkIPbD8J
         WXaZ3WjfdjJH2/KrWhmxep6VsTzQL1qDcY8sk5xEXZYtUSbwAGaT1jG5DbW0GLg0M1fB
         ZLTeU8Vb5FsbsgnGNCIxd1+eG8U3ZGhZYakZpuGRZTbgkmJkzAYtEXSf20MaiaiPyxNO
         mL4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+k+BvS2DOsBN0a03bc81oSnKlGscwk0VjyqA8OnfISq6EOcR7CkkV0Pbl4cWYWMMnEkVqNgw5i/KwJtGJu@lists.linux.dev
X-Gm-Message-State: AOJu0YzZfMJIUpPcDQsK7mJuuikLYaekqAAWc5IXzbS01qRq6+K1647O
	r4ytzvVenXHA4wP0yp38APrHQreAOclX8FJ1oCJb8Gfup5S4AFZxO/t5u+cxdWA1T2MrdOPUD/3
	E84Te4FpnLN58CGLWV/ZgtWGKYU4dQuo=
X-Gm-Gg: Acq92OFSqU6ngVnO+ufXFz9mXyAeR0LhECS5UWj63Sljqzk0jXZIyw1JFpRRLDNFFhx
	JDyuH/Z4bcQA0rDuBzE6wSqaq2yCUNjoeyREt9gc6y9bazvTLEVdUJfnEBXW2Ln4YF4gHXnr87W
	HBHuSQZggPF4ntlIV3TE3lT8837ONH9qthK5Nu7hEeJSvqtcHU5XHO0anuItoFJUNCLV37h0cZh
	LJb1tv/vviUnKoSptDf1SkUCZuPIUAwTLPi42l8ja3ufaQckfOeh5XURtnKjJxxcrD6CG/N8lxZ
	zqaDgmJkU4IYTvVBl6JEla0=
X-Received: by 2002:a17:907:e895:b0:bed:d329:1ed9 with SMTP id
 a640c23a62f3a-bff4bdfcba1mr152037266b.33.1781365115721; Sat, 13 Jun 2026
 08:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260613014905.48458-1-brockhaftner@gmail.com>
 <aiz1bMmAN-gQnm9x@stanley.mountain> <aiz14CLCduz7996E@stanley.mountain>
In-Reply-To: <aiz14CLCduz7996E@stanley.mountain>
From: Brock Haftner <brockhaftner@gmail.com>
Date: Sat, 13 Jun 2026 08:38:24 -0700
X-Gm-Features: AVVi8Cd5UbthRNShg8YEncP0KBxT_NGxx0mp2GrBPMxb4eVX4ZgEGIFccYFnCgs
Message-ID: <CAAYiRaP0ahm9NsmPBdEy1A_TiCPCfGt-nBC_xf1-tN_RiuvmSA@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: audio: add missing newline to
 sysfs_emit formats
To: Dan Carpenter <error27@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 09:17:08AM +0300, Dan Carpenter wrote:
> On Sat, Jun 13, 2026 at 09:15:08AM +0300, Dan Carpenter wrote:
> > On Fri, Jun 12, 2026 at 06:49:05PM -0700, Brock Haftner wrote:
> > > The sysfs_emit() function is used to format strings that are returned
> > > to userspace. According to the sysfs documentation, these outputs
> > > should include a newline character for visual clarity.
> > >
> > > Fix the checkpatch.pl warnings by adding the missing '\n' to the
> > > sysfs_emit() format strings inside several functions.
> > >
> > > Signed-off-by: Brock Haftner <brockhaftner@gmail.com>
> >
> > Please don't do this for existing code, only for new code.  There
> > is a risck that user space relies on the old behavior.
>
> We should delete this checkpatch warning really.  It could be a
> sashiko rule which only applies for patches which introduce new
> functions or something.

Thank you for the explanation, apologies for the mistake. I did not
consider user-space implications for adding the newline characters.
I will drop this patch, thank you for the reply.

Cheers,
Brock


On Fri, Jun 12, 2026 at 11:17=E2=80=AFPM Dan Carpenter <error27@gmail.com> =
wrote:
>
> On Sat, Jun 13, 2026 at 09:15:08AM +0300, Dan Carpenter wrote:
> > On Fri, Jun 12, 2026 at 06:49:05PM -0700, Brock Haftner wrote:
> > > The sysfs_emit() function is used to format strings that are returned
> > > to userspace. According to the sysfs documentation, these outputs
> > > should include a newline character for visual clarity.
> > >
> > > Fix the checkpatch.pl warnings by adding the missing '\n' to the
> > > sysfs_emit() format strings inside several functions.
> > >
> > > Signed-off-by: Brock Haftner <brockhaftner@gmail.com>
> >
> > Please don't do this for existing code, only for new code.  There
> > is a risck that user space relies on the old behavior.
>
> We should delete this checkpatch warning really.  It could be a
> sashiko rule which only applies for patches which introduce new
> functions or something.
>
> regards,
> dan carpenter
>
