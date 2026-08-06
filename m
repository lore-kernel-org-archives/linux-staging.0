Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED96543E9FB
	for <linux-staging@lists.linux.dev>; Thu,  6 Aug 2026 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013754; cv=pass; b=t4nI4xqEjuWLYvPC0RSTDqJHONeNPrcxyqh6I+gp7lvuE+1quYugzxDQtZ4GXv9BD04jqDusTpWvSmoFv8aYvzdW6ynYOjoM/3aC6mAYcDBOCP2yd6Nw+5FsXL+Nadyp+62FzlTvS8Mjjy7vrdDcgYZBf7VG+BV3xjp3RyIOqB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013754; c=relaxed/simple;
	bh=ilqc60JsWKpK4XmzhXcu6LgOa4t6EyTgNdSTMrIR/LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyjhQf11vzcOH3AVa564zIkVJF1yPuDNTrRVo3AFI3PaZEbRdmlEVp0VhIFjZzV0hOZ+NSCGtUZcHs2lukMKIeCRvhirK8Fbaa3JcLVIsGbjI0Azqp5miEGLHfdcXrs0l+96Je3HzjVU2IVji8LP1HHXysdJpFY8OtBWt6isiOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjEv1R/Y; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjEv1R/Y"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e53581361so115829485a.1
        for <linux-staging@lists.linux.dev>; Thu, 06 Aug 2026 03:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786013752; cv=none;
        d=google.com; s=arc-20260327;
        b=F1yICOQtWLt0hbrtb0SEKbZLGyJFkVSw/RHk4J4RouJJzH8jvHTw1Ac9zOIJfwPOUv
         gQf6I94DKB3JPIMdlHYjTraExkLMVxUnSS0pOAlSA+2rwgz4bCuFwqi7gMJVixRfK8fF
         5n8HfsPPGRME5tBosW2MGV8edQttq47P+0mZuaYfCBzx2UfW6iGcsyskyNm1PGHRJK5Y
         YbADupjVg1s1w7jVqFxOmMBsMnsfnScL6t/fEACOMmFJm8dgUmrKIC5yqISPaoYld9zJ
         xeXFkTpGxqcU4EnVWlxReCvJI4llDQ8CYmjU5ymQpkim/t2fykff1TjC3IYahTeEi97o
         jKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T65fESTPGPlV/T1qvjOWpdsn1fVfSsd2tiR5sGi2eJ0=;
        fh=3fTYSHjMsfbsB1Vyv8/tFkWGCzQVdO+KuILfvTVGefE=;
        b=XjM3duCW6Lesjuue2D9RS2OsmsRewiL9yG17azct4x17qUVTgcllpFbJLocuX14GgP
         dQ/mnAPHVKqMktgPC6W9J5Y9DIHWlFmKzroDNUqUs2RFiPgQCUkWjqsXwcGX07aJOIe3
         fyjB9mT6CcsfDhvJmnod2cEEXdtJYgW11cKv5TZ6b82vwJHei2DMH1vScmHw71fq7oQ/
         z1682jPT25yTublo5Iz2QamAhfWEbMQHF5NWgqnxf72uj7iZAhZZj0MHwo6A0C8XsIlP
         YhSfikDTanrT2WdZ0LwfYzqtBQO8SJAmQm28JhzLg0ziSrtrIIKjpW2f2z4nI8w8sfxA
         zcTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786013752; x=1786618552; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T65fESTPGPlV/T1qvjOWpdsn1fVfSsd2tiR5sGi2eJ0=;
        b=JjEv1R/YRId791IazWPfs4Fd8Uqs1mJAQ+e+I0YymSVFaHtf+pwaC5qj8y+3K1azTV
         wxtleSNjKbrVr3IBnDbGdrJjW7sawVRxsQa/BIjIjor1IC3VeRDgtlYTA4CmyjTY2AbJ
         F9YJ7WIWcHTxr2F5icfJOfSXK11PwX/e732wzEyOgJ+0HSrcji7m+lyCzOi84iiPtGP2
         C3yif6W1eUal/6jT31WayQq1UA7vY2E0BVZrycz2YO9/31sg295CeRpKh/2J0aRy9lnY
         Gwoi5oC+WNLz+Kra2xDd4BtXuIxu4gZlny2ileOZF4IiyPq8zDLc1aFdRDxX1ZCkrr+o
         FeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013752; x=1786618552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T65fESTPGPlV/T1qvjOWpdsn1fVfSsd2tiR5sGi2eJ0=;
        b=gs7hqQxxkl9dQ9t29k41uczCS1rYov6zH3vWVtYjbLPYnTjPNPhBaJIAQ3KAJgRB6Q
         yjC6tEqLtiOBRPcJ8Dhw4N76sPyUzA7pU3kiEZtwzNK7hiQmOrLqYORi/A2VE58m2QDH
         zIn5L8PBJgt3g4bLq+52Yp7ZRbWVV7DhITyL3gZltl9zoS1MBavI7O+tcaGqI2BBLpBG
         h/cpzrdfAh0wDooSbN7yqXyhfvrsgpcPoqg9rNeSy6sjYy/0biATb5UtYTStl3yp3YUN
         d0a5b+mLk6p4brFqSJeT9LCZQmXXJvCw1zoESgf2hsQ54g6JaCTtC8Zz1WzjKS9nqoAE
         nzyw==
