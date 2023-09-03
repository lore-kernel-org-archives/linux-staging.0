Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EED28F6
	for <linux-staging@lists.linux.dev>; Sun,  3 Sep 2023 19:43:01 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-27178b6417fso576701a91.0
        for <linux-staging@lists.linux.dev>; Sun, 03 Sep 2023 12:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693770181; x=1694374981; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ffpdWUDuUU8t1ryovFUN8LkKxzjq69DuqglQ3PmuD8=;
        b=Bls2SWNagik3ynBdpJTwhP1s1j4yy+p4WEKMF29LWugFN7BPbmKterTqiiv/pe69Zc
         mR/DjxDfVVGB1Wp9fpXmtlP1txbdvIEhYdZ0KO2LF6g1qDYps7AAL5f/pItShoG7Eokr
         AuiA/48eCP2JLPwDOC5/Rq4Ty9ZWPJIxs51BbAF6UVgiFHc8Jfc3x+Tb/hl7ckiaJHF6
         IIVxl+80JJQ/v0pRmyBNeIRyiriJk9caA1ABJ5AdbcVinG+WLweJW3+PFRK3bQSsdsEl
         gLBIUDq3JkJ5LQYZELi61Enzvzm9gw6aeN8kPpF58E2XAy/E8dOa6Q09/3NHiXOppsRR
         7Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693770181; x=1694374981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ffpdWUDuUU8t1ryovFUN8LkKxzjq69DuqglQ3PmuD8=;
        b=FWx9PfJJ03Y8iMdSbx7HfzeTK95eDyAOaO84YNTQY+FpEnu0fVVUcwy8zy4ryYwgWv
         Zj6nrDNF61wThy1s8oZHshsFa6jaRtbHRp3A8cLCY9y0rScTymo5w+pHy8BtulJ8EFNl
         eU5+oFqNjUWvQ/aQPZD0nrpdW8BzRdYfdGYZaB1YSpJIprcokmaj4fNyOoukl34YKS6+
         QO/wfue/eRISNcIRliMVU6goJeVaODxFCkIINzVNw9b4vPKBGOIpK2BHkeX0OfnCZUTN
         xlhN4An56eu+6+edb/FNlIvQw+7PJ3e7t6znpP6q5MpOgdp57g/s2C5r36ej+S7AwP0T
         u+sg==
X-Gm-Message-State: AOJu0YxvzvkNcU3Xeq707YpeAQgiASgie6tjn2ded5plWZgN1Ajqzty2
	3sE+D9yt8q4yJ2hKPEPvUxZbjh3gRlWYODevd6U=
X-Google-Smtp-Source: AGHT+IGXewbb/ITFSk2Puk8s63iULshNgzFvB6glZXwW3/cZbENKsNljjUMVecRB84dvPr7Gq29TOsEq6S1ykAV9e2I=
X-Received: by 2002:a17:90a:fa86:b0:262:f99b:a530 with SMTP id
 cu6-20020a17090afa8600b00262f99ba530mr7494900pjb.34.1693770180885; Sun, 03
 Sep 2023 12:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230903140617.567850-1-bergh.jonathan@gmail.com> <2023090301-emission-scarce-8272@gregkh>
In-Reply-To: <2023090301-emission-scarce-8272@gregkh>
From: Jonathan Bergh <bergh.jonathan@gmail.com>
Date: Sun, 3 Sep 2023 21:42:49 +0200
Message-ID: <CA+MPq=WaoLPdEOgKNLjSTwW=T4tL4vSDpWPU1cUxCU_A7a4aEg@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: Add missing '*' in multiline comments
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes ... that would be better.

On Sun, Sep 3, 2023 at 4:43=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Sun, Sep 03, 2023 at 04:06:17PM +0200, Jonathan Bergh wrote:
> > This patch resolves a warning reported by checkpatch where multiline
> > block comments should use '*' on intermediate lines in order to adhere
> > to the Linux kernel coding-style guidelines.
> >
> > Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme_fake.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_=
user/vme_fake.c
> > index 7c53a8a7b79b..90aaf650524d 100644
> > --- a/drivers/staging/vme_user/vme_fake.c
> > +++ b/drivers/staging/vme_user/vme_fake.c
> > @@ -1010,8 +1010,8 @@ static void fake_free_consistent(struct device *p=
arent, size_t size,
> >  {
> >       kfree(vaddr);
> >  /*
> > -     dma_free_coherent(parent, size, vaddr, dma);
> > -*/
> > + *   dma_free_coherent(parent, size, vaddr, dma);
> > + */
>
> As this code isn't being used, why not just delete it instead?
>
> thanks,
>
> greg k-h
