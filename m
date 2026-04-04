Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F258220D4FF
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775294470; cv=pass; b=JeDS01B4uneZ1O9A5KfFKC8zG7/Ikd6MkVXfeWfEz8xkU//Rd2pwQJ3ihyjZupKhffGgIMzfEcAwFALKgOQINRAq8LQbePdd1e5Fdp9vpE/mL9AY/rqdcIrcS7ARwC9gQ5YmPrRkb+5MHnoENJz7J+Ij3onek6g5tW43ro8V/I8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775294470; c=relaxed/simple;
	bh=5hf6g2Mjh93Hlu0d7sFXGbK5t+LyY41Hn4QmoaMefEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFCqa4Dz7fkm/wSsnhKbmkwXRFkkSrQOW20HqFEvaRKl/kHatTRNN5edDXvxWjocjiUIvBuRWQyXW+cOjX8D0YkvLnrxRBlG0uU9UcwksipRQFTIEBYREwBpKrDWDMk6V5BVbBc0rvfjVBz9QjdAvx3NgRIdSFNKQ0SQ/4TZyLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXvAbJUB; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXvAbJUB"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124b07e5fe4so91011c88.3
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 02:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775294468; cv=none;
        d=google.com; s=arc-20240605;
        b=QsTLeSrlRpxpn/yM+siWQI9N3qN4yZN480R6cLjnYYVNrduMCSp2SzpJmFGz9CTokQ
         3pphM41zhQ+1IXxUydFVUwpL//ON5M9HRvWnUbW3fyTgM336p54vXCTcxESrP8vLxizV
         0WysMBjJogK0btpkbZW+SOU/b+JQ/UPWi2MgYZnWTCf8Lap/pZZiCm8TwP/WDogFdUo/
         Bj/kYA4M/gKeexSksj0cAsFuVUaRVOXWm8uyP+F35oslw0yJFC5w9HuS3t6fh5AR3/1Z
         klh4dKJn5Z9c29mT7WUGdSbL2I4EtjStm90vTkgx7yNXhuHJFCyXQgz4WcTqmWSGKxcT
         ojEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3LA5sIgpc/p6fg0spCc6WhI6mhgSI3o8Gw1eemizfKU=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=OvGIN3x0/yf26du41ZAkF4KSK6XSqMBQ5jbXouXV9FVGGHttdKB+qGutuAqCX/rso4
         X8xmyRiW2c6nvy2Xppy37Qm5Bh16hrsCbjed4BHefgQAfjHJ/L9/bSHOTlEOfW9DCOC7
         SjW641/dLqImcpeQw1owXKXSbtq8jwDAJZJ81VVHE8BizoWGcn5/cr2MTyRhd8/kW0J8
         +yHKk4ke06BdhWOePfojO9ZvHxWpZpfugEJN0s5Vph8WnwjeuKCgcgTlGBnURqQD6SBx
         VmwJTQsVnsA6ATrutR0rTeep8ZxIG/+vY82RGm+ZQJyDeu+uPyhyjYx3G9kP+8aODpWr
         MOCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775294468; x=1775899268; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LA5sIgpc/p6fg0spCc6WhI6mhgSI3o8Gw1eemizfKU=;
        b=LXvAbJUBFJIIMUhDwYX/0udhfvVOncex+nM1LoDYG0V085wkpOiY0HLogkgUPc/jaG
         KKwpkPt5fVCO6/0Cgha/aZ8pAMUQgxv7MZsUzkWxWflnRloQlW4oxQC16yQrGoA69YH/
         fuCZQx1OaTEUEow1D42UXO+Kt/6tjDQP1sKSdM4o/YI0GYYrwPkn5TeuhVD1IV0eN+wz
         qxLzyt+/AbhTdMNhQZwUmIiMALNpSUYQ6eYWAdr8SCPDzK8Igkj+w7zWh3x41w/6mggj
         u7eb7O+qeAbVnMAzj6AClDtD4steQ4XOBTOMldjukMxU11HjZwDPUoqyNdfdOEG/xUR6
         sg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775294468; x=1775899268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3LA5sIgpc/p6fg0spCc6WhI6mhgSI3o8Gw1eemizfKU=;
        b=n2NLXlz4rmopG50KRLRcjKugSdyaWaIWiKfM6mMEXVrFyCerK0ybgWLQHxTvEfzY7+
         nhF8i/LkAuUaCxgm4sI2l7h0VrcFml4wCOnUQFhw293sCirelEZO9s6fSlcwRXsnZ/Gp
         y06G2f+BW+OnHOITB3Ubdqs4gFyMcHaZfttMNXipdZ2v30YxvSAp0C+DruGoFkVPp1QH
         lsjExPMbHVJ57EBtf6fNNCdPMCTfFJUT4+9TtKUparEDcKX0FzWoSTroKXCTA/R0mlwo
         XNRcIGWComlnzx+vTu1Vj28C+bFRvBVs7EWhFiuFVqn61LuxNXtnbYxHgS/nCL8H/83l
         CKVQ==
X-Gm-Message-State: AOJu0Yy53OJ8ZCv2F0zBmblT46jlmO312j38zYGKB5a9RMF6/Nzo4mrc
	0ZZB5ZzUXxrMs0YXJLS3YYHFUYfZBPdc53LfKtMXcn5psNIg0Z9el/6Ieg9CWNoi0PV+gfys/Is
	zOTOFNHk//74AVVZWnYOYf+/DkrIBidE=
