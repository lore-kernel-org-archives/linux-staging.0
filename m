Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D1C431487
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 12:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241344; cv=pass; b=kjF3yEYVG387TDGRzD3LCHWEeebP9LGxH5ttq8LhtV7EmsUQ+5phq2+3dpOUFep6q/YfoPVxXBVu+lwCieXTAblUbxJqzKhLAQ/HDzmFYYYEMS1hhZgWiX013Ndq5M8pC390ug6adNpgiuwvYRGhWWUUaXVWMD5DQHT2Iz/yHus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241344; c=relaxed/simple;
	bh=27pEB9mkjCBjUqNujyIdQW4s74fnNVSjeyGM9Mmko/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lPKQEKTVJxxkQRQO2otvJu8Kd81gQsO5/Iht3KJDoaPQ8uBi2qrXEr1+Ew5pPfqT0ArdquBO8eFGgOLjRZs8Y8AcYJD5q0U1sPlDO0m/qJB5vqe6O2ym9cpJjwS3KgOQQLo2RqFSOo3OzsJAWamC25/NKTBk3aZipwlKeprO2ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlJd8Nbm; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlJd8Nbm"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69fc6a09b5aso4982262a12.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 05:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785241341; cv=none;
        d=google.com; s=arc-20260327;
        b=IdkI9yflc6gjiVH7mHHv2+vStvnWpPDFfH/ItExWU2yqDG4yw5dB+/jl79+w3ERdrT
         HCoa4DHB4nc7VSBckYQH6Ns+0yS2vsG13nQfTG8gGNhNVvgkfB/cFWYpVDyEWq8wDEfa
         kLNHtGPtZbGSPjAIp9whHar+LfxRh+wkHZjHAUSqttadE/5RjFzXQ1zgdy4G4p9p8SMI
         JxRyDCGXIb4aycrYIrC1gpWYIRtX9M/mk9/ftvTbS8cZWmx/Eg4EKvFnnERntP+ZS274
         b+/AXXCFe+FECjbz65ZJHyCxgLSawUBuntxfH5nm0PO0Veb/Y98aF/hsTwo7eXRIza/X
         7TqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nQtLGCF+absZpo7CYw6+cf9nUCFtJnc7kPT8nnOc+qM=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=YLF+eC/watowcXoARd8UdUZ7kIWGBpbiG2TykHDIdrE2V3LlGpd2QnTpTLYAqzKvwK
         ztnQg1Y0+WbktrnClO8AnhMIIkGKstE0RWov5b0+KS5xLfQ5wvn27Ruifz4NWeY6JbdF
         VrO6HStPrjfqRvYbMLpvF9dnV0gowP+XhJxP7hNR7cnUgefSux/px61em2b/pj/5FtiW
         YuEcx92WwTGntBuSsYR7YdIxk15IfZ9HL9gR+516UY4IF3cbjiPxUKhDv+tYkkeHdBaK
         Bcb7sIUziWH0VWbaAb0jGQm5Vdsa19rnRbh5v3wUQjd0SOQu58WsDoIvOOW9zCqCr5U1
         h5bA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785241341; x=1785846141; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nQtLGCF+absZpo7CYw6+cf9nUCFtJnc7kPT8nnOc+qM=;
        b=rlJd8NbmbSMUUerGkvWNOCPglVkO5pYIYmTsdDU20/ie7qGXS3tl+4F4LgLiXQu29g
         NBqh0pWxMy5Om6T3h9pVNOBFwNq0Zpcf3moYjGFWupe2bufKAxBe3v6RqxWX5ADpuXbY
         Vf6CuW+gHgZp5JySb6s0b0hqbVB2gBBmjCeK0iH8AmRmGDqwgqxFDulI4vnyalq684jr
         fg3pWLwK7PjmpejIxNTiMnzNFr/z14pUFX38IXqGQTtbv9TPTin7FyubYpikaw3TNv64
         dGeMZxjfe5AbPwHrpWIY5j97v4sLRGFpPEo2fBaEgL72vwzhLmwLLaCE7lmDfzXGGeEm
         QIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785241341; x=1785846141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQtLGCF+absZpo7CYw6+cf9nUCFtJnc7kPT8nnOc+qM=;
        b=VmANvEkzbrAb4rNULTv7LmeTzZuDgs8eR42CW5vusLkOzmfnyC+ZE8J7BMNUWQNORO
         BT7p1l5RzcVOzI9jQT/HJPZ+7+MFHk8gsQNCZ3Cle28TLyjoDioJ1tnXwOrwWirNm4OE
         cFbTd6o9RBkWcDoKJ0JFKrQoLAOw4WD0bj107HCGBsnHTi9grzb4IrKLPL26LZLmu0yk
         IKeCsA74gcALRrnQFWr+abcbWge+98dQU69oOxDDU4uofZFP94VzHj5RtzYP8MqPJrmi
         ksmQeQ42m4D+rEp29FAAdbHHiaMBFgfb0nDWMOKA0NFa26E0AEUvlhbaU8zR/sxnxG9p
         S/nw==
