Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC8E3B0AEA
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263232; cv=pass; b=icXZqpWjvspje9cuiyvrVJylyGqwx4vT+Xw7ic5SWUwVGPcudaPLYq/wWmlx6RMzS748qcJL9V40mpz8JJU+OwGeaV7ri/dj+J36rbH4JRoWWvyTbnmGdUKFiywnrvlfzsonh1OTbylEHyNZBQIrQh6OVhC5g4AYawpKN0BxVVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263232; c=relaxed/simple;
	bh=WkEWz4mj8V/La5ibN5ZGxZHCQujl3YdUwyDFz4ro5gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAgQBG3rr1iwgCAPgkqns709pA96cXPrptF+jZZx3QqboV4jhUKpiEm8usxd7n8m4Ox5ASA50AblAeE61cPhKkTKgaDqpx6E/Jyb/2ck5g1TOBf0Y/5tZVg37pXymttcpefZWDM46EoJNHkl4mRTNMFEPJhZJc9HwM9ADvTRihk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWjaA97/; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWjaA97/"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso1214489a12.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 04:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788263229; cv=none;
        d=google.com; s=arc-20260327;
        b=atmlDOow75oIZ1EmYrvDJi8sRvjudeBeAPQaxHE9XXbxdM2PYIMAvSIqWf3Rb3vC18
         J/Qax5fSR5hS43rX5MYSc5W2u5RLYkACd/ypemVzZsVLpMwiINSmBzunuck36PLqt07r
         8jrQaI3q4MzbpptaZFLTCHy3MMklkgxLEr0w+uxLkgsBKvYe/RJnkGIVx37s3PuRkDdJ
         +rabnMVdzUNiSiv5+TH/ydC0YNQ5jF9XlTI6W45ilQCUSfS5dk4in40X/KelFaECb4J9
         XyakPQXSwzbIpRhuE9gKvscWiqntZ6yxzK9XtfPXZOjIL5JsRoLAO1S5sTePq9e0RClO
         9q3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ai8hKQw9ceu4/718ljCxu801NyMv3a5qOhxDkpE5Xpg=;
        fh=J8XNUBYamNkLyLTg2UBlrnwPjOEJkgRlC1VzxnpGKhk=;
        b=VUmfNBm6gTtSs6Zoa0QPdbC6giTwmuP47frLhYxM7pOUpuIHxcdZ4XJJpIApzrnPOU
         riEa7UNLr68YZiI56bZqX5x79wWzJIsV4JYo04GBG0iyyyQteTCe7Ywfi3qB8lunA0pV
         VhcqNdyILh8wYgR8hfN53LjVySZOqhkOwHIWFKyRmxR/pXnybw/LXLKLWwjOCktv4gsl
         6sgYZBPLDINjM0CQ9NAmPZ3js3g6rXyabkpZnkkzkOWJKfKEt8co4BbUETJft1xEhNus
         biLfouRlk/ntG9csu6KMSNY/kPBbSWrTsmKJNFaaLO5+Qj56MXtz1XRTpCuDhetrcze4
         zuig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788263229; x=1788868029; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ai8hKQw9ceu4/718ljCxu801NyMv3a5qOhxDkpE5Xpg=;
        b=LWjaA97/Bqbf1J+br4Ljf5hhqTcjBR0SzZpulvz+GQjbpYM+WIJ6jD/yrM+zj272Mp
         ipMr4k8CaEYBOW+T0riPHvbkaCSfg9zx7OBog1yCBDgPOl2ALkKIf73nObmVnBMnqsdu
         hpUZROmPSl6u8fL2wIHi3e7zXnE38iYJoqeFKcz2RWUwOZHAanUfvtKW/xPTKyqtcPqz
         cELc08TybJMpH3+01fDkn1PTZKSui0jN+cnZCe0+f+ByJ5J2nl3CieEovlQkHZ7k/2Of
         +0pOGmeAynqo+lpoihI1KU9aRF3AxBySlwy61tGMqQ4ofLRp6zRC+ToRjyhvkC0eZsYe
         LQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788263229; x=1788868029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai8hKQw9ceu4/718ljCxu801NyMv3a5qOhxDkpE5Xpg=;
        b=ack7qQqcSraef38Uao6M5bOWQ5Eb/5dH0XM8UW5m6RYSwufy6wgTJdfcmtLn/1thFK
         W1g+ek1aawvFeahqSspSNUGKUlUQ9GzJ4gcPgwUoegIDN+BPqDHj41e7qGvNPyllnEDJ
         4GtdUwHCybM2c4rhff7RhaDO6gzoOUuypANf+ynRBzfFxISkg+eP001Dn5O9x/+x/MxB
         tI5VLaGvYbuIH1N9x66U2k9HjsZKN6MecKT9QOODaetrRaUr3AfZWXCzGO3/YRTEwg9t
         01suqC/sCaUGPMzq8R1Gw0k2aTa3DcRiU3/9wW73vx0qJbD4RdTqk70GA6WSy68S0QId
         2d0A==
X-Forwarded-Encrypted: i=1; AKwUvBz5V8MW0XQiG+U5eXzGGES6nf6JDPMZAyKgyrAu2x/mZRJet6n/qhG0iHL2uy12v1N2boOV3PG7lq3BynvZ@lists.linux.dev
X-Gm-Message-State: AFuF++lzBidl8tSSoPvjPXlSos+7+EX6Sulv5MYzgZwMGokWmJuC7r6P
	HF5Vqsmqc1nKYXLWMJ+9KDZd67KRYn3CwllY9TaZ5s37tPPOGnLXN5SlKTmAwR1TUqjK/3xQpzg
	mnb0jX10uoehDHyGoydETVuQCdb8Y0jI=
