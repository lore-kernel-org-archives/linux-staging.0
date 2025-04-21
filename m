Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032E1A83F9;
	Mon, 21 Apr 2025 13:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243095; cv=none; b=ISIG6ctUdA3ka9b3ptnZhzlNRK1tP3srFr7JqbmriYmC4zt+uk12QubgtZEH+Fud7ycdjlnbgggDaA74ClDAokgaeYCSYq6IA1XjW02qNrVe0cubE4G663LIOzq9F7xGfdZH3IePiLhK5GPAtjfIADjtpQUEbwJWkkeQdzfzHb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243095; c=relaxed/simple;
	bh=E2F1I2DRDs4lcPmP+73ms3CRLlBK5QiJqEpvigoUffg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGoksbfbbisTU5aQWLCL34S9+rVzxPl0e+ZXrC4N4GE4Yv9J8Mq1TNqSEA705vEvf6uwDWTqvSTNTPS2guyGe1v8VNkiG7eFismuUDejJ+8qlv473hLa34ce1fEfmzZrMrJH21jZ0Zaivh+WWRHsbfXgRFTSh+/L7CkRQzozymE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9kuZwz9; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9kuZwz9"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476805acddaso46376481cf.1;
        Mon, 21 Apr 2025 06:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745243093; x=1745847893; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+rz5Axxady4tMqOuG//Mk9tsSexspjxF9mxBCn+v+E=;
        b=i9kuZwz9K80NvvW6qJk5FiHeROwEBVzO4BFUq+3YpMl8iZJtQMiBzfk78BNWNrhZVH
         QEoUw9+JmTb7BovHwMTRm+S9ThPqEQQ1++AkI+pzvwaG//sP6or1WSAs6kLB8m6M/Tq8
         +dqKmYu3+r93UNkWweYy9W9n9kjjW7DCe68kckQ16UDAEpqqT+g6dWUOHmSSE58RWG3u
         WSp1kQm524KVp2mZvEjQIyB5U8Xs1g/TYE4pgFh61dl4/u7mmCGZp8XDtD1NGy1E2nK+
         dTQ01yvYO4ZY7/z5vae6wIYwi2A4a3/KPctag3S9mBDs64gcqSWN1hnkn5IJo2x5bsv3
         Ebtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745243093; x=1745847893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+rz5Axxady4tMqOuG//Mk9tsSexspjxF9mxBCn+v+E=;
        b=tU2NhXcf+SbZ+SuUlT6VurF4THeK63uvS88V9LL2ivXVzRXMzj17nJld2ism1t2lzr
         +5ObJhcvNV564V5jtFEEb3R82P/AZjBfYB5vl/1JedKKfE/kk9mYHQC7HTUqlrsXFw1t
         JZvCD+SjqWBUMdBdIr64jPBDtLpgKuA6bVWT/SYv88noJggvIrGuujXqgkfATjyDI755
         OVq3Z8gPXLtdhXbi79CL/2eXSAWw3laya68w81rBLGTt13bTKLWUUfv8wqdYNhXUaEGi
         6ogzZZjyIUcU98hzMiezmZq7qYxxN3SeAHG4JGZHRZvcgDnZkKD8uxEryNIXX4XhyVyl
         ZVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKcIg6f8Zte+KgPxHSWzPYtpgVUnLswJyWY7FPh7l/gM9WSbLGDgy8MAWZ6YPUkWYHoCIxTTLrovPG2TJ2YuJ89y2JsA==@lists.linux.dev, AJvYcCXv/k2ty3yEc5VCic3v7ZqSvOIc1mPsl92YnGdtu7lcfceblsTA06Z5xjZNlvC2kzAN2e7eCbcaja1ScbyWPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtM0HO9FhIv7/ppl2ded1XInuM68EEKuRVQl6aHvxB8zyb/pnJ
	gfjXnEf6Q+GnHmWL2mE4r5ADCNsNG3C6UHQlw9dBiB03OW42Av0fKKBMLzck9+eSE4DHRKR0DaU
	nUdh0WwQTVW8D+cCTaUR385dAulk=
X-Gm-Gg: ASbGncvvBEi59Dj2i/poUFBn2MOW2Ca0m+X0F32SvfJ0U2VLUClEnNDUGruRppQK5sl
	rdVWm5gMJjso0aBeak36N8URO57rCPXGdeRWFlln1hjZ6b9luwUqGlmAGfZFuTA9nAlMIWOs+Cg
	c2DM2OruBSerM4z9NQ9+8vSLuZUSsCa8bUACh8PBfzzELpl0HqvG0b+A==
