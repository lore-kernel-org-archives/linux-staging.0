Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E6C32ED58
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465966; cv=pass; b=OYAXVTjvSFFxJChyp3Id5ymV+L3h72sVlmjI6O7k8lXLgIqEJBFHyw51RRN8ic1aJnymEl7v93uknj96XqysjUUcnWkzOuL9XOprk64fMOilm0+iIVSOQWFKAEKehn6Bpuu14la1pzObL/KLBG3ySnpaSvgciw8sdbHxUorTiiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465966; c=relaxed/simple;
	bh=QnRxVbSse60pFxyYPw0+eUlAywLh5kF1aA0lLOiK1FY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6zf2Zb2HFQp+Zt/LESarijDagwMUhrGfNbevL/rT5AHTRkUY0F2k0BYjDuX/hwcWX8UINB0pgyhqRPHNeBH5PKF+RQHqxKjHJZhtsLkQHmMJVi804mdPlLL3hfsGxv8AC1wj0nqhyjG5mHEk6hjniGoYAwC3yBdN0AFBYVgjoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2g4abGj; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2g4abGj"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a2fb8ad36so150321fa.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 12:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774465962; cv=none;
        d=google.com; s=arc-20240605;
        b=ODhcbnYuMZPViBgSmHdPx7deuZAVC/0QUANHC70glg6VP2NiSikfuK2/fE4fYSwGPu
         mxZHvS4XwTTwNLUau2mCJgncpfSge2sisO+tcrjkJIUImukFF69NDLFXhbqko2IHCXt/
         qKTQ46rA6hqPLol030hRnrZZ0HUNRDBSLWoFDPZWrtQfhhjazLNCf0f4/Qs8upfhg2p8
         bB0TF0p8qMbN7+NDAsHvcQAlhi2EibhcGdPPATrnAoq5r+vZa0jECE5LnYhKQeP6c3hW
         yx4SS+dChiOOFTBS//2nF+bHlZqnKGYRpgDArDVHfOJGNEOnnMvfHacrlC97f0wOK0nb
         GpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e9Rk1PX2UL/m1nnItUmGUkhb4G1ee+f51xa8F5pTp0s=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=PZvozdGbOSCCqu1nmQdyq38E6uOWqijTOKfr8s/LBtFUco/3YIZLlbi2octsz/CxsA
         wVu6yk31ZBgBtjhLsMUWBinMFDL3nQasUSt5ouv/0Qzj4zZyR5Kv5aLU6z8Agdsm/Z39
         mp93p2nVuEw7mgfE7g5fCOIZ1ee8xobzvaKpnChVcjepGuBRoxd7xIHWMuf2VdNw2upt
         g0mWWlJc56KO5kChlo9bK94jH8ms/WYIZGH68ovM9IJ6d15QDgCHh5O+DX5Nq+y193eM
         LqhmMO8IqguPntSv+0YD10SvztZ4bUP+SfdNn3hbCd4w4CDsaCGilvJGZz8QtWKpYoOg
         8Vlg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774465962; x=1775070762; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9Rk1PX2UL/m1nnItUmGUkhb4G1ee+f51xa8F5pTp0s=;
        b=A2g4abGjB72Bv5cBVFjCn88Yvg5JZqGIsTTt1IAXZyVvdp6sV6ZQPGy2wjugcf7jPT
         GOxjvaxOhdIfJ91DZ5I7ALTuoXGsYJbv1G403IYpOpqKY+srmYgmHtQ7nXm+R8mnPyT0
         Ypys1pzTb6PJt/Rov9lMtq2RnPv6N6PJFsIIksa4RjnUS1JJfyJlc5YHxgVLZfWXWdjj
         YAC4ZyR9VgZEVcMN7CJntGHIfDjI6cXriS1hXzJ09sUMnqGJIeD1ePR1noBO/ifgT2Ty
         eUhkwHMcVyBC1pTbYarGEAnavun8R5WGbzJ7B0AIEGuCrgx865K6xl3ZoE+S4RD8/Eq0
         D2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774465962; x=1775070762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e9Rk1PX2UL/m1nnItUmGUkhb4G1ee+f51xa8F5pTp0s=;
        b=GXfmyTUbPq8bm0r8NN/jn54/K9thBXZd3KQeBEPg1hpHAm3emvshTyIRo3USRnQZrN
         HztNAS1Ujz8yMtWXm7l6RK+vu7WdmTm6sGae/XClTz215RYO787QR/K8ntsadx6BSozY
         tlmU0zvsTn5EYjxZVC73qOcoV6v0Q8lXniVdt/YmP0eWIj8lXyIg6nsvYMmPYzzHx+Bt
         cZuhm7zhHNB0vM82PITiytTw4cFQlpYs5BGAq/zp/PxaXCfiyn/Ho+fZho3bBOYWzBF+
         wFcJBijrWwlcfIhkq3lTqz0P7zno4GKPpXBCE8tN+uchJThkhbIS35hkKiMiStDkgeUZ
         6Wtw==
