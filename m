Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22D4374E59
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620713; cv=pass; b=JI4gEHHfU0BD7z7TVzh7DaNyNHcPN4CDMmQy7cB2Z3Dwu9kJzmL57D/m3N0Hl0pjSTLBfRoiPOlefXpImGnP9hKQLplaMe5pnPki/B0sYGismavCjwQMeM28gJxPOohSxFobb+YDRUrp5jq1E+oiySLrPHZo4wWXZajTJzDo0CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620713; c=relaxed/simple;
	bh=MT/2tmGMhh09voamgXY3Cimo1subFeymstrJFGTsuiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5CmYIbWkhbWSRiHaHIEBkKSWKAt5dhPADOyV+czffYNOfzoAPoA6ff82i3DJD5otld0Hvug/FmhmiVxN9IJ7hk4sPmhDLGhwt+oepparfrxZBtV8OTC7hpSDgrM3DWvysabRaeOH1PnBNEkuGF/LhkMukNN4ZivTjbAjY4GWg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILPyi0v5; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILPyi0v5"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81f64e8dfbcso30116347b3.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 04:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786620711; cv=none;
        d=google.com; s=arc-20260327;
        b=odVTUljJmdrPGLzSXXe+UgwDeeBIU+LMC/cwtt3QWEgPY5HQkJmOChP0dQY7O0jH91
         fLump3fXB2CLay30SPfJYBTUI63Xe+5U4j1dnSSyl3M5JC0kLRWHkYEONSB99yBZuf63
         hIEiwf/ZsTRUkYBXBU9XRSCxM7KavX3cedOAk46MbJvevMTV+3zZbVZ/d4QbOUyXdpV/
         kk+QW4HGY0L8dPw3suSuEjVWvsHj5T+s6qwDzBrq3vMdTlW5ZUBCMI544usPY4bPt5lT
         6umUCjEHKXDEJCyl/e4OT2jVfVVceVNDvG8p6K96bfwEJFL8/nZxf1HxXO0Rw1J0TKzQ
         4bKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tia08duuH2NBzcDa5W6CuiLGU5uz5B2OAbtc8rVP8as=;
        fh=lXPBF9GaDwmRlmq1Z12VKsIMQq6vUOYHH/EIrxEz5FQ=;
        b=Ba8z9AyVHkrgv10Iuol1LUfazl0pq0KhsUi98EK/IOEjqXh8YraGA2j+zwrMluwcOa
         +/8cztbFGwwsww7+37OgClBkaAuKe97XVmTcQrvw8T7eOT3VJewHfgxE2mm/HqydyJAy
         wtaV2t90aFz3PyDaafoSUDOH7IBayekvBCa8E0D6+hbWKxZafoajz5x/WXhv5bpK+St8
         or4bD7hkk3vIIHMteK8fsQGOAQ+YL1rEbJ+PdqAUNBs2VBGgp5b0dHQ+2jkEwpxgQkMk
         IJVYDp2xgCch6o1PDYdalADBb7OY+OSfR1ygmd/gboZFnD8YgV4QzZzD1SatkMe929h4
         L/rg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786620711; x=1787225511; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tia08duuH2NBzcDa5W6CuiLGU5uz5B2OAbtc8rVP8as=;
        b=ILPyi0v527xr3hY3Kiw8fLbT7idH0uceXqot9pxU9u4t/Hv0ncm/ya7Ecqhok0uQuE
         kZx8I+TkAVjlD6VFwRqhTKlczrGEjYVbZlOqCpDCbuD3zgoEVPCl+UOKq6MqPFu6jXN+
         xpI7EUxqdg2GZNweWttg7BCBFLLVwm55e2jK4PLWf/kxFz4oXt5/lwhe8PxBnq+YGhAl
         2EENYteA/aovCZQn1kqSCjUNIM5YctE5wTKoS7jkKc27fm7rcJufS8/gyJDhV9OQTZPR
         Ru9r788rjW2gNM3sSgunAQY2ftHsXOclsTjxE/wq6LIbqjUG6yitCF726X+MictiULaw
         lXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786620711; x=1787225511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tia08duuH2NBzcDa5W6CuiLGU5uz5B2OAbtc8rVP8as=;
        b=co3yArm11u8WaoglcqZ0CZ1sFJLg+T85vKbh6TcpKEnRm/+iN47dpdKdxuI3ExFcln
         CeQqcpjfvrZA3JWxsuB21ql3eTDTOGwH9z3gOE9sYmeM9OK5o8Ahvgs0ifmllsXDKiao
         tJtS8bXnfu97EeosRxB7MgRXehfJVGaohc6pPXiZyYaoFwpsDLGf3+qjKx1ePIj6+o1b
         mXU52NzLWWTN9nKbALxSCsmqhgkbYze/+kn0lHuVzzgd9TuTAjhkPFBIeVTjd555x1vA
         mpEcCoNVSENz5UeCOc6fyW0ANX1ldk7ZBl2SQOT1mOAspfcU5VSS9VaVFssn+l5qjnhX
         igPg==
