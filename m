Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B43A3E8D
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941383; cv=pass; b=AI07o4EfmFKw+p3ji7afLsN3lMOhOr5z4xl30zLUwf0bphdWKpVCIUUFxMt7OuSyeeHBkZqOGOEBbJxzphRTaeePWG8oHaK9P11puDDxsYoyAnWBIT/PS+hH9TnYDCUYW/0SNg+lQEa6J8mSC+1NVqFcMQ7lTt+fjp9qbukieKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941383; c=relaxed/simple;
	bh=XdYXJLoS0uEe98OMVFWHa33NjujRF2OHBnsIj0zj7GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NrQUnhN9f2Ftgz3tfs0+KJ21hgzc/oHtKYZn2BEn0DdXviq7jpUaMlTQpDX6hh7jeRFsoL+Sq39phyYfBAEFDmNzSZOwazhO2TVu00tKdByiRZzDBbKRsvH0eIkYmlC9LldWxzVKRD3UVfLN0RyAILEcIjJreZbeD3VVxLOkZjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=am83aTRf; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="am83aTRf"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12714f01940so345088c88.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 00:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774941381; cv=none;
        d=google.com; s=arc-20240605;
        b=WEoYiVGbfEorvRRKQw+MrrcBqhCDqZGTAsoThMZELyssFeMUJ3K9nadF4bKs307T0I
         ZoMYosA/ej8VN2HFI+5uJHVqHTQ/vjIW9J2pggptdN3BFTV/tnbdz3JzdOxjaTD8+S0f
         CYf6A3oU32g46WM1L9GJd6P0zWB/Qr/6e54+mHjMre2bQ+GngaeY8yXsVWZK/duqhxbY
         GXHb923T5Wrs9FXRpPuEqtierXTDWQYOVkF2DW/XtorfqQh7AYQ8Yi+3hcxB18POhw9e
         kE45KGS+TBkONopZhhWdbh0NOCM7uIwxrb4XsQMT50mRpcQSfPNaEJNW45j+YrzYJRrq
         31vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0ugUnLqcal0RI3AJbTiSHqxK7TDVmHuvdji4ugSgYLc=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=Pr3vDDUAwoxREe0VD5M3gtgVLDpFWctAc11bXqO5zo5+3N+xgo1B7OsPbbqijhbpu8
         3V4Hcz5r84+Bti+iJhLKiv5umZADk33vJcdNHYG14Z0E8DLwPUP0vPXsExSIBBjn/a2P
         dX5gV+/pvnbpMBucbNv/M7Ew6B0aRCPZJOMd8Rn8mjnEocOAGjfkH4aY4XtblCTQf0AB
         48iQd9ge8Q3Oxf4I2aRhWsTuGxRTEgCe8Uu5bJMB/+3RbKTOOVwCRFFzdqsyK1A7ggnT
         TGrGdXeH7dI9P81tSA9paGEaOPQKOmgAzifYiwKQRj1aBhzEj6ezBc9ZTkBtoCdUO8Bh
         3yfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774941381; x=1775546181; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ugUnLqcal0RI3AJbTiSHqxK7TDVmHuvdji4ugSgYLc=;
        b=am83aTRfiXyf8wnmdEuPIuQddC4Lx/mMqGECFw6KXMpfHnHst45kwrFU2FE8jY510c
         LVEAgTU0L1QfB+IjLSICQLNr5F1wiTuh24s0+xHLtohOlI8akgvSBUW/e5LuZe9VHuhW
         UM0W9U+4uVZt28CYhGdyAMyPt0h5j4q/tl3GPgtxk26XRn0XVitxQDfMfw8t13m7B06i
         mIha3AqCrVWfONY2QTcC3RudxRZJRN3z1y2OWtBhaon+9AcPXnSv9y+Y9Uy6agkboaL/
         wdNM8XLpeGuEim4BO/SK8oq6Eq0P0gyzTyxdVYnlzMJOqBPa6tC1821LBTAyvIdKbYeF
         vtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774941381; x=1775546181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ugUnLqcal0RI3AJbTiSHqxK7TDVmHuvdji4ugSgYLc=;
        b=qAagV092YFwf4YDrPiMRPw3tLpXB7qHr4882Rdx4PTuFTQfMw5jY6+4TljDgf+bQFm
         K+OAcN6sHeg/b2+t/yEEezN4RYG8JQGdXQlislli/iM68hWJMcDAuRNpqFPyoz/TiyLw
         cclJv+c2C5Pai5LqziHZ2m08OzCw5TElUqpJieJXS8ejS1wzP8cEKUhQZbxSWV61DgLP
         r0SXFnA4XO3QkVsyCulmxoecESM2JrfDjt0VOT6XCwNNQMvmSLP7EUxsAze9j9mklPv2
         SEwQ4NdaKHuu01ZuAoD1WxoqqlGVjoNk3a9tNjfRJN1Na6fdM9qKhcp5myLpHRZk3Ml3
         bIrA==
