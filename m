Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9BD72
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 12:10:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1C5B611AF;
	Sat, 10 Apr 2021 12:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618056641;
	bh=QuA4EydXG7LZzEytUN7b8Jvd71QrqnoFflurUJs9urc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dr/FtupipdisbBRRu+vyTZv4a2w2I2tvLoEG0CmGOBKXnsP9xjsOGM/TZlphzbZzz
	 6PG/1jeQ5Y5fU/nq5y1IkHOWYOZjG/Q3mq0nmPCx/uFsOzEZ4RX7jPYPn0VDqPAr61
	 gr//Nvu0O0NHlYxB3vjAotho7PofzN4aIf7I8aRg=
Date: Sat, 10 Apr 2021 14:10:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Mitali Borkar <mitaliborkar810@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8192e: replace comparison
 to NULL by bool
Message-ID: <YHGVvn8Yi0tWL3sa@kroah.com>
References: <YHDnWpWztxeZospi@kali>
 <alpine.DEB.2.22.394.2104101408100.2975@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2104101408100.2975@hadrien>

On Sat, Apr 10, 2021 at 02:08:30PM +0200, Julia Lawall wrote:
> 
> 
> On Sat, 10 Apr 2021, Mitali Borkar wrote:
> 
> > Fixed Comparison to NULL can be written as '!...' by replacing it with
> > simpler form i.e boolean expression. This makes code more readable alternative.
> > Reported by checkpatch.
> >
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
> > index 65eac33aaa5b..476875125e87 100644
> > --- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
> > +++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
> > @@ -269,12 +269,12 @@ static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *Addr,
> >  {
> >  	u8	count;
> >
> > -	if (pTsCommonInfo == NULL)
> > +	if (!pTsCommonInfo)
> >  		return;
> >
> >  	memcpy(pTsCommonInfo->Addr, Addr, 6);
> >
> > -	if (pTSPEC != NULL)
> > +	if (pTSPEC)
> >  		memcpy((u8 *)(&(pTsCommonInfo->TSpec)), (u8 *)pTSPEC,
> >  		       sizeof(union tspec_body));
> >
> > @@ -328,7 +328,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
> >  	}
> >
> >  	*ppTS = SearchAdmitTRStream(ieee, Addr, UP, TxRxSelect);
> > -	if (*ppTS != NULL)
> > +	if (ppTS)
> 
> You lost a * here.

Ugh, good catch.

Mitali, can you send me a fix-up patch for this, or do you want me to
drop your original patch from my tree?

thanks,

greg k-h
