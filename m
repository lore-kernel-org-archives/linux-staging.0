Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E4070
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 13:26:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5E0D61028;
	Sat, 10 Apr 2021 13:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618061207;
	bh=rPcqecjTvR3ky4zAY9nAY6o/ftBaMVw2xbvS/QjaU7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xdNb3ctGMcQ5Z2mb8Do+Hs9vL3Ur6qOKYFdQF6Zou2geHqapx9aTilw+CXoRikCyX
	 oVAFlxCy2JGRt21rHBokDnp8poIxdHT7qIHlvW9fgKK3VmMfJDTYHbM4DGLHmteF9o
	 ATwQYu23e8iHN+QFQPLaV7B7Un487yvsQssnJO8E=
Date: Sat, 10 Apr 2021 15:26:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Mitali Borkar <mitaliborkar810@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH v2] staging: rtl8192e: fixed pointer
 error by adding '*'
Message-ID: <YHGnlCrZgqjFTgTH@kroah.com>
References: <YHGhdtldqAlRsPHT@kali>
 <alpine.DEB.2.22.394.2104101523140.2975@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2104101523140.2975@hadrien>

On Sat, Apr 10, 2021 at 03:23:35PM +0200, Julia Lawall wrote:
> 
> 
> On Sat, 10 Apr 2021, Mitali Borkar wrote:
> 
> > Fixed Comparison to NULL can be written as '!...' by replacing it with
> > simpler form i.e. boolean expression. This makes code more readable
> > alternative.
> > Reported by checkpatch.
> >
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> > Changes from v1:- added pointer to the function, which was missed during
> > fixing v1.
> >
> >  drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
> > index 4457c1acfbf6..78b5b4eaec5f 100644
> > --- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
> > +++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
> > @@ -327,7 +327,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
> >  	}
> >
> >  	*ppTS = SearchAdmitTRStream(ieee, Addr, UP, TxRxSelect);
> > -	if (ppTS)
> > +	if (*ppTS)
> 
> This looks like a patch against your previous patch, and not against the
> original code.

That's fine as I already accepted the previous patch.

thanks,

greg k-h
