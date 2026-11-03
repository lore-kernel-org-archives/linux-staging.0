Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793730092;
	b=XHfQSjHhbljov+o8eP8msyRaneqMl5mYiq2//R74INEXjrYaxbORuF+HsnfA1sGDfPzC
	 BhBX3dyjf2qQ2r4STL8S5dPF+WWtAV3lPUyK5eewxAf9NnBJBWqtQEcg6YbhzZlrEwKai
	 MIzrfU7ADWgm2IgaZhRBA7mjG+ZZN3FNu0g3v3/dqLA5tAMYHq77QsHo7tqg4MIoKLY7u
	 wIP2mGHTVyTbOSwBFNzBnTyWPFrakQx+JqHgNC7fYxQNio6CHhVn/5ZWu4Co2b5ZtpGlu
	 EQcWdLPUBb3BYWmYck1PMXOha+ymUnH1ARnZPwj+v48g5X6VJg+wNN6QjZzM7UezSIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MpEcraxy9Q/+qqrBNS3dySP9r7Q89RzTEEKEaNrMPJU=;
	b=042sGUn9KZ2u/IrFoGVlSgHl6yB+VHCXeXnfmdXYjnXb/WOlcuSSSHK+4JWpYUYxLNTS
	 WDgxk+KBkYUoml019GABRPVswJg9EZ1WnIEGBkcKPXObrLdQKOvX/xrQgU46StUH3FDSh
	 hlbT28XWjqmTwrIjwC5rdHpihW6udf+P7IEVZtzlMm1UnPtoL/s5oXn1wPFQve/Oar5w6
	 6QbnfSojwPy3rgpVQcSdEyZW5F9cQfSWqkaGBV+SEb6Vj8VIJ3HbE6ANvrye2p9mVB4C1
	 puFHAr1rPD9kPeK05m1hXF08LTfJlPKfag6BonW0oq4pCYc7whx0O9WHnx7G/MmJT/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5LpPDuQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C737D606D823
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 18:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C737D606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5LpPDuQ
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab3dd9670bso40391291fa.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 10:21:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793730090; cv=none;
        d=google.com; s=arc-20260327;
        b=NmnW1KNDAYn+LziGtWVGjJLlonQuYrGJC64xZgjZnVzQDdcqVSyDKn8YyzVqv6T9P3
         GaKyG9ypDEVXqhZU9cqD/dN1fdloCJ/ZY8onVB54OZ6fhX/GWPyVCP9TDeoErDDgeP4V
         o/mCxNiGs8jCvQUuWv6Fb/bqtXCSij4a5prHXvbmTuSgWZNxUTXr60DhDXZUEdkwfp8l
         puTzTplpuJjdJD6yr2N8m1fW5B7SXbbJa16o47S77d5aYEVcoq8eEx9FQZhu9fQPiCHB
         6VSUh6zJV3DLICTuQ5kjhXUjq81j2mcCxp0XdfuoVQteHAe18s/ezS7+pYxR3RnlM0Yx
         D1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MpEcraxy9Q/+qqrBNS3dySP9r7Q89RzTEEKEaNrMPJU=;
        fh=+iOlbFVpNTMmrRBFiHSSHgwXk138h4IzD/DZjr9WoLg=;
        b=DpyLzsdYPX0xuP2HS9j7rd4eD8N7JiSA9VVN4wtKMePTeausQvez2Br1kKwonmC/cO
         CJdASQTCu42TOwDblNQhMtTA+z7zQklENEMynvWmDggDf/WTMpcGZ0HUPtCjnIEee5LM
         Jrtdq1VzVUoYtlRSCbkMXRWCNdx0aqUhLoNVRPsGj+6LD00LF3wPSkPmOz775q34CKhQ
         5YNdhNnDLusAOWCR7oxpkVMv+f1RPD6Pt5Osatl3d2CBywAohZrSO1/Fm+S5GQCYRFTr
         1uN1/uB5EnU9H9uyvaay/GZS16rjgUXpvB7reIId4I2Z73R0SmRfeOPL8IL2mpTjdc9F
         5UOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730090; x=1794334890; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MpEcraxy9Q/+qqrBNS3dySP9r7Q89RzTEEKEaNrMPJU=;
        b=m5LpPDuQGZoFVYxmBulzH78/4kwjPMP/Cb3Q0k4vcfH/BAUMRVUS0nN96Ull6nMdlf
         9VXeXv/SsGg5mAtLYoT7oGfuD8n3SeVGIPYqnhnhSTEdOIoM1NEhP9LvlEv11FP5EL1M
         DeS447Q9KcYWllI2RrnmK+nE6XYclVkfy6MY4H0ptFRQAN4iDtusSTjY7opKkO04ebDu
         EblsbtJY1oUOkUFTKcdqOigABApgRaTxevsmxAOPK0ZZw4YuVU4K8VIytzjHZ90MlrdG
         6hiDS7b0F7Py0cX2TNGbo8oAZY7Of6cPqQUxnL9P00ZJweFoGWHOiIAqyFEWyPWqbRkW
         VlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730090; x=1794334890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpEcraxy9Q/+qqrBNS3dySP9r7Q89RzTEEKEaNrMPJU=;
        b=Yw7Uv6smrNIIPGl1MZ7ky9buL+Bd3c7l54I2eKgi4fuY64tsEt73A6G4WAkUH20HGe
         jzj0aHewpCyNTj73+hsJXBQY+7e7ri5qki6Nc0WqE16b0/QXKIHOFFDGwqHL9ggNgrqg
         uCcAhkdCakd2mdGRn70MfAwm4rISB8MVW0RjHjJBYC6Q5I1RdxdW7KXkmN6vN3l4YfXF
         YgUF+drSm6ybtFZEiX+3F3A+0xo0OQxZ6+3pWZjWivofpO5Gyq/4ACKYJAK5EKZBX/ou
         kVTD5QKfzgkw9DtgU3XBVCZQhv0jpxnR361H4V2VdO/ve6mNoV2Daqrq7DZUHsoZJfCS
         61Ng==
