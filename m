Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E7D1EE00A
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 18:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464703; cv=pass; b=j5wcZgLZekGkRHhokzzqqIJV1bheImC2dYyCKaCd4bJMjxLXE9ucAx6UWW+L169O358VnatMdUUUfRnz0ORY10k2KM8bjlYstE50MHvNmjvnXDSvbTPU83PvgZlhbElPFJmb8dwgTayJvseGXE8Fzeuxb4CkbNSA+7VTc9K512E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464703; c=relaxed/simple;
	bh=i0MI5thfwzLfmVMhD1HU90N+f+S1iCcup2p4kPBqpnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JF2OstLgRnq08g8PQG23ylMzHjozlhttS+LNoB1kgun176/PzPgl1/xckD4TkAUwZjAXv4sPGUYFjAKh+cjeGTWRV6OZRMnbH6W9i1JfktaL/VUNck/7tSewVK5pGJSeQi3uZan67IFDv/JLWEvmH+0Q6UUNEZ1p9GxSR6rMZak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EA7o/dVC; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EA7o/dVC"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38bcdda57b0so1217791fa.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 11:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774464700; cv=none;
        d=google.com; s=arc-20240605;
        b=cE6UXTswnZYnTeblhf7QyQfF7gK36EtpUHKW0uNXsDD4+tnYfIdaOqPXneEpLwYUKz
         BA2xdK7EZ+d30f6hrtwQDp0uBjv3a5tKUPw4pZvxTGZP8jFwloiLg3TnhWxbJ0oAxv8m
         8AQoLDOZztEH7XZp06ARZJqWzST53XS2/Y591m75FeQIwP6/9DNopqG5J+eV77WKfvob
         Lh8MYnoDxr9zOssD/9lNCnZc7Zt9/La6AsgKqUWoBRufm8Lnbu0RHHsuyNUef+bqnF5t
         aoUXQAWEfSAkzrXf98S3KSMeBHbVFPNDUYQwp4SndMJRMApqcauMgVXb66iPw3o5VmVG
         fcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CFaGKugKLx+ScDC5k7gtIepkK9p/Eb8sOZi/RA2C3sE=;
        fh=UKzYtcxNyaLFzxPWM1kNNGxl1cCVURZh3lfL7Mt6vbQ=;
        b=W9GYGR5DcOAjngl9ghreMA3bOBLI4utcp6tflVg84i5xJMTnJM6HUpPd56ShBhf4KY
         BeY8gR+GsFxzYAaMCXTxe4qpzIJHPZG0D2RyfpeIqehPp7XawCzd01Xi+tH07AOTJr+0
         AK7XzLCW632N9OlirKZMhsbFLDC7+nyCmGJM3SF9pQu2rcOWhyZDhMOHhpzsYyON9EiG
         Cdr1q+yqexMlqTgUh68Vw2m4fpDNxAJvesiY5Op5vFL7ObjksFaajDq0VwhIN93mgC+G
         MW6v0mtH+S7w/FQDqkeVWrr6cIrd5ujY6avNGaPTJCWAoJFQdfw8rbSgiFesPumPvkDG
         EbhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774464700; x=1775069500; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFaGKugKLx+ScDC5k7gtIepkK9p/Eb8sOZi/RA2C3sE=;
        b=EA7o/dVCWWEw7tZuUSDbYkv0WyB9wvJxQF+P5bw7Y4OAUnEsUo5DJB2A3wdajeMcyj
         jkVhhCbXI4/6XYsEo1leUxnKVoFFAXmYMBXXBqbMRY15skNYPT5zjrXKTXjijYTfBuL/
         eLot9pgkcwl7/H76IawmvB6trbPyJil3Luu9fXXplmqxvaCb9fUESYpwPliTZ3ngeo/F
         2R7muN9VDkas01o0aZlm4uVMC5w+Xaf7gZqeoDZRlmsQwGfL7Ppmme5i9zR/gyP864VU
         95h2ZoyJQmouEuAhQw4etl7Eu82JPEgTHMSh36qjCfDAd+AqXxpaE0FNLxGJi3abSOSS
         Ltjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774464700; x=1775069500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFaGKugKLx+ScDC5k7gtIepkK9p/Eb8sOZi/RA2C3sE=;
        b=fq3KBUlSbqzP8nbfTJUMqjL097Mfng8qAOgKhZE3QhDSUbYJVR5TgsFcNFySMfGwmG
         Cl5kHNrueptFNUke/RRyhyJ5gc5BUbvpMCcOHNtZgoSagKfFc+0xH4mtdDtytWGLH4Yi
         F3QDVLJhFr2/nPn8BWhhVHZOUEetxj2yqNd+9/n9QRhrGE3GCyaGG2hqU1f+3aIfLs04
         bH4kLeLrC0Q4o210BP80InWIyXCY9dDhaqgeq8htP4tL2SpWstghbkRSwCRHz569tAeb
         VhUTMA8Uor23IjusTiuSDcDXewgc6gZDnVPTogQxccLf3y6zJe5iM8MTQRdz0/Zv57a7
         N3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtHhrxNBn8NZz7cNYM1WcX+xmxPdVC+go8ivvwu3JhEysOL4kad8rE0KdMnWiWsQRO6DNeRwLwO+KZXIyE@lists.linux.dev
