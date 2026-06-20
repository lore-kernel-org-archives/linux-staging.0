Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1A42222C5
	for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 07:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781941427; cv=pass; b=WNcTZNJO09pTIfaiXRjc4cy6vTEUE33UX1h0KrAYuiSE1uGK6gUrveh9+maqOnainBFB1FrqFsQC7pjqatSmhkt+G5PqH6vioC8/sT3gX6EPTJp4hD4kZVERWFnx6Kig+Fd7dBzUhgID4YwDHrAXhR56sXKHKaQSltQEG+5iMKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781941427; c=relaxed/simple;
	bh=DzV/Bz091e8nL5SyiOpv/VkEA+1Mi8KwLdzoRNONtSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFp6jvKyK1IvynPqCD3Elm5EgTizsFdsQCO9T0X65dBTkNKEeMcgmJWf7hQO5I5BotrHf91OzM62pl2SCo610UaxskJ25VyL1QkhcCx8Gau1P9WSximAoNXaT2DP0Hvry8bvLY0ds4/ZP8sPTyj8/4aZDve+RiKNkVc9DWQFVkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bj1IhRoY; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bj1IhRoY"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c0840dc2859so233778866b.1
        for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 00:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781941425; cv=none;
        d=google.com; s=arc-20240605;
        b=cSz4pQPcIBJjvP6rXSba65R9qytm5jffpb7iahRj0cSmvkNXRNMRay8ryhH4yKW9Sw
         Wtyf1yUpfuDRGwi6orFyHgnTKpGlEffokpVnZH6xRIVZgmp+HvBzol17ozLPIb7tbTie
         aU0R0MaBvqbei8jbQlqjHUiPFYBLGrFRKngQmsmBTDJIiylA6u53oQ7bAVcyc1GEoWHv
         Q5eiALiOz7Qbymr81W7SK7B2SQb6hJ6gBF47I2vsg7/dgtL/EGNuuaU2D7Q38JeHzepw
         Iet2+RzdL7gUnxsnTpPrUF8AaJsH9/k2fkNBB/W2WstgIK03M02hcjCgYrLTCMB2KI3W
         RqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RwJUzJkFOp4tAmfXA6KJ4MrErpiHytjtZyfzG3vrPY0=;
        fh=4IPZeTrKlg3WocGdCx0tj3qbmNGLBTEmVTWTCONb1Ow=;
        b=XLuCPoqyHZncm4VmJZybkVVeMGqo8R8yXexBOffkhoHHqoTfz4NW685//jzcwKwviG
         E42HFs7PrjsuLjYbWp9WRt2eQmYfFyzXvZTMRb9HZtJ6OUkcWI5sjGsimK4P6tOhu0Oy
         SalufuwUJoj75cT8c/2c6DYOexihOVPdYtODHOudNKpvm0N80Oj6SCCgkNgD/k+NgBaS
         H7bU+/pshUFp1gr6KvQyFfILJ8koeV2zWAhx380N+9w5Rc8KeXDKxBnPJKUlSpif2+/Q
         iOhDWvxECo3ntDK776jVM1UhVC/zMgavB4PF55Js+oGanQ0k1+O4FsIdLHE3J5ZEcZig
         Blwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781941425; x=1782546225; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwJUzJkFOp4tAmfXA6KJ4MrErpiHytjtZyfzG3vrPY0=;
        b=bj1IhRoYZoCPNGH7Kj6HIVzIYl0Hd4zkdjRZOglcx6zXvACk8AckK71Oo5YWJgbdFQ
         sZ212kjkCTk4iInMIx3Jm2Ryy9zQEUsIcgM2DgzjXd1Ni6orHImymQzNM0hHChdQaf2E
         UczIsh4GVtC1/HD+N+LOcnsiqkG5ZFA9el8H0OOyiW0Brd9sozEdtofXzAektjUDqCHq
         35EIW3FALnR/Tsg0+hHzWxYXaxnxdsTgCyGrG1OI+L6z5d4q1AmnlLOIDqb/VGo1mH5Z
         wXVqbNSFJKTqJ9kt5h6Xw5AdR9zzy6A/XLYzLxc0oQdeUfXQRIkogrhnNMqCBN3kLyHT
         1c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781941425; x=1782546225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RwJUzJkFOp4tAmfXA6KJ4MrErpiHytjtZyfzG3vrPY0=;
        b=Fsz5b11xZeOjA3dy/YCM/kMhd95/Qw7rdSrKJU+I2gp/GL6t/1TnRu4s106vi4OALh
         /Q2pgsWZmRvEme21yGOCOiYrFNbb52msfJbD8ACrEh8cUbqZ0+pYHec+77Z7iad4tjDD
         x0m/8RE5WcmsFUcDzlKjbEtD1a90bApWvnlZDPQeCOx4bTuz0AK4HcbOvD7p3go78d3m
         FQ2vAAqVRdFXY7p90afs+cEGDPlxpNN8mcEDoAVDhVb/3JjftjoIC+uif4J1kCndX0sF
         P2XlONHQh9CdhWyNMJzUpdci3p5nA9/rxw+jFuwEDwTiV5R2Ek9QUPNNBzX47EqLNq1e
         tgww==
