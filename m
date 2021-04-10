Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656E670
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 12:34:21 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id em21-20020a17090b0155b029014e204a81e6so224571pjb.1
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 05:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PXHn0JTgY+La3+5YIGKYFWelzukB7RedFElx6gczrqk=;
        b=KPPCL8xefCVfIQ/eO0Gf7y0/Jx3dpw/yEh+nij8tebQlWjMY2IBKtk2rpnv3mSWkvq
         24EnqrK6KwfPinNDIJZq5KlFIR/b9TlXxqIOfd8u8dfj4Kz0PJuq2bMYsyJcJI5wK/Ff
         EvGmVWkoI9N21zSWE6ikaobNvPynGiKELZXS04ydxV3KZgJcrbNHZ6fcJTP9Qd3D6iAl
         +MXGCZ5ojWEJE2lzPauji9RsbwFa77A135b9mCKlLC9EWM7ArZl7104lyxmF4DVI27yh
         eHSIMi9BmYlHaOZnli5ao3t8ydxhwdm5fOAikLT4AorejTFNiitzaF8RcAHBn8IEURPR
         zEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PXHn0JTgY+La3+5YIGKYFWelzukB7RedFElx6gczrqk=;
        b=hYx3dlsrYKGQR/ntnThPtz6iERogwu1KgJYcSk3dng9/T5i9khoVx/PcXZ+ck5nGdM
         3WPeadvp6fvdPI9oCLqUBhw2q75/pgI2H2GkOynnT0lAOypCaNSZL/WYj1CNPtmOKoDC
         LFC/F030ZvET0VaaYdRTgjeXuUyLtjFSH9GwXLt56eI44sNjfBmMLejuUX3LvnT4uvmu
         0IefZVoXfkcvt78KG6h6sE2Kl660ldSstsYJQxYnP5jzgIhjAKuQlaoQODMuFFxa1UDh
         tCV/R7dOHP2twXAfjx8Rr1o0oibOX8j/z5QsCikmy6ankQntSEkF9RZpJTRq2vh0Y+rP
         dlYQ==
X-Gm-Message-State: AOAM5335n9JOVFyA0yAowPKek3KAeZ+EUziHU2/Rt4qHZXhet2edjk0h
	tgh0AIPbsLqnL6YNCJyZCNA=
X-Google-Smtp-Source: ABdhPJzwTMEdOsR0vy3cArPM/2aBvJDhgMNvXNE+UCI4/J7xEYgsSSDCbRVv3ksuHZYN1E6X62TwVA==
X-Received: by 2002:a17:90a:4309:: with SMTP id q9mr18091539pjg.40.1618058060802;
        Sat, 10 Apr 2021 05:34:20 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id fs9sm5109138pjb.40.2021.04.10.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 05:34:20 -0700 (PDT)
Date: Sat, 10 Apr 2021 18:04:11 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8192e: replace comparison
 to NULL by bool
Message-ID: <YHGbQ+y0Fplssz44@kali>
References: <YHDnWpWztxeZospi@kali>
 <alpine.DEB.2.22.394.2104101408100.2975@hadrien>
 <YHGVvn8Yi0tWL3sa@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHGVvn8Yi0tWL3sa@kroah.com>

On Sat, Apr 10, 2021 at 02:10:38PM +0200, Greg KH wrote:
> On Sat, Apr 10, 2021 at 02:08:30PM +0200, Julia Lawall wrote:
> > 
> > 
> > On Sat, 10 Apr 2021, Mitali Borkar wrote:
> > 
> > > Fixed Comparison to NULL can be written as '!...' by replacing it with
> > > simpler form i.e boolean expression. This makes code more readable alternative.
> > > Reported by checkpatch.
> > >
> > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > ---
> > >  drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
> > > index 65eac33aaa5b..476875125e87 100644
> > > --- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
> > > +++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
> > > @@ -269,12 +269,12 @@ static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *Addr,
> > >  {
> > >  	u8	count;
> > >
> > > -	if (pTsCommonInfo == NULL)
> > > +	if (!pTsCommonInfo)
> > >  		return;
> > >
> > >  	memcpy(pTsCommonInfo->Addr, Addr, 6);
> > >
> > > -	if (pTSPEC != NULL)
> > > +	if (pTSPEC)
> > >  		memcpy((u8 *)(&(pTsCommonInfo->TSpec)), (u8 *)pTSPEC,
> > >  		       sizeof(union tspec_body));
> > >
> > > @@ -328,7 +328,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
> > >  	}
> > >
> > >  	*ppTS = SearchAdmitTRStream(ieee, Addr, UP, TxRxSelect);
> > > -	if (*ppTS != NULL)
> > > +	if (ppTS)
> > 
> > You lost a * here.
> 
> Ugh, good catch.
> 
> Mitali, can you send me a fix-up patch for this, or do you want me to
> drop your original patch from my tree?
>
Yes Sir, I am making corrections right now in this patch. Will send the
fix up patch in an hour.


> thanks,
> 
> greg k-h