X-Gm-Message-State: AOJu0Yxqc+ney7QfwnbwG8UdcJXoAxhrX60TAsTVGRW/AmX/JnT7MAHX
	JqwGT2Y5lHI6N+ZZx46PfBQ3XwBzM4qYX3DapJu/AuFNvPiGZLQEI/KgHcXtPmVW/syL/LteMd/
	cHkbo96ziAiJWXaAVMPy2DloaqEfC8vQ=
X-Gm-Gg: ATEYQzx1CSR6o67dBvYhP+SSHmdeUxfAZiYpbji1ja3/oXjlgtsIeXQnqnz+aPzHsFh
	D94JaU5gyjnfgLnrVgf9ahOi/b9TrChAFsJgRdRi0YNOWLw8vOnSkLG/wDL8oeMs8K5/QYzega1
	PK2QMMNUB29qPJ005y9I4zc/pJgZEy40SGT3SzoHu0SfUfadGpFyWIHh4dddhDqaee3bujZC/71
	MaylpXBoFObvsiQTII04e0zWkstKPh2fvFhrCXgUZXF51NNG1Xa1AcACGY8/BkXInu8lTcsl6Ig
	ktn6xVG0lV9LHRoap1I42wbUiP6lx0asbFZGxig61A==
X-Received: by 2002:a05:651c:199e:b0:38a:3473:526d with SMTP id
 38308e7fff4ca-38c43298e7cmr9227511fa.7.1774465961380; Wed, 25 Mar 2026
 12:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
 <20260324133029.82764-4-ayushmukkanwar@gmail.com> <2026032445-squad-breeching-23ed@gregkh>
 <CABJ81bhLibj0_VzShMp_n7DCh+zhyHPAn=SV=9Oo8uy_+Kt-EQ@mail.gmail.com> <2026032510-shudder-unseated-28b7@gregkh>
In-Reply-To: <2026032510-shudder-unseated-28b7@gregkh>
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Date: Thu, 26 Mar 2026 00:42:27 +0530
X-Gm-Features: AQROBzDTQ3hf6LC87ctHtOShf97hP-KZDTXcgZhFjK75aj-36GU25kggVQRLi84
Message-ID: <CABJ81biO14i_FCxeMCTZkXGofxN+Lvw8H7UmG5v_qLi2CJovGQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] staging: octeon: ethernet: add pr_fmt macro
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 2:41=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Mar 25, 2026 at 02:33:00PM +0530, Ayush Mukkanwar wrote:
> > On Tue, Mar 24, 2026 at 7:58=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Tue, Mar 24, 2026 at 07:00:29PM +0530, AyushMukkanwar wrote:
> > > > Add pr_fmt macro to prefix log messages with the module
> > > > name for easier debugging.
> > > >
> > > > Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
> > > > ---
> > > >  drivers/staging/octeon/ethernet.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/oc=
teon/ethernet.c
> > > > index eadb74fc14c8..5bb8c303f88b 100644
> > > > --- a/drivers/staging/octeon/ethernet.c
> > > > +++ b/drivers/staging/octeon/ethernet.c
> > > > @@ -5,6 +5,7 @@
> > > >   * Copyright (c) 2003-2007 Cavium Networks
> > > >   */
> > > >
> > > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/kernel.h>
> > > >  #include <linux/module.h>
> > > > --
> > > > 2.53.0
> > > >
> > >
> > > How about working to remove the existing pr_*() calls with the proper
> > > dev_*() and netdev_*() calls instead, so that pr_fmt() is not needed =
at
> > > all?  That is the more "correct" solution here.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Hi Greg,
> >
> > After investigating, the pr_*() calls in ethernet-mem.c and
> > ethernet-spi.c are inside functions that only receive hardware pool
> > indices or register structs with no net_device or device pointer
> > available, so dev_*() and netdev_*() replacements are not possible
> > there.
> >
> > For ethernet.c, device pointers are available at most call sites and I
> > can replace those with dev_err() and netdev_err()/netdev_info()
> > appropriately. The two calls where no device pointer is available
> > would keep pr_err() as is.
>
> That's a good start, but for the others, work back up the call chain to
> properly pass in a device pointer so that these warning/error messages
> can get printed out properly.  Drivers should not have any "generic"
> messages like that, as it does not show what device actually created the
> message.
>
> thanks,
>
> greg k-h

Hi Greg,

After tracing the call chains, the pr_warn() calls are inside
ethernet-mem.c. cvm_oct_mem_fill_fpa() which eventually reaches them
is called from two places:

1. ethernet.c via cvm_oct_configure_common_hw(), which is called from
cvm_oct_probe() - pdev is available here.
2. cvm_oct_rx_refill_pool() in ethernet-rx.h, which is called from
cvm_oct_poll() in ethernet-rx.c - no device pointer is available there
as it is called by the NAPI subsystem and oct_rx_group has no device
pointer either.

Since both call sites share cvm_oct_mem_fill_fpa(), adding a struct
device * parameter would break the second call site. The FPA pool is
shared hardware owned by the platform device, so storing &pdev->dev in
a static global during probe and using that in the mem functions in
ethernet-mem.c seems like the right approach. This avoids changing any
function parameters. The same global could also be used for the
pr_err() calls in ethernet-spi.c, where the interrupt handler has no
device pointer available either. Would that be acceptable, or is there
a preferred way to handle this?

Thanks,
Ayush
