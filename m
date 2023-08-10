Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B322D1E1AC
	for <linux-staging@lists.linux.dev>; Thu, 10 Aug 2023 14:00:23 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so4294854a12.1
        for <linux-staging@lists.linux.dev>; Thu, 10 Aug 2023 07:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691676022; x=1692280822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdmJj2QqDHMxtiF3eCBrt5esrxE5kxx10fSadyM3MuE=;
        b=GytVXAxB4ulLq1I2C/87Mh5s5PQbr9OQsTpV2ET6NYMjvZBigTzaD0DGpAo3C63SFn
         Et31qS/FSOMsPCrOfrIwjupwyiX9I0MfkD2JbFf2Wbi4JtgZvf68HTnxuQN3yu/RznDc
         q4GWUq6RJnIi8vWgKC/3yJJehXKMX0w+l1deh18ggm063CLB/4DfXEQAfOKzMMq0W1/D
         /ujN7AoXDwE1jNJT0Exx3aPcvy9FXVLBxe4txpCxpRsd07+osdHF6+gkjIhLx5S/nqDi
         qJeie0MD2YSQYsWAsZMUAylL47TWu7jNEINLqGq9giGMj0UTJEyBlKwyy9L9B4GBOY6v
         hrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691676022; x=1692280822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdmJj2QqDHMxtiF3eCBrt5esrxE5kxx10fSadyM3MuE=;
        b=GFn53sjHthODJAk+c5CVPilU/zsBw9C0NopGxOnu91f6ibNJmHB84TE2llwGnUeap4
         jSwJUqgqEyzyWkxIHWsUWL6FPM8w+nPn+oSLgsqs9TZSXTGgMuEHS3Ne8pkNkVqGrajg
         QIodhBkowuJoiDjwNq3mJjCNMFU1C6FLlFDEbT0umjL1eskNTyvk51a9lfCmPCrljUr1
         VuD2HZ4c5myYKtcgzvJLb8nqnNfDqeXCBAV2X1TCYcpwCibfFGeI1GP8yxEUmdPwEpLE
         96Dk7Xk/P5AEGcbD44izTHgAuR7nFX2RBbmcW1oXpm+OZgiNIAZjIGp/K/Z8h0uC1ySG
         G6LQ==
X-Gm-Message-State: AOJu0YyCISq8FGB0tdOYno6E2A3Yo7e3/At2TViNcyOgVEIe9r86XwC4
	TmfS4K/CO3WWJs2AM2ss1QSen2V7yTZfIPgo2nfRNMZWSOjvUQ==
X-Google-Smtp-Source: AGHT+IF5ZBTO7QiWw4xTvVd+B3q3ehY9+Ycy1W6mKGBOOj4I7HzYIHeq5Bbj2xmbkE4AAauc0kdHbiBjIYJV9jGZXm8=
X-Received: by 2002:a17:906:2ce:b0:992:2f67:cd34 with SMTP id
 14-20020a17090602ce00b009922f67cd34mr2852930ejk.22.1691676021456; Thu, 10 Aug
 2023 07:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230805035739.376502-1-szp2017@gmail.com> <2023080933-customs-undercoat-ba4d@gregkh>
In-Reply-To: <2023080933-customs-undercoat-ba4d@gregkh>
From: Leo Sun <szp2017@gmail.com>
Date: Thu, 10 Aug 2023 22:00:18 +0800
Message-ID: <CA+_ZtsLVD_aL1Hf1b7EFsGTp5hw+jnGDDCeMhiqg2zg9u8xB1g@mail.gmail.com>
Subject: Re: [PATCH] staging: vt6655: Change camel case variables to snake case
To: Greg KH <gregkh@linuxfoundation.org>
Cc: forest@alittletooquiet.net, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2023=E5=B9=B48=E6=9C=889=E6=
=97=A5=E5=91=A8=E4=B8=89 20:21=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sat, Aug 05, 2023 at 11:57:39AM +0800, Mingzai Sun wrote:
> > Change camel case to snake case.
> > Issue found by checkpatch.
> >
> > Signed-off-by: Mingzai Sun <szp2017@gmail.com>
> > ---
> >  drivers/staging/vt6655/srom.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/vt6655/srom.c b/drivers/staging/vt6655/sro=
m.c
> > index ee5ca4db74dc..812964ab68c5 100644
> > --- a/drivers/staging/vt6655/srom.c
> > +++ b/drivers/staging/vt6655/srom.c
> > @@ -49,7 +49,7 @@
> >   * Parameters:
> >   *  In:
> >   *      iobase          - I/O base address
> > - *      byContntOffset  - address of EEPROM
> > + *      by_contnt_offset  - address of EEPROM
>
> Why did you keep the unneeded "by" prefix?
>
> thanks,
>
> greg k-h

OK, I will remove the "by" prefix in the second patch.