X-Gm-Message-State: AOJu0Yw+i6pjqdytwzyi7b0EMi/N+47BXKp+oGGcmWV+7jkMD8a53d2e
	aTUWxBS5sTP5tKOt+ruXa9cHp+pXp0NXrGcG67gX1CwJHSE1bUnBGCjyu0FgsUE6k63H9h6vRmn
	MmYRxAw+gMLUi8iqjiup2uCmwImYL5rk=
X-Gm-Gg: ATEYQzwcM3CSt5sSoceRlXqTidhLtbYQz3tzCghDJqaXa07fbrTi78mvEd5BSSqG528
	xepQZSjCK2K6ZYAOTXcY445hPIm6jrbdh5lckEOrEOfV09mOV4aK88GUOmFyOvKwFfHT790q2PQ
	NdWpfMgrnoe/sy78bFEY6ZDsPio4nnVILgg7nyxmILzzBP9E9zejjryr3urzVZJXKKAv9NZRdnK
	/WgDtlWwjPp8lUUMzuYIUc6kJaHgb2fSOMoYpcAPQLGWFnz4SfDSUvzzd/KfYdppNxBqKK7IwxX
	uUlReYbRtwf49Rjcnk1r4uEIpEai2TKfYm1AwB6CHQ==
X-Received: by 2002:a05:7022:618a:b0:12a:6cde:fd0c with SMTP id
 a92af1059eb24-12ab2906c98mr3569464c88.7.1774941381390; Tue, 31 Mar 2026
 00:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
 <20260324133029.82764-4-ayushmukkanwar@gmail.com> <2026032445-squad-breeching-23ed@gregkh>
 <CABJ81bhLibj0_VzShMp_n7DCh+zhyHPAn=SV=9Oo8uy_+Kt-EQ@mail.gmail.com>
 <2026032510-shudder-unseated-28b7@gregkh> <CABJ81biO14i_FCxeMCTZkXGofxN+Lvw8H7UmG5v_qLi2CJovGQ@mail.gmail.com>
 <2026033001-doorframe-reforest-d967@gregkh>