X-Forwarded-Encrypted: i=1; AKwUvBxd2LYQgpKlHJKaYKpVq/NrsnYjFXXl02/AplhT8vHPhP9AMQ9TnizEn+bzEWavoItPddhMJLRJkpOSU3tL@lists.linux.dev
X-Gm-Message-State: APuU4Z8qR9NB6G75iV4YEDaw9v/2sNJDmW4rQfW8b1Ctxwi4McQ4xzdm
	86tG/49ZZoV6c7dNSAfSBoGVVTBT9G+/ZLVjcMjFU/6CT2OrfmFMt/eh7f15+BAAXNC6xfoMCQK
	GzRDnzbSPh3Hup6ULpstrBOmGYyhbnqU=
X-Gm-Gg: AYBFou0Avk2nnYKfPPAh0wQjdYYJx5PDsXgQy8ZIkzaXaSUnC38l6JyLmj0Pg+DNwAI
	eBXDwmm44YOYJHG/BCDsWodfJRbvgvbXTH82/13NidSHy6r2eiJGhBL4brlQBVIwVcFKutqg43Q
	HZNpyoK0TsUv8A88xVEvDQkSfYJRqbH/lnSgPvd1XeLuq38scoI/dFk6yuAedIDCLI3z7SplRJR
	c0ogulvcj26rxEFGVs+B4V/2Tnk8biaSUPsKued0w0dSLrBEoao/hULy4gpyUJF4Z1FDVbM/uiV
	sa3rGKHOmiPHnJeWk/dzxNWscZZtnmPq8/96B1L6fQCYf2D/0PsY/t0bURcFWORIHYfZ3djOR6z
	xc0VC/j3SlbU22qZN7P4/6RTZzdLKnPOgvcLZzoCzNY9/xt/CLEhCV5A=
X-Received: by 2002:a05:6512:15a7:b0:5bf:a7d2:e8a0 with SMTP id
 2adb3069b0e04-5bfd956a316mr4721107e87.24.1793730089789; Tue, 03 Nov 2026
 10:21:29 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com> <2026101402-spotter-stitch-056b@gregkh>
In-Reply-To: <2026101402-spotter-stitch-056b@gregkh>
From: Rishik <rishik.yechuri.code@gmail.com>
Date: Tue, 3 Nov 2026 12:21:18 -0600
X-Gm-Features: AclHuK-WvTHT1ZlqTF2qAihAoEI62WDFaQZ_G19gGgQx45WPEFF393UzPQZsYo8
Message-ID: <CAL4M7k4kABFmDrReZ0dnuYHiEb0Jn2N=iutncNJ4X-S=HPAYXw@mail.gmail.com>
Subject: Re: [PATCH 00/10] staging: rtl8723bs: replace private 802.11 header
 macros with generic helpers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rishik Yechuri <epicrishik@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I forgot to add the assisted-by tag to the series. I wrote the series
with some help from claude. Should I resend the series with updated
tags?


On Wed, Oct 14, 2026 at 10:45=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 13, 2026 at 03:15:28PM -0500, Rishik Yechuri wrote:
> > The rtl8723bs driver has its own set of macros and inline functions in
> > wifi.h for working with 802.11 frame headers. They access the header
> > through hardcoded byte offsets and pointer casts, and they duplicate
> > struct ieee80211_hdr and the helpers in <linux/ieee80211.h> that
> > mac80211, cfg80211 and other wireless drivers already use.
> >
> > This series switches the driver over to the generic versions and
> > deletes the private ones from wifi.h. Each patch converts one group of
> > macros and removes their definitions once nothing uses them anymore,
> > so the driver builds after every patch.
> >
> >   Patches 1 to 3 convert header address access and the Frame Control
> >   flag checks and updates.
> >
> >   Patches 4 and 5 convert the frame type and subtype checks. Single
> >   comparisons use the ieee80211_is_*() helpers, and switch statements
> >   mask frame_control with IEEE80211_FCTL_* and use IEEE80211_STYPE_*
> >   case labels, the same way mac80211 does.
> >
> >   Patch 6 removes an unused struct member. Its initialisers were the
> >   last users of a few private subtype constants that have no generic
> >   equivalent.
> >
> >   Patch 7 converts the frame subtype setter and removes the private
> >   WIFI_* frame type enum.
> >
> >   Patches 8 and 9 convert the Sequence Control, Duration/ID and QoS
> >   Control fields.
> >
> >   Patch 10 replaces the driver's destination and source address
> >   helpers with ieee80211_get_DA() and ieee80211_get_SA().
> >
> > None of this should change behaviour. In the few places where a
> > generic helper checks more than the code it replaces, or where the old
> > macro kept bits that a plain assignment would overwrite, the commit
> > message explains why the result is the same.
> >
> > Compile tested with W=3D1 after each patch, and checked with checkpatch
> > and smatch. I don't have a device with this chip, so it has not been
> > tested on hardware.
>
> Did you forget the assisted-by tag for this series or did you really do
> this "by hand"?
>
> thanks,
>
> greg k-h