X-Gm-Message-State: AOJu0Yy7WniZrLXTC2VKEsK+KI+Vf8oqGlWTSMG76/qnrJpxGRdxq73C
	RZ7Jc7rxw09xBT3LhhYs35MLHr6MZv0atPBb1toVy3n5hxJIl1TkJpP07ov65bChJ1IYIljVFu+
	gEaQL2GdKcHgFqoz4GoFRR1ILbGYIc+gLlijRdK4=
X-Gm-Gg: AR+sD10A8kDqfLPmNr/KBJUWSFH5FP8jaVkXyP5K2dyXsdj/OtV2zji9lPGda5AfR3U
	6hw6w55BmoievMsC2Bv97Z7rM5beeK1X5L4JaWEnU8nPS07+YTs7+FL73BN4C0uWVrF8L7MridQ
	6TN1cEOKLCaTSBaKtGplUO7EdPGGEYl3EsFMj6f+B5DDGbs7vfyZacurigaMarS6U8DCQ3B6GD3
	dbvutRXdmIJUshsybu/jQgqgf4aPmIJgqyTgDqFkThXBrd2zY5Ol2AgDZ5MoRDYSXfxrcFw2hVT
	eaSeo5KHjjDDN78=
X-Received: by 2002:a05:6402:2b8d:b0:698:ecf:d18a with SMTP id
 4fb4d7f45d1cf-6a0349f4a43mr1146478a12.9.1785241340817; Tue, 28 Jul 2026
 05:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720124544.63457-1-olivier.tanoh19@gmail.com>
 <20260720124544.63457-2-olivier.tanoh19@gmail.com> <2026072851-foil-womanly-4837@gregkh>
In-Reply-To: <2026072851-foil-womanly-4837@gregkh>
From: Olivier Tanoh <olivier.tanoh19@gmail.com>
Date: Tue, 28 Jul 2026 14:22:08 +0200
X-Gm-Features: AUfX_mwZ335DpAt9D5xzAi6-vRQ6TXMQm7Pf0Nbvf4k5j1qV45OzPmw8I0N329Y
Message-ID: <CAM49wQu_kXqP7AFjGLL2xpvbBg7u2quB1V3rFRdyYwJhdgJxRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] staging: rtl8723bs: rename mBratesOS to avoid CamelCase
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2026, Greg KH wrote:
> Why are you keeping the "m" and "b" here?  Does that match up with what
> is really stored in this variable?

You're right, the "m" and "b" prefixes are Hungarian notation and don't
describe the content. The variable holds the basic rates array, so
basic_rates is a clearer name. I'll send a v2.

Thanks for the review,
Olivier

Le mar. 28 juil. 2026 =C3=A0 09:30, Greg KH <gregkh@linuxfoundation.org> a =
=C3=A9crit :
>
> On Mon, Jul 20, 2026 at 02:45:42PM +0200, Olivier Tanoh wrote:
> > Fix checkpatch.pl warning regarding the use of CamelCase:
> > CHECK: Avoid CamelCase: <mBratesOS>
> >
> > Rename the struct member mBratesOS to comply with the
> > Linux kernel coding style.
>
> Why are you keeping the "m" and "b" here?  Does that match up with what
> is really stored in this variable?
>
> thanks,
>
> greg k-h
