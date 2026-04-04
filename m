Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2553A137750
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775294278; cv=pass; b=OBuWANscKu97eJAWwW2QL/DQA9LWq0OiW8VCBo5V2kxTvV4PPmvGo5SzXKZOjDt7/j9ijiCkyvln8G4k6F51C0l+hTvTRS1++9/75suhTQL5SMQnfVe2CwueB4wMbMYY3/O/CC+me1Cdx9pD5MD42KvgCYtFmdOeAs6dja88thA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775294278; c=relaxed/simple;
	bh=yLaF9Migg0dtB4s/WGY5rAXrmV711EDKk7i3lLXtbX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPU2zAaL2EbhbSpImYH1heE0FNTDJuch2L2KvZrqPbFrg2X0gOPzQL0pN1Yq9QVd8SkqdRh+5gWdxJ0xTrbJpzgvMJ2mqgj/fHzXvgLIz4rhceENl3spQhPcbp9KgqKwmv83gA2DeuqbVfOak0el0HH0lcXgNWYOqu56l5zCeM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fObR25KR; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fObR25KR"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12736a0147cso129358c88.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 02:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775294276; cv=none;
        d=google.com; s=arc-20240605;
        b=d4bS/jwD3spo7Oowf9Dl1aEcQUC2ddjHSqq/Z6MZbVOfvMzbj/69xnDdMNrUaItlgj
         hhb3EOruRMCDuoHhScq+0iN15HiSwbsosAAre/Nc5awSC/rDV8BKkC2JXUdRALmNOUP7
         mULh8a2LCv29FctQjpZpAHZiUkE/cowiSQV+Y7ACKvh1GEMBtafpmQaJzo92pOMCZxUd
         Kg/7fofXDplhDbF0vAzner9HYaxIbZBGLHb6GP793+ZZox7niVqxmtZG5KwjbZD3J6M5
         P4RVJwXoa8JvLFm3J9JbxCSuE54zsweM7t56kdTb2oBc6T2tBSWWGf8ejvJGJeS/D6zO
         Bybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DhpbSl4kP8S8JePX9477mAgm/rzwUPNhJmuT5zNaBuE=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=WeNQrcLOIMDbVNToIn0PSHU1/nbk5xA4OEgo2Sf0Fp3YYETeiQQCedKT16O8CzulVy
         0Z0j019l2zbQxxFtCBsR/bwLzgcFVpMZL+AX8YAOVrGDuynJl3QlmT6Tc0Tpb33dqy9x
         6YPm9PsPfDH1bC7DTV6Eljpedjk5ME5UNHd6l6+z1VZX1A09SXDI45PFhMQR9NWDqrJr
         Tr7wsdSSxtGntLjTfm28u5qZivD+ohH05PNnsJ+FRT80k7daafj9nHbjI2BXDkWi2XGz
         BYnppRlA3GFpxkIlrfV1p2YQSVk6iKgdo1jYIdLnLZwOrsXsUVups7CqPICythb+Apoq
         jQtA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775294276; x=1775899076; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhpbSl4kP8S8JePX9477mAgm/rzwUPNhJmuT5zNaBuE=;
        b=fObR25KRfnzLDTGP70xfO7t4p1blXMkDMCrCL/XhzUN91RyQys3jg9kJKUlBVfmsHK
         tTAJ3k3978GdYMu1mriMWzc44/jkDMWeEB29axxaKLdcBYuVXIyLb/LMDLHaC+xcgBL8
         YGR+RNU997Cd6O3l0FNq9uTIZWscEVjQnxEHSMpl6EkKO9AnzlGb8mABab/fj7ZHFNaQ
         SXpd/UppoYmwUsUXIhWaDQ0ZXehm4j76hW2k6onZ8rGqbvviPxK4bdky3IUTPIzjCDfT
         MoRa1hfdfxYJO5LxjB6b5yHRdlEwCcouNwuyRTyTYCHCD7Qqy2qA2sVMVf8frMCfahc3
         JZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775294276; x=1775899076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DhpbSl4kP8S8JePX9477mAgm/rzwUPNhJmuT5zNaBuE=;
        b=KQJs+AmBTCrqt/DuuK5Wg8p5QOqGaGPNCayVL1OCIVWG17r0E+TnzDu85DrLaWFPrS
         EeE4lUedmKtwmOgycKKAsMyQ/S3B+xNWIaYotnTB4WuS4ljjKARxA/0Vb1hY1A8ZBeDt
         gJ8o3DJrazKcubbWhz/Sddi7xIk47rsdx4Pd8XtZlIS/B+K6Syg/cuNPRfB+voszo5w+
         eHKbSPIsEwC/XHPXuoxRatyZ/p9YRDbgs9yZqeHnYq/hPXWp9xoeLxjckH8a5GiuOKU/
         8JXFzROCr0TEwQoaGfnsraN26EWiSuG9qrEHH2dw0wsA/X8ZReCq4UI2OW7g6YIHiv/n
         138Q==
X-Gm-Message-State: AOJu0Yy94qJBC6XqAoUvmvzExT9Wn2QnGcMynz+J60IoJWjlV3KrwlBu
	rc5fRQiV71TO9iy9yCPO7AqwU6MwbfknUxjaqsvyJ4JJn/hu4RFu8dLPwPJyAcQ2CApODWwm/TN
	EzErYx25syAgbN+dCa4hxNrD/ykhLTuE=
X-Gm-Gg: AeBDietJu7fytHxyvu56x2bU1XNWG5GodelZaM2dOFFlWfdytEomtOkT60QtUnk8Nna
	/LBG1y9CyT95LXUhezee7u8CaIYnbL2yojP/xIBx1kpgfA7Qxcbm6isSzm0sNvmXvqGEJA0rJMI
	e0D8x1hBkWRze4You9Cst3SlTWOV1WZtq2TpaM553sn0/+tpMTzibnn6CPOd4qWU3VkweDPZrww
	qSTESBLObV7KHkrfbUG72v8iGyYFq0lKFCYQzbaNHsqzYX6ZyT9SvTXKKsf+d4K4pjVCeIWpDAB
	E8I4UBOe4WBXn03Q+tgwNH+CkoWCxjxOtcqIXgy2LQ==
X-Received: by 2002:a05:7022:b81:b0:127:332d:63e with SMTP id
 a92af1059eb24-12bfb76050dmr1099770c88.5.1775294276072; Sat, 04 Apr 2026
 02:17:56 -0700 (PDT)
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
Date: Sat, 4 Apr 2026 14:47:44 +0530
X-Gm-Features: AQROBzC24rXK6uav1r1u1EIARsSJlcqahVMLX852dclEmYynpsl7YyrKfwlDm1I
Message-ID: <CABJ81bjL98GqzZpWwCX8_8vChbs-xV5GVmVo0tPS0QpmgTc5GQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] staging: octeon: ethernet-spi: replace pr_err with dev_err
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