X-Gm-Message-State: AOJu0YwkMjX/cRSMP0LLxJj6962vq3nu83WYEqYvc2gbvuJiR3gC40AT
	R7ylqjUmIa1zLwe3MRfE8WeBImPH3pZg4EXjDqeINr5byLm1MI5YnsYdyWWen7zT8smBSwarcRV
	cksy73FLTlS2kSw8Qey7c/aR5QM9Sch8=
X-Gm-Gg: ATEYQzwOn0S8+K/h4ZsuH9rN4bKym75tGOvS7KoQJxTav+5XA6BhxgBxj11UnZkSpHP
	Llhv2x1DqpEsN0dmMLRLfaulh75N01S8sfJa7ZQq21UyL4BDBMDEzoDKNDdwFqQEas2b/WwLOWv
	o0Vhs4mnky5d8NW5tftJAr+1abZMwOpI0z6iEerLo8jKoKK3Pc/GJrveU+bXp4aJTIK13JccWP2
	2jART7umK65EdkeTV9/RK5ZpWlrbQ+7+iOY1Hb5hN+uujMlefw3f3PPNZ7m2Zstf3vpM5UDsDY+
	O+qTUiXf
X-Received: by 2002:a2e:9d8c:0:b0:38b:f0f0:e3f7 with SMTP id
 38308e7fff4ca-38c4307a89cmr15506031fa.7.1774464699800; Wed, 25 Mar 2026
 11:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260324220453.47406-3-omer.e.idrissi@gmail.com> <acOQbjNdDwLAGduo@stanley.mountain>
In-Reply-To: <acOQbjNdDwLAGduo@stanley.mountain>
From: Omer <omer.e.idrissi@gmail.com>
Date: Wed, 25 Mar 2026 19:51:27 +0100
X-Gm-Features: AaiRm530X_K90IwmqXm9yNUb6CFXJ3nv124KfyBLuQraTMXsoYyn_22hyCMXn2M
Message-ID: <CACx49NdDxFcsJayDz8ERbn04yq7g+JqvPAEf_-xojSH68uMJ5Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: rtl8723bs: cleanup return in sdio_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will make a v2 patch for this series.
My question is do I go back to returning error pointers for
sdio_dvobj_init? I did that in my original commit so that
the proper errno would be propagated back to the rtw_drv_init probe
function in sdio_intf.c.
sdio_dvobj_init function can fail due to both allocation issues and
sdio_init failure. So i thought it would be more
descriptive to propagate an error pointer instead of NULL for both cases.

Best,
Omer El Idrissi

On Wed, Mar 25, 2026 at 8:36=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Tue, Mar 24, 2026 at 11:04:53PM +0100, Omer El Idrissi wrote:
> > Make sdio_init() return errno from sdio_enable_func or
> > sdio_set_block_size instead of _SUCCESS/_FAIL vendor-defined
> > macros.
> >
> > Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> > ---
>
> You're going to need to start labeling your patches as v2 etc.
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>
> >  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/sta=
ging/rtl8723bs/os_dep/sdio_intf.c
> > index 358eac0837cf..01b5d8a70072 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> > @@ -131,9 +131,7 @@ static u32 sdio_init(struct dvobj_priv *dvobj)
> >  release:
> >       sdio_release_host(func);
> >
> > -     if (err)
> > -             return _FAIL;
> > -     return _SUCCESS;
> > +     return err;
>
> This patch isn't wrong, per se, but I'd really like for you to update
> the callers as well like how you did in the earlier patch.  Right now,
> they're still testing for _SUCCESS.
>
> Make sdio_dvobj_init() propagate the error code back instead of -1.
>
> Change rtw_resume_process_normal() to:
>
>         ret =3D sdio_init();
>         if (ret)
>                 goto whatever_and_return_NULL;
>
> It will make the commit message a little bit more complicated.
>
>     Make sdio_init() propagate standard kernel error codes instead
>     of returning _SUCCESS/_FAIL.  There are two callers for this
>     function.  sdio_dvobj_init() already returns negative values
>     but the caller doesn't check for errors so changing this doesn't
>     affect anything.  rtw_resume_process_normal() returns NULL on
>     error so leave that as-is.
>
> Sorry, for being a bit nit-picky on this but you might end up potentially
> sending a lot of these patches.
>
> regards,
> dan carpenter