X-Forwarded-Encrypted: i=1; AHgh+RrNg5dFH1HuhIuGz+e5I9YaAGZpoliPa1sdQBFXS9DC4EEpKDkglz0N6eNMssLZw4ox+h9D0bv2N34plRKX@lists.linux.dev
X-Gm-Message-State: AOJu0Yz29GvUDWVJ8tsnb9n4Hrofal5+7x2T+HpFRNwlUchGLlviVkyT
	h2EbyxSK2LH0m0jnHX5GoiDrshVMpHptSvF8Cvkab9zm37MG+fISClSwDrbY+Tsb9kG0wmMuBjc
	leeCyTrp/pXkeotbc9KCk+hoR9O1UCCE=
X-Gm-Gg: AR+sD118y5xeQWab07j+GbJ5m0i5yxa8m0PyK6hZQjpAyYi/1l5xdnKg9lVU/3supdn
	CTMRzkWzZFdx+DpItebJEUT3LuY34Rl8OeEBOrXAl+fvqLe4VJfVdRxhtbysmjM9KTppXo8tk+p
	Q/lrbOHhSPIpURxMQYk2BaFF/I64LMWFwSN63YZ1I8EyCjkEG7uF82CewNXExWyh33Z+m0cUSw8
	7DnYqKfZ1paOzFAdar1tExbY/q+RSafEW6FfiTEA+95J9byw9qi1Od3tdUGK2URNNWHlFG8jXve
	7WKI0jbe1mXUe4fLhItxDucuNOj8gjoudodLk9JvIzimCN5lPAdi4ZmEwh+mqcUZ1QgkJfVWEIm
	n
X-Received: by 2002:a05:690c:6288:b0:833:4ca4:f3d7 with SMTP id
 00721157ae682-83475d60c58mr25625387b3.29.1786620710489; Thu, 13 Aug 2026
 04:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727111534.729615-1-congnt264@gmail.com> <2026081240-shanty-prepay-648e@gregkh>
In-Reply-To: <2026081240-shanty-prepay-648e@gregkh>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Thu, 13 Aug 2026 18:31:39 +0700
X-Gm-Features: AUfX_mzGbGbCLUqw5yGVABFLcGDzOMeEoke6_vKzwWhrkgvCIpYRKRc2ZgE3fTs
Message-ID: <CAJpJ=Gufo_0aKSGPr6rH7C+b6N+VdCzakAL_Zatb_Vp5ejdHJA@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: fix flush_image leak in tsi148 bridge
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Martyn Welch <martyn@welchs.me.uk>, Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 7:25=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 27, 2026 at 06:15:34PM +0700, Cong Nguyen wrote:
> > When error checking is enabled (err_chk=3D1), tsi148_probe() allocates =
an
> > extra master window resource, tsi148_device->flush_image, which is used
> > to flush posted writes by reading back over the VME bus. Unlike the
> > regular master windows, this resource is not linked into
> > tsi148_bridge->master_resources.
> >
> > Because it is not on any resource list, it is freed neither by the prob=
e
> > error path (which only walks the master_resources list) nor by
> > tsi148_remove(), so it is leaked whenever err_chk is set and either
> > probe fails after the allocation or the device is unbound / the module
> > is unloaded.
> >
> > Free flush_image in both the probe error path and tsi148_remove(). This
> > is safe when err_chk is disabled: tsi148_device is allocated with
> > kzalloc() so flush_image is NULL and kfree(NULL) is a no-op.
> >
> > Fixes: d22b8ed9a3b0 ("Staging: vme: add Tundra TSI148 VME-PCI Bridge dr=
iver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme_tsi148.c | 3 +++
> >  1 file changed, 3 insertions(+)
>
> How was this found and tested?

Code inspection: flush_image is allocated in tsi148_probe() (when
err_chk is set) but never added to master_resources, while both the
probe error path and tsi148_remove() only free windows on that list.
Build-tested only; I have no TSI148 hardware.

>
> Did you forget an Assisted-by: tag?

Yes, sorry -- found with AI assistance and I missed the tag. I'll send a
v2 adding:
Assisted-by: Claude:claude-opus-4

>
> thanks,
>
> greg k-h

Thanks,
Cong