X-Forwarded-Encrypted: i=1; AHgh+RoaLfphciu6FbnLxfPJH3LLVgiEPmA/OpKKe0VOrDrwIp9PSzWUksUp+y/IAZe1eOpqBDHkcoIPPfRtjjZc@lists.linux.dev
X-Gm-Message-State: AOJu0YwcjL7CvVH25Y0RcCwRiCfOSMT+QttbwKGvjT3lLxxsjmHsKESR
	CRYYZntUNBuXOFmIOj4xyoEt35vHinZkkgu70LTdY0LysTV787/QBLg8SFoIYqC3pl0cwWbjgCm
	WhwSZzPUmOtyL5uXhciQ8lqfX+W+MZKk=
X-Gm-Gg: AR+sD13yT9JBb0s0pHyfa1khg7Es5TztIowLJ0lY90diZLxIapEz4W4N18jisApr7bl
	XM6zahbngLlFt7y/e1L9MdLFB6AA/Izjt4rJZ8FqZNE9oPpabrO5x2uoihkVjjQj/uwaTLD05kv
	qDtMPUh2WgX8wkplCVDqbX4hISEAIsvyeVsMGXofVICn2A3dIS1P6J8lAuf2qJ5aOFGuteJJCX3
	RBuEpa947MLRrCpAh1tLj/YeNcKLen8pZ0XV3Ia+6rV/TAiaWc46YLkWRDwd5mNorPiuF5oo//a
	rFEJ2q15Vemv3b1qoIyXsPOWUSduZi85qBda1ICV08PS7h/PZoFfkNg=
X-Received: by 2002:a05:620a:2a06:b0:92e:1725:15dd with SMTP id
 af79cd13be357-936490ca6f3mr1200907785a.26.1786013751819; Thu, 06 Aug 2026
 03:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805183317.85489-1-work.ashmitkumar@gmail.com> <2026080628-album-pandemic-ddff@gregkh>
In-Reply-To: <2026080628-album-pandemic-ddff@gregkh>
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
Date: Thu, 6 Aug 2026 16:25:40 +0530
X-Gm-Features: AUfX_mwaZGZilJaaOZT7dCAVbB_mCM-eMaCtPQnsgArvLwG7OsBAy7SCf_uBde0
Message-ID: <CAPDQrT839L+qUraZuv3KDKbjZnNLzqkoRO5r7n_gv=W3xr_4cA@mail.gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: Replace custom rtw_cbuf with kfifo
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mchehab@kernel.org, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Regarding the pointer type, no type information was actually lost. The
original struct rtw_cbuf was implemented with an untyped void *bufs[]
array, and I used void * in DECLARE_KFIFO_PTR to preserve that exact
behavior 1:1.

The technical reason the original code used void * is that the
consumer (c2h_wk_callback) expects the queue to multiplex three
different untyped pointer states -

A valid u8 * payload buffer.
A special sentinel pointer (void *)evtpriv used to trigger c2h_evt_clear.
A NULL pointer.

I traced every push into c2h_queue across the codebase. Today, there
is exactly one reachable push site (hal/sdio_ops.c:766), which
exclusively pushes NULL to signal that the interrupt handler failed to
allocate memory. However, because the consumer logic still explicitly
branches on all three pointer states, preserving void * was the safest
way to swap the ring buffer without rewriting the underlying event
state machine.

And to answer your second question, no LLM was used to create this
change. I analyzed the driver's event queue and wrote the migration
manually.

If you prefer, I can submit a v5 that changes the kfifo type to u8 *
and explicitly casts the sentinel, or I can submit a follow-up patch
that rips out the unreachable consumer branches entirely.

Thanks,
Ashmit Kumar


On Thu, Aug 6, 2026 at 10:22=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Aug 05, 2026 at 06:33:16PM +0000, Ashmit Kumar wrote:
> > The rtl8723bs driver implemented its own custom circular buffer
> > (rtw_cbuf) for c2h event handling. The kernel already provides a standa=
rd,
> > lockless circular buffer implementation in <linux/kfifo.h>.
> >
> > This patch replaces the custom rtw_cbuf struct and its associated
> > functions with the standard kfifo API (kfifo_alloc, kfifo_put,
> > kfifo_get, kfifo_is_empty, kfifo_free), simplifying the driver code
> > and relying on the robust kernel infrastructure. Furthermore, the alloc=
ation
> > size is simplified to C2H_QUEUE_MAX_LEN, dropping the vestigial + 1 tha=
t
> > the original naive ring buffer required to disambiguate full from empty=
.
> >
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> > ---
> > Changes in v4:
> >  - Abandoned ternary operator style fixes in favor of completely
> >    replacing the custom rtw_cbuf ring buffer with the standard Linux
> >    kfifo API, as suggested by Greg Kroah-Hartman.
>
> Great, how was this tested?
>
> > @@ -58,7 +59,7 @@
> >       struct  evt_priv {
> >               struct work_struct c2h_wk;
> >               bool c2h_wk_alive;
> > -             struct rtw_cbuf *c2h_queue;
> > +             DECLARE_KFIFO_PTR(c2h_queue, void *);
>
> Why did you loose the type of the pointer?  Was a LLM used to create
> this change?
>
> thanks,
>
> greg k-h
