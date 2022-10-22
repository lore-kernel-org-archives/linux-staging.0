Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A40228F3;
	Sat, 22 Oct 2022 08:27:54 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id l28so3035292qtv.4;
        Sat, 22 Oct 2022 01:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=025bctJnC6v5kJzOMmMkALIZKID9ay+0wrUaacLttgA=;
        b=q38Kzp0kA0A2ewZXYrKAJovuF4VMgrWkK0bOYd3K6AVagLy5Hch73dbXkqDSS1Icif
         fx7R0UBtQggMHVpamFx5YrWQ97XcZobi7smSUPDWRMJeAMd05R0UzwLApAUTXRdkA5nl
         zm9k8vV5i/CxS/f7eVoDF0PfhBoVkVG+0alM3zX911ukSj3BR5D8Lg5Hr7n5t+bqB77+
         HO5pPEdpabK/I50///bO82yqHTFGnH+m9tDZZRLKpqXUfYM6cWOeobsKVM3gJwAENTKi
         Dqmu9/QEBpVQwcI15vmEHWe+yXsgL+nQXn+8W432146im2bk0hXbTkAeoyomUuzsSO9l
         FerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=025bctJnC6v5kJzOMmMkALIZKID9ay+0wrUaacLttgA=;
        b=rlI+bjma4BPnb7t2zCu9zEQRLVBQWMPnZklnldhdjDMN/X8vuIENGNtV8oLp5c6UsP
         Jgba0yASoMtkKadYO6i/z9lSIw8xnu1e8onWSL30EK4uEU1G4/Ov5IFYPJPXAFpJxedg
         /OjaRXOTwVzgHLFdAi2TMyxvbft/9aDQZzLDOQv1e1dYr2/cJikYBEx/94ti94KzdWq3
         4IgmCp1pxE7iCGgR9FEUTWcj9zGmZSzr1PDPevQca6svChWxbKHQbeoGLfskFNmsaD8c
         IxxRkxQ1hBvaOd1v880MhoaVhBE9cYKxK4+83Lao0u554oFWrFQQJ2SFgbwaKYGKnWF2
         iCKg==
X-Gm-Message-State: ACrzQf278REuxxCo31zeTJCk8Qz6PTEJ69m3Yf055AI+K0MxOIVJqYP+
	PJQrzg89Y/y+rByOCnaw04qnR/ToTmeCHpLoDLQ=
X-Google-Smtp-Source: AMsMyM7gMqM27Jsc0M8UoH55Qquukfzouoy9ascj4Gt4Gx4ay1q7uTo2a0kAAXYQZurDlL0KtcFId2PN1hYr/uVz0H8=
X-Received: by 2002:a05:622a:254:b0:39c:b5d1:63 with SMTP id
 c20-20020a05622a025400b0039cb5d10063mr18859341qtx.296.1666427273958; Sat, 22
 Oct 2022 01:27:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
 <20221022070612.13009-4-tanjubrunostar0@gmail.com> <Y1Ol7aLwJVdNtzph@kroah.com>
In-Reply-To: <Y1Ol7aLwJVdNtzph@kroah.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Sat, 22 Oct 2022 09:27:42 +0100
Message-ID: <CAHJEyKU4NSrpRmRTG4q9D3xcTr-L2gtO7a_WPYTD7-nXoSQL_w@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] staging: vt6655: refactor long lines of code in s_uFillDataHead
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 22, 2022 at 9:17 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sat, Oct 22, 2022 at 07:06:09AM +0000, Tanjuate Brunostar wrote:
> > fix checkpatch errors by refactoring long lines of code in the function: s_uFillDataHead
> >
> > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> > ---
> >  drivers/staging/vt6655/rxtx.c | 97 ++++++++++++++++++++++++-----------
> >  1 file changed, 67 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> > index 01e72999831b..dc853b83459b 100644
> > --- a/drivers/staging/vt6655/rxtx.c
> > +++ b/drivers/staging/vt6655/rxtx.c
> > @@ -484,19 +484,28 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
> >                       } else {
> >                               /* Get Duration and TimeStamp */
> >                               buf->duration_a =
> > -                                     cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength,
> > -                                                                         byPktType, wCurrentRate, bNeedAck, uFragIdx,
> > -                                                                         cbLastFragmentSize, uMACfragNum,
> > +                                     cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A,
>
> Why is this function not returning u16 to start with?  Everywhere it is
> used it is casted.
>
> Please fix that up first, then fix up the function name itself, and then
> work on shortening these lines, as that will be much better overall.
>
> thanks,
>
> greg k-h
OK
