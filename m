Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF213C584F;
	Mon, 18 May 2026 06:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779084478; cv=none; b=kTp0L8rqCBYklnarbIIIT6SVJWGaFNIA6JnCGMn1K04KuCNSQfkz3Bb6/e/BDTDbgNoKmyoipQQAJgSvSyriXERjQY2PWwZYb6iAzAWOt+Dzqynmixx8XVEr2NCXk8jxEuw9c9+8z02Q4GJ/Aom8tBmRm28mGr48lPcjAAGPAoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779084478; c=relaxed/simple;
	bh=/ikUnS2vp5kNC2R6WwqL7cSOTSKahqhPT/a+m/wNDMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JU64aTF7+3wD8Wd+mFCKS02aEtLB26u4fJGf/KblwBR4VlxGKb4dPXL24BqNXSl4CHQYn91sHCoNk6FVaHbH8MN2N3ux8Hjf7hQqbmuXacDbZmychb7z4cvqNbIV0MVupQoDejaPfGubwj/knyDnigb4/0vfR+o1UmbscfRObK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xNA3Pg+r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xNA3Pg+r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E8AC2BCB7;
	Mon, 18 May 2026 06:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779084477;
	bh=/ikUnS2vp5kNC2R6WwqL7cSOTSKahqhPT/a+m/wNDMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xNA3Pg+r01pVDIEMlRookG17sOFTx1lVuNt3MXCZoGbGlluZxTsShIfsJcRRLE44v
	 ZbXuxOXP1wh+6aW3NIji01X5tpnPajff3HQflOolDXBc9lVacxS8nSk5rmIjFvC8XM
	 keotqeCIhTRX8FAq1GOm26i38abTEljMJ3juo8YU=
Date: Mon, 18 May 2026 08:07:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Sajal Gupta <sajal2005gupta@gmail.com>, dennylin0707@gmail.com,
	khushalchitturi@gmail.com, nikolayof23@gmail.com,
	khomenkov@mailbox.org, s9430939@naver.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: split multiple assignments in
 rtw_xmit.c
Message-ID: <2026051858-nutcase-neurotic-de76@gregkh>
References: <20260517092141.9518-1-sajal2005gupta@gmail.com>
 <agqhx2yQdbRe3zZp@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agqhx2yQdbRe3zZp@stanley.mountain>

On Mon, May 18, 2026 at 08:21:11AM +0300, Dan Carpenter wrote:
> On Sun, May 17, 2026 at 02:51:20PM +0530, Sajal Gupta wrote:
> > Split multiple assignments into separate statements to comply
> > with kernel coding style. Fixes the checkpatch warnings:
> > "multiple assignments should be avoided"
> > 
> > Signed-off-by: Sajal Gupta <sajal2005gupta@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_xmit.c | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> > index 458e471535ad..e30c99eeee89 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> > @@ -185,7 +185,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
> >  		pxmitbuf->phead = pxmitbuf->pbuf;
> >  		pxmitbuf->pend = pxmitbuf->pbuf + MAX_XMITBUF_SZ;
> >  		pxmitbuf->len = 0;
> > -		pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
> > +		pxmitbuf->ptail = pxmitbuf->phead;
> > +		pxmitbuf->pdata = pxmitbuf->ptail;
> 
> I find this harder to read.
> 
> To be honest, I don't really have a problem with the original code.

I agree, let's leave it as-is.

thanks,

greg k-h