X-Forwarded-Encrypted: i=1; AFNElJ89gomDF5V2Td/xn1oJeqD+jaPuIbRa3QDs3GGR8+STzYoMpVHACocJ0vHb5gO+Nv6EQuyG8hFZ1qBNmmn9@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo8PLM1Yc2iruQaDA9LuSSN3WZUUf4GcUJlvXWAKjka2VuWlxA
	HaO6itQNenyG39pgO1LZ0Q0emGpD2C5wRAlE/IoVv5deT9jk4+UaRWeeTQjGTuCxVRTpX8/QQ5L
	ogr71thzZcmRjf5patWLqGKJrnZWzqv8=
X-Gm-Gg: AfdE7cm8i3FpLqB9LWq0olR8Ir/s/xLANuc+ubR3WD489xQO6uP9/thWnkLj9X2yj5K
	qXnT+esdPEpDfB8cZmJ+Cy0Zfs97SlCIPqyLNDMy3xKrIW9upbEeprsnelzwzKJQE9wQp0Oc4m0
	PcXnHPjNe1jeJdIQAUljKhYZhW3IwoRZQBe7lISIHguOfoVYyWd+lvmDg+LywoLW/ZiNiSYllcd
	R0AeOfaqka1qBJcccFsi74XI744/+kUbC+b+9/lG18eR7GkrZWHofsXBcgd3ruytE3+2X4vuQ==
X-Received: by 2002:a17:907:1c84:b0:c08:695:8819 with SMTP id
 a640c23a62f3a-c094ab06232mr347376166b.0.1781941424883; Sat, 20 Jun 2026
 00:43:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529111927.14138-1-neharora23587@gmail.com>
 <CAOWJOptv1JcOGcEt39HVy7LkpAsvzbw9yj64kJG+X5J=VbWrMA@mail.gmail.com>
 <CAOWJOps9RBNAGsPFsBCbzFkEUN1=75YvwmqJX6RdQBbt1C6W-Q@mail.gmail.com>
 <ai-j96dVwtPMERVM@stanley.mountain> <CAOWJOpt2CW=-zybOrPr2pwfPVQFcd+j3YoNP+rMyAar_2kJtbw@mail.gmail.com>
In-Reply-To: <CAOWJOpt2CW=-zybOrPr2pwfPVQFcd+j3YoNP+rMyAar_2kJtbw@mail.gmail.com>
From: neha arora <neharora23587@gmail.com>
Date: Sat, 20 Jun 2026 13:13:33 +0530
X-Gm-Features: AVVi8CcREoyjcHXowOc7Bxi7M8cmts4kYSlT8u6k6tHdF-PG1aMmVvHCxP8n4jA
Message-ID: <CAOWJOpuObcnFMW_abhZVjLbkUSyiGMbgQwB6FPekgSU5Bn6eFA@mail.gmail.com>
Subject: Re: [PATCH v3] staging: sm750fb: rename pv_reg to io_base
To: Dan Carpenter <error27@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

After further investigation, and feedback from maintainers, I have
concluded that porting DRM to the SM750, will cause a huge performance
regression as DRM has no interface for 2D acceleration, making the CPU
do graphics, which is slow, the only way to expose 2D acceleration is
custom IOCTLs, which is not preferable.

So, it is best to keep using the fbdev stack for the SM750.

Regards,
Onish

On Wed, Jun 17, 2026 at 8:30=E2=80=AFAM neha arora <neharora23587@gmail.com=
> wrote:
>
> Hi Dan,
>
> Please disregard my previous patch submission.
>
> I am currently working on a complete rewrite of the sm750fb staging
> driver into a modern, KMS-based DRM driver (sm750drm). Because this
> is a complete architectural overhaul, I am building it outside the
> staging tree structure.
>
> Once the sm750drm driver framework is stable and ready for a RFC
> (Request for Comments), I will submit the entire new subsystem patch seri=
es
> directly to the dri-devel mailing list and CC you.
>
> Thank you for your review and your time!
>
> Regards,
> Onish
>
>
> On Mon, Jun 15, 2026 at 12:34=E2=80=AFPM Dan Carpenter <error27@gmail.com=
> wrote:
> >
> > On Sun, Jun 14, 2026 at 12:45:05AM +0530, neha arora wrote:
> > > Hi everyone,
> > >
> > > Just following up on this patch to ensure it didn't get lost in the q=
ueue.
> > > Please let me know if any changes or a V4 are needed.
> > >
> >
> > It doesn't apply to linux-next.  Did you work against the lastest
> > devel-next tree?
> >
> > regards,
> > dan carpenter
> >