X-Gm-Gg: AeBDies4awM7r7ktWp4jKPAIJqJqV3hP3OsQEuMJY5nyJSsLBpuao6RfFuVdmiGvGix
	sdn7A77t5zcaULyoAn5y+OATjnXpwlBprVsQvck2Pdqjqre7rJ+hRCdSwXZ4iqyMb3Qoi87HCgB
	f5IG6RNfeAEA44VmoTBnXIeTLzOK+EtaTr7iw1jSywVAOj5f7l65Wu+uE7XorqR4RWAINrqoUMC
	xw0WN8OTLIj5a7N+K39YzOh9VUd1mHOTdfbosv8EkEztf1WJmiYX8B81xgyKJ8h2dt9x8FjZzXy
	L3vJLhVbwl7S70+qwTXxqX9AJ6Xg44IW9Ix9+oee8Q==
X-Received: by 2002:a05:7022:50e:b0:12b:f616:1a31 with SMTP id
 a92af1059eb24-12bfb7780f2mr1149915c88.6.1775294467923; Sat, 04 Apr 2026
 02:21:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026033119-endpoint-jimmy-6b83@gregkh> <20260331111757.110703-1-ayushmukkanwar@gmail.com>
 <20260331111757.110703-2-ayushmukkanwar@gmail.com> <2026040136-cruncher-massive-992f@gregkh>
In-Reply-To: <2026040136-cruncher-massive-992f@gregkh>
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Date: Sat, 4 Apr 2026 14:50:56 +0530
X-Gm-Features: AQROBzBbm0p6BOmAr63tLdeOd67o1EMzqQzh5qelzr-kG1UlFgKt3bBwsMhnoXE
Message-ID: <CABJ81bhbWnH_BjCM4ABSv1aW=EtptxGbgZOGMTcan3=GO6mLCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] staging: octeon: ethernet-spi: replace pr_err with dev_err
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 3:39=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Tue, Mar 31, 2026 at 04:47:56PM +0530, AyushMukkanwar wrote:
> > Replace pr_err() calls with dev_err() to include device information
> > in log messages. The device pointer is passed through the interrupt
> > handler via dev_id, which is changed from &number_spi_ports to
> > dev->dev.parent in request_irq and free_irq.
> >
> > Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
> > ---
> >  drivers/staging/octeon/ethernet-spi.c | 59 ++++++++++++++-------------
> >  1 file changed, 30 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/staging/octeon/ethernet-spi.c b/drivers/staging/oc=
teon/ethernet-spi.c
> > index 699c98c5ec13..8c02920c3cdc 100644
> > --- a/drivers/staging/octeon/ethernet-spi.c
> > +++ b/drivers/staging/octeon/ethernet-spi.c
> > @@ -17,67 +17,67 @@
> >  static int number_spi_ports;
> >  static int need_retrain[2] =3D { 0, 0 };
> >
> > -static void cvm_oct_spxx_int_pr(union cvmx_spxx_int_reg spx_int_reg, i=
nt index)
> > +static void cvm_oct_spxx_int_pr(union cvmx_spxx_int_reg spx_int_reg, i=
nt index, struct device *dev)
>
> This is ok, but this, but usually the pointer is the first argument.
> And shouldn't this be a netdev (see below...)
>
> > @@ -107,14 +107,15 @@ static irqreturn_t cvm_oct_spi_rml_interrupt(int =
cpl, void *dev_id)
> >  {
> >       irqreturn_t return_status =3D IRQ_NONE;
> >       union cvmx_npi_rsl_int_blocks rsl_int_blocks;
> > +     struct device *dev =3D dev_id;
>
> This isn't ok, the function prototype should really be a pointer, not a
> void thing.
>
> > @@ -196,7 +197,7 @@ int cvm_oct_spi_init(struct net_device *dev)
> >
> >       if (number_spi_ports =3D=3D 0) {
> >               r =3D request_irq(OCTEON_IRQ_RML, cvm_oct_spi_rml_interru=
pt,
> > -                             IRQF_SHARED, "SPI", &number_spi_ports);
> > +                             IRQF_SHARED, "SPI", dev->dev.parent);
>
> Wait, no, you can't do anything with the parent!
>
> This is a netdev, keep it a netdev.  Don't pass it "up" the device
> heirchary to the device pointer, use the real netdev pointer instead.
>
> Also, it seems you didn't test build your changes, what happened?
>
> thanks,
>
> greg k-h

Hi Greg,

I'm preparing v4 of the octeon pr_*() conversion series, broken into
smaller patches as you requested.

While converting ethernet-spi.c, I hit a complication with the IRQ
handler. The SPI code registers a single shared IRQ across all SPI
ports:
if (number_spi_ports =3D=3D 0)
    request_irq(OCTEON_IRQ_RML, handler, IRQF_SHARED, "SPI", dev_id);
number_spi_ports++;

The original code used &number_spi_ports (a static) as dev_id, so
request_irq and free_irq always matched. But to convert the handler's
pr_err() calls to netdev_err(), I need to pass a net_device * as
dev_id.

The problem is: the first SPI port registers the IRQ, but the last
port to uninit frees it with a different net_device *, causing a
dev_id mismatch.

Additionally, all the error messages in the handler are SPI4 bus-level
errors (DIP4, calendar parity, FIFO overflow, etc.), not specific to
any individual port. Would using dev_err() with the platform device be
acceptable here since the IRQ is registered once for the whole SPI
subsystem? Or would you prefer a different approach?

Thanks, Ayush
