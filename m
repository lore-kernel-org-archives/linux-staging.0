Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09BE3E9F9E
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064285; cv=pass; b=O8kuASYDJ9tNx5kjxe4X5kgMqtXNQXLx5g0T9iWxjQxq24JwunmHIHxSkEZxaBPxYvNZyOjJBo0jDVt/JfPfK5fgjEc+EFgFxvGTaK3uhlleuJnQjReeo+h+ZtzvkEczIcbHFmDOScogVc62cyMq+OmTMZN8EDQaScoMPZwKvwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064285; c=relaxed/simple;
	bh=Y0df9QlXapCfWt0fpDZLptLzc2sflOhB7BNttK8tG0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdPveNIbxv3Hv9yNu8hVNL7IlrhdPLA7Jd28TPDUuzb0h6aP6zzDHEUpJsew5caOwDa51CGrGbnJSL9Pq2WmALaqc7jVKnGiX9dl2fN9pKjpksdAkpqGpBKmQK64O+Zl1tz4HmDFBkOKaqADnUOm0HBEd3YLNXBGjawIIyG14tE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkpQrx3r; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkpQrx3r"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65c7492a2ceso1526334d50.3
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 03:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778064284; cv=none;
        d=google.com; s=arc-20240605;
        b=SUiJFe0xJ40lRzStStVjQDSFivzhMfZ/4Ok1uv6ZLx0dTqsNJRRsW8AzMp45hrEdC3
         F7IjSAtKsWjip0SZRhk6boIvah5xDXID24FtUOtJnsb7wY0AfPHXHg055GL7A/V1XDuD
         hksFO4h58g4kF8KfI+lmJetO9/ZBvCTg1x5qteneIGMapSVfOkIITgqQDbknHW9AAMbZ
         8TKQhG1Ca8eApV+KzuNEmjHeVcOW5z7eKaUcJAsTb4Y99cahsJ7Gp1wJI3UTPWzo6Vfl
         7YcUv7qlap8IvD4WzkusGYtZOensayT49VOsVEFEtfkPXUrWfRrXfTZMfrCq345j80QZ
         7JFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOcVUuSXxU+mRMKW6rAuDSteuJMJ8DdJe3XSItK0MjU=;
        fh=t5wEtVuhuC/5a52FIrnL+rh3s1Rpv06kLKPUttBKsls=;
        b=df/LS9aW4uwi6nYwKSIjVP1N7quluqyBCIJbpdhk7Qc+GeOlSzevcJe9b3WCR9Ugh9
         FcUlUIfw1Fg/IcMuoA0rxJkEG2kINfzIm6/0hklnHHMPiblBQZBgilT7JEMbnvVokYMC
         wIBTOg/LrkZu218wi7t3vzxR+HzGgkv4juqz2iWawVSMMH5imVg40QH+LsHgjGbQkEYa
         GqIEECfdAcJ682vIp1JHjVBmVFsHxQ4SPlL0oiCZH9gElw7SKPZOPAHbo51AJ08AUTC2
         sXv+bHhGaZaZsUdySOM4BaKAjsP/OCmTjoqCVD26xeIr1hJa5WSS0VEqFLQa6w0gUpKu
         Wb9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778064284; x=1778669084; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOcVUuSXxU+mRMKW6rAuDSteuJMJ8DdJe3XSItK0MjU=;
        b=OkpQrx3rsvtUCyfzsdciaGFQ1RuVN4bnVke1mwAngToWvVSg4pHQSotd60Am8i3gUQ
         jUtUDxKgHUD4KsPA249eqWFXrYFbScpa8fL5Mw637/5kz8CBGtDm/wt74hh8a+pJRm0h
         1rhf5rJvYGLowMwt7/jzAOwA6HOOkra3b7NKohtT9FQhvVVXfcrJhjPAF0rwCg3LDPY7
         rB3bZFx23okqSXdqBEBjpCjZypK+7aAmgBD3HGrGZaCYPHVV3gROkVfve5cj2B4HgSrD
         K9ZPcjT0FEVTHYXOdff00mISBGFQMt44US7Z7u521jUk80KcxDxJLdcLLQgzV1bZvpSZ
         X0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778064284; x=1778669084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOcVUuSXxU+mRMKW6rAuDSteuJMJ8DdJe3XSItK0MjU=;
        b=ArqGYZR0KLj9NTo3sbv4IUc2SnVhrC8oM4nbb6QrHSt0vwuSLvK8KJp0VyqR5lm/f7
         tMzzcIoi7bjl4HY6n3N0UW/QndFua7GXXILH2T3bBkP6f67ipI2sydGtkUgl173Shjph
         RTbsJMBSsroCCHMtthHoObqEd+E6wrmHpByAtxzt8Q8TeAmuNj6MsqTxtN3nlQcNTEA8
         11vs/29Uf/cZqk+nBswoeWaGqBO8npqmKhRggyAnYdwEt36cTSmWsY7+HgCNYjLpY0Mm
         fAFhvIluMWNjSpH9UVp198f0pyORCqz2pscsgP/80/A73XrBLRaUkqVzmrGgvJDsb5rV
         ofJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nQciVVN8MKQkbmrsG1mX6mXmpaq4AGz8Bj4KZwSCZcAukjpgYh4xDoZTEdPEI36IgykUn6HHsII5l8B5f@lists.linux.dev