X-Google-Smtp-Source: AGHT+IGIcQ/qkOH4f0efAIsakCdLqhNqY4LYe4mmqUwLFuwUa0Qipj0FoFEBLw2HZkwHnNe2Z94rqKHLyweAtiy2SkA=
X-Received: by 2002:a05:6214:c47:b0:6ea:d6be:215b with SMTP id
 6a1803df08f44-6f2c463fe82mr253512396d6.36.1745243093007; Mon, 21 Apr 2025
 06:44:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1745007964.git.gshahrouzi@gmail.com> <20250421122931.13202ca9@jic23-huawei>
In-Reply-To: <20250421122931.13202ca9@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 21 Apr 2025 09:44:41 -0400
X-Gm-Features: ATxdqUFAbjpx3MFjc3K3f1DwNxW16cyZ7M2yUtmCrTFRFvvxdKKOIoewOoIYhyc
Message-ID: <CAKUZ0zLpRRPDBF5qaUXCukSn=uZFbDUG8UhXrQbpkrZyePe1Ww@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] staging: iio: adc: ad7816: Fix channel handling
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, sonic.zhang@analog.com, vapier@gentoo.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 7:29=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Fri, 18 Apr 2025 16:47:34 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > The original patch combined a functional fix (allowing channel 7) with
> > several refactoring steps (introducing chip_info, renaming structs,
> > improving validation). As requested, these have now been separated.
> >
> > The series proceeds as follows:
> > 1. Fix: Allow diagnostic channel 7 for all device variants.
> > 2. Refactor: Rename the main state structure for clarity before introdu=
cing
> >    the new chip_info struct.
> > 3. Refactor: Introduce struct ad7816_chip_info to hold static per-varia=
nt
> >    data, update ID tables to store pointers, and switch to using
> >    device_get_match_data() for firmware-independent identification.
> >    This removes the old enum/id mechanism.
> > 4. Refactor: Add has_busy_pin to chip_info and use this flag to
> >    determine BUSY pin handling, replacing pointer comparisons.
> > 5. Refactor: Simplify channel validation logic using
> >    chip_info->max_channels, removing strcmp() checks.
> >
> > Regarding the 'fixes' tag: I've applied it only to the first commit
> > containing the core fix, primarily to make backporting easier. Is this
> > the standard practice, or should the tag typically be applied to
> > subsequent commits that build upon or are related to the fix as well?
> >
> > Chainges in v3:
> >       - Split the patch into smaller patches. Make the fix first
> >         followed by clean up.
> >       - Include missing channel for channel selection.
> >       - Address specific feedback regarding enums vs. chip_info data.
> >       - Use device_get_match_data() for device identification.
> >       - Move BUSY pin capability check into chip_info data.
> >       - Simplify channel validation using chip_info data.
> > Changes in v2:
> >         - Refactor by adding chip_info struct which simplifies
> >           conditional logic.
>
> Hi Gabriel,
>
> Whilst I appreciate the enthusiasm. Generally slow down a little!
> If there is a fundamental issue like an accidental sending of the wrong
> version then please reply to the thread cover letter to say that.
> Otherwise, even in the presence of build bot reports, it is good
> for any non trivial series to wait a little for reviews to come in.
> Ideally a week, but a few days can be fine if you already have a lot
> of feedback from reviewers.
Got it, makes more sense to respond to a fundamental error like that
in the cover letter than send an entire new patch series out which
bloats the mailing list.
>
> IIO is moderately high traffic and whilst we are good at hitting
> the button to mark a thread read, it still takes some time!
Got it.
>
> Jonathan
>
> >
> > Gabriel Shahrouzi (5):
> >   staging: iio: adc: ad7816: Allow channel 7 for all devices
> >   staging: iio: adc: ad7816: Rename state structure
> >   staging: iio: adc: ad7816: Introduce chip_info and use pointer
> >     matching
> >   staging: iio: adc: ad7816: Use chip_info for device capabilities
> >   staging: iio: adc: ad7816: Simplify channel validation using chip_inf=
o
> >
> >  drivers/staging/iio/adc/ad7816.c | 94 ++++++++++++++++++--------------
> >  1 file changed, 54 insertions(+), 40 deletions(-)
> >
>