X-Gm-Gg: AYBFou3Fhgv4hgVExLy7VZmqnKSqdwxz4zh4RAxEI5r4E4Vsv0TzRo/QdMu7WfAvR29
	35fZNXozxc6A/be0wSY5pbrv17Vt/2BfRy1rYz4Q7ezTcdR9OKLHNIEzDoGiKvgxGfFzYplduPQ
	1upjqmjkFASpwustOnQqYP8nvSxNAab1jwDzgIieu/H3EYULadGM/0N9HfmwLGY1Kt79Gle8cfa
	068b3dctmfrNEO9/HRB7qd1hP2ed52f6BpH5ncGSyijZ4DCXJ2TVOmMMsxhfsD1LZGPi8MJ7jTT
	JeqERYthKcrChW95qRgpViwdwHm8LonralJfrkaK0WTz9RsHzEC3wIvWD5+4CKKwSgVTFUDJDDb
	XnkZCsVG+IOolPELr4Q68mKafsEVg
X-Received: by 2002:a05:6402:20d4:20b0:6a6:35ca:af8f with SMTP id
 4fb4d7f45d1cf-6a635cab01emr9499959a12.16.1788263228730; Tue, 01 Sep 2026
 04:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728131050.37032-1-meatuni001@gmail.com> <2026090151-nutrient-clay-c53e@gregkh>
In-Reply-To: <2026090151-nutrient-clay-c53e@gregkh>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Tue, 1 Sep 2026 16:46:55 +0500
X-Gm-Features: AcwNN1V9ueymiP7ruql3Mjh2nKm8Knc4dBzDaOwVce9PaTuiK_XJMOgz4bU3x60
Message-ID: <CADqcGBkjYpLko0EF9BgyApg6LrhA+cR_Cbg5A=4AE81pN4rRSw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: sm750fb: fix mono image source stride
 mismatch in lynxfb_ops_imageblit()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sent v4, rebased on current staging-testing and applies cleanly:

Link: https://lore.kernel.org/all/20260901113031.161610-1-meatuni001@gmail.=
com/

Thanks,
Bilal


On Tue, Sep 1, 2026 at 3:15=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Tue, Jul 28, 2026 at 06:10:50PM +0500, Muhammad Bilal wrote:
> > sm750_hw_imageblit() advances its monochrome source pointer by
> > src_delta per scanline, and computes the correct rounded-up stride
> > internally as:
> >
> >         bytes_per_scan =3D (width + start_bit + 7) / 8;
> >
> > Its only caller, lynxfb_ops_imageblit(), instead passed src_delta as
> > image->width >> 3. For widths not a multiple of 8 this under-counted
> > the stride, so the source pointer fell further behind the real
> > per-scanline layout on every line, corrupting the rendered image.
> >
> > Rather than just fixing the caller's calculation, remove src_delta
> > as a parameter entirely and have sm750_hw_imageblit() advance by the
> > bytes_per_scan it already computes for itself. There has only ever
> > been one caller, and that caller was passing an out-of-sync
> > derivative of the same width/start_bit values sm750_hw_imageblit()
> > already has, so keeping stride as a separate parameter served no
> > purpose beyond letting the two calculations drift apart, which is
> > exactly what happened here.
> >
> > Rounding up, rather than down, is the direction consistent with the
> > rest of the fbdev core: struct fb_image mono bitmap data (the same
> > image->data this driver receives) is walked elsewhere with byte
> > strides derived from a ceiling division of width by 8. The generic
> > mono bit iterator in drivers/video/fbdev/core/fb_imageblit.h advances
> > scanlines with "iter->data +=3D BITS_TO_BYTES(iter->width)", and
> > BITS_TO_BYTES() (include/linux/bitops.h) is a ceiling division.
> > sm750_hw_imageblit()'s own "(width + start_bit + 7) / 8" is that same
> > ceiling division with an added start_bit offset, so the caller's
> > ">> 3" (floor) was the one calculation out of step with how this data
> > layout is handled everywhere else.
> >
> > Found by code review of sm750_hw_imageblit()'s internal stride
> > calculation against what its only caller was passing in, and
> > confirmed with a clean -Werror build. I do not have this hardware,
> > so this has not been exercised at runtime on real sm750 silicon.
> >
> > Fixes: 81dee67e215b2 ("staging: sm750fb: add sm750 to staging")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> > ---
> > v3: Added the version notes below, which Dan pointed out were
> >     missing from v2. Added Cc: stable@vger.kernel.org, flagged by
> >     Greg's patch-bot since the Fixes: tag targets an old (2015)
> >     commit. Added the rounding-direction justification Dan asked
> >     about, citing fb_imageblit.h's BITS_TO_BYTES() as the existing
> >     kernel-wide convention for this same struct fb_image layout.
> >     Moved the "no hardware" disclosure from an email reply into the
> >     commit message itself, per Dan's request.
> > v2: Added a Fixes tag. Moved the src_delta calculation into
> >     sm750_hw_imageblit() itself and dropped it as a parameter, per
> >     Dan Carpenter's review.
> >
> >  drivers/staging/sm750fb/sm750.c       | 2 +-
> >  drivers/staging/sm750fb/sm750.h       | 2 +-
> >  drivers/staging/sm750fb/sm750_accel.c | 6 ++----
> >  drivers/staging/sm750fb/sm750_accel.h | 4 +---
> >  4 files changed, 5 insertions(+), 9 deletions(-)
> >
>
> Does not apply to 7.3-rc1 :(
>
> Can you please rebase and resend?
>
> thanks,
> greg k-h