X-Gm-Message-State: AOJu0YyAZAAEF6dt6tkk5rmUPEUM9nih4m5C0X0YZMx+7NPYJdJgfPuH
	lOXifwf+rGhFTGY0ZEha1ofCWVTWv6AGMqBcHQmL4CXKojfBxlAfpaSGgynZQCdX6WWgNie8gtI
	lwyK/xTi21OzEs+Dgq7yvAzpjaFti86s=
X-Gm-Gg: AeBDieuLqFIGo2JT2o41bidosIq7tJAJyDjGj1O6Md9lB3rr/dAQz7+zHl+fo2D60GT
	1i2amJh+syiDS0ctA5llTWSugP5m7WiCYDIjJ80onLm4/d6v2Yb84O/yp1e40TNhgsnkY0QXIiK
	tno/ZokXVRxVsMDaIGsFD9wtNqAzAw/jDg0DvESd2E9ayRUiZHiD2Y1oumi+eA9j1H9cxcWTa47
	z1IyKJHaYxt04KXp5oXD7UURiz0lDw+D/wkKP18txoVYyJbxihd56AShZ7MyxFJAmzXak58BMZA
	4ZILpkzPKYeYDudN3IVVqZRelmA9kxYm/n2aFahL
X-Received: by 2002:a53:e8d0:0:b0:65c:1011:8a8 with SMTP id
 956f58d0204a3-65c79e61076mr2147667d50.34.1778064283600; Wed, 06 May 2026
 03:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260506035641.5060-1-chaitanya.msabnis@gmail.com>
 <fcfbdb1a-188a-4ab1-b7cc-b2c430d2cca4@sezginduran.net> <CABjkosGtM-bju-gn9QtBfOMKMUsoYFb22noWjELnNi6B_ZBQ3Q@mail.gmail.com>
 <5113f014-f0fb-406a-9b3c-725acff62c9f@sezginduran.net>
In-Reply-To: <5113f014-f0fb-406a-9b3c-725acff62c9f@sezginduran.net>
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Date: Wed, 6 May 2026 16:14:35 +0530
X-Gm-Features: AVHnY4JPaXNoGN9zz1U7PeVImzyha_1cov6nxk831hyykLfr2yFQC3IIXdjzu9k
Message-ID: <CABjkosFMeZBcWaEpF77_a+0AETWY5RtbGK3jdE8OkVgnLbLxYw@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: add const to g_fbmode array
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 Ahmet Sezgin Duran wrote:

Are you sure that you had enabled the module? When I apply and try to
compile your patch, I get these errors:

Hi Ahmet,

You are completely right, and I apologize. I fell into the trap of
running make M=3Ddrivers/staging/sm750fb/ without verifying that
CONFIG_FB_SM750 was actually enabled in my .config first. My local
build silently skipped the compilation, which led me to falsely
believe the syntax was valid.

Looking at the errors you provided, it is clear that g_fbmode is
dynamically assigned during module setup (lines 896, 900), meaning the
checkpatch suggestion to make it const conflicts with the driver's
logic.

Please drop this patch. I will ensure my .config is properly set to
build the specific modules I am touching before submitting in the
future.

Thank you for catching this and for your time reviewing it.

Regards,
Chaitanya

On Wed, May 6, 2026 at 4:06=E2=80=AFPM Ahmet Sezgin Duran <ahmet@sezgindura=
n.net> wrote:
>
> On 5/6/26 10:14 AM, Chaitanya Sabnis wrote:
> > On Wed, May 6, 2026 at 11:57=E2=80=AFAM Ahmet Sezgin Duran ahmet@sezgin=
duran.net wrote:
> >
> > Did you compile these changes?
> >
> > Yes, I have verified the changes by compiling the driver with: make
> > M=3Ddrivers/staging/sm750fb/
> >
> > The build completed successfully without errors.
> >
> > Regards,
> > Chaitanya
>
> Are you sure that you had enabled the module? When I apply and try to
> compile your patch, I get these errors:
>
>  >
>  >   CC [M]  drivers/staging/sm750fb/sm750.o
>  > drivers/staging/sm750fb/sm750.c: In function =E2=80=98lynxfb_set_fbinf=
o=E2=80=99:
>  > drivers/staging/sm750fb/sm750.c:785:33: error: assignment of
> read-only location =E2=80=98g_fbmode[index]=E2=80=99
>  >   785 |                 g_fbmode[index] =3D g_def_fbmode;
>  >       |                                 ^
>  > drivers/staging/sm750fb/sm750.c:787:41: error: assignment of
> read-only location =E2=80=98g_fbmode[index]=E2=80=99
>  >   787 |                         g_fbmode[index] =3D g_fbmode[0];
>  >       |                                         ^
>  > drivers/staging/sm750fb/sm750.c: In function =E2=80=98sm750fb_setup=E2=
=80=99:
>  > drivers/staging/sm750fb/sm750.c:896:45: error: assignment of
> read-only location =E2=80=98g_fbmode[0]=E2=80=99
>  >   896 |                                 g_fbmode[0] =3D opt;
>  >       |                                             ^
>  > drivers/staging/sm750fb/sm750.c:900:45: error: assignment of
> read-only location =E2=80=98g_fbmode[1]=E2=80=99
>  >   900 |                                 g_fbmode[1] =3D opt;
>  >       |                                             ^
>
> Regards,
> Ahmet Sezgin Duran