In-Reply-To: <2026033001-doorframe-reforest-d967@gregkh>
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Date: Tue, 31 Mar 2026 12:46:10 +0530
X-Gm-Features: AQROBzCbnSwlXhAKraRHFamSDmx6bJD6auQRP0957Yvm0h79dgtWkf3ZCUhcOKY
Message-ID: <CABJ81bj_u6Pm7Y2YF3SH8GbMGEiNUZksn0+sF0yc+kC=Xzg6qQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] staging: octeon: ethernet: add pr_fmt macro
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 9:26=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Mar 26, 2026 at 12:42:27AM +0530, Ayush Mukkanwar wrote:
> > On Wed, Mar 25, 2026 at 2:41=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Wed, Mar 25, 2026 at 02:33:00PM +0530, Ayush Mukkanwar wrote:
> > > > On Tue, Mar 24, 2026 at 7:58=E2=80=AFPM Greg KH <gregkh@linuxfounda=
tion.org> wrote:
> > > > >
> > > > > On Tue, Mar 24, 2026 at 07:00:29PM +0530, AyushMukkanwar wrote:
> > > > > > Add pr_fmt macro to prefix log messages with the module
> > > > > > name for easier debugging.
> > > > > >
> > > > > > Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
> > > > > > ---
> > > > > >  drivers/staging/octeon/ethernet.c | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/drivers/staging/octeon/ethernet.c b/drivers/stagin=
g/octeon/ethernet.c
> > > > > > index eadb74fc14c8..5bb8c303f88b 100644
> > > > > > --- a/drivers/staging/octeon/ethernet.c
> > > > > > +++ b/drivers/staging/octeon/ethernet.c
> > > > > > @@ -5,6 +5,7 @@
> > > > > >   * Copyright (c) 2003-2007 Cavium Networks
> > > > > >   */
> > > > > >
> > > > > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > > > >  #include <linux/platform_device.h>
> > > > > >  #include <linux/kernel.h>
> > > > > >  #include <linux/module.h>
> > > > > > --
> > > > > > 2.53.0
> > > > > >
> > > > >
> > > > > How about working to remove the existing pr_*() calls with the pr=
oper
> > > > > dev_*() and netdev_*() calls instead, so that pr_fmt() is not nee=
ded at
> > > > > all?  That is the more "correct" solution here.
> > > > >
> > > > > thanks,
> > > > >
> > > > > greg k-h
> > > >
> > > > Hi Greg,
> > > >
> > > > After investigating, the pr_*() calls in ethernet-mem.c and
> > > > ethernet-spi.c are inside functions that only receive hardware pool
> > > > indices or register structs with no net_device or device pointer
> > > > available, so dev_*() and netdev_*() replacements are not possible
> > > > there.
> > > >
> > > > For ethernet.c, device pointers are available at most call sites an=
d I
> > > > can replace those with dev_err() and netdev_err()/netdev_info()
> > > > appropriately. The two calls where no device pointer is available
> > > > would keep pr_err() as is.
> > >
> > > That's a good start, but for the others, work back up the call chain =
to
> > > properly pass in a device pointer so that these warning/error message=
s
> > > can get printed out properly.  Drivers should not have any "generic"
> > > messages like that, as it does not show what device actually created =
the
> > > message.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Hi Greg,
> >
> > After tracing the call chains, the pr_warn() calls are inside
> > ethernet-mem.c. cvm_oct_mem_fill_fpa() which eventually reaches them
> > is called from two places:
> >
> > 1. ethernet.c via cvm_oct_configure_common_hw(), which is called from
> > cvm_oct_probe() - pdev is available here.
> > 2. cvm_oct_rx_refill_pool() in ethernet-rx.h, which is called from
> > cvm_oct_poll() in ethernet-rx.c - no device pointer is available there
> > as it is called by the NAPI subsystem and oct_rx_group has no device
> > pointer either.
> >
> > Since both call sites share cvm_oct_mem_fill_fpa(), adding a struct
> > device * parameter would break the second call site. The FPA pool is
> > shared hardware owned by the platform device, so storing &pdev->dev in
> > a static global during probe and using that in the mem functions in
> > ethernet-mem.c seems like the right approach. This avoids changing any
> > function parameters. The same global could also be used for the
> > pr_err() calls in ethernet-spi.c, where the interrupt handler has no
> > device pointer available either. Would that be acceptable, or is there
> > a preferred way to handle this?
>
> Drivers should NEVER have "shared hardware pools", they are always
> device specific, so passing in the proper device everywhere is the
> correct thing to be doing here.
>
> thanks,
>
> greg k-h

Hi Greg,

I have made the changes for most of the call chains. However there is
one remaining blocker in ethernet.c.

cvm_oct_rx_refill_worker() in ethernet.c is a work queue callback with
a fixed signature that only receives struct work_struct *work. It has
no device pointer to pass to the cvm_oct_rx_refill_pool() call inside
it.
Currently cvm_oct_rx_refill_work is declared as a plain global
delayed_work in ethernet.c with no parent struct, so container_of
cannot be used to get a device pointer inside the worker.

One approach would be to embed the delayed_work inside a new struct
that also holds a struct device * pointer, set it during probe, and
use container_of inside the worker to get it. Is this the right
approach, or is there a preferred approach?

Thanks,
Ayush
